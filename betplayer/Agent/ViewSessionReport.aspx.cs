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
    public partial class ViewSessionReport : System.Web.UI.Page
    {
        private DataTable dt2;
        private DataTable runTable;
        public DataTable MatchesDataTable { get { return dt2; } }
        public DataTable runTable1 { get { return runTable; } }



        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
                DropDownClient.DataSource = dt;
                DropDownClient.DataBind();
                DropDownClient.DataTextField = "Name";
                DropDownClient.DataValueField = "ClientID";
                DropDownClient.DataBind();

                string s1 = "Select SessionID,Session From Session where MatchID = '" + MatchID + "'";
                MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);
                DropDownSession.DataSource = dt1;
                DropDownSession.DataBind();
                DropDownSession.DataTextField = "Session";
                DropDownSession.DataValueField = "Session";
                DropDownSession.DataBind();

                string s2 = "select Session.sessionID,Session.session,Session.Runs,Session.Amount,Session.rate,Session.Mode,Session.DateTime,Session.Team,Session.clientID,clientmaster.Name from Session inner join clientmaster on Session.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["AgentID"] + "' && Session.MatchID = '0'";
                MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                dt2 = new DataTable();
                adp2.Fill(dt2);

                runTable = new DataTable();
                runTable.Columns.Add(new DataColumn("RUNS"));
                runTable.Columns.Add(new DataColumn("AMOUNT"));
                    if (dt2.Rows.Count > 0)
                    {
                        int runs = Convert.ToInt16(dt2.Rows[0]["Runs"]);
                        int Amount = Convert.ToInt32(dt2.Rows[0]["Amount"]);
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
                                int Amount1 = Amount;
                                row["Amount"] = System.Drawing.Color.Blue;
                                row["AMOUNT"] = Amount1;
                            }


                            runTable.Rows.Add(row.ItemArray);

                        }
                    }

                }
            }
        }

        protected void btnview_Click(object sender, EventArgs e)
        {
            int MatchID = Convert.ToInt32(Request.QueryString["MatchID"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s2 = "select Session.sessionID,Session.session,Session.Runs,Session.Amount,Session.rate,Session.Mode,Session.DateTime,Session.Team,Session.clientID,clientmaster.Name from Session inner join clientmaster on Session.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["AgentID"] + "' && Session.MatchID = '" + MatchID + "' && Session.Session = '" + DropDownSession.Text + "'";
                MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                dt2 = new DataTable();
                adp2.Fill(dt2);



                runTable = new DataTable();
                runTable.Columns.Add(new DataColumn("RUNS"));
                runTable.Columns.Add(new DataColumn("AMOUNT"));
                if (dt2.Rows.Count > 0)
                {
                    int runs = Convert.ToInt16(dt2.Rows[0]["Runs"]);
                    int Amount = Convert.ToInt32(dt2.Rows[0]["Amount"]);
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
                            int Amount1 = Amount;
                            row["Amount"] = System.Drawing.Color.Blue;
                            row["AMOUNT"] = Amount1;
                        }


                        runTable.Rows.Add(row.ItemArray);

                    }
                }
            }
        }
    }
}