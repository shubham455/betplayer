using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.admin
{
    public partial class MatchRates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string MatchID = Request.QueryString["Matchid"].ToString();
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string SELECT = "Select * from Matches Where apiID = '" + MatchID + "' ";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                lblTeamA.Text = dt.Rows[0]["TeamA"].ToString();
                lblTeamB.Text = dt.Rows[0]["TeamB"].ToString();
            }
        }
    }
}