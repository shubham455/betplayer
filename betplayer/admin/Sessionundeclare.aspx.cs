﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace betplayer.admin
{
    public partial class Sessionundeclare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            firebasekey.Value = Request.QueryString["fk"];
            apiID.Value = Request.QueryString["MatchID"];
        }
    }
}