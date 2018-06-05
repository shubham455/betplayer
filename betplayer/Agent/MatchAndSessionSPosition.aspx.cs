using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Agent
{
    public partial class MatchAndSessionSPosition : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable MatchesDataTable { get { return dt; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            apiID.Value = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string s = "select Session.sessionID,Session.session,Session.Runs,Session.Amount,Session.rate,Session.Mode,Session.DateTime,Session.Team,Session.clientID,clientmaster.Name from Session inner join clientmaster on Session.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["AgentID"] + "' && Session.MatchID = '" + apiID.Value + "'";
                MySqlCommand cmd1 = new MySqlCommand(s, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                dt = new DataTable();
                adp1.Fill(dt);
            }
        }

        protected void Session4_ServerClick(object sender, EventArgs e)
        {

        }
    }
}