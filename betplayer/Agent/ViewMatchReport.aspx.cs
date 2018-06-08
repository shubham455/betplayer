using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Agent
{
    public partial class ViewMatchReport : System.Web.UI.Page
    {
        private DataTable dt2;
        public DataTable MatchesDataTable { get { return dt2; } }
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int MatchID = Convert.ToInt32(Request.QueryString["MatchID"]);
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string s = "Select * From ClientMaster where CreatedBy = '" + Session["AgentID"] + "'";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    Dropdownclient.DataSource = dt;

                    Dropdownclient.DataTextField = "Name";
                    Dropdownclient.DataValueField = "ClientID";
                    Dropdownclient.DataBind();

                    string TeamName = "Select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
                    MySqlCommand TeamNamecmd = new MySqlCommand(TeamName, cn);
                    MySqlDataAdapter TeamNameadp = new MySqlDataAdapter(TeamNamecmd);
                    DataTable TeamNamedt = new DataTable();
                    TeamNameadp.Fill(TeamNamedt);
                    lblTeamA.Text = TeamNamedt.Rows[0]["TeamA"].ToString();
                    lblTeamB.Text = TeamNamedt.Rows[0]["TeamB"].ToString();
                    lblTeam1.Text = TeamNamedt.Rows[0]["TeamA"].ToString();
                    lblTeam2.Text = TeamNamedt.Rows[0]["TeamB"].ToString();


                    string s2 = "select Runner.RunnerID,Runner.Amount,Runner.rate,Runner.Mode,Runner.DateTime,Runner.Team,Runner.clientID,clientmaster.Name from Runner inner join clientmaster on Runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["AgentID"] + "' && Runner.MatchID = '0'";
                    MySqlCommand cmd1 = new MySqlCommand(s2, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    dt2 = new DataTable();
                    adp1.Fill(dt2);


                }
            }
        }

        protected void Dropdownclient_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MatchID = Convert.ToInt32(Request.QueryString["MatchID"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s2 = "select Runner.RunnerID,Runner.Amount,Runner.rate,Runner.Mode,Runner.DateTime,Runner.Team,Runner.Position1,Runner.Position2,Runner.clientID,clientmaster.Name from Runner inner join clientmaster on Runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["AgentID"] + "' && Runner.MatchID = '"+MatchID+"' && runner.ClientID = '"+Dropdownclient.SelectedValue+"'  ";
                MySqlCommand cmd = new MySqlCommand(s2, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt2 = new DataTable();
                adp.Fill(dt2);


            }
        }
    }
}