using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

using Database;
using Util;

namespace Model
{
    public enum Sex
    {
        Male, Female
    }
    /// <summary>
    /// Summary description for Class1
    /// </summary>
    public class UserModel
    {
        public int Id { get; set; }
        public string NickName { get; private set; }
        public string FirstName { get; private set; }
        public string SecondName { get; private set; }
        public string Password { get; private set; }
        public long BirthDate { get; private set; }
        public string AvatarPath { get; private set; }
        public Sex Gender { get; private set; }
        public bool IsLoggedIn { get; private set; }
        public uint Balance { get; private set; }

        public List<string> CompletedQuests { get; private set; }
        public UserModel(string nickName, string firstName, string secondName,
            string password, long birthDate, string avatarPath, Sex gender)
        {
            NickName = nickName;
            FirstName = firstName;
            SecondName = secondName;
            Password = password;
            BirthDate = birthDate;
            AvatarPath = avatarPath;
            Gender = gender;
            Id = (nickName + firstName + secondName + birthDate.ToString()).GetHashCode();
        }

        public UserModel(int id, string nickName, string firstName, string secondName,
            string password, long birthDate, string avatarPath, Sex gender)
        {
            Id = id;
            NickName = nickName;
            FirstName = firstName;
            SecondName = secondName;
            Password = password;
            BirthDate = birthDate;
            AvatarPath = avatarPath;
            Gender = gender;
        }

        public UserModel(string nickName, string password, SqlCommand authCommand)
        {
            Id = (int)authCommand.Parameters[DatabaseConst.ParameterId].Value;
            NickName = nickName;
            FirstName = (string)authCommand.Parameters[DatabaseConst.ParameterFirstName].Value;
            SecondName = (string)authCommand.Parameters[DatabaseConst.ParameterSecondName].Value;
            Password = password;
            BirthDate = (long)authCommand.Parameters[DatabaseConst.ParameterBirthDate].Value;
            AvatarPath = DatabaseUtil.GetString(authCommand, DatabaseConst.ParameterAvatarPath);
            Gender = (bool)authCommand.Parameters[DatabaseConst.ParameterGender].Value ? Sex.Female : Sex.Male;
        }

        public override string ToString()
        {
            return FirstName + " " + NickName + " " + SecondName; 
        }

    }

}