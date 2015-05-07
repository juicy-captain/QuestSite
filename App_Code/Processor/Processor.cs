using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

using Model;
using Interface;

namespace Processor
{
    /// <summary>
    /// Summary description for Processor
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

}