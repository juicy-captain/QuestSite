using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Model;

public partial class AppPageDefault : System.Web.UI.Page, ICrossPageUserSender
{
    private PlayerModel MPlayerModel { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    PlayerModel ICrossPageUserSender.GetPlayerModel()
    {
        return MPlayerModel;
    }

}