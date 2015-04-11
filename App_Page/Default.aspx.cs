using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_Default : System.Web.UI.Page, ICrossPageUserSender
{
    private PlayerModel mPlayerModel { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    PlayerModel ICrossPageUserSender.GetPlayerModel()
    {
        return mPlayerModel;
    }

}