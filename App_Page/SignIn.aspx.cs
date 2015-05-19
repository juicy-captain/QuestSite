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
//using Processor;

public partial class AppPageAuthorization : System.Web.UI.Page, ICrossPageSender<UserModel>
{
private UserModel UserModel { get; set; }
//private static IProcessor<UserModel> Processor { get; set; }

//static AppPageAuthorization()
//{
//    Processor = new UserAuthProcessor();
//}
protected void Page_Load(object sender, EventArgs e)
{

    }
    //protected void ButtonAuthorization_Click(object sender, EventArgs e)
    //{
    //    PerformAuthRequest();

    //    if (UserModel != null)
    //    {
    //        if (CheckBoxAdministrator.Checked)
    //        {
    //            Server.Transfer("~/App_Page/AdminUsers.aspx", true);
    //        }
    //        else
    //        {
    //            Server.Transfer("~/App_Page/Profile.aspx", true);
    //        }
    //    }
    //    else
    //    {
    //        //should be moved to JS
    //        LabelNotRegistered.Visible = true;
    //        ButtonGoToRegistration.Visible = true;

    //        LabelUserName.Visible = false;
    //        LabelPassword.Visible = false;
    //        TextBoxUserName.Visible = false;
    //        TextBoxPassword.Visible = false;
    //        CheckBoxAdministrator.Visible = false;
    //        ButtonAuthorization.Visible = false;
    //    }
    //}

    //private void PerformAuthRequest()
    //{
    //    Dictionary<string, object> Parameters = new Dictionary<string, object>()
    //    {
    //        {DatabaseConst.ParameterNickName, TextBoxUserName.Text},
    //        {DatabaseConst.ParameterPassword, TextBoxPassword.Text},
    //    };
    //    DatabaseResponse<UserModel> databaseResponse = new DatabaseRequest<UserModel>()
    //    {
    //        Parameters = Parameters,
    //        Processor = Processor,
    //        RequestType = RequestType.Query,
    //        StoredProcedure = DatabaseConst.SPAuthorizeUser
    //    }.Execute();
    //    UserModel = databaseResponse.Result;
    //}

UserModel ICrossPageSender<UserModel>.GetModel()
{
    return UserModel;
}

}