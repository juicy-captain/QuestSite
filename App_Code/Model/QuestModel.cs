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
        public List<UserModel> RegisteredCompetotors { get; private set; }
        public QuestComplexityLevel ComplexityLevel { get; private set; }
        public List<StageModel> Stages { get; set; }
        public int LastStage { get; set; }

        public QuestModel(int id, string name, string description, long startDate, long expirationDate, bool opened,
            List<UserModel> registeredCompetotors, QuestComplexityLevel complexityLevel, List<StageModel> stages)
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

        public QuestModel(int id, string name, string description, long startDate, long expirationDate, QuestComplexityLevel complexityLevel)
        {
            Id = id;
            Name = name;
            Description = description;
            StartDate = startDate;
            ExpirationDate = expirationDate;
            ExpirationDate = expirationDate;
            ComplexityLevel = complexityLevel;
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
        }

    }

}