using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

using Model;
using Interface;
using Util;
using Database;

namespace Processor
{
    /// <summary>
    /// Summary description for IProcessor
    /// </summary>
    public class UserBatchProcessor : IProcessor<List<UserModel>>
    {
        public List<UserModel> Process(SqlDataReader dataReader)
        {
            List<UserModel> models = new List<UserModel>();
            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    int id = dataReader.GetInt32(0);
                    string nickName = dataReader.GetString(1);
                    string firstName = dataReader.GetString(2);
                    string secondName = dataReader.GetString(3);
                    string password = dataReader.GetString(4);
                    long birthDate = dataReader.GetInt64(5);
                    string avatarPath = dataReader.GetString(6);
                    Sex gender = dataReader.GetBoolean(7) ? Sex.Female : Sex.Male;
                    models.Add(new UserModel(id, nickName, firstName, secondName, password, birthDate, avatarPath, gender));
                }
            }
            return models;
        }

    }

    public class QuestBatchProcessor : IProcessor<List<QuestModel>>
    {
        public List<QuestModel> Process(SqlDataReader dataReader)
        {
            List<QuestModel> questModels = new List<QuestModel>();
            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    int id = dataReader.GetInt32(0);
                    string name = dataReader.GetString(1);
                    string description = dataReader.GetString(2);
                    long startDate = dataReader.GetInt64(3);
                    long expirationDate = dataReader.GetInt64(4);
                    //Opened = (string)selectCommad.Parameters[PARAMETER_AVATAR_PATH].Value;
                    QuestComplexityLevel complexityLevel = (QuestComplexityLevel)dataReader.GetInt32(6);

                    //TODO replace null eand false
                    questModels.Add(new QuestModel(id, name, description, startDate, expirationDate, false, null, complexityLevel, null));
                }
            }
            return questModels;
        }

    }

    public class StageBatchProcessor : IProcessor<List<StageModel>>
    {
        public List<StageModel> Process(SqlDataReader dataReader)
        {
            List<StageModel> stageModels = new List<StageModel>();
            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    string title = DatabaseUtil.GetString(dataReader, 0);
                    string question = DatabaseUtil.GetString(dataReader, 1);
                    string imagePath = DatabaseUtil.GetString(dataReader, 2);
                    string answer = DatabaseUtil.GetString(dataReader, 3);
                    int ordinal = dataReader.GetInt32(4);
                    stageModels.Add(new StageModel(title, question, imagePath, answer, ordinal));
                }
            }
            return stageModels;
        }

    }

    public class SubscriptionsBatchProcessor : IProcessor<List<QuestModel>>
    {
        public List<QuestModel> Process(SqlDataReader dataReader)
        {
            List<QuestModel> questModels = new List<QuestModel>();
            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    int id = dataReader.GetInt32(0);
                    string name = dataReader.GetString(1);
                    string description = dataReader.GetString(2);
                    long startDate = dataReader.GetInt64(3);
                    long expirationDate = dataReader.GetInt64(4);
                    //Opened = (string)selectCommad.Parameters[PARAMETER_AVATAR_PATH].Value;
                    QuestComplexityLevel complexityLevel = (QuestComplexityLevel)dataReader.GetInt32(6);

                    //TODO replace null eand false
                    questModels.Add(new QuestModel(id, name, description, startDate, expirationDate, false, null, complexityLevel, null));
                }
            }
            return questModels;
        }

    }

    public class SubscribersBatchProcessor : IProcessor<List<UserModel>>
    {
        public List<UserModel> Process(SqlDataReader dataReader)
        {
            List<UserModel> models = new List<UserModel>();
            if (dataReader.HasRows)
            {
                while (dataReader.Read())
                {
                    int id = dataReader.GetInt32(0);
                    string nickName = dataReader.GetString(1);
                    string firstName = dataReader.GetString(2);
                    string secondName = dataReader.GetString(3);
                    string password = dataReader.GetString(4);
                    long birthDate = dataReader.GetInt64(5);
                    string avatarPath = dataReader.GetString(6);
                    Sex gender = dataReader.GetBoolean(7) ? Sex.Female : Sex.Male;
                    models.Add(new UserModel(id, nickName, firstName, secondName, password, birthDate, avatarPath, gender));
                }
            }
            return models;
        }

    }

    public class GetAnswerProcessor : IProcessor<string>
    {
        public string Process(SqlDataReader dataReader)
        {
            dataReader.Read();
            return dataReader.GetString(0);
        }
    }

    public class GetLastStageOrdinalProcessor : IProcessor<int>
    {
        public int Process(SqlDataReader dataReader)
        {
            dataReader.Read();
            return dataReader.GetInt32(0);
        }
    }

    public class SubscriptionStateProcessor : IProcessor<int>
    {
        public int Process(SqlDataReader dataReader)
        {
            if (dataReader.HasRows)
            {
                dataReader.Read();
                return dataReader.GetInt32(2);
            }
            else
            {
                return DatabaseConst.EmptyData;
            }
        }
    }

    public class UserAuthProcessor : IProcessor<UserModel>
    {
        public UserModel Process(SqlDataReader dataReader)
        {
            UserModel user = null;
            while (dataReader.Read())
            {
                int id = dataReader.GetInt32(0);
                string nickName = dataReader.GetString(1);
                string firstName = dataReader.GetString(2);
                string secondName = dataReader.GetString(3);
                string password = dataReader.GetString(4);
                long birthDate = dataReader.GetInt64(5);
                string avatarPath = dataReader.GetString(6);
                Sex gender = dataReader.GetBoolean(7) ? Sex.Male : Sex.Female;
                user = new UserModel(id, nickName,firstName,secondName,password,birthDate,avatarPath,gender);
            }
            return user;
        }
    }

}