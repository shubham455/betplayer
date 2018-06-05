using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Agent
{
    public partial class Match_SessionPosition : System.Web.UI.Page
    {
        private DataTable dt;
        private DataTable dt1;
        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            apiID.Value = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string SELECT = "Select * from Matches Where apiID = '" + apiID.Value + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);


                string s = "select runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,runner.Position1,runner.Position2 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["AgentID"] + "'";
                MySqlCommand cmd1 = new MySqlCommand(s, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                dt1 = new DataTable();
                adp1.Fill(dt1);

                foreach (DataRow row in dt1.Rows)
                {
                    string Mode1="";
                    string Mode = dt1.Rows[0]["Mode"].ToString();
                    if (Mode == "K")
                    {
                         Mode1 = "L";
                    }
                    else if(Mode == "L")
                    {
                        Mode1 = "K";
                    }
                    row["Mode"] = Mode1;
                }

                foreach(DataRow row in dt1.Rows)
                {
                    Decimal Position = 0;
                    Decimal Amount = Convert.ToDecimal(dt1.Rows[0]["Amount"]);
                    Decimal Rate = Convert.ToDecimal(dt1.Rows[0]["Rate"]);
                    string Mode = dt1.Rows[0]["Mode"].ToString();
                    

                    if(Mode == "K")
                    {
                        Position = Amount * Rate * -1;
                    }
                    else if (Mode == "L")
                    {
                        Position = Amount * Rate;
                    }
                    row["Position1"] = Position;
                }
                foreach (DataRow row in dt1.Rows)
                {
                    Decimal Position = 0;
                    Decimal Amount = Convert.ToDecimal(dt1.Rows[0]["Amount"]);
                    Decimal Rate = Convert.ToDecimal(dt1.Rows[0]["Rate"]);
                    string Mode = dt1.Rows[0]["Mode"].ToString();

                    if (Mode == "K")
                    {
                       
                    }
                    else if (Mode == "L")
                    {
                        
                    }
                    row["Position2"] = Position;
                }


            }
        }

        protected void Session1_ServerClick(object sender, EventArgs e)
        {
            string value = Session1.Value;
             int apiID = Convert.ToInt32(Request.QueryString["MatchID"]);

            Response.Redirect("MatchAndSessionSposition.aspx?Matchid="+apiID+"&&Session="+value);
        }
    }
}