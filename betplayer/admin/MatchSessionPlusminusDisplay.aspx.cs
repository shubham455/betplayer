using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
//using betplayer.MatchSessionPlusMinus.Admin;

namespace betplayer.admin
{
    public partial class Test : System.Web.UI.Page
    {
        public MatchSessionPlusMinus.Admin admin;
        public int MatchID;

        protected void Page_Load(object sender, EventArgs e)
        {
            admin = new MatchSessionPlusMinus.Admin(Session["AdminID"].ToString(), Request.QueryString["MatchID"]);
        }

    }
}



    