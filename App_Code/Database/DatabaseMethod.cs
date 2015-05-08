﻿using System;
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
        
    }

}