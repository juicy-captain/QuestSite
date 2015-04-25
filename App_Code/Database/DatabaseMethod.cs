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
                Result = new PlayerModel(userNickName, password, authCommand)
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
                Result = QuestModel.ProcessBatch(dataReader)
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
                Result = StageModel.ProcessBatch(dataReader)
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
            suscribeCommand.Parameters.AddWithValue(DatabaseConst.ParameterLastStage, 1);
            try
            {
                suscribeCommand.ExecuteNonQuery();
            }
            catch (Exception)
            {
                //ignored
            }

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
                Result = QuestModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static DatabaseResponse<List<PlayerModel>> GetQuestSubscribers(SqlConnection connection, int questId)
        {
            SqlCommand getSubscribers = connection.CreateCommand();
            getSubscribers.CommandType = CommandType.StoredProcedure;
            getSubscribers.CommandText = "GetQuestSubscribers";
            getSubscribers.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            SqlDataReader dataReader = getSubscribers.ExecuteReader();

            DatabaseResponse<List<PlayerModel>> databaseResponse = new DatabaseResponse<List<PlayerModel>>()
            {
                Result = PlayerModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static DatabaseResponse<SubscriptionState> CheckSubscription(SqlConnection connection, int questId, int playerId, int numOfStages)
        {
            //Is player subscribed for a quest?
            SqlCommand getSubscriptions = connection.CreateCommand();
            getSubscriptions.CommandType = CommandType.StoredProcedure;
            getSubscriptions.CommandText = "CheckSubscription";
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterUserId, playerId);
            SqlDataReader dataReader = getSubscriptions.ExecuteReader();
            dataReader.Read();


            SubscriptionState subscriptionState = SubscriptionState.NotSubscribed;
            if (dataReader.HasRows)
            {
                int stageNumber = dataReader.GetInt32(2);
                if (stageNumber == 0)
                {
                    subscriptionState = SubscriptionState.NotStarted;
                }
                else if (stageNumber == numOfStages)
                {
                    subscriptionState = SubscriptionState.Finished;
                }
                else
                {
                    subscriptionState = SubscriptionState.InProgress;
                }
            }
            DatabaseResponse<SubscriptionState> databaseResponse = new DatabaseResponse<SubscriptionState>()
            {
                Result = subscriptionState
            };
            return databaseResponse;
        }

        public static DatabaseResponse<int> GetLastStage(SqlConnection connection, int questId, int playerId)
        {
            SqlCommand getSubscriptions = connection.CreateCommand();
            getSubscriptions.CommandType = CommandType.StoredProcedure;
            getSubscriptions.CommandText = "GetLastStage";
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterUserId, playerId);
            SqlDataReader dataReader = getSubscriptions.ExecuteReader();
            dataReader.Read();

            DatabaseResponse<int> databaseResponse = new DatabaseResponse<int>()
            {
                Result = dataReader.GetInt32(0)
            };
            return databaseResponse;
        }

        public static DatabaseResponse<bool> CheckAnswer(SqlConnection connection, int questId, int stageOrdinal, string answer)
        {
            //Is player's answer rignt?
            SqlCommand getSubscriptions = connection.CreateCommand();
            getSubscriptions.CommandType = CommandType.StoredProcedure;
            getSubscriptions.CommandText = "GetAnswer";
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterStageOrdinal, stageOrdinal);
            SqlDataReader dataReader = getSubscriptions.ExecuteReader();
            dataReader.Read();

            DatabaseResponse<bool> databaseResponse = new DatabaseResponse<bool>()
            {
                Result = answer.Equals(dataReader.GetString(0))
            };
            return databaseResponse;
        }

        public static void СonfirmRightAnswer(SqlConnection connection, int questId, int playerId)
        {
            SqlCommand registerCommand = connection.CreateCommand();
            registerCommand.CommandType = CommandType.StoredProcedure;
            registerCommand.CommandText = "SetNewLastStage";
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterUserId, playerId);
            registerCommand.ExecuteNonQuery();
        }

        public static void DeletePlayer(SqlConnection connection, int playerId)
        {
            SqlCommand registerCommand = connection.CreateCommand();
            registerCommand.CommandType = CommandType.StoredProcedure;
            registerCommand.CommandText = "DeleteUser";
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterUserId, playerId);
            registerCommand.ExecuteNonQuery();
        }
        
    }

}