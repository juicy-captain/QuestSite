using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Model;

/// <summary>
/// Summary description for ICrossPageUserSender
/// </summary>
public interface ICrossPageUserSender
{
    PlayerModel GetPlayerModel();
}