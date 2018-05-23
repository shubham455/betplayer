using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace betplayer.superagent
{
    public partial class Match_SessionPosition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            apiID.Value = Request.QueryString["MatchID"];
        }
    }
}