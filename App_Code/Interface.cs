﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Model;

namespace Interface
{
    /// <summary>
    /// Summary description for ICrossPageSender
    /// </summary>
    public interface ICrossPageSender<ModelType>
    {
        ModelType GetModel();
    }

}