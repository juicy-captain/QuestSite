﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Model;
using Database;
using Interface;

public partial class AppPageQuestion : System.Web.UI.Page, ICrossPageSender<PlayerModel>, ICrossPageSender<QuestModel>
{
    private static PlayerModel PlayerModel { get; set; }
    private static QuestModel QuestModel { get; set; }
    private static StageModel StageModel { get; set; }
    private static int LastStage { get; set; }
    private static bool isPreviousAnswerRight { get; set; }
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
            LastStage = lastStageResponse.Result;
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
            DatabaseResponse<bool> answerResponse = new DatabaseRequest<bool>()
            {
                RequestType = RequestType.CheckAnswer,
                StageOrdinal = StageModel.Ordinal,
                QuestId = QuestModel.Id,
                Answer = TextBoxPlayerAnswer.Text
            }.Execute();

            isPreviousAnswerRight = answerResponse.Result;

            if (isPreviousAnswerRight)
            {
                new DatabaseRequest<int>()
                {
                    RequestType = RequestType.СonfirmRightAnswer,
                    StageOrdinal = StageModel.Ordinal,
                    QuestId = QuestModel.Id,
                    PlayerId = PlayerModel.Id
                }.Execute();
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

    PlayerModel ICrossPageSender<PlayerModel>.GetModel()
    {
        return PlayerModel;
    }

    QuestModel ICrossPageSender<QuestModel>.GetModel()
    {
        return QuestModel;
    }

}