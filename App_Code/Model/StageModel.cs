using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

using Util;

/// <summary>
/// Summary description for StageModel
/// </summary>
public class StageModel
{
    public string Title { get; private set; }
    public string Question { get; private set; }
    public string ImagePath { get; private set; }
    public string Answer { get; private set; }
    public int Ordinal { get; private set; }

	public StageModel(string title, string question, string imagePath, string answer, int ordinal)
	{
        Title = title;
        Question = question;
        ImagePath = imagePath;
        Answer = answer;
        Ordinal = ordinal;
	}

    public static List<StageModel> ProcessBatch(SqlDataReader dataReader)
    {
        List<StageModel> stageModels = new List<StageModel>();
        if (dataReader.HasRows)
        {
            while (dataReader.Read())
            {
                string title = dataReader.GetString(0);
                string question = dataReader.GetString(1);
                string imagePath = DatabaseUtil.GetSyting(dataReader, 2);
                string answer = dataReader.GetString(3);
                int ordinal = dataReader.GetInt32(4);
                stageModels.Add(new StageModel(title, question, imagePath, answer, ordinal));
            }
        }
        return stageModels;
    }

}