using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Model;
using Interface;

public partial class AppPageProfile : System.Web.UI.Page, ICrossPageSender<PlayerModel>
{
    private static PlayerModel PlayerModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null && PreviousPage is ICrossPageSender<PlayerModel>)
        {
            ICrossPageSender<PlayerModel> sourcePage = PreviousPage as ICrossPageSender<PlayerModel>;
            PlayerModel = sourcePage.GetModel();
            LabelFirstName.Text = PlayerModel.FirstName;
            LabelNickName.Text = PlayerModel.NickName;
            LabelSecondName.Text = PlayerModel.SecondName;
        }
    }

    PlayerModel ICrossPageSender<PlayerModel>.GetModel()
    {
        return PlayerModel;
    }
}