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
    public partial class My_Ledger : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable MatchesDatatable { get { return dt; } }

        protected void Page_Load(object sender, EventArgs e)
        {

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "select matches.DateTime,matches.TeamA,matches.TeamB, agentledger.Amount,agentledger.Dabit,agentledger.credit,agentledger.remark from agentledger inner join matches on agentledger.matchID = matches.apiID  Where agentledger.AgentID = '" + Session["AgentID"] + "' ";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);

                foreach (DataRow row in dt.Rows)
                {

                    string timeFromDB = row["DateTime"].ToString();
                    //DateTime oDate = DateTime.ParseExact(timeFromDB, "yyyy-MM-ddTHH:mm tt", System.Globalization.CultureInfo.InvariantCulture);
                    DateTime oDate = DateTime.Parse(timeFromDB);
                    string datetime =  oDate.Date.ToString().Substring(0, 10);
                    row["DateTime"] = datetime;
                }

            }
        }

    }
}
