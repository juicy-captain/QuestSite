using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Model;
using Interface;
using Database;
using Processor;

public partial class App_Page_QuestDetails : System.Web.UI.Page, ICrossPageSender<UserModel>, ICrossPageSender<QuestModel>
{
    private static UserModel UserModel { get; set; }
    private static QuestModel QuestModel { get; set; }
    private static List<UserModel> Subscribers { get; set; }
    private static bool isUserLoggedIn { get { return isLoggedIn; } set { isLoggedIn = value; } }

    private static bool isLoggedIn = false;
    private static IProcessor<List<StageModel>> ProcessorStages { get; set; }
    private static IProcessor<List<UserModel>> ProcessorSubscribers { get; set; }
    private static IProcessor<int> ProcessorSubscriptionState { get; set; }

    static App_Page_QuestDetails()
    {
        ProcessorStages = new StageBatchProcessor();
        ProcessorSubscribers = new SubscribersBatchProcessor();
        ProcessorSubscriptionState = new SubscriptionStateProcessor();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        GetPlyaerInfo();
        PopulateQuestInfo(isUserLoggedIn);
        GetPlayerProfile();
    }

    private void PopulateQuestInfo(bool isPlayerLoggedIn)
    {
        if (PreviousPage is ICrossPageSender<QuestModel>)
        {
            ICrossPageSender<QuestModel> sourcePage = PreviousPage as ICrossPageSender<QuestModel>;
            QuestModel = sourcePage.GetModel();
        }
        AddQuestDescription();
        PopulateSubscribersList();
        if (isUserLoggedIn)
        {
            SetUpActionButtons();
        }
    }
    private void GetPlayerProfile()
    {
        if (PreviousPage != null && PreviousPage is ICrossPageSender<UserModel>)
        {
            ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePage.GetModel();
            isUserLoggedIn = true;

            if (UserModel != null)
            {
                Label userNickNameDeclaration = new Label() { Text = "Вы вошли как: " };
                HyperLink linkToProfilePage = new HyperLink()
                {
                    //Text = "Вы вошли как: " + UserModel.NickName,
                    //NavigateUrl = "~/App_Page/Profile.aspx"
                };
                header.Controls.Add(userNickNameDeclaration);
                header.Controls.Add(linkToProfilePage);
            }
        }
    }
    private void GetPlyaerInfo()
    {
        if (PreviousPage is ICrossPageSender<UserModel>)
        {
            ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePage.GetModel();
            isUserLoggedIn = true;
        }
    }
    private void AddQuestDescription()
    {
        PerformGetStagesRequest();

        Label description = new Label()
        {
            Text = String.Format("{0}<br>{1}<br>Дата начала: {2}<br>Дата окончания: {3}<br>Уровень сложности: {4}<br>Количество этапов: {5}<br>",
            QuestModel.Name, QuestModel.Description, new DateTime(QuestModel.StartDate), new DateTime(QuestModel.ExpirationDate),
            QuestModel.ComplexityLevel, QuestModel.Stages.Count)
        };
        QuestDetails.Controls.Add(description);
    }
    private void PopulateSubscribersList()
    {
        PerformGetQuestSubscribersRequest();

        if (Subscribers != null)
        {
            HtmlGenericControl subscribersDiv = new HtmlGenericControl("div");
            Label subscribersHeaderText = new Label() { Text = "Подписчики:" };
            subscribersDiv.Controls.Add(subscribersHeaderText);

            HtmlGenericControl subscribersList = new HtmlGenericControl("ul");
            foreach (UserModel player in Subscribers)
            {
                HtmlGenericControl listItem = new HtmlGenericControl("li");
                listItem.Controls.Add(new Label() { Text = player.ToString() });
                subscribersList.Controls.Add(listItem);
            }
            subscribersDiv.Controls.Add(subscribersList);
            QuestDetails.Controls.Add(subscribersDiv);
        }
    }
    private void SetUpActionButtons()
    {
        SubscriptionState subscriptionState = PerformSubscriptionStateRequest();

        string actionButtonText = null;
        string actionButtonPostBackUrl = null;
        switch (subscriptionState)
        {
            case SubscriptionState.Observer:
                actionButtonText = "Зарегистрироваться чтобы принять участие";
                actionButtonPostBackUrl = "~/App_Page/Registration.aspx";
                break;
            case SubscriptionState.NotSubscribed:
                actionButtonText = "Принять участие";
                actionButtonPostBackUrl = "~/App_Page/Profile.aspx";
                break;
            case SubscriptionState.NotStarted:
                actionButtonText = "Начать прохождение";
                actionButtonPostBackUrl = "~/App_Page/Question.aspx";
                break;
            case SubscriptionState.InProgress:
                actionButtonText = "Продолжить";
                actionButtonPostBackUrl = "~/App_Page/Question.aspx";
                break;
            case SubscriptionState.Finished:
                actionButtonText = "Пройти ещё раз";
                actionButtonPostBackUrl = "~/App_Page/Question.aspx";
                break;
        }
        LinkButton actionButton = new LinkButton() { ID = ((int)subscriptionState).ToString(), Text = actionButtonText, PostBackUrl = actionButtonPostBackUrl };
        actionButton.Click += (sender, args) =>
            {
                SubscriptionState state = (SubscriptionState)int.Parse((sender as LinkButton).ID);
                if (state == SubscriptionState.NotSubscribed)
                {
                    PerformSubscribeForQuestRequest();
                }
                else if (state == SubscriptionState.Finished)
                {
                    Dictionary<string, object> Parameters = new Dictionary<string, object>()
                    {
                        {DatabaseConst.ParameterQuestId, QuestModel.Id},
                        {DatabaseConst.ParameterUserId, UserModel.Id},
                    };
                    new DatabaseRequest<object>()
                    {
                        Parameters = Parameters,
                        RequestType = RequestType.Alter,
                        StoredProcedure = DatabaseConst.SPResetUserProgress
                    }.Execute();
                }
            };

        //if there is no stages in quest but user subscribed, he/she isn't able to start a quest
        if (subscriptionState != SubscriptionState.Observer)
        {
            if (QuestModel.Stages.Count != 0)
            {
                QuestDetails.Controls.Add(actionButton);
            }
        }

        if (subscriptionState != SubscriptionState.NotSubscribed && subscriptionState != SubscriptionState.Observer)
        {
            LinkButton unsubscribeButton = new LinkButton() { Text = "Отписаться", PostBackUrl = "~/App_Page/Profile.aspx" };
            unsubscribeButton.Click += (sender, args) =>
            {
                PerformUnsubscribeUserRequest();
            };
            QuestDetails.Controls.Add(unsubscribeButton);
        }
    }
    private void PerformGetStagesRequest()
    {
        Dictionary<string, object> ParametersStages = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterStageRelatedQuestId, QuestModel.Id}
        };
        DatabaseResponse<List<StageModel>> databaseResponse = new DatabaseRequest<List<StageModel>>()
        {
            Parameters = ParametersStages,
            Processor = ProcessorStages,
            RequestType = RequestType.Query,
            StoredProcedure = DatabaseConst.SPGetQuestStages
        }.Execute();

        QuestModel.Stages = databaseResponse.Result;
    }
    private void PerformGetQuestSubscribersRequest()
    {
        Dictionary<string, object> ParametersSubscribers = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterQuestId, QuestModel.Id}
        };
        DatabaseResponse<List<UserModel>> subscribersResponse = new DatabaseRequest<List<UserModel>>()
        {
            Parameters = ParametersSubscribers,
            Processor = ProcessorSubscribers,
            RequestType = RequestType.Query,
            StoredProcedure = DatabaseConst.SPGetQuestSubscribers
        }.Execute();

        Subscribers = subscribersResponse.Result;
    }
    private void PerformUnsubscribeUserRequest()
    {
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterQuestId, QuestModel.Id},
            {DatabaseConst.ParameterUserId, UserModel.Id},
        };
        new DatabaseRequest<object>()
        {
            Parameters = Parameters,
            RequestType = RequestType.Alter,
            StoredProcedure = DatabaseConst.SPDeleteSubscription
        }.Execute();
    }
    private SubscriptionState PerformSubscriptionStateRequest()
    {
        SubscriptionState subscriptionState = SubscriptionState.Observer;
        if (UserModel != null)
        {
            Dictionary<string, object> Parameters = new Dictionary<string, object>()
            {
                {DatabaseConst.ParameterQuestId, QuestModel.Id},
                {DatabaseConst.ParameterUserId, UserModel.Id},
            };
            DatabaseResponse<int> databaseResponse = new DatabaseRequest<int>()
            {
                Parameters = Parameters,
                Processor = ProcessorSubscriptionState,
                RequestType = RequestType.Query,
                StoredProcedure = DatabaseConst.SPCheckSubscription
            }.Execute();

            int stageNumber = databaseResponse.Result;
            subscriptionState = SubscriptionState.NotSubscribed;
            if (stageNumber != DatabaseConst.EmptyData)
            {
                if (stageNumber == 0)
                {
                    subscriptionState = SubscriptionState.NotStarted;
                }
                else if (stageNumber == QuestModel.Stages.Count)
                {
                    subscriptionState = SubscriptionState.Finished;
                }
                else
                {
                    subscriptionState = SubscriptionState.InProgress;
                }
            }
        }
        return subscriptionState;
    }
    private void PerformSubscribeForQuestRequest()
    {
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterQuestId, QuestModel.Id},
            {DatabaseConst.ParameterUserId, UserModel.Id},
        };
        new DatabaseRequest<object>()
        {
            Parameters = Parameters,
            RequestType = RequestType.Alter,
            StoredProcedure = DatabaseConst.SPInsertSubscription
        }.Execute();
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }

    QuestModel ICrossPageSender<QuestModel>.GetModel()
    {
        return QuestModel;
    }

    protected void ButtonLogout_Click(object sender, EventArgs e)
    {
        UserModel = null;
    }

}