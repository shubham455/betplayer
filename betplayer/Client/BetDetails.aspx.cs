using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.Client
{
    public partial class BetDetails : System.Web.UI.Page
    {
        

        private DataTable dt;
        private DataTable dt1;
        private DataTable dt2;
        private DataTable dt3;
        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }
        public DataTable MatchesDataTable2 { get { return dt2; } }
        public DataTable MatchesDataTable3 { get { return dt3; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["ClientID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else { 
            apiID.Value = Request.QueryString["id"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();

                    string SELECT = "Select * from Matches Where apiID = '" + apiID.Value + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    adp.Fill(dt);

                    string SMatches = "Select * from Matches where Status = '1' && Active = '1'";
                    MySqlCommand cmd1 = new MySqlCommand(SMatches, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    dt1 = new DataTable();
                    adp1.Fill(dt1);

                    string TeamCMatches = "Select TeamC from Matches where Status = '1' && Active = '1'";
                    MySqlCommand cmd2 = new MySqlCommand(TeamCMatches, cn);
                    MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                    dt2 = new DataTable();
                    adp2.Fill(dt2);

                    string ClientID = Session["ClientID"].ToString();
                    string runner = "Select *  from runner  where ClientID = '" + ClientID + "' and MatchID = '" + apiID.Value + "' order by DateTime DESC";
                    MySqlCommand cmd3 = new MySqlCommand(runner, cn);
                    MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                    dt3 = new DataTable();
                    adp3.Fill(dt3);
                    if (dt3.Rows.Count > 0)
                    {
                        PositionTeam1.Text = dt3.Rows[0]["Position1"].ToString();
                        PositionTeam2.Text = dt3.Rows[0]["Position2"].ToString();
                    }
                    else
                    {
                        PositionTeam1.Text = "0.00";
                        PositionTeam2.Text = "0.00";
                    }
                }
                
            }
        }
        
    }
}