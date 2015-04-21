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

public partial class App_Page_QuestDetails : System.Web.UI.Page, ICrossPageSender<PlayerModel>, ICrossPageSender<QuestModel>
{
    private static PlayerModel PlayerModel { get; set; }
    private static QuestModel QuestModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            PopulateQuestInfo(GetPlyaerInfo());
        }
        else
        {
            //Click handler for subscribe button per se
            //WTF?????? IT MUST NOT BE SO!!!!
            //SEAT OF THE TROUBLE IS HERE, MAN!!!
            new DatabaseRequest<Object>()
            {
                RequestType = RequestType.SubscribePlayerForQuest,
                PlayerId = PlayerModel.Id,
                QuestId = QuestModel.Id
            }.Execute();
        }
    }

    private void PopulateQuestInfo(bool isPlayerLoggedIn)
    {
        if (PreviousPage is ICrossPageSender<QuestModel>)
        {
            ICrossPageSender<QuestModel> sourcePage = PreviousPage as ICrossPageSender<QuestModel>;
            QuestModel = sourcePage.GetModel();

            AddQuestDescription();
            PopulateSubscribersList();

            if (isPlayerLoggedIn)
            {
                SetUpSubscribeStartButton();
            }
        }
    }

    private bool GetPlyaerInfo()
    {
        if (PreviousPage is ICrossPageSender<PlayerModel>)
        {
            ICrossPageSender<PlayerModel> sourcePage = PreviousPage as ICrossPageSender<PlayerModel>;
            PlayerModel = sourcePage.GetModel();

            if (PlayerModel != null)
            {
                Label userNickNameDeclaration = new Label() { Text = "Вы вошли как: " };
                HyperLink linkToProfilePage = new HyperLink()
                {
                    Text = "Вы вошли как: " + PlayerModel.NickName,
                    NavigateUrl = "~/App_Page/Profile.aspx"
                };
                header.Controls.Add(userNickNameDeclaration);
                header.Controls.Add(linkToProfilePage);
                return true;
            }
        }
        return false;
    }

    private void AddQuestDescription()
    {
        DatabaseResponse<List<StageModel>> stagesResponse = new DatabaseRequest<List<StageModel>>()
        {
            RequestType = RequestType.GetStages,
            QuestId = QuestModel.Id
        }.Execute();

        Label description = new Label()
        {
            Text = String.Format("{0}<br>{1}<br>Дата начала: {2}<br>Дата окончания: {3}<br>Уровень сложности: {4}<br>Количество этапов: {5}<br>",
            QuestModel.Name, QuestModel.Description, new DateTime(QuestModel.StartDate), new DateTime(QuestModel.ExpirationDate),
            QuestModel.ComplexityLevel, stagesResponse.ResponseModel.Count)
        };
        QuestDetails.Controls.Add(description);
    }

    private void PopulateSubscribersList()
    {
        DatabaseResponse<List<PlayerModel>> subscribersResponse = new DatabaseRequest<List<PlayerModel>>()
        {
            RequestType = Database.RequestType.GetQuestSubscribers,
            QuestId = QuestModel.Id
        }.Execute();

        if (subscribersResponse.ResponseModel != null)
        {
            HtmlGenericControl subscribersDiv = new HtmlGenericControl("div");
            Label subscribersHeaderText = new Label() { Text = "Подписчики:" };
            subscribersDiv.Controls.Add(subscribersHeaderText);

            HtmlGenericControl subscribersList = new HtmlGenericControl("ul");
            foreach (PlayerModel player in subscribersResponse.ResponseModel)
            {
                HtmlGenericControl listItem = new HtmlGenericControl("li");
                listItem.Controls.Add(new Label() { Text = player.ToString() });
                subscribersList.Controls.Add(listItem);
            }
            subscribersDiv.Controls.Add(subscribersList);
            QuestDetails.Controls.Add(subscribersDiv);
        }
    }

    private void SetUpSubscribeStartButton()
    {
        DatabaseResponse<bool> databaseResponse = new DatabaseRequest<bool>()
        {
            RequestType = RequestType.CheckSubscription,
            PlayerId = PlayerModel.Id,
            QuestId = QuestModel.Id
        }.Execute();
        bool isPlayerSubscribed = databaseResponse.ValueResult;

        Button subscribeButton = isPlayerSubscribed ?
            (new Button() { Text = "Начать прохождение", PostBackUrl = "~/App_Page/Question.aspx" }) :
            (new Button() { Text = "Принять участие", PostBackUrl = "~/App_Page/Profile.aspx" });
        QuestDetails.Controls.Add(subscribeButton);
    }


    PlayerModel ICrossPageSender<PlayerModel>.GetModel()
    {
        return PlayerModel;
    }

    QuestModel ICrossPageSender<QuestModel>.GetModel()
    {
        return QuestModel;
    }
}