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

    protected void RegistrationWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        try
        {
            NewlyCreatedPlayer = CreatePlayer();
            new DatabaseRequest<Object>()
            {
                RequestType = RequestType.RegisterUser,
                UserModel = NewlyCreatedPlayer
            }.Execute();
            Server.Transfer("~/App_Page/Profile.aspx", true);
        }
        catch (FileFormatException)
        {
            LabelIncompatibleImageType.Visible = true;
        }
    }

    private UserModel CreatePlayer()
    {
        string nickName = (RegistrationWizard.WizardSteps[0].FindControl("TextBoxNickName") as TextBox).Text;
        string firstName = (RegistrationWizard.WizardSteps[0].FindControl("TextBoxFirstName") as TextBox).Text;
        string secondName = (RegistrationWizard.WizardSteps[0].FindControl("TextBoxSecondName") as TextBox).Text;
        string password = (RegistrationWizard.WizardSteps[0].FindControl("TextBoxPassword") as TextBox).Text;

        int day = int.Parse((RegistrationWizard.WizardSteps[1].FindControl("BirthDay") as DropDownList).SelectedValue);
        int month = int.Parse((RegistrationWizard.WizardSteps[1].FindControl("BirthMonth") as DropDownList).SelectedValue);
        int year = int.Parse((RegistrationWizard.WizardSteps[1].FindControl("BirthYear") as DropDownList).SelectedValue);
        long birthDate = new DateTime(year, month, day).Ticks;

        UserModel.Sex gender = (RegistrationWizard.WizardSteps[1].FindControl("RadioButtonMale") as RadioButton).Checked ? UserModel.Sex.Male : UserModel.Sex.Female;

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


    UserModel ICrossPageSender<UserModel>.GetModel()
    {
        return NewlyCreatedPlayer;
    }
}