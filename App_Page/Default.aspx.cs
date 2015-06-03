using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Model;
using Interface;

public partial class AppPageDefault : System.Web.UI.Page, ICrossPageSender<UserModel>
{
    private UserModel UserModel { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }
}