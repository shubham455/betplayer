using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace betplayer.poweruser
{
    public partial class ManuallyUpdation : System.Web.UI.Page
    {
        protected string apiID { get; set; }
        protected string firebasekey { get; set; }
        protected string Type { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            apiID = Request.QueryString["MatchId"];
            firebasekey = Request.QueryString["fk"];
            Type = Request.QueryString["Type"];
        }
    }
}