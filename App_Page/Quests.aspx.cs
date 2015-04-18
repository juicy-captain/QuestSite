using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Model;
using Database;
using Util;

public partial class AppPageQuests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatabaseResponse<QuestModel> databaseResponse = new DatabaseRequest<QuestModel>()
        {
            RequestType = Database.RequestType.GetAllQuests,
            ConnectionString = ConnectionUtil.GetConnectionString()
        }.Execute();
        HtmlGenericControl listOfQuests = FindControl("quests list") as HtmlGenericControl;
        //listOfQuests.Controls.Add();
        //TODO write logic of retreiving data from data base; create question page; load user image to disk
    }
}