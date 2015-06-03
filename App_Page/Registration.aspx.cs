using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

using Model;
using Database;
using Util;
using Interface;
using Const;

public partial class AppPageRegistration : System.Web.UI.Page, ICrossPageSender<UserModel>
{
    private UserModel NewlyCreatedPlayer { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RegistrationWizard_FinishButtonClick(object sender, EventArgs eventArgs)
    {
        try
        {
            NewlyCreatedPlayer = CreatePlayer();
            PerformRegisterRequest();
            Server.Transfer("~/App_Page/Profile.aspx", true);
        }
        catch (FileFormatException)
        {
            LabelIncompatibleImageType.Visible = true;
        }
    }

    private UserModel CreatePlayer()
    {
        string nickName = (FindControl("TextBoxNickName") as TextBox).Text;
        string firstName = (FindControl("TextBoxFirstName") as TextBox).Text;
        string secondName = (FindControl("TextBoxSecondName") as TextBox).Text;
        string password = (FindControl("TextBoxPassword") as TextBox).Text;

        int day = int.Parse((FindControl("BirthDay") as DropDownList).SelectedValue);
        int month = int.Parse((FindControl("BirthMonth") as DropDownList).SelectedValue);
        int year = int.Parse((FindControl("BirthYear") as DropDownList).SelectedValue);
        long birthDate = new DateTime(year, month, day).Ticks;

        Sex gender = (FindControl("RadioButtonMale") as RadioButton).Checked ? Sex.Male : Sex.Female;

        string avatarPath = SaveAvatar();

        return new UserModel(nickName, firstName, secondName, password, birthDate, avatarPath, gender);
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
    private void PerformRegisterRequest()
    {
        Dictionary<string,object> Parameters = new Dictionary<string,object>()
        {
            {DatabaseConst.ParameterId, NewlyCreatedPlayer.Id},
            {DatabaseConst.ParameterNickName, NewlyCreatedPlayer.NickName},
            {DatabaseConst.ParameterFirstName, NewlyCreatedPlayer.FirstName},
            {DatabaseConst.ParameterSecondName, NewlyCreatedPlayer.SecondName},
            {DatabaseConst.ParameterPassword, NewlyCreatedPlayer.Password},
            {DatabaseConst.ParameterBirthDate, NewlyCreatedPlayer.BirthDate},
            {DatabaseConst.ParameterAvatarPath, NewlyCreatedPlayer.AvatarPath},
            {DatabaseConst.ParameterGender, (int)NewlyCreatedPlayer.Gender},
        };
        new DatabaseRequest<object>()
        {
            Parameters = Parameters,
            RequestType = RequestType.Alter,
            StoredProcedure = DatabaseConst.SPInsertUser
        }.Execute();
    }


    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return NewlyCreatedPlayer;
    }
}