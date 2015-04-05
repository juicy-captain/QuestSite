using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminModel
/// </summary>
public class AdminModel : UserModel
{
    public AdminModel(string nickName, string firstName, string secondName,
        string password, long birthDate, string avatarPath, Sex gender)
        : base(nickName, firstName, secondName, password, birthDate, avatarPath, gender) { }
}