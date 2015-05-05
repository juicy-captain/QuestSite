using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Interface;
using Model;
using Database;

public partial class App_Page_AdminStageEdit : System.Web.UI.Page, ICrossPageSender<UserModel>, ICrossPageSender<QuestModel>
{
    private static QuestModel QuestModel { get; set; }
    private static StageModel StageModel { get; set; }
    private static UserModel UserModel { get; set; }
    private static bool isNewStage { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        GetModelsAndSetFileds();
    }
    protected void ButtonSaveChanges_Click(object sender, EventArgs e)
    {
        string title = TextBoxTitle.Text;
        string question = TextBoxQuestion.Text;
        string answer = TextBoxAnswer.Text;
        int ordinal = int.Parse(TextBoxOrdinal.Text);
        int previousStageOrdinal = 0;
        if (!isNewStage)
        {
            previousStageOrdinal = StageModel.Ordinal;
        }


        StageModel = new StageModel(title, question, null, answer, ordinal);

        if (isNewStage)
        {
            new DatabaseRequest<object>()
            {
                RequestType = RequestType.AddStage,
                QuestId = QuestModel.Id,
                StageModel = StageModel
            }.Execute();
            isNewStage = false;
        }
        else
        {
            new DatabaseRequest<object>()
            {
                RequestType = RequestType.EditStage,
                QuestId = QuestModel.Id,
                PreviousStageOrdinal = previousStageOrdinal,
                StageModel = StageModel
            }.Execute();
        }
    }
    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        new DatabaseRequest<object>()
        {
            RequestType = RequestType.DeleteStage,
            QuestId = QuestModel.Id,
            StageOrdinal = StageModel.Ordinal
        }.Execute();
    }

    private void GetModelsAndSetFileds()
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<QuestModel> sourceQuestPage = PreviousPage as ICrossPageSender<QuestModel>;
            QuestModel = sourceQuestPage.GetModel();
            ICrossPageSender<StageModel> sourceStagePage = PreviousPage as ICrossPageSender<StageModel>;
            StageModel = sourceStagePage.GetModel();
            ICrossPageSender<UserModel> sourceUserPage = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourceUserPage.GetModel();

            if (StageModel == null)
            {
                isNewStage = true;
                ButtonDelete.Visible = false;
                return;
            }
            TextBoxTitle.Text = StageModel.Title;
            TextBoxQuestion.Text = StageModel.Question;
            TextBoxAnswer.Text = StageModel.Answer;
            TextBoxOrdinal.Text = StageModel.Ordinal.ToString();
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