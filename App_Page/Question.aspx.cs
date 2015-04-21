using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Model;
using Database;
using Interface;

public partial class AppPageQuestion : System.Web.UI.Page
{
    private PlayerModel PlayerModel { get; set; }
    private QuestModel QuestModel { get; set; }
    private StageModel StageModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null && PreviousPage is ICrossPageSender<PlayerModel> && PreviousPage is ICrossPageSender<QuestModel>)
        {
            PlayerModel = (PreviousPage as ICrossPageSender<PlayerModel>).GetModel();
            QuestModel = (PreviousPage as ICrossPageSender<QuestModel>).GetModel();

            DatabaseResponse<int> lastStageResponse = new DatabaseRequest<int>()
            {
                RequestType = RequestType.GetLastStage,
                PlayerId = PlayerModel.Id,
                QuestId = QuestModel.Id
            }.Execute();

            QuestModel.LastStage = lastStageResponse.ValueResult;

            StageModel = QuestModel.Stages[lastStageResponse.ValueResult];
            LabelQuestionTitle.Text = StageModel.Title;
            LabelQuestionBody.Text = StageModel.Question;
        }
    }
    protected void ButtonSendAnswer_Click(object sender, EventArgs e)
    {
        DatabaseResponse<bool> answerResponse = new DatabaseRequest<bool>()
        {
            RequestType = RequestType.CheckAnswer,
            StageOrdinal = StageModel.Ordinal,
            QuestId = QuestModel.Id,
            Answer = TextBoxPlayerAnswer.Text
        }.Execute();

        bool isAnswerRight = answerResponse.ValueResult;

        if (isAnswerRight)
        {
            new DatabaseRequest<int>()
            {
                RequestType = RequestType.СonfirmRightAnswer,
                StageOrdinal = StageModel.Ordinal,
                QuestId = QuestModel.Id,
                PlayerId = PlayerModel.Id
            }.Execute();
        }
    }
}