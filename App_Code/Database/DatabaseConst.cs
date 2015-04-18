using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

using Model;

namespace Database
{
    /// <summary>
    /// Summary description for DatabaseConst
    /// </summary>
    public static class DatabaseConst
    {

        public static SqlParameter[] AuthorizationOutputParameters
        {
            get
            {
                return new SqlParameter[] {
                                                new SqlParameter(UserModel.PARAMETER_ID, SqlDbType.Int) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_FIRST_NAME, SqlDbType.VarChar, 50) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_SECOND_NAME, SqlDbType.VarChar, 50) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_BIRTH_DATE, SqlDbType.BigInt) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_AVATAR_PATH, SqlDbType.VarChar, 50) {Direction = ParameterDirection.Output},
                                                new SqlParameter(UserModel.PARAMETER_GENDER, SqlDbType.Bit) {Direction = ParameterDirection.Output}
                                            };
            }
        }

    }

}