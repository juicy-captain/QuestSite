using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Const
{
    /// <summary>
    /// Summary description for Const
    /// </summary>
    public sealed class ServerConst
    {
        public const string BaseAvatarPath = "../Avatars/";
        public const string DefaultAvatarPath = BaseAvatarPath + "Default.png";
        public static List<string> AvatarFormats = new List<string>() { ".gif", ".png", ".jpeg", ".jpg" };
        public const int FictitiousId = 0;
    }

}