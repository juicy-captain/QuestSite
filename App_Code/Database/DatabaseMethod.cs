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
    /// Summary description for DatabaseMethod
    /// </summary>
    public static class DatabaseMethod
    {
        public static DatabaseResponse Authorize(SqlConnection connection,
            SqlParameter[] inputParameters,
            SqlParameter[] outputParameters,
            string userNickName,
            string password)
        {
            SqlCommand selectCommand = connection.CreateCommand();
            selectCommand.CommandType = CommandType.StoredProcedure;
            selectCommand.CommandText = "AuthorizationQuery";
            selectCommand.Parameters.AddRange(inputParameters);
            selectCommand.Parameters.AddRange(outputParameters);
            selectCommand.ExecuteNonQuery();

            DatabaseResponse databaseResponse = new DatabaseResponse()
            {
                PlayerModel = new PlayerModel(userNickName, password, selectCommand)
            };
            return databaseResponse;
        }

        public static void Register(SqlConnection connection, PlayerModel player)
        {
            SqlCommand insertingCommand = connection.CreateCommand();
            insertingCommand.CommandType = CommandType.StoredProcedure;
            insertingCommand.CommandText = "InsertUser";
            insertingCommand.Parameters.AddWithValue("@Id", player.ID);
            insertingCommand.Parameters.AddWithValue("@nick_name", player.NickName);
            insertingCommand.Parameters.AddWithValue("@first_name", player.FirstName);
            insertingCommand.Parameters.AddWithValue("@second_name", player.SecondName);
            insertingCommand.Parameters.AddWithValue("@password", player.Password);
            insertingCommand.Parameters.AddWithValue("@birth_date", player.BirthDate);
            insertingCommand.Parameters.AddWithValue("@avatar_path", "cap");
            insertingCommand.Parameters.AddWithValue("@gender", (int)player.Gender);
            insertingCommand.ExecuteNonQuery();
        }

    }

}