using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

using Model;
using Util;

namespace Database
{
    /// <summary>
    /// Summary description for DatabaseMethod
    /// </summary>
    public static class DatabaseMethod
    {
        public static DatabaseResponse<PlayerModel> Authorize(SqlConnection connection, string userNickName, string password)
        {
            SqlCommand authCommand = connection.CreateCommand();
            authCommand.CommandType = CommandType.StoredProcedure;
            authCommand.CommandText = "AuthorizeUser";
            authCommand.Parameters.AddRange(new SqlParameter[] {
                new SqlParameter(DatabaseConst.ParameterNickName, userNickName),
                new SqlParameter(DatabaseConst.ParameterPassword, password)
            });
            authCommand.Parameters.AddRange(DatabaseConst.AuthOutputParameters);
            authCommand.ExecuteNonQuery();

            DatabaseResponse<PlayerModel> databaseResponse = new DatabaseResponse<PlayerModel>()
            {
                ResponseModel = new PlayerModel(userNickName, password, authCommand)
            };
            return databaseResponse;
        }

        public static DatabaseResponse<List<QuestModel>> GetAllQuests(SqlConnection connection)
        {
            SqlCommand getCommand = connection.CreateCommand();
            getCommand.CommandType = CommandType.StoredProcedure;
            getCommand.CommandText = "GetAllQuests";
            getCommand.Parameters.AddRange(DatabaseConst.QuestsOutputParameters);
            SqlDataReader dataReader = getCommand.ExecuteReader();

            DatabaseResponse<List<QuestModel>> databaseResponse = new DatabaseResponse<List<QuestModel>>()
            {
                ResponseModel = QuestModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static DatabaseResponse<List<StageModel>> GetStages(SqlConnection connection, int questId)
        {
            SqlCommand getCommand = connection.CreateCommand();
            getCommand.CommandType = CommandType.StoredProcedure;
            getCommand.CommandText = "GetQuestStages";
            getCommand.Parameters.AddWithValue(DatabaseConst.ParameterRelatedQuestId, questId);
            SqlDataReader dataReader = getCommand.ExecuteReader();

            DatabaseResponse<List<StageModel>> databaseResponse = new DatabaseResponse<List<StageModel>>()
            {
                ResponseModel = StageModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static void Register(SqlConnection connection, PlayerModel player)
        {
            SqlCommand insertingCommand = connection.CreateCommand();
            insertingCommand.CommandType = CommandType.StoredProcedure;
            insertingCommand.CommandText = "InsertUser";
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterId, player.Id);
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterNickName, player.NickName);
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterFirstName, player.FirstName);
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterSecondName, player.SecondName);
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterPassword, player.Password);
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterBirthDate, player.BirthDate);
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterAvatarPath, "cap");
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterGender, (int)player.Gender);
            insertingCommand.ExecuteNonQuery();
        }

        public static void Subscribe(SqlConnection connection, int questId, int playerId)
        {
            SqlCommand insertingCommand = connection.CreateCommand();
            insertingCommand.CommandType = CommandType.StoredProcedure;
            insertingCommand.CommandText = "InsertSubscription";
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            insertingCommand.Parameters.AddWithValue(DatabaseConst.ParameterUserId, playerId);
            insertingCommand.ExecuteNonQuery();
        }

    }

}