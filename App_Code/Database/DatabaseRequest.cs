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
    public enum RequestType
    {
        RegisterUser,
        AuthorizeUser,
        GetAllQuests,
        GetStages,
        SubscribeUserForQuest,
        GetUserSubscriptions,
        GetQuestSubscribers,
        CheckSubscription,
        GetLastStage,
        CheckAnswer,
        СonfirmRightAnswer,
        DeleteUser,
        UpdateProfile,
        GetAllUsers,
        UnsubscribeUserForQuest,
        DeleteQuest,
        EditQuest,
        DeleteStage,
        EditStage,
        AddStage,
        AddQuest
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
        public RequestType RequestType { get; set; }
        public string NickName { get; set; }
        public string Password { get; set; }
        public UserModel UserModel { get; set; }
        public UserModel EditedUserModel { get; set; }
        public int PlayerId { get; set; }
        public int QuestId { get; set; }
        public int StageOrdinal { get; set; }
        public string Answer { get; set; }
        public int NumberOfStages { get; set; }
        public QuestModel QuestModel { get; set; }
        public StageModel StageModel { get; set; }
        public int PreviousStageOrdinal { get; set; }

        public DatabaseRequest() { }

        public DatabaseResponse<ResponseType> Execute()
        {
            DatabaseResponse<ResponseType> databaseResponse = null;
            using (SqlConnection connection = new SqlConnection(DatabaseUtil.GetConnectionString()))
            {
                connection.Open();
                switch (RequestType)
                {
                    case RequestType.AuthorizeUser:
                        databaseResponse = DatabaseMethod.Authorize(connection, NickName, Password) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.RegisterUser:
                        DatabaseMethod.Register(connection, UserModel);
                        break;
                    case RequestType.GetAllQuests:
                        databaseResponse = DatabaseMethod.GetAllQuests(connection) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.GetStages:
                        databaseResponse = DatabaseMethod.GetStages(connection, QuestId) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.SubscribeUserForQuest:
                        DatabaseMethod.Subscribe(connection, QuestId, PlayerId);
                        break;
                    case RequestType.GetUserSubscriptions:
                        databaseResponse = DatabaseMethod.GetUserSubscriptions(connection, PlayerId) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.GetQuestSubscribers:
                        databaseResponse = DatabaseMethod.GetQuestSubscribers(connection, QuestId) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.CheckSubscription:
                        databaseResponse = DatabaseMethod.CheckSubscription(connection, QuestId, PlayerId, NumberOfStages) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.GetLastStage:
                        databaseResponse = DatabaseMethod.GetLastStage(connection, QuestId, PlayerId) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.CheckAnswer:
                        databaseResponse = DatabaseMethod.CheckAnswer(connection, QuestId, StageOrdinal, Answer) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.СonfirmRightAnswer:
                        DatabaseMethod.СonfirmRightAnswer(connection, QuestId, PlayerId);
                        break;
                    case RequestType.DeleteUser:
                        DatabaseMethod.DeleteUser(connection, PlayerId);
                        break;
                    case RequestType.UpdateProfile:
                        DatabaseMethod.EditProfile(connection, UserModel);
                        break;
                    case RequestType.GetAllUsers:
                        databaseResponse = DatabaseMethod.GetAllUsers(connection) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.UnsubscribeUserForQuest:
                        DatabaseMethod.Unsubscribe(connection, QuestId, PlayerId);
                        break;
                    case RequestType.DeleteQuest:
                        DatabaseMethod.DeleteQuest(connection, QuestId);
                        break;
                    case RequestType.EditQuest:
                        DatabaseMethod.EditQuest(connection, QuestModel);
                        break;
                    case RequestType.DeleteStage:
                        DatabaseMethod.DeleteStage(connection, QuestId, StageOrdinal);
                        break;
                    case RequestType.EditStage:
                        DatabaseMethod.EditStage(connection, StageModel, QuestId, PreviousStageOrdinal);
                        break;
                    case RequestType.AddStage:
                        DatabaseMethod.AddStage(connection, StageModel, QuestId);
                        break;
                    case RequestType.AddQuest:
                        DatabaseMethod.AddQuest(connection, QuestModel);
                        break;
                        
                }
            }
            return databaseResponse;
        }

    }

}