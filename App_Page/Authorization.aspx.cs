using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class App_Page_Authorization : System.Web.UI.Page, ICrossPageUserSender
{
    private PlayerModel mPlayerModel { get; set; }

    private static SqlParameter[] sSqlOutputParameters;
    static App_Page_Authorization()
    {
        sSqlOutputParameters = new SqlParameter[] {
                                                new SqlParameter(UserModel.PARAMETER_ID, SqlDbType.Int) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_FIRST_NAME, SqlDbType.VarChar, 50) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_SECOND_NAME, SqlDbType.VarChar, 50) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_BIRTH_DATE, SqlDbType.BigInt) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_AVATAR_PATH, SqlDbType.VarChar, 50) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_GENDER, SqlDbType.Bit) {Direction = ParameterDirection.Output}
                                            };
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonAuthorization_Click(object sender, EventArgs e)
    {
        string userName = TextBoxUserName.Text;
        string password = TextBoxPassword.Text;
        SqlParameter[] sqlInputParameters = {
                                                new SqlParameter(UserModel.PARAMETER_NICK_NAME, userName),
                                                new SqlParameter(UserModel.PARAMETER_PASSWORD, password)
                                            };

        string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand selectCommand = connection.CreateCommand();
            selectCommand.CommandType = CommandType.StoredProcedure;
            selectCommand.CommandText = "AuthorizationQuery";
            selectCommand.Parameters.AddRange(sqlInputParameters);
            selectCommand.Parameters.AddRange(sSqlOutputParameters);

            connection.Open();
            selectCommand.ExecuteNonQuery();
            mPlayerModel = new PlayerModel(userName, password, selectCommand);
        }
    }

    PlayerModel ICrossPageUserSender.GetPlayerModel()
    {
        return mPlayerModel;
    }
}