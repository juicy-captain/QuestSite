using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Model
{
    /// <summary>
    /// Summary description for Class1
    /// </summary>
    public class PlayerModel : UserModel
    {
        public uint Balance { get; private set; }
        public ushort Stage { get; private set; }
        public List<string> CompletedQuests { get; private set; }
        public PlayerModel(string nickName, string firstName, string secondName,
            string password, long birthDate, string avatarPath, Sex gender)
            : base(nickName, firstName, secondName, password, birthDate, avatarPath, gender) { }

        public PlayerModel(int id, string nickName, string firstName, string secondName,
            string password, long birthDate, string avatarPath, Sex gender)
            : base(id, nickName, firstName, secondName, password, birthDate, avatarPath, gender) { }

        public PlayerModel(string nickName, string password, SqlCommand authCommand)
            : base(nickName, password, authCommand) { }

        public static List<PlayerModel> ProcessBatch(SqlDataReader dataReader)
        {
            List<PlayerModel> userModels = new List<PlayerModel>();
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

                    //TODO replace null eand false
                    userModels.Add(new PlayerModel(id, nickName, firstName, secondName, password, birthDate, avatarPath, gender));
                }
            }
            return userModels;
        }

        public override string ToString()
        {
            return FirstName + " " + NickName + " " + SecondName; 
        }

    }

}