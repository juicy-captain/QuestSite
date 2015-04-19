using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

using Database;

namespace Model
{
    public enum QuestComplexityLevel
    {
        Easy,
        Medium,
        Hard,
        AreYoyCrazy
    }

    /// <summary>
    /// Summary description for QuestModel
    /// </summary>
    public class QuestModel
    {
        public int Id { get; private set; }
        public string Name { get; private set; }
        public string Description { get; private set; }
        public long StartDate { get; private set; }
        public long ExpirationDate { get; private set; }
        public bool Opened { get; private set; }
        public List<PlayerModel> RegisteredCompetotors { get; private set; }
        public QuestComplexityLevel ComplexityLevel { get; private set; }
        public List<StageModel> Stages { get; private set; }

        public QuestModel(int id, string name, string description, long startDate, long expirationDate, bool opened,
            List<PlayerModel> registeredCompetotors, QuestComplexityLevel complexityLevel, List<StageModel> stages)
        {
            Id = id;
            Name = name;
            Description = description;
            StartDate = startDate;
            ExpirationDate = expirationDate;
            ExpirationDate = expirationDate;
            //calculate Opened value while performing request to database
            Opened = opened;
            RegisteredCompetotors = registeredCompetotors;
            ComplexityLevel = complexityLevel;
            Stages = stages;
        }

        public QuestModel(SqlCommand selectCommad)
        {
            Id = (int)selectCommad.Parameters[DatabaseConst.ParameterId].Value;
            Name = (string)selectCommad.Parameters[DatabaseConst.ParameterName].Value;
            Description = (string)selectCommad.Parameters[DatabaseConst.ParameterDescription].Value;
            StartDate = (long)selectCommad.Parameters[DatabaseConst.ParameterStartDate].Value;
            ExpirationDate = (long)selectCommad.Parameters[DatabaseConst.ParameterExpirationDate].Value;
            //Opened = (string)selectCommad.Parameters[PARAMETER_AVATAR_PATH].Value;
            ComplexityLevel = (QuestComplexityLevel)selectCommad.Parameters[DatabaseConst.ParameterComplexityLevel].Value;

            //SqlDataReader datareader = new SqlDataReader();
        }

        public static List<QuestModel> ProcessBatch(SqlDataReader dataReader)
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

                    //TODO replace falseand false
                    questModels.Add(new QuestModel(id, name, description, startDate, expirationDate, false, null, complexityLevel, null));
                }
            }    
            return questModels;
        }
    }

}