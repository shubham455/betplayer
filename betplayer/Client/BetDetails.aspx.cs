using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }
        public DataTable MatchesDataTable2 { get { return dt2; } }
        protected void Page_Load(object sender, EventArgs e)
        {

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



            }
        }
    }
}