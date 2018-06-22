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
        private DataTable dt3;
        public DataTable MatchesDataTable { get { return dt3; } }
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


                    string s3 = "select Runner.RunnerID,Runner.Amount,Runner.rate,Runner.Mode,Runner.DateTime,Runner.Team,Runner.clientID,clientmaster.Name from Runner inner join clientmaster on Runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["AgentID"] + "' && Runner.MatchID = '0'";
                    MySqlCommand cmd3 = new MySqlCommand(s3, cn);
                    MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                    dt3 = new DataTable();
                    adp3.Fill(dt3);
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
                    dt3 = new DataTable();
                    adp.Fill(dt3);
                }
                decimal TotalPosition1 = 0, TotalPosition2 = 0;
                for (int j = 0; j<dt3.Rows.Count;j++)
                {
                    decimal position1amount = Convert.ToDecimal(dt3.Rows[j]["Position1"]);
                    decimal position2amount = Convert.ToDecimal(dt3.Rows[j]["Position2"]);

                    TotalPosition1 = TotalPosition1 + position1amount;
                    TotalPosition2 = TotalPosition2 + position2amount;
                }
                lblTotalposition1.Text = TotalPosition1.ToString();
                lblTotalposition2.Text = TotalPosition2.ToString();

            }
        }
    }
}