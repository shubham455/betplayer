using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace betplayer.poweruser
{
    public partial class SessionRate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            apiid.Value = Request.QueryString["Matchid"];
        }
    }
}