using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

using Model;
using Database;
using Util;
using Interface;

public partial class AppPageAuthorization : System.Web.UI.Page, ICrossPageSender<PlayerModel>
{
    private PlayerModel PlayerModel { get; set; }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonAuthorization_Click(object sender, EventArgs e)
    {
        DatabaseResponse<PlayerModel> databaseResponse = new DatabaseRequest<PlayerModel>()
        {
            RequestType = Database.RequestType.AuthorizePlayer,
            NickName = TextBoxUserName.Text,
            Password = TextBoxPassword.Text
        }.Execute();

        PlayerModel = databaseResponse.ResponseModel;
    }

    PlayerModel ICrossPageSender<PlayerModel>.GetModel()
    {
        return PlayerModel;
    }
}