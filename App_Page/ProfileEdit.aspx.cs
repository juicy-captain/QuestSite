using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using Database;
using Model;
using Interface;
using Const;
using Util;

public partial class App_Page_ProfileEdit : System.Web.UI.Page, ICrossPageSender<PlayerModel>
{
    private static PlayerModel PlayerModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<PlayerModel> sourcePage = PreviousPage as ICrossPageSender<PlayerModel>;
            PlayerModel = sourcePage.GetModel();
            TextBoxNickName.Text = PlayerModel.NickName;
            TextBoxFirstName.Text = PlayerModel.FirstName;
            TextBoxSecondName.Text = PlayerModel.SecondName;
            BirthDay.SelectedIndex = new DateTime(PlayerModel.BirthDate).Day;
            BirthMonth.SelectedIndex = new DateTime(PlayerModel.BirthDate).Month;
            BirthYear.SelectedIndex = new DateTime(PlayerModel.BirthDate).Year;
            if (PlayerModel.Gender == UserModel.Sex.Male)
            {
                RadioButtonMale.Checked = true;
            }
            else
            {
                RadioButtonFemale.Checked = true;
            }
        }
    }

    private PlayerModel CreatePlayer()
    {
        string nickName = TextBoxNickName.Text;
        string firstName = TextBoxFirstName.Text;
        string secondName = TextBoxSecondName.Text;
        string password = TextBoxCheckNewPassword.Text;

        int day = int.Parse(BirthDay.SelectedValue);
        int month = int.Parse(BirthMonth.SelectedValue);
        int year = int.Parse(BirthYear.SelectedValue);
        long birthDate = new DateTime(year, month, day).Ticks;

        UserModel.Sex gender = RadioButtonMale.Checked ? UserModel.Sex.Male : UserModel.Sex.Female;

        string avatarPath = SaveAvatar();

        PlayerModel editedPlayerModel = new PlayerModel(nickName, firstName, secondName, password, birthDate, avatarPath, gender)
        {
            Id = PlayerModel.Id
        };
        return editedPlayerModel;
    }

    private string SaveAvatar()
    {
        if (AvatarUpload.HasFile)
        {
            string fileExtension = FileUtil.GetFileExtension(AvatarUpload);
            if (ServerConst.AvatarFormats.Contains(fileExtension))
            {
                string fileName = Server.MapPath(ServerConst.BaseAvatarPath) + AvatarUpload.FileName;
                AvatarUpload.SaveAs(fileName);
                return ServerConst.BaseAvatarPath + AvatarUpload.FileName;
            }
            else
            {
                throw new FileFormatException();
            }
        }
        else
        {
            return ServerConst.DefaultAvatarPath;
        }
    }

    protected void ButtonSaveChanges_Click(object sender, EventArgs e)
    {
        try
        {
            PlayerModel = CreatePlayer();
            new DatabaseRequest<Object>()
            {
                RequestType = RequestType.UpdateProfile,
                PlayerModel = PlayerModel
            }.Execute();
            Server.Transfer("~/App_Page/Profile.aspx", true);
        }
        catch (FileFormatException)
        {
            LabelIncompatibleImageType.Visible = true;
        }
    }

    PlayerModel ICrossPageSender<PlayerModel>.GetModel()
    {
        return PlayerModel;
    }
}