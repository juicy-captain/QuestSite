using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Model;
using Interface;
using Database;

public partial class AppPageProfile : System.Web.UI.Page, ICrossPageSender<PlayerModel>, ICrossPageSender<QuestModel>
{
    private static PlayerModel PlayerModel { get; set; }
    private static List<QuestModel> QuestModels { get; set; }
    private static QuestModel SelectedQuestModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null && PreviousPage is ICrossPageSender<PlayerModel>)
        {
            GetPlayer();
            GetAndPopulateQuestList();
        }
        else
        {
            //dynamically added linkToDetails has been pressed
            //WTF?????? IT MUST NOT BE SO!!!!
        }
    }

    private void GetPlayer()
    {
        ICrossPageSender<PlayerModel> sourcePage = PreviousPage as ICrossPageSender<PlayerModel>;
        PlayerModel = sourcePage.GetModel();
        LabelFirstName.Text = PlayerModel.FirstName;
        LabelNickName.Text = PlayerModel.NickName;
        LabelSecondName.Text = PlayerModel.SecondName;
    }

    private void GetAndPopulateQuestList()
    {
        DatabaseResponse<List<QuestModel>> databaseResponse = new DatabaseRequest<List<QuestModel>>()
        {
            RequestType = RequestType.GetPlayerSubscriptions,
            PlayerId = PlayerModel.Id
        }.Execute();
        QuestModels = databaseResponse.ResponseModel;

        if (QuestModels.Count != 0)
        {
            HtmlGenericControl questsList = FindControl("QuestsList") as HtmlGenericControl;
            foreach (QuestModel quest in QuestModels)
            {
                HtmlGenericControl listItem = new HtmlGenericControl("li");

                LinkButton linkToDetails = new LinkButton() { Text = quest.Name, PostBackUrl = "~/App_Page/QuestDetails.aspx" };

                //IT DOES NOT WORK AT THIS PAGE BUT WORK AT QUESTS
                linkToDetails.Click += (sender, args) =>
                    {
                        string selectedQuestName = (sender as LinkButton).Text;
                        foreach (QuestModel questModel in QuestModels)
                        {
                            if (questModel.Name.Equals(selectedQuestName))
                            {
                                SelectedQuestModel = questModel;
                                break;
                            }
                        }
                    };
                listItem.Controls.Add(linkToDetails);
                questsList.Controls.Add(listItem);
            }
        }
        else
        {
            (FindControl("LabelSubscriptions") as Label).Text = "Вы пока не подписались на на один квест";
        }
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

    PlayerModel ICrossPageSender<PlayerModel>.GetModel()
    {
        return PlayerModel;
    }

    QuestModel ICrossPageSender<QuestModel>.GetModel()
    {
        return SelectedQuestModel;
    }
}