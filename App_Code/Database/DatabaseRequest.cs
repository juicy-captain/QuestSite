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
    public enum RequestType
    {
        RegisterPlayer,
        AuthorizePlayer
    }

    /// <summary>
    /// Class which simplifies representation of requests to SQL database
    /// </summary>
    public class DatabaseRequest
    {

        public RequestType RequestType { get; set; }

        public string NickName { get; set; }
        public string Password { get; set; }

        public PlayerModel PlayerModel { get; set; }

        public SqlParameter[] InputParameters { get; set; }
        public SqlParameter[] OutputParameters { get; set; }
        public string ConnectionString { get; set; }

        public DatabaseRequest() { }

        public DatabaseResponse Execute()
        {
            DatabaseResponse databaseResponse = null;
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                switch (RequestType)
                {
                    case RequestType.AuthorizePlayer:
                        databaseResponse = DatabaseMethod.Authorize(connection, InputParameters, OutputParameters, NickName, Password);
                        break;
                    case RequestType.RegisterPlayer:
                        DatabaseMethod.Register(connection, PlayerModel);
                        break;

                }
            }
            return databaseResponse;
        }

    }

    public class DatabaseResponse
    {
        public DatabaseResponse() { }

        public PlayerModel PlayerModel { get; set; }
        public int ScalarResult { get; set; }

    }

}