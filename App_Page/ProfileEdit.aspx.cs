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

public partial class App_Page_ProfileEdit : System.Web.UI.Page, ICrossPageSender<UserModel>
{
    private static UserModel UserModel { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            ICrossPageSender<UserModel> sourcePage = PreviousPage as ICrossPageSender<UserModel>;
            UserModel = sourcePage.GetModel();
            TextBoxNickName.Text = UserModel.NickName;
            TextBoxFirstName.Text = UserModel.FirstName;
            TextBoxSecondName.Text = UserModel.SecondName;
            BirthDay.SelectedIndex = new DateTime(UserModel.BirthDate).Day;
            BirthMonth.SelectedIndex = new DateTime(UserModel.BirthDate).Month;
            BirthYear.SelectedIndex = new DateTime(UserModel.BirthDate).Year;
            if (UserModel.Gender == Sex.Male)
            {
                RadioButtonMale.Checked = true;
            }
            else
            {
                RadioButtonFemale.Checked = true;
            }
        }
    }

    private UserModel CreatePlayer()
    {
        string nickName = TextBoxNickName.Text;
        string firstName = TextBoxFirstName.Text;
        string secondName = TextBoxSecondName.Text;
        string password = TextBoxCheckNewPassword.Text;

        int day = int.Parse(BirthDay.SelectedValue);
        int month = int.Parse(BirthMonth.SelectedValue);
        int year = int.Parse(BirthYear.SelectedValue);
        long birthDate = new DateTime(year, month, day).Ticks;

        Sex gender = RadioButtonMale.Checked ? Sex.Male : Sex.Female;

        string avatarPath = SaveAvatar();

        UserModel editedUserModel = new UserModel(nickName, firstName, secondName, password, birthDate, avatarPath, gender)
        {
            Id = UserModel.Id
        };
        return editedUserModel;
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
            UserModel = CreatePlayer();
            new DatabaseRequest<Object>()
            {
                RequestType = RequestType.UpdateProfile,
                UserModel = UserModel
            }.Execute();
            Server.Transfer("~/App_Page/Profile.aspx", true);
        }
        catch (FileFormatException)
        {
            LabelIncompatibleImageType.Visible = true;
        }
    }

    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }
}