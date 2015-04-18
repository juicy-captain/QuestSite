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

public partial class App_Page_Authorization : System.Web.UI.Page, ICrossPageUserSender
{
    private PlayerModel mPlayerModel { get; set; }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonAuthorization_Click(object sender, EventArgs e)
    {
        string nickName = TextBoxUserName.Text;
        string password = TextBoxPassword.Text;
        SqlParameter[] inputParameters = {
                                                new SqlParameter(UserModel.PARAMETER_NICK_NAME, nickName),
                                                new SqlParameter(UserModel.PARAMETER_PASSWORD, password)
                                            };
        string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        DatabaseResponse databaseResponse = new DatabaseRequest()
        {
            RequestType = Database.RequestType.AuthorizePlayer,
            OutputParameters = DatabaseConst.AuthorizationOutputParameters,
            InputParameters = inputParameters,
            ConnectionString = connectionString,
            NickName = nickName,
            Password = password
        }.Execute();

        mPlayerModel = databaseResponse.PlayerModel;
    }

    PlayerModel ICrossPageUserSender.GetPlayerModel()
    {
        return mPlayerModel;
    }
}