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

public partial class AppPageAuthorization : System.Web.UI.Page, ICrossPageSender<UserModel>
{
    private UserModel UserModel { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonAuthorization_Click(object sender, EventArgs e)
    {
        DatabaseResponse<UserModel> databaseResponse = new DatabaseRequest<UserModel>()
        {
                RequestType = Database.RequestType.AuthorizeUser,
                NickName = TextBoxUserName.Text,
                Password = TextBoxPassword.Text
        }.Execute();
        UserModel = databaseResponse.Result;

        if (CheckBoxAdministrator.Checked)
        {
            Server.Transfer("~/App_Page/AdminUsers.aspx", true);
        }
        else
        {
            Server.Transfer("~/App_Page/Profile.aspx", true);
        }
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }

}