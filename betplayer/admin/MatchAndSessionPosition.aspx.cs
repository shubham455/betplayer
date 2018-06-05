using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace betplayer.admin
{
    public partial class MatchAndSessionPosition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            apiID.Value = Request.QueryString["MatchID"];
        }

        protected void Session1_ServerClick(object sender, EventArgs e)
        {
             string value = Session1.Value;
            Response.Redirect("MatchAndSessionSposition.aspx?Session=value");
        }
    }
}