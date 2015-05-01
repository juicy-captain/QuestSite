using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Database;
using Model;
using Interface;

public partial class App_Page_AdminQuestEdit : System.Web.UI.Page, ICrossPageSender<UserModel>
{
    private static UserModel UserModel { get; set; }
    private static QuestModel QuestModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<QuestModel> sourcePageQuest = PreviousPage as ICrossPageSender<QuestModel>;
            QuestModel = sourcePageQuest.GetModel();
            ICrossPageSender<UserModel> sourcePageUser = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePageUser.GetModel();

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
    protected void ButtonSaveChanges_Click(object sender, EventArgs e)
    {
        CreateUpdatedQuest();
        new DatabaseRequest<object>()
        {
            RequestType = RequestType.EditQuest,
            QuestModel = QuestModel
        }.Execute();
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }
}