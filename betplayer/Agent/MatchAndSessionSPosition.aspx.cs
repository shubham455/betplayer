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
       
        private DataTable runTable;
        public DataTable MatchesDataTable { get { return dt; } }
        
        public DataTable runTable1 { get { return runTable; } }


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
                
                adp1.Fill(dt);
              


                runTable = new DataTable();
                runTable.Columns.Add(new DataColumn("RUNS"));
                runTable.Columns.Add(new DataColumn("AMOUNT"));
                int runs = Convert.ToInt16(dt.Rows[0]["Runs"]);
                int Amount = Convert.ToInt32(dt.Rows[0]["Amount"]);
                for (int i = runs - 10; i <= runs + 10; i++)
                {

                    DataRow row = runTable.NewRow();
                    row["RUNS"] = i.ToString();
                    if (i < runs)
                    {
                        int Amount1 = Amount * -1;
                        row["Amount"] = 
                            System.Drawing.Color.Red; 
                        row["AMOUNT"] = Amount1;

                    }
                    if (i >= runs)
                    {
                        int Amount1 = Amount ;
                        row["Amount"] = System.Drawing.Color.Blue;
                        row["AMOUNT"] = Amount1;
                    }


                    runTable.Rows.Add(row.ItemArray);

                }
            }


            
        }
    }
}