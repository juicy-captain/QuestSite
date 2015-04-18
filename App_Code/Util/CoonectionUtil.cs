using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Util
{
    /// <summary>
    /// Summary description for CoonectionUtil
    /// </summary>
    public static class ConnectionUtil
    {
        public static string GetConnectionString()
        {
            return WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }
    }

}