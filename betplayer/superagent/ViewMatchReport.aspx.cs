using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.superagent
{
    public partial class ViewMatchReport : System.Web.UI.Page
    {
        private DataTable dt4;
        public DataTable MatchesDataTable { get { return dt4; } }
        private DataTable runtable;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                runtable = new DataTable();
                runtable.Columns.Add(new DataColumn("ClientID"));
                runtable.Columns.Add(new DataColumn("Name"));

                DataRow row = runtable.NewRow();

                string MatchID = Request.QueryString["MatchID"];
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();

                    string SELECT = "Select * from Matches Where apiID = '" + MatchID + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    string TeamA = dt.Rows[0]["TeamA"].ToString();
                    string TeamB = dt.Rows[0]["TeamB"].ToString();
                    lblTeamA.Text = TeamA;
                    lblTeamB.Text = TeamB;
                    lblTeamA1.Text = TeamA;
                    lblTeamB1.Text = TeamB;

                    string s1 = "Select * From AgentMaster where CreatedBy = '" + Session["SuperAgentCode"] + "'";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    adp1.Fill(dt1);

                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        string Agentcode = dt1.Rows[i]["code"].ToString();
                        string s2 = "Select * From ClientMaster where CreatedBy = '" + Agentcode + "' && Mode = 'Agent'";
                        MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                        MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                        DataTable dt2 = new DataTable();
                        adp2.Fill(dt2);

                        for (int j = 0; j < dt2.Rows.Count; j++)
                        {
                            int ClientID = Convert.ToInt32(dt2.Rows[j]["ClientID"]);
                            string Name = dt2.Rows[j]["Name"].ToString();

                            row["ClientID"] = ClientID;
                            row["Name"] = Name;
                            runtable.Rows.Add(row.ItemArray);
                        }
                    }
                    Dropdownclient.DataSource = runtable;
                    Dropdownclient.DataTextField = "Name";
                    Dropdownclient.DataValueField = "ClientID";
                    Dropdownclient.DataBind();

                    string s3 = "Select * From AgentMaster where CreatedBy = '" + Session["SuperAgentCode"] + "'";
                    MySqlCommand cmd3 = new MySqlCommand(s3, cn);
                    MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                    DataTable dt3 = new DataTable();
                    adp3.Fill(dt3);

                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        string Agentcode = dt3.Rows[i]["code"].ToString();


                        string s4 = "select Runner.RunnerID,Runner.Amount,Runner.rate,Runner.Mode,Runner.DateTime,Runner.Team,Runner.Position1,Runner.Position2,Runner.clientID,clientmaster.Name,ClientMaster.CreatedBy from Runner inner join clientmaster on Runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Agentcode + "' && Runner.MatchID = '" + MatchID + "'";
                        MySqlCommand cmd4 = new MySqlCommand(s4, cn);
                        MySqlDataAdapter adp4 = new MySqlDataAdapter(cmd4);
                        dt4 = new DataTable();
                        adp4.Fill(dt4);
                        decimal PositionAAmount = 0, PositionBAmount = 0;
                        for (int j = 0; j < dt4.Rows.Count; j++)
                        {
                            decimal Amount = Convert.ToDecimal(dt4.Rows[j]["Position1"]);
                            PositionAAmount = PositionAAmount + Amount;

                        }
                        lblTotalPosition1.Text = PositionAAmount.ToString();
                        lblPositionA.Text = PositionAAmount.ToString();
                        colorforpositionA(PositionAAmount);
                        for (int j = 0; j < dt4.Rows.Count; j++)
                        {
                            decimal Amount = Convert.ToDecimal(dt4.Rows[j]["Position2"]);
                            PositionBAmount = PositionBAmount + Amount;

                        }
                        lblTotalPosition2.Text = PositionBAmount.ToString();
                        lblPositionB.Text = PositionBAmount.ToString();
                        colorforpositionB(PositionBAmount);
                    }
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
                decimal PositionAAmount = 0, PositionBAmount = 0;
                if (Dropdownclient.SelectedItem.Text == "All Client")
                {

                    string s1 = "Select * From AgentMaster where CreatedBy = '" + Session["SuperAgentCode"] + "'";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    adp1.Fill(dt1);

                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        string Agentcode = dt1.Rows[i]["code"].ToString();
                        string s = "select Runner.RunnerID,Runner.Amount,Runner.rate,Runner.Mode,Runner.DateTime,Runner.Team,Runner.Position1,Runner.Position2,Runner.clientID,clientmaster.Name,clientmaster.CreatedBy from Runner inner join clientmaster on Runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Agentcode + "' && Runner.MatchID = '" + MatchID + "'";
                        MySqlCommand cmd = new MySqlCommand(s, cn);
                        MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                        dt4 = new DataTable();
                        adp.Fill(dt4);

                        for (int j = 0; j < dt4.Rows.Count; j++)
                        {
                            decimal Amount = Convert.ToDecimal(dt4.Rows[j]["Position1"]);
                            PositionAAmount = PositionAAmount + Amount;

                        }
                        lblTotalPosition1.Text = PositionAAmount.ToString();
                        lblPositionA.Text = PositionAAmount.ToString();
                        colorforpositionA(PositionAAmount);

                        for (int k = 0; k < dt4.Rows.Count; k++)
                        {
                            decimal Amount = Convert.ToDecimal(dt4.Rows[k]["Position2"]);
                            PositionBAmount = PositionBAmount + Amount;

                        }
                        lblTotalPosition2.Text = PositionBAmount.ToString();
                        lblPositionB.Text = PositionBAmount.ToString();
                        colorforpositionB(PositionBAmount);

                    }
                }
                else
                {
                    string s1 = "Select * From AgentMaster where CreatedBy = '" + Session["SuperAgentCode"] + "'";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    adp1.Fill(dt1);

                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        string Agentcode = dt1.Rows[i]["code"].ToString();

                        string s2 = "select Runner.RunnerID,Runner.Amount,Runner.rate,Runner.Mode,Runner.DateTime,Runner.Team,Runner.Position1,Runner.Position2,Runner.clientID,clientmaster.Name,clientmaster.CreatedBy from Runner inner join clientmaster on Runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Agentcode + "' && Runner.MatchID = '" + MatchID + "' && runner.ClientID = '" + Dropdownclient.SelectedValue + "'  ";
                        MySqlCommand cmd = new MySqlCommand(s2, cn);
                        MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                        dt4 = new DataTable();
                        adp.Fill(dt4);
                    }
                    for (int j = 0; j < dt4.Rows.Count; j++)
                    {
                        decimal Amount = Convert.ToDecimal(dt4.Rows[j]["Position1"]);
                        PositionAAmount = PositionAAmount + Amount;

                    }
                    lblTotalPosition1.Text = PositionAAmount.ToString();
                    lblPositionA.Text = PositionAAmount.ToString();
                    colorforpositionA(PositionAAmount);

                    for (int k = 0; k < dt4.Rows.Count; k++)
                    {
                        decimal Amount = Convert.ToDecimal(dt4.Rows[k]["Position2"]);
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