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
            SqlCommand getQuestsCommand = connection.CreateCommand();
            getQuestsCommand.CommandType = CommandType.StoredProcedure;
            getQuestsCommand.CommandText = "GetAllQuests";
            SqlDataReader dataReader = getQuestsCommand.ExecuteReader();

            DatabaseResponse<List<QuestModel>> databaseResponse = new DatabaseResponse<List<QuestModel>>()
            {
                ResponseModel = QuestModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static DatabaseResponse<List<StageModel>> GetStages(SqlConnection connection, int questId)
        {
            SqlCommand getStagesCommand = connection.CreateCommand();
            getStagesCommand.CommandType = CommandType.StoredProcedure;
            getStagesCommand.CommandText = "GetQuestStages";
            getStagesCommand.Parameters.AddWithValue(DatabaseConst.ParameterRelatedQuestId, questId);
            SqlDataReader dataReader = getStagesCommand.ExecuteReader();

            DatabaseResponse<List<StageModel>> databaseResponse = new DatabaseResponse<List<StageModel>>()
            {
                ResponseModel = StageModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static void Register(SqlConnection connection, PlayerModel player)
        {
            SqlCommand registerCommand = connection.CreateCommand();
            registerCommand.CommandType = CommandType.StoredProcedure;
            registerCommand.CommandText = "InsertUser";
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterId, player.Id);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterNickName, player.NickName);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterFirstName, player.FirstName);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterSecondName, player.SecondName);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterPassword, player.Password);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterBirthDate, player.BirthDate);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterAvatarPath, "cap");
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterGender, (int)player.Gender);
            registerCommand.ExecuteNonQuery();
        }

        public static void Subscribe(SqlConnection connection, int questId, int playerId)
        {
            SqlCommand suscribeCommand = connection.CreateCommand();
            suscribeCommand.CommandType = CommandType.StoredProcedure;
            suscribeCommand.CommandText = "InsertSubscription";
            suscribeCommand.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            suscribeCommand.Parameters.AddWithValue(DatabaseConst.ParameterUserId, playerId);
            suscribeCommand.ExecuteNonQuery();
        }

        public static DatabaseResponse<List<QuestModel>> GetPlayerSubscriptions(SqlConnection connection, int playerId)
        {
            SqlCommand getSubscriptions = connection.CreateCommand();
            getSubscriptions.CommandType = CommandType.StoredProcedure;
            getSubscriptions.CommandText = "GetPlayerSubscriptions";
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterUserId, playerId);
            SqlDataReader dataReader = getSubscriptions.ExecuteReader();

            DatabaseResponse<List<QuestModel>> databaseResponse = new DatabaseResponse<List<QuestModel>>()
            {
                ResponseModel = QuestModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static DatabaseResponse<List<PlayerModel>> GetQuestSubscribers(SqlConnection connection, int questId)
        {
            SqlCommand getSubscriptions = connection.CreateCommand();
            getSubscriptions.CommandType = CommandType.StoredProcedure;
            getSubscriptions.CommandText = "GetQuestSubscribers";
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            SqlDataReader dataReader = getSubscriptions.ExecuteReader();

            DatabaseResponse<List<PlayerModel>> databaseResponse = new DatabaseResponse<List<PlayerModel>>()
            {
                ResponseModel = PlayerModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

    }

}