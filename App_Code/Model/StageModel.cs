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

}