using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserModel
/// </summary>
internal abstract class UserModel
{
    public ulong ID { get; private set; }
    public string Nickname { get; private set; }
    public string
    public string FirstName { get; private set; }
    public string SecondName { get; private set; }
    public DateTime BirthDate { get; private set; }
    public string Avatar { get; private set; }
    public uint Balance { get; private set; }
    public ushort Stage { get; private set; }
    public bool IsLogined { get; private set; }
    public Sex Gender { get; private set; }
    public enum Sex
    {
        Male, Female
    }
    

    public UserModel()
    {

    }
}