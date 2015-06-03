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
using Const;
using Processor;

public partial class App_Page_AdminQuestEdit : System.Web.UI.Page,
    ICrossPageSender<UserModel>,
    ICrossPageSender<StageModel>,
    ICrossPageSender<QuestModel>
{
    private static UserModel UserModel { get; set; }
    private static QuestModel QuestModel { get; set; }
    private static StageModel SelectedStageModel { get; set; }
    private static List<StageModel> Stages { get; set; }
    private static bool isNewQuest { get; set; }
    private static IProcessor<List<StageModel>> Processor { get; set; }

    static App_Page_AdminQuestEdit()
    {
        Processor = new StageBatchProcessor();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateQuestInfo();
        PopulateStagesInfo();

    }
    protected void ButtonSaveChanges_Click(object sender, EventArgs e)
    {
        CreateUpdatedQuest();
        if (isNewQuest)
        {
            PerformAddQuestRequest();
        }
        else
        {
            PerformEditQuestRequest();
        }
    }
    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        PerformDeleteQuestRequest();
    }
    protected void ButtonAddNewStage_Click(object sender, EventArgs e)
    {
        SelectedStageModel = null;
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

        int id = ServerConst.FictitiousId;
        if (QuestModel != null)
        {
            id = QuestModel.Id;
        }
        QuestModel = new QuestModel(id, name, description, startDate, expirationDate, complexity);
    }
    private void PopulateQuestInfo()
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<QuestModel> sourcePageQuest = PreviousPage as ICrossPageSender<QuestModel>;
            QuestModel = sourcePageQuest.GetModel();
            ICrossPageSender<UserModel> sourcePageUser = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePageUser.GetModel();


            if (QuestModel != null)
            {
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

                isNewQuest = false;
            }
            else
            {
                isNewQuest = true;
                ButtonDelete.Visible = false;
                ButtonAddNewStage.Visible = false;
            }
        }



    }
    private void PopulateStagesInfo()
    {
        if (QuestModel != null)
        {
            PerformGetStagesRequest();

            foreach (StageModel stage in QuestModel.Stages)
            {
                HtmlGenericControl listItem = new HtmlGenericControl("li");
                Label title = new Label() { Text = "Название этапа: " + stage.Title };
                Label question = new Label() { Text = "Вопрос: " + stage.Question };
                Label answer = new Label() { Text = "Ответ: " + stage.Answer };
                Label ordinal = new Label() { Text = "Порядковый номер: " + stage.Ordinal };
                Button editButton = new Button() { Text = "Редактировать", ID = stage.Ordinal.ToString(), PostBackUrl = "~/App_Page/AdminStageEdit.aspx" };
                editButton.Click += (sender, args) =>
                {
                    int selectedStageOrdinal = int.Parse((sender as Button).ID);
                    foreach (StageModel stageModel in QuestModel.Stages)
                    {
                        if (stageModel.Ordinal == selectedStageOrdinal)
                        {
                            SelectedStageModel = stageModel;
                            break;
                        }
                    }
                };

               

                //TODO remove this crappy code before course project vindication
                listItem.Controls.Add(title);
                listItem.Controls.Add(new HtmlGenericControl("br"));
                listItem.Controls.Add(question);
                listItem.Controls.Add(new HtmlGenericControl("br"));
                listItem.Controls.Add(answer);
                listItem.Controls.Add(new HtmlGenericControl("br"));
                listItem.Controls.Add(ordinal);
                listItem.Controls.Add(new HtmlGenericControl("br"));
                listItem.Controls.Add(editButton);
                listItem.Controls.Add(new HtmlGenericControl("br"));
                //listItem.Controls.Add(editButton);
                listItem.Controls.Add(new HtmlGenericControl("br"));
                stagesList.Controls.Add(listItem);
            }
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
            Processor = Processor,
            RequestType = RequestType.Query,
            StoredProcedure = DatabaseConst.SPGetQuestStages
        }.Execute();

        QuestModel.Stages = databaseResponse.Result;
    }
    private void PerformAddQuestRequest()
    {
        Dictionary<string, object> ParametersAddQuest = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterName, QuestModel.Name},
            {DatabaseConst.ParameterDescription, QuestModel.Description},
            {DatabaseConst.ParameterStartDate, QuestModel.StartDate},
            {DatabaseConst.ParameterExpirationDate, QuestModel.ExpirationDate},
            {DatabaseConst.ParameterComplexityLevel, QuestModel.ComplexityLevel},
        };
        new DatabaseRequest<object>()
        {
            Parameters = ParametersAddQuest,
            RequestType = RequestType.Alter,
            StoredProcedure = DatabaseConst.SPInsertQuest
        }.Execute();
    }
    private void PerformEditQuestRequest()
    {
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterQuestId, QuestModel.Id},
            {DatabaseConst.ParameterName, QuestModel.Name},
            {DatabaseConst.ParameterDescription, QuestModel.Description},
            {DatabaseConst.ParameterStartDate, QuestModel.StartDate},
            {DatabaseConst.ParameterExpirationDate, QuestModel.ExpirationDate},
            {DatabaseConst.ParameterComplexityLevel, QuestModel.ComplexityLevel},
        };
        new DatabaseRequest<object>()
        {
            Parameters = Parameters,
            RequestType = RequestType.Alter,
            StoredProcedure = DatabaseConst.SPEditQuest
        }.Execute();
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
    StageModel ICrossPageSender<StageModel>.GetModel()
    {
        return SelectedStageModel;
    }
    QuestModel ICrossPageSender<QuestModel>.GetModel()
    {
        return QuestModel;
    }

}