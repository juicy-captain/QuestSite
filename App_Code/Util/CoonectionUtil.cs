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

        public static string GetSyting(SqlDataReader dataReader, int i)
        {
            return dataReader.IsDBNull(i) ? null : dataReader.GetString(i);
        }

    }

}