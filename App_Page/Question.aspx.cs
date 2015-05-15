using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Model;
using Database;
using Interface;
using Processor;

public partial class AppPageQuestion : System.Web.UI.Page, ICrossPageSender<UserModel>, ICrossPageSender<QuestModel>
{
    private static UserModel UserModel { get; set; }
    private static QuestModel QuestModel { get; set; }
    private static StageModel StageModel { get; set; }
    private static int LastStage { get; set; }
    private static bool isPreviousAnswerRight { get; set; }
    private static IProcessor<string> AnswerProcessor { get; set; }
    private static IProcessor<int> LastStageProcessor { get; set; }

    static AppPageQuestion()
    {
        AnswerProcessor = new GetAnswerProcessor();
        LastStageProcessor = new GetLastStageOrdinalProcessor();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null && PreviousPage is ICrossPageSender<UserModel> && PreviousPage is ICrossPageSender<QuestModel>)
        {
            UserModel = (PreviousPage as ICrossPageSender<UserModel>).GetModel();
            QuestModel = (PreviousPage as ICrossPageSender<QuestModel>).GetModel();

            PerformGetLastStageRequest();
            SetQuest();
        }
        else
        {
            if (isPreviousAnswerRight)
            {
                if (LastStage != QuestModel.Stages.Count)
                {
                    isPreviousAnswerRight = false;
                    SetQuest();
                    ControlsBeforeNewQuestion();
                }
            }
        }
    }
    protected void ButtonSendAnswer_Click(object sender, EventArgs e)
    {
        if (!isPreviousAnswerRight)
        {
            isPreviousAnswerRight = PerformCheckAnswerRequest();

            if (isPreviousAnswerRight)
            {
                PerformСonfirmRightAnswerRequest();
                LastStage++;
                ControlsAfterRightAnswer();
            }
            else
            {
                LabelWrongAnswer.Visible = true;
            }
        }

    }

    void ControlsAfterRightAnswer()
    {
        LabelQuestionTitle.Visible = false;
        LabelQuestionBody.Visible = false;
        TextBoxPlayerAnswer.Visible = false;
        ButtonSendAnswer.Visible = false;
        LabelWrongAnswer.Visible = false;

        if (LastStage != QuestModel.Stages.Count)
        {
            ButtonNextStep.Visible = true;
        }
        else
        {
            ControlsQuestEnd();
        }

    }
    void ControlsBeforeNewQuestion()
    {
        TextBoxPlayerAnswer.Text = String.Empty;

        LabelQuestionTitle.Visible = true;
        LabelQuestionBody.Visible = true;
        TextBoxPlayerAnswer.Visible = true;
        ButtonSendAnswer.Visible = true;
        LabelWrongAnswer.Visible = false;
        ButtonNextStep.Visible = false;
    }
    void ControlsQuestEnd()
    {
        LabelQuestionTitle.Visible = false;
        LabelQuestionBody.Visible = false;
        TextBoxPlayerAnswer.Visible = false;
        ButtonNextStep.Visible = false;
        ButtonSendAnswer.Visible = false;
        LabelWrongAnswer.Visible = false;
        ButtonQuestionEnd.Visible = true;
    }
    void SetQuest()
    {
        StageModel = QuestModel.Stages[LastStage];
        LabelQuestionTitle.Text = StageModel.Title;
        LabelQuestionBody.Text = StageModel.Question;
    }
    private void PerformСonfirmRightAnswerRequest()
    {
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterQuestId, QuestModel.Id},
            {DatabaseConst.ParameterUserId, UserModel.Id},
        };
        new DatabaseRequest<object>()
        {
            Parameters = Parameters,
            RequestType = RequestType.Insert,
            StoredProcedure = DatabaseConst.SPSetNewLastStage
        }.Execute();
    }
    private bool PerformCheckAnswerRequest()
    {
        //Is user's answer rignt?
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterQuestId, QuestModel.Id},
            {DatabaseConst.ParameterStageOrdinal, StageModel.Ordinal},
        };
        DatabaseResponse<string> databaseResponse = new DatabaseRequest<string>()
        {
            Parameters = Parameters,
            Processor = AnswerProcessor,
            RequestType = RequestType.Query,
            StoredProcedure = DatabaseConst.SPGetAnswer
        }.Execute();
        return databaseResponse.Result.Equals(TextBoxPlayerAnswer.Text);
    }
    private void PerformGetLastStageRequest()
    {
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterQuestId, QuestModel.Id},
            {DatabaseConst.ParameterUserId, UserModel.Id},
        };
        DatabaseResponse<int> lastStageResponse = new DatabaseRequest<int>()
        {
            Parameters = Parameters,
            Processor = LastStageProcessor,
            RequestType = RequestType.Query,
            StoredProcedure = DatabaseConst.SPGetLastStage
        }.Execute();
        LastStage = lastStageResponse.Result;
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