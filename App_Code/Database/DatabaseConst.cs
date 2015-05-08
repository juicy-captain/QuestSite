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
    /// Summary description for DatabaseConst
    /// </summary>
    public static class DatabaseConst
    {
        public static SqlParameter[] AuthOutputParameters
        {
            get
            {
                return new SqlParameter[] {
                    new SqlParameter(ParameterId, SqlDbType.Int) {Direction = ParameterDirection.Output},
                    new SqlParameter(ParameterFirstName, SqlDbType.VarChar, 50) {Direction = ParameterDirection.Output},
                    new SqlParameter(ParameterSecondName, SqlDbType.VarChar, 50) {Direction = ParameterDirection.Output},
                    new SqlParameter(ParameterBirthDate, SqlDbType.BigInt) {Direction = ParameterDirection.Output},
                    new SqlParameter(ParameterAvatarPath, SqlDbType.VarChar, 50) {Direction = ParameterDirection.Output},
                    new SqlParameter(ParameterGender, SqlDbType.Bit) {Direction = ParameterDirection.Output}
                };
            }
        }

        //Common model
        public const string ParameterId = "@Id";

        //UserModel
        public const string ParameterNickName = "@nick_name";
        public const string ParameterFirstName = "@first_name";
        public const string ParameterSecondName = "@second_name";
        public const string ParameterPassword = "@password";
        public const string ParameterBirthDate = "birth_date";
        public const string ParameterAvatarPath = "@avatar_path";
        public const string ParameterGender = "@gender";

        //QuestModel
        public const string ParameterName = "@name";
        public const string ParameterDescription = "@description";
        public const string ParameterStartDate = "@start_date";
        public const string ParameterExpirationDate = "@expiration_date";
        public const string ParameterOpened = "@opened";
        public const string ParameterComplexityLevel = "@complexity_level";

        //StageModel
        public const string ParameterStageRelatedQuestId = "@related_quest";
        public const string ParameterStageTitle = "@title";
        public const string ParameterStageQuestion = "@question";
        public const string ParameterStageImage = "@image_path";
        public const string ParameterStageAnswer = "@answer";
        public const string ParameterStageOrdinal = "@ordinal";
        public const string ParameterStageOrdinalPrevious = "@ordinal_previous";

        //Subscription
        public const string ParameterQuestId = "@questId";
        public const string ParameterUserId = "@userId";
        public const string ParameterLastStage = "@last_stage";

        //Stored Procedures
        public const string SPGetAllUsers = "GetAllUsers";
        public const string SPGetAllQuests = "GetAllQuests";
        public const string SPGetQuestStages = "GetQuestStages";
        public const string SPGetUserSubscriptions = "GetUserSubscriptions";
        public const string SPGetQuestSubscribers = "GetQuestSubscribers";
        public const string SPInsertQuest = "InsertQuest";    
    }

    public enum SubscriptionState
    {
        NotStarted,
        NotSubscribed,
        InProgress,
        Finished
    }

}