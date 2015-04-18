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
        AuthorizePlayer,
        GetAllQuests
    }

    /// <summary>
    /// Class which simplifies representation of requests to SQL database
    /// </summary>
    public class DatabaseRequest<ResponseType>
    {

        public RequestType RequestType { get; set; }

        public string NickName { get; set; }
        public string Password { get; set; }

        public PlayerModel PlayerModel { get; set; }

        public SqlParameter[] InputParameters { get; set; }
        public string ConnectionString { get; set; }

        public DatabaseRequest() { }

        public DatabaseResponse<ResponseType> Execute()
        {
            DatabaseResponse<ResponseType> databaseResponse = null;
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                switch (RequestType)
                {
                    case RequestType.AuthorizePlayer:
                        databaseResponse = DatabaseMethod.Authorize(connection, InputParameters, NickName, Password) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.RegisterPlayer:
                        DatabaseMethod.Register(connection, PlayerModel);
                        break;
                    case RequestType.GetAllQuests:
                        databaseResponse = DatabaseMethod.GetAllQuests(connection) as DatabaseResponse<ResponseType>;
                        break;
                }
            }
            return databaseResponse;
        }

    }

    public class DatabaseResponse<TResponseType>
    {
        public DatabaseResponse() { }

        public TResponseType ResponseModel { get; set; }
        public int ScalarResult { get; set; }

    }

}