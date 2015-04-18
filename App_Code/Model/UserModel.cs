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
    /// <summary>
    /// Summary description for UserModel
    /// </summary>
    public abstract class UserModel
    {


        public int Id { get; private set; }
        public string NickName { get; private set; }
        public string FirstName { get; private set; }
        public string SecondName { get; private set; }
        public string Password { get; private set; }
        public long BirthDate { get; private set; }
        public string AvatarPath { get; private set; }
        public Sex Gender { get; private set; }
        public bool IsLoggedIn { get; private set; }

        public enum Sex
        {
            Male, Female
        }

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

        public UserModel(string nickName, string password, SqlCommand selectCommad)
        {
            Id = (int)selectCommad.Parameters[DatabaseConst.ParameterId].Value;
            NickName = nickName;
            FirstName = (string)selectCommad.Parameters[DatabaseConst.ParameterFirstName].Value;
            SecondName = (string)selectCommad.Parameters[DatabaseConst.ParameterSecondName].Value;
            Password = password;
            BirthDate = (long)selectCommad.Parameters[DatabaseConst.ParameterBirthDate].Value;
            AvatarPath = (string)selectCommad.Parameters[DatabaseConst.ParameterAvatarPath].Value;
            Gender = (bool)selectCommad.Parameters[DatabaseConst.ParameterGender].Value ? Sex.Female : Sex.Male;
            //IsLoggedIn = true;
        }

    }

}