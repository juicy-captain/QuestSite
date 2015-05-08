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

public partial class AppPageProfile : System.Web.UI.Page, ICrossPageSender<UserModel>, ICrossPageSender<QuestModel>
{
    private static UserModel UserModel { get; set; }
    private static List<QuestModel> QuestModels { get; set; }
    private static QuestModel SelectedQuestModel { get; set; }
    private static IProcessor<List<QuestModel>> Processor { get; set; }
    private static Dictionary<string, object> Parameters { get; set; }

    static AppPageProfile()
    {
        Processor = new SubscriptionsBatchProcessor();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null && PreviousPage is ICrossPageSender<UserModel>)
        {
            GetPlayer();
        }
        GetAndPopulateQuestList();
    }
    protected void ButtonDeleteProfile_Click(object sender, EventArgs e)
    {
        new DatabaseRequest<Object>()
        {
            RequestType = RequestType.DeleteUser,
            PlayerId = UserModel.Id
        }.Execute();
    }
    protected void ButtonLogout_Click(object sender, EventArgs e)
    {
        UserModel = null;
    }

    private void GetPlayer()
    {
        ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
        UserModel = sourcePage.GetModel();
        LabelFirstName.Text = UserModel.FirstName;
        LabelNickName.Text = UserModel.NickName;
        LabelSecondName.Text = UserModel.SecondName;
        Avatar.ImageUrl = UserModel.AvatarPath;
    }
    private void GetAndPopulateQuestList()
    {
        PerformGetUserSubscriptionsRequest();

        if (QuestModels.Count != 0)
        {
            foreach (QuestModel quest in QuestModels)
            {
                HtmlGenericControl listItem = new HtmlGenericControl("li");

                LinkButton linkToDetails = new LinkButton()
                {
                    Text = quest.Name,
                    ID = quest.Id.ToString(),
                    PostBackUrl = "~/App_Page/QuestDetails.aspx"
                };
                linkToDetails.Attributes.Add("runat", "server");
                linkToDetails.Attributes.Add("onclick", "linkToDetails_Click");

                linkToDetails.Click += (sender, args) =>
                    {
                        int selectedQuestId = int.Parse((sender as LinkButton).ID);
                        foreach (QuestModel questModel in QuestModels)
                        {
                            if (questModel.Id == selectedQuestId)
                            {
                                SelectedQuestModel = questModel;
                                break;
                            }
                        }
                    };
                listItem.Controls.Add(linkToDetails);
                QuestsList.Controls.Add(listItem);
            }
        }
        else
        {
            LabelSubscriptions.Text = "Вы пока не подписались на на один квест";
        }
    }
    private void PerformGetUserSubscriptionsRequest()
    {
        Parameters = new Dictionary<string,object>()
        {
            {DatabaseConst.ParameterUserId, UserModel.Id}
        };
        DatabaseResponse<List<QuestModel>> databaseResponse = new DatabaseRequest1<List<QuestModel>>()
        {
            Parameters = Parameters,
            Processor = Processor,
            RequestType = RequestType1.Query,
            StoredProcedure = DatabaseConst.SPGetUserSubscriptions
        }.Execute();
        QuestModels = databaseResponse.Result;
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }

    QuestModel ICrossPageSender<QuestModel>.GetModel()
    {
        return SelectedQuestModel;
    }

}