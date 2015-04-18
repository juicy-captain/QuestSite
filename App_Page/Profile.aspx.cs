using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Model;

public partial class AppPageProfile : System.Web.UI.Page
{
    private PlayerModel MPlayerModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null && PreviousPage is ICrossPageUserSender)
        {
            ICrossPageUserSender sourcePage = (ICrossPageUserSender)PreviousPage;
            MPlayerModel = sourcePage.GetPlayerModel();
            LabelFirstName.Text = MPlayerModel.FirstName;
            LabelNickName.Text = MPlayerModel.NickName;
            LabelSecondName.Text = MPlayerModel.SecondName;
        }
    }
}