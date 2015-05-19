using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Model;
using Database;
using Util;
using Interface;

public partial class AppPageQuests : System.Web.UI.Page, ICrossPageSender<QuestModel>, ICrossPageSender<UserModel>
{
    private QuestModel SelectedQuestModel { get; set; }
    private List<QuestModel> QuestModels { get; set; }
    private static UserModel UserModel { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        DatabaseResponse<List<QuestModel>> databaseResponse = new DatabaseRequest<List<QuestModel>>()
        {
            RequestType = Database.RequestType.GetAllQuests
        }.Execute();

        PopulateQuestList(QuestModels = databaseResponse.Result);
        GetPlayerProfile();
    }

    private void PopulateQuestList(List<QuestModel> questModels)
    {
        foreach (QuestModel quest in questModels)
        {
            HtmlGenericControl listItem = new HtmlGenericControl("li");

            LinkButton linkToDetails = new LinkButton() { Text = quest.Name, PostBackUrl = "~/App_Page/QuestDetails.aspx" ,ID = quest.Id.ToString() };
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

            Label description = new Label()
            {
                Text = String.Format("<br>{0}<br>Дата начала: {1}<br>Дата окончания: {2}<br>Уровень сложности: {3}",
                quest.Description, new DateTime(quest.StartDate), new DateTime(quest.ExpirationDate), quest.ComplexityLevel)
            };
            listItem.Controls.Add(linkToDetails);
            listItem.Controls.Add(description);
            QuestsList.Controls.Add(listItem);
        }
    }

    private void GetPlayerProfile()
    {
        if (PreviousPage != null && PreviousPage is ICrossPageSender<UserModel>)
        {
            ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePage.GetModel();

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

    QuestModel ICrossPageSender<QuestModel>.GetModel()
    {
        return SelectedQuestModel;
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }
}