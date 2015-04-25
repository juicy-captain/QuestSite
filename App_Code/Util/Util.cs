using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Util
{
    /// <summary>
    /// Summary description for CoonectionUtil
    /// </summary>
    public static class DatabaseUtil
    {
        public static string GetConnectionString()
        {
            return WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        public static string GetString(SqlDataReader dataReader, int i)
        {
            return dataReader.IsDBNull(i) ? null : dataReader.GetString(i);
        }

        public static int GetInt32(SqlDataReader dataReader, int i)
        {
            return dataReader.IsDBNull(i) ? -1 : dataReader.GetInt32(i);
        }

        public static string GetString(SqlCommand sqlCommand, string field)
        {
            return Convert.IsDBNull(sqlCommand.Parameters[field].Value) ? null : (string)sqlCommand.Parameters[field].Value;
        }

    }

}