using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Database;
using Model;
using Interface;
using Processor;

public partial class App_Page_AdminQuests : System.Web.UI.Page, ICrossPageSender<UserModel>, ICrossPageSender<QuestModel>
{
    private static UserModel UserModel { get; set; }
    private static List<QuestModel> QuestModels { get; set; }
    private static QuestModel QuestModel { get; set; }
    private static QuestModel SelectedQuestModel { get; set; }
    private static IProcessor<List<QuestModel>> Processor { get; set; }

    static App_Page_AdminQuests()
    {
        Processor = new QuestBatchProcessor();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePage.GetModel();
        }
        PopilateQuests();
    }
    protected void ButtonAddNewQuest_Click(object sender, EventArgs e)
    {
        SelectedQuestModel = null;
    }
    protected void ButtonRemoveAll_Click(object sender, EventArgs e)
    {
        new DatabaseRequest<object>()
        {
            RequestType = RequestType.Alter,
            StoredProcedure = DatabaseConst.SPDeleteAllQuests
        }.Execute();
    }

    private void PopilateQuests()
    {
        PerformGetAllQuestsRequest();

        foreach (QuestModel quest in QuestModels)
        {
            HtmlGenericControl listItem = new HtmlGenericControl("li");

            Label name = new Label() { Text = quest.Name };
            Label description = new Label()
            {
                Text = String.Format("<br>{0}<br>Дата начала: {1}<br>Дата окончания: {2}<br>Уровень сложности: {3}",
                quest.Description, new DateTime(quest.StartDate), new DateTime(quest.ExpirationDate), quest.ComplexityLevel)
            };

            Button editButton = new Button()
            {
                Text = "Редактировать",
                PostBackUrl = "~/App_Page/AdminQuestEdit.aspx",
                ID = quest.Id.ToString()
            };
            editButton.Click += (sender, args) =>
            {
                int selectedQuestId = int.Parse((sender as Button).ID);
                foreach (QuestModel questModel in QuestModels)
                {
                    if (questModel.Id == selectedQuestId)
                    {
                        SelectedQuestModel = questModel;
                        break;
                    }
                }
            };

            Button deleteButton = new Button()
            {
                Text = "Удалить",
                //PostBackUrl = "~/App_Page/AdminQuests.aspx",
                ID = "delete" + quest.Id.ToString()
            };
            deleteButton.Click += (sender, args) =>
            {
                string clickedButtonId = (sender as Button).ID;
                int selectedQuestId = int.Parse(clickedButtonId.Substring(6, clickedButtonId.Length - 6));
                foreach (QuestModel questModel in QuestModels)
                {
                    if (questModel.Id == selectedQuestId)
                    {
                        QuestModel = questModel;
                        PerformDeleteQuestRequest();
                        Server.Transfer("~/App_Page/AdminQuests.aspx", true);
                        break;
                    }
                }
            };
           listItem.Controls.Add(new HtmlGenericControl("br"));
            listItem.Controls.Add(editButton);
            listItem.Controls.Add(deleteButton);
           listItem.Controls.Add(new HtmlGenericControl("br"));
            listItem.Controls.Add(name);
            listItem.Controls.Add(description);
            content.Controls.Add(listItem);
        }
    }
    private void PerformGetAllQuestsRequest()
    {
        DatabaseResponse<List<QuestModel>> databaseResponse = new DatabaseRequest<List<QuestModel>>()
        {
            Processor = Processor,
            RequestType = RequestType.Query,
            StoredProcedure = DatabaseConst.SPGetAllQuests
        }.Execute();
        QuestModels = databaseResponse.Result;
    }

    private void PerformDeleteQuestRequest()
    {
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterQuestId, QuestModel.Id}
        };
        new DatabaseRequest<object>()
        {
            Parameters = Parameters,
            RequestType = RequestType.Alter,
            StoredProcedure = DatabaseConst.SPDeleteQuest
        }.Execute();
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