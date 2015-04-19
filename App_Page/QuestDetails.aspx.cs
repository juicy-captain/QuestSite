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

public partial class App_Page_QuestDetails : System.Web.UI.Page
{
    private QuestModel QuestModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null && PreviousPage is ICrossPageSender<QuestModel>)
        {
            ICrossPageSender<QuestModel> sourcePage = PreviousPage as ICrossPageSender<QuestModel>;
            QuestModel = sourcePage.GetModel();

            Label description = new Label()
            {
                Text = String.Format("{0}<br>{1}<br>Дата начала: {2}<br>Дата окончания: {3}<br>Уровень сложности: {4}",
                QuestModel.Name, QuestModel.Description, new DateTime(QuestModel.StartDate),
                new DateTime(QuestModel.ExpirationDate), QuestModel.ComplexityLevel)
            };

            (FindControl("QuestDetails") as HtmlGenericControl).Controls.Add(description);

            DatabaseResponse<List<StageModel>> databaseResponse = new DatabaseRequest<List<StageModel>>()
            {
                RequestType = Database.RequestType.GetStages,
                QuestId = QuestModel.Id
            }.Execute();
        }
    }

}