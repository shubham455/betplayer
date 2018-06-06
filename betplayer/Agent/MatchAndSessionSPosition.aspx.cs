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
        private DataTable dt1;
        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }


        protected void Page_Load(object sender, EventArgs e)
        {
            string Session1 = Request.QueryString["Session"];
            apiID.Value = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string s = "select Session.sessionID,Session.session,Session.Runs,Session.Amount,Session.rate,Session.Mode,Session.DateTime,Session.Team,Session.clientID,clientmaster.Name from Session inner join clientmaster on Session.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["AgentID"] + "' && Session.MatchID = '" + apiID.Value + "' && Session.Session = '"+Session1+"'";
                MySqlCommand cmd1 = new MySqlCommand(s, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                dt = new DataTable();
                dt1 = new DataTable();
                adp1.Fill(dt);
                adp1.Fill(dt1);

                int runs = Convert.ToInt16(dt1.Rows[0]["Runs"]);
                    for (int i = runs - 10; i < runs + 10; i++)
                    {
                    foreach (DataRow row in dt1.Rows)
                    {

                        int Num = i;
                        row["Runs"] = Num;
                    }
                  
                }
            }


            
        }
    }
}