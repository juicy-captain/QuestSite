﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
}