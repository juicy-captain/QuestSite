using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

using Model;
using Util;
using Interface;

namespace Database
{
    public enum RequestType
    {
        Insert,
        Query
    }

    public class DatabaseResponse<ResponseType>
    {
        public ResponseType Result { get; set; }
        public DatabaseResponse() { }
    }

    /// <summary>
    /// Class which simplifies representation of requests to SQL database
    /// </summary>
    public class DatabaseRequest<ResponseType>
    {
        public IProcessor<ResponseType> Processor { get; set; }
        public Dictionary<string, object> Parameters { get; set; }
        public RequestType RequestType { get; set; }
        public string StoredProcedure { get; set; }

        public DatabaseResponse<ResponseType> Execute()
        {
            DatabaseResponse<ResponseType> databaseResponse = new DatabaseResponse<ResponseType>();
            using (SqlConnection connection = new SqlConnection(DatabaseUtil.GetConnectionString()))
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = StoredProcedure;

                if (Parameters != null)
                {
                    foreach (KeyValuePair<string, object> parameterPair in Parameters)
                    {
                        command.Parameters.AddWithValue(parameterPair.Key, parameterPair.Value);
                    }
                }

                connection.Open();
                switch (RequestType)
                {
                    case RequestType.Insert:
                        command.ExecuteNonQuery();
                        break;
                    case RequestType.Query:
                        databaseResponse.Result = Processor.Process(command.ExecuteReader());
                        break;
                }
            }
            return databaseResponse;
        }

    }

}