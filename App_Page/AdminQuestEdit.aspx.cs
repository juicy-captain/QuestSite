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

public partial class App_Page_AdminQuestEdit : System.Web.UI.Page, ICrossPageSender<UserModel>, ICrossPageSender<StageModel>
{
    private static UserModel UserModel { get; set; }
    private static QuestModel QuestModel { get; set; }
    private static StageModel SelectedStageModel { get; set; }
    private static List<StageModel> Stages { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateQuestInfo();
        PopulateStagesInfo();

    }
    protected void ButtonSaveChanges_Click(object sender, EventArgs e)
    {
        CreateUpdatedQuest();
        new DatabaseRequest<object>()
        {
            RequestType = RequestType.EditQuest,
            QuestModel = QuestModel
        }.Execute();
    }
    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        new DatabaseRequest<object>()
        {
            RequestType = RequestType.DeleteQuest,
            QuestId = QuestModel.Id
        }.Execute();
    }

    private void CreateUpdatedQuest()
    {
        string name = TextBoxName.Text;
        string description = TextBoxDescription.Text;

        int day = int.Parse(StartDay.SelectedValue);
        int month = int.Parse(StartMonth.SelectedValue);
        int year = int.Parse(StartYear.SelectedValue);
        long startDate = new DateTime(year, month, day).Ticks;

        day = int.Parse(ExpirationDay.SelectedValue);
        month = int.Parse(ExpirationMonth.SelectedValue);
        year = int.Parse(ExpirationYear.SelectedValue);
        long expirationDate = new DateTime(year, month, day).Ticks;

        QuestComplexityLevel complexity;
        if (LevelEasy.Checked)
        {
            complexity = QuestComplexityLevel.Easy;
        }
        else if (LevelMedium.Checked)
        {
            complexity = QuestComplexityLevel.Medium;
        }
        else if (LevelHard.Checked)
        {
            complexity = QuestComplexityLevel.Hard;
        }
        else
        {
            complexity = QuestComplexityLevel.AreYoyCrazy;
        }

        QuestModel = new QuestModel(QuestModel.Id, name, description, startDate, expirationDate, complexity);
    }
    private void PopulateQuestInfo()
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<QuestModel> sourcePageQuest = PreviousPage as ICrossPageSender<QuestModel>;
            QuestModel = sourcePageQuest.GetModel();
            ICrossPageSender<UserModel> sourcePageUser = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePageUser.GetModel();
        }

        TextBoxName.Text = QuestModel.Name;
        TextBoxDescription.Text = QuestModel.Description;

        DateTime startDate = new DateTime(QuestModel.StartDate);
        StartDay.SelectedIndex = startDate.Day;
        StartMonth.SelectedIndex = startDate.Month;
        StartYear.SelectedIndex = startDate.Year;

        DateTime expirationDate = new DateTime(QuestModel.ExpirationDate);
        ExpirationDay.SelectedIndex = expirationDate.Day;
        ExpirationMonth.SelectedIndex = expirationDate.Month;
        ExpirationYear.SelectedIndex = expirationDate.Year;

        switch (QuestModel.ComplexityLevel)
        {
            case QuestComplexityLevel.Easy:
                LevelEasy.Checked = true;
                break;
            case QuestComplexityLevel.Medium:
                LevelMedium.Checked = true;
                break;
            case QuestComplexityLevel.Hard:
                LevelHard.Checked = true;
                break;
            case QuestComplexityLevel.AreYoyCrazy:
                LevelCrazy.Checked = true;
                break;
        }
    }
    private void PopulateStagesInfo()
    {
        DatabaseResponse<List<StageModel>> databaseResponse = new DatabaseRequest<List<StageModel>>()
        {
            RequestType = Database.RequestType.GetStages,
            QuestId = QuestModel.Id
        }.Execute();

        Stages = databaseResponse.Result;

        foreach (StageModel stage in Stages)
        {
            HtmlGenericControl listItem = new HtmlGenericControl("li");
            Label title = new Label() { Text = "Название этапа: " + stage.Title };
            Label question = new Label() { Text = "Вопрос: " + stage.Question };
            Label answer = new Label() { Text = "Ответ: " + stage.Answer };
            Label ordinal = new Label() { Text = "Порядковый номер: " + stage.Ordinal };

            Button deleteButton = new Button() { Text = "Удалить", ID = stage.Ordinal.ToString(), PostBackUrl = "~/App_Page/AdminQuestEdit.aspx" };
            deleteButton.Click += (sender, args) =>
            {
                new DatabaseRequest<object>()
                {
                    RequestType = RequestType.DeleteStage,
                    QuestId = QuestModel.Id,
                    StageOrdinal = int.Parse((sender as Button).ID)
                }.Execute();
                stagesList.Controls.Remove(listItem);
            };


            HtmlGenericControl br = new HtmlGenericControl("<br>");

            //TODO remove this crappy code before course project vindication
            listItem.Controls.Add(title);
            listItem.Controls.Add(br);
            listItem.Controls.Add(question);
            listItem.Controls.Add(br);
            listItem.Controls.Add(answer);
            listItem.Controls.Add(br);
            listItem.Controls.Add(ordinal);
            listItem.Controls.Add(br);
            listItem.Controls.Add(deleteButton);
            listItem.Controls.Add(br);
            //listItem.Controls.Add(editButton);
            listItem.Controls.Add(br);
            stagesList.Controls.Add(listItem);
        }
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }

    StageModel ICrossPageSender<StageModel>.GetModel()
    {
        return SelectedStageModel;
    }

}