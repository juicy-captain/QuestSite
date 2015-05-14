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
    protected void ButtonSaveChanges_Click(object sender, EventArgs e)
    {
        try
        {
            UserModel = CreatePlayer();
            PerformProfileUpdateRequest();
        }
        catch (FileFormatException)
        {
            LabelIncompatibleImageType.Visible = true;
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
    private void PerformProfileUpdateRequest()
    {
        Dictionary<string, object> Parameters = new Dictionary<string, object>()
        {
            {DatabaseConst.ParameterId, UserModel.Id},
            {DatabaseConst.ParameterNickName, UserModel.NickName},
            {DatabaseConst.ParameterFirstName, UserModel.FirstName},
            {DatabaseConst.ParameterSecondName, UserModel.SecondName},
            {DatabaseConst.ParameterPassword, UserModel.Password},
            {DatabaseConst.ParameterBirthDate, UserModel.BirthDate},
            {DatabaseConst.ParameterAvatarPath, UserModel.AvatarPath},
            {DatabaseConst.ParameterGender, (int)UserModel.Gender},
        };
        new DatabaseRequest<object>()
        {
            Parameters = Parameters,
            RequestType = RequestType.Insert,
            StoredProcedure = DatabaseConst.SPEditUser
        }.Execute();
    }


    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return UserModel;
    }
}