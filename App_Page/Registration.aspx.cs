using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

using Model;
using Database;
using Util;
using Interface;

public partial class AppPageRegistration : System.Web.UI.Page, ICrossPageSender<PlayerModel>
{
    private PlayerModel NewlyCreatedPlayer { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RegistrationWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        NewlyCreatedPlayer = CreatePlayer();
        new DatabaseRequest<Object>()
        {
            RequestType = RequestType.RegisterPlayer,
            PlayerModel = NewlyCreatedPlayer
        }.Execute();
    }

    private PlayerModel CreatePlayer()
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

        return new PlayerModel(nickName, firstName, secondName, password, birthDate, null, gender);
    }




    PlayerModel ICrossPageSender<PlayerModel>.GetModel()
    {
        return NewlyCreatedPlayer;
    }
}