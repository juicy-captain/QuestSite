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
        RegisterPlayer,
        AuthorizePlayer,
        GetAllQuests,
        GetStages,
        SubscribePlayerForQuest,
        GetPlayerSubscriptions,
        GetQuestSubscribers,
        CheckSubscription,
        GetLastStage,
        CheckAnswer,
        СonfirmRightAnswer
    }

    public class DatabaseResponse<ResponseType>
    {
        public ResponseType ResponseModel { get; set; }
        public ResponseType ValueResult { get; set; }
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
        public PlayerModel PlayerModel { get; set; }
        public int PlayerId { get; set; }
        public int QuestId { get; set; }
        public int StageOrdinal { get; set; }
        public string Answer { get; set; }

        public DatabaseRequest() { }

        public DatabaseResponse<ResponseType> Execute()
        {
            DatabaseResponse<ResponseType> databaseResponse = null;
            using (SqlConnection connection = new SqlConnection(DatabaseUtil.GetConnectionString()))
            {
                connection.Open();
                switch (RequestType)
                {
                    case RequestType.AuthorizePlayer:
                        databaseResponse = DatabaseMethod.Authorize(connection, NickName, Password) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.RegisterPlayer:
                        DatabaseMethod.Register(connection, PlayerModel);
                        break;
                    case RequestType.GetAllQuests:
                        databaseResponse = DatabaseMethod.GetAllQuests(connection) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.GetStages:
                        databaseResponse = DatabaseMethod.GetStages(connection, QuestId) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.SubscribePlayerForQuest:
                        DatabaseMethod.Subscribe(connection, QuestId, PlayerId);
                        break;
                    case RequestType.GetPlayerSubscriptions:
                        databaseResponse = DatabaseMethod.GetPlayerSubscriptions(connection, PlayerId) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.GetQuestSubscribers:
                        databaseResponse = DatabaseMethod.GetQuestSubscribers(connection, QuestId) as DatabaseResponse<ResponseType>;
                        break;
                    case RequestType.CheckSubscription:
                        databaseResponse = DatabaseMethod.CheckSubscription(connection, QuestId, PlayerId) as DatabaseResponse<ResponseType>;
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
                }
            }
            return databaseResponse;
        }

    }

}