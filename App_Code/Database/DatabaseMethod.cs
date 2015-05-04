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
        public static DatabaseResponse<UserModel> Authorize(SqlConnection connection, string userNickName, string password)
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

            DatabaseResponse<UserModel> databaseResponse = new DatabaseResponse<UserModel>()
            {
                Result = new UserModel(userNickName, password, authCommand)
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

        public static void Register(SqlConnection connection, UserModel user)
        {
            SqlCommand registerCommand = connection.CreateCommand();
            registerCommand.CommandType = CommandType.StoredProcedure;
            registerCommand.CommandText = "InsertUser";
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterId, user.Id);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterNickName, user.NickName);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterFirstName, user.FirstName);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterSecondName, user.SecondName);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterPassword, user.Password);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterBirthDate, user.BirthDate);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterAvatarPath, user.AvatarPath);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterGender, (int)user.Gender);
            registerCommand.ExecuteNonQuery();
        }

        public static void Subscribe(SqlConnection connection, int questId, int userId)
        {
            SqlCommand suscribeCommand = connection.CreateCommand();
            suscribeCommand.CommandType = CommandType.StoredProcedure;
            suscribeCommand.CommandText = "InsertSubscription";
            suscribeCommand.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            suscribeCommand.Parameters.AddWithValue(DatabaseConst.ParameterUserId, userId);
            try
            {
                suscribeCommand.ExecuteNonQuery();
            }
            catch (Exception)
            {
                //ignored
            }

        }

        public static DatabaseResponse<List<QuestModel>> GetUserSubscriptions(SqlConnection connection, int userId)
        {
            SqlCommand getSubscriptions = connection.CreateCommand();
            getSubscriptions.CommandType = CommandType.StoredProcedure;
            getSubscriptions.CommandText = "GetUserSubscriptions";
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterUserId, userId);
            SqlDataReader dataReader = getSubscriptions.ExecuteReader();

            DatabaseResponse<List<QuestModel>> databaseResponse = new DatabaseResponse<List<QuestModel>>()
            {
                Result = QuestModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static DatabaseResponse<List<UserModel>> GetQuestSubscribers(SqlConnection connection, int questId)
        {
            SqlCommand getSubscribers = connection.CreateCommand();
            getSubscribers.CommandType = CommandType.StoredProcedure;
            getSubscribers.CommandText = "GetQuestSubscribers";
            getSubscribers.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            SqlDataReader dataReader = getSubscribers.ExecuteReader();

            DatabaseResponse<List<UserModel>> databaseResponse = new DatabaseResponse<List<UserModel>>()
            {
                Result = UserModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static DatabaseResponse<SubscriptionState> CheckSubscription(SqlConnection connection, int questId, int userId, int numOfStages)
        {
            //Is user subscribed for a quest?
            SqlCommand getSubscriptions = connection.CreateCommand();
            getSubscriptions.CommandType = CommandType.StoredProcedure;
            getSubscriptions.CommandText = "CheckSubscription";
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterUserId, userId);
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

        public static DatabaseResponse<int> GetLastStage(SqlConnection connection, int questId, int userId)
        {
            SqlCommand getSubscriptions = connection.CreateCommand();
            getSubscriptions.CommandType = CommandType.StoredProcedure;
            getSubscriptions.CommandText = "GetLastStage";
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            getSubscriptions.Parameters.AddWithValue(DatabaseConst.ParameterUserId, userId);
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
            //Is user's answer rignt?
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

        public static void СonfirmRightAnswer(SqlConnection connection, int questId, int userId)
        {
            SqlCommand registerCommand = connection.CreateCommand();
            registerCommand.CommandType = CommandType.StoredProcedure;
            registerCommand.CommandText = "SetNewLastStage";
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterUserId, userId);
            registerCommand.ExecuteNonQuery();
        }

        public static void DeleteUser(SqlConnection connection, int userId)
        {
            SqlCommand registerCommand = connection.CreateCommand();
            registerCommand.CommandType = CommandType.StoredProcedure;
            registerCommand.CommandText = "DeleteUser";
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterUserId, userId);
            registerCommand.ExecuteNonQuery();
        }

        public static void EditProfile(SqlConnection connection, UserModel user)
        {
            SqlCommand registerCommand = connection.CreateCommand();
            registerCommand.CommandType = CommandType.StoredProcedure;
            registerCommand.CommandText = "EditUser";
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterId, user.Id);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterNickName, user.NickName);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterFirstName, user.FirstName);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterSecondName, user.SecondName);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterPassword, user.Password);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterBirthDate, user.BirthDate);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterAvatarPath, user.AvatarPath);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterGender, (int)user.Gender);
            registerCommand.ExecuteNonQuery();
        }

        public static DatabaseResponse<List<UserModel>> GetAllUsers(SqlConnection connection)
        {
            SqlCommand getQuestsCommand = connection.CreateCommand();
            getQuestsCommand.CommandType = CommandType.StoredProcedure;
            getQuestsCommand.CommandText = "GetAllUsers";
            SqlDataReader dataReader = getQuestsCommand.ExecuteReader();

            DatabaseResponse<List<UserModel>> databaseResponse = new DatabaseResponse<List<UserModel>>()
            {
                Result = UserModel.ProcessBatch(dataReader)
            };
            return databaseResponse;
        }

        public static void Unsubscribe(SqlConnection connection, int questId, int userId)
        {
            SqlCommand suscribeCommand = connection.CreateCommand();
            suscribeCommand.CommandType = CommandType.StoredProcedure;
            suscribeCommand.CommandText = "DeleteSubscription";
            suscribeCommand.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            suscribeCommand.Parameters.AddWithValue(DatabaseConst.ParameterUserId, userId);
            suscribeCommand.ExecuteNonQuery();

        }

        public static void DeleteQuest(SqlConnection connection, int questId)
        {
            SqlCommand registerCommand = connection.CreateCommand();
            registerCommand.CommandType = CommandType.StoredProcedure;
            registerCommand.CommandText = "DeleteQuest";
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            registerCommand.ExecuteNonQuery();
        }

        public static void EditQuest(SqlConnection connection, QuestModel quest)
        {
            SqlCommand registerCommand = connection.CreateCommand();
            registerCommand.CommandType = CommandType.StoredProcedure;
            registerCommand.CommandText = "EditQuest";
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, quest.Id);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterName, quest.Name);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterDescription, quest.Description);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterStartDate, quest.StartDate);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterExpirationDate, quest.ExpirationDate);
            registerCommand.Parameters.AddWithValue(DatabaseConst.ParameterComplexityLevel, quest.ComplexityLevel);
            registerCommand.ExecuteNonQuery();
        }

        public static void DeleteStage(SqlConnection connection, int questId, int stageOrdinal)
        {
            SqlCommand deleteCommand = connection.CreateCommand();
            deleteCommand.CommandType = CommandType.StoredProcedure;
            deleteCommand.CommandText = "DeleteStage";
            deleteCommand.Parameters.AddWithValue(DatabaseConst.ParameterQuestId, questId);
            deleteCommand.Parameters.AddWithValue(DatabaseConst.ParameterStageOrdinal, stageOrdinal);
            deleteCommand.ExecuteNonQuery();
        }

    }

}