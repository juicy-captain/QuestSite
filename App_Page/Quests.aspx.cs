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

public partial class AppPageQuests : System.Web.UI.Page, ICrossPageSender<QuestModel>
{
    private QuestModel SelectedQuestModel { get; set; }
    private List<QuestModel> QuestModels { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        DatabaseResponse<List<QuestModel>> databaseResponse = new DatabaseRequest<List<QuestModel>>()
        {
            RequestType = Database.RequestType.GetAllQuests
        }.Execute();

        PopulateQuestList(QuestModels = databaseResponse.ResponseModel);
    }

    private void PopulateQuestList(List<QuestModel> questModels)
    {
        HtmlGenericControl questsList = FindControl("QuestsList") as HtmlGenericControl;
        foreach (QuestModel quest in questModels)
        {
            HtmlGenericControl listItem = new HtmlGenericControl("li");

            LinkButton linkToDetails = new LinkButton() { Text = quest.Name, PostBackUrl = "~/App_Page/QuestDetails.aspx" };
            linkToDetails.Click += LinkButton_Click;

            Label description = new Label()
            {
                Text = String.Format("<br>{0}<br>Дата начала: {1}<br>Дата окончания: {2}<br>Уровень сложности: {3}",
                quest.Description, new DateTime(quest.StartDate), new DateTime(quest.ExpirationDate), quest.ComplexityLevel)
            };
            listItem.Controls.Add(linkToDetails);
            listItem.Controls.Add(description);
            questsList.Controls.Add(listItem);
        }
    }


    QuestModel ICrossPageSender<QuestModel>.GetModel()
    {
        return SelectedQuestModel;
    }
    protected void LinkButton_Click(object sender, EventArgs e)
    {
        string selectedQuestName = (sender as LinkButton).Text;
        foreach (QuestModel quest in QuestModels)
        {
            if (quest.Name.Equals(selectedQuestName))
            {
                SelectedQuestModel = quest;
                break;
            }
        }
    }
}