using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UserModel
/// </summary>
public abstract class UserModel
{
    public const string PARAMETER_ID = "@Id";
    public const string PARAMETER_NICK_NAME = "@nick_name";
    public const string PARAMETER_FIRST_NAME = "@first_name";
    public const string PARAMETER_SECOND_NAME = "@second_name";
    public const string PARAMETER_PASSWORD = "@password";
    public const string PARAMETER_BIRTH_DATE = "birth_date";
    public const string PARAMETER_AVATAR_PATH = "@avatar_path";
    public const string PARAMETER_GENDER = "@gender";

    public int ID { get; private set; }
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
        ID = (nickName + firstName + secondName + birthDate.ToString()).GetHashCode();
    }

    public UserModel(string nickName, string password, SqlCommand selectCommad)
    {
        ID = (int)selectCommad.Parameters[PARAMETER_ID].Value;
        NickName = nickName;
        FirstName = (string)selectCommad.Parameters[PARAMETER_FIRST_NAME].Value;
        SecondName = (string)selectCommad.Parameters[PARAMETER_SECOND_NAME].Value;
        Password = password;
        BirthDate = (long)selectCommad.Parameters[PARAMETER_BIRTH_DATE].Value;
        AvatarPath = (string)selectCommad.Parameters[PARAMETER_AVATAR_PATH].Value;
        Gender = (bool)selectCommad.Parameters[PARAMETER_GENDER].Value ? Sex.Female : Sex.Male;
        //IsLoggedIn = true;
    }

}