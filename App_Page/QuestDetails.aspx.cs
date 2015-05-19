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

public partial class App_Page_QuestDetails : System.Web.UI.Page, ICrossPageSender<UserModel>, ICrossPageSender<QuestModel>
{
    private static UserModel UserModel { get; set; }
    private static QuestModel QuestModel { get; set; }
    private static bool isUserLoggedIn { get { return isLoggedIn; } set { isLoggedIn = value; } }

    private static bool isLoggedIn = false;

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
            SetUpActionButton();
        }
    }


    private void GetPlayerProfile()
    {
        if (PreviousPage != null && PreviousPage is ICrossPageSender<UserModel>)
        {
            ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePage.GetModel();
                        isUserLoggedIn = true;

            Label userNickNameDeclaration = new Label() { Text = "Вы вошли как: " };
            HyperLink linkToProfilePage = new HyperLink()
            {
                Text = "Вы вошли как: " + UserModel.NickName,
                NavigateUrl = "~/App_Page/Profile.aspx"
            };
            header.Controls.Add(userNickNameDeclaration);
            header.Controls.Add(linkToProfilePage);
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
        DatabaseResponse<List<StageModel>> stagesResponse = new DatabaseRequest<List<StageModel>>()
        {
            RequestType = RequestType.GetStages,
            QuestId = QuestModel.Id
        }.Execute();

        QuestModel.Stages = stagesResponse.Result;

        Label description = new Label()
        {
            Text = String.Format("{0}<br>{1}<br>Дата начала: {2}<br>Дата окончания: {3}<br>Уровень сложности: {4}<br>Количество этапов: {5}<br>",
            QuestModel.Name, QuestModel.Description, new DateTime(QuestModel.StartDate), new DateTime(QuestModel.ExpirationDate),
            QuestModel.ComplexityLevel, stagesResponse.Result.Count)
        };
        QuestDetails.Controls.Add(description);
    }

    private void PopulateSubscribersList()
    {
        DatabaseResponse<List<UserModel>> subscribersResponse = new DatabaseRequest<List<UserModel>>()
        {
            RequestType = Database.RequestType.GetQuestSubscribers,
            QuestId = QuestModel.Id
        }.Execute();

        if (subscribersResponse.Result != null)
        {
            HtmlGenericControl subscribersDiv = new HtmlGenericControl("div");
            Label subscribersHeaderText = new Label() { Text = "Подписчики:" };
            subscribersDiv.Controls.Add(subscribersHeaderText);

            HtmlGenericControl subscribersList = new HtmlGenericControl("ul");
            foreach (UserModel player in subscribersResponse.Result)
            {
                HtmlGenericControl listItem = new HtmlGenericControl("li");
                listItem.Controls.Add(new Label() { Text = player.ToString() });
                subscribersList.Controls.Add(listItem);
            }
            subscribersDiv.Controls.Add(subscribersList);
            QuestDetails.Controls.Add(subscribersDiv);
        }
    }

    private void SetUpActionButton()
    {
        DatabaseResponse<SubscriptionState> databaseResponse = new DatabaseRequest<SubscriptionState>()
        {
            RequestType = RequestType.CheckSubscription,
            PlayerId = UserModel.Id,
            QuestId = QuestModel.Id,
            NumberOfStages = QuestModel.Stages.Count
        }.Execute();
        SubscriptionState subscriptionState = databaseResponse.Result;

        string actionButtonText = null;
        string actionButtonPostBackUrl = null;
        switch (subscriptionState)
        {
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
        LinkButton actionButton = new LinkButton() { Text = actionButtonText, PostBackUrl = actionButtonPostBackUrl };
        actionButton.Click += (sender, args) =>
            {
                new DatabaseRequest<Object>()
                {
                    RequestType = RequestType.SubscribeUserForQuest,
                    PlayerId = UserModel.Id,
                    QuestId = QuestModel.Id
                }.Execute();
            };
        QuestDetails.Controls.Add(actionButton);

        if (subscriptionState != SubscriptionState.NotSubscribed)
        {
            LinkButton unsubscribeButton = new LinkButton() { Text = "Отписаться", PostBackUrl = "~/App_Page/Profile.aspx" };
            unsubscribeButton.Click += (sender, args) =>
            {
                new DatabaseRequest<Object>()
                {
                    RequestType = RequestType.UnsubscribeUserForQuest,
                    PlayerId = UserModel.Id,
                    QuestId = QuestModel.Id
                }.Execute();
            };
            QuestDetails.Controls.Add(unsubscribeButton);
        }
    }


    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }

    QuestModel ICrossPageSender<QuestModel>.GetModel()
    {
        return QuestModel;
    }

}