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
                    string s = "Select * From ClientMaster where CreatedBy = '" + Session["Agentcode"] + "'";
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


                    string s2 = "select Runner.RunnerID,Runner.Amount,Runner.rate,Runner.Mode,Runner.DateTime,Runner.Team,Runner.Position1,Runner.Position2,Runner.clientID,clientmaster.Name from Runner inner join clientmaster on Runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["Agentcode"] + "' && Runner.MatchID = '"+MatchID+"'";
                    MySqlCommand cmd1 = new MySqlCommand(s2, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    dt2 = new DataTable();
                    adp1.Fill(dt2);
                    decimal PositionAAmount = 0, PositionBAmount = 0;
                    for (int i = 0; i < dt2.Rows.Count; i++)
                    {
                        decimal Amount = Convert.ToDecimal(dt2.Rows[i]["Position1"]);
                        PositionAAmount = PositionAAmount + Amount;

                    }
                    lblTotalPosition1.Text = PositionAAmount.ToString();
                    lblPositionA.Text = PositionAAmount.ToString();
                    colorforpositionA(PositionAAmount);
                    for (int i = 0; i < dt2.Rows.Count; i++)
                    {
                        decimal Amount = Convert.ToDecimal(dt2.Rows[i]["Position2"]);
                        PositionBAmount = PositionBAmount + Amount;

                    }
                    lblTotalPosition2.Text = PositionBAmount.ToString();
                    lblPositionB.Text = PositionBAmount.ToString();
                    colorforpositionB(PositionBAmount);


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
                decimal PositionAAmount = 0, PositionBAmount =0;
                if (Dropdownclient.SelectedItem.Text == "All Client")
                {
                    string s2 = "select Runner.RunnerID,Runner.Amount,Runner.rate,Runner.Mode,Runner.DateTime,Runner.Team,Runner.Position1,Runner.Position2,Runner.clientID,clientmaster.Name from Runner inner join clientmaster on Runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["Agentcode"] + "' && Runner.MatchID = '" + MatchID + "'";
                    MySqlCommand cmd1 = new MySqlCommand(s2, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    dt2 = new DataTable();
                    adp1.Fill(dt2);

                    for (int i = 0; i < dt2.Rows.Count; i++)
                    {
                        decimal Amount = Convert.ToDecimal(dt2.Rows[i]["Position1"]);
                        PositionAAmount = PositionAAmount + Amount;

                    }
                    lblTotalPosition1.Text = PositionAAmount.ToString();
                    lblPositionA.Text = PositionAAmount.ToString();
                    colorforpositionA(PositionAAmount);

                    for (int i = 0; i < dt2.Rows.Count; i++)
                    {
                        decimal Amount = Convert.ToDecimal(dt2.Rows[i]["Position2"]);
                        PositionBAmount = PositionBAmount + Amount;

                    }
                    lblTotalPosition2.Text = PositionBAmount.ToString();
                    lblPositionB.Text = PositionBAmount.ToString();
                    colorforpositionB(PositionBAmount);

                }
                else
                {
                    string s3 = "select Runner.RunnerID,Runner.Amount,Runner.rate,Runner.Mode,Runner.DateTime,Runner.Team,Runner.Position1,Runner.Position2,Runner.clientID,clientmaster.Name from Runner inner join clientmaster on Runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["Agentcode"] + "' && Runner.MatchID = '" + MatchID + "' && runner.ClientID = '" + Dropdownclient.SelectedValue + "'  ";
                    MySqlCommand cmd = new MySqlCommand(s3, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    dt2 = new DataTable();
                    adp.Fill(dt2);
                    for (int i = 0; i < dt2.Rows.Count; i++)
                    {
                        decimal Amount = Convert.ToDecimal(dt2.Rows[i]["Position1"]);
                        PositionAAmount = PositionAAmount + Amount;

                    }
                    lblTotalPosition1.Text = PositionAAmount.ToString();
                    lblPositionA.Text = PositionAAmount.ToString();
                    colorforpositionA(PositionAAmount);



                    for (int i = 0; i < dt2.Rows.Count; i++)
                    {
                        decimal Amount = Convert.ToDecimal(dt2.Rows[i]["Position2"]);
                        PositionBAmount = PositionBAmount + Amount;

                    }
                    lblTotalPosition2.Text = PositionBAmount.ToString();
                    lblPositionB.Text = PositionBAmount.ToString();
                    colorforpositionB(PositionBAmount);

                }
            }
        }
        public void colorforpositionA(decimal Amount)
        {
            if (Amount > 0)
            {
                lblPositionA.ForeColor = System.Drawing.Color.Blue;
            }
            else if (Amount < 0)
            {
                lblPositionA.ForeColor = System.Drawing.Color.Red;
            }
        }
        public void colorforpositionB(decimal Amount)
        {
            if (Amount > 0)
            {
                lblPositionB.ForeColor = System.Drawing.Color.Blue;
            }
            else if (Amount < 0)
            {
                lblPositionB.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}