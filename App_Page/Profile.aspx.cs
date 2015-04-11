using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Page_Profile : System.Web.UI.Page
{
    private PlayerModel mPlayerModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
        {
            ICrossPageUserSender sourcePage = (ICrossPageUserSender)PreviousPage;
            mPlayerModel = sourcePage.GetPlayerModel();
            LabelFirstName.Text = mPlayerModel.FirstName;
            LabelNickName.Text = mPlayerModel.NickName;
            LabelSecondName.Text = mPlayerModel.SecondName;
        }
    }
}