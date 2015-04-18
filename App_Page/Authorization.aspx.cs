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

public partial class AppPageAuthorization : System.Web.UI.Page, ICrossPageUserSender
{
    private PlayerModel PlayerModel { get; set; }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonAuthorization_Click(object sender, EventArgs e)
    {
        string nickName = TextBoxUserName.Text;
        string password = TextBoxPassword.Text;
        SqlParameter[] inputParameters = {
                                                new SqlParameter(DatabaseConst.ParameterNickName, nickName),
                                                new SqlParameter(DatabaseConst.ParameterPassword, password)
                                            };

        DatabaseResponse<PlayerModel> databaseResponse = new DatabaseRequest<PlayerModel>()
        {
            RequestType = Database.RequestType.AuthorizePlayer,
            InputParameters = inputParameters,
            ConnectionString = ConnectionUtil.GetConnectionString(),
            NickName = nickName,
            Password = password
        }.Execute();

        PlayerModel = databaseResponse.ResponseModel;
    }

    PlayerModel ICrossPageUserSender.GetPlayerModel()
    {
        return PlayerModel;
    }
}