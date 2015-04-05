using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserModel
/// </summary>
public abstract class UserModel
{
    public int ID { get; private set; }
    public string Nickname { get; private set; }
    public string FirstName { get; private set; }
    public string SecondName { get; private set; }
    public string Password { get; private set; }
    public long BirthDate { get; private set; }
    public string AvatarPath { get; private set; }   
    public bool IsLoggedIn { get; private set; }
    public Sex Gender { get; private set; }
    public enum Sex
    {
        Male, Female
    }

    public UserModel(string nickName, string firstName, string secondName,
        string password, long birthDate, string avatarPath, Sex gender)
    {
        Nickname = nickName;
        FirstName = firstName;
        SecondName = secondName;
        Password = password;
        BirthDate = birthDate;
        AvatarPath = avatarPath;
        Gender = gender;
        ID = (nickName + firstName + secondName + birthDate.ToString()).GetHashCode();
    }

}