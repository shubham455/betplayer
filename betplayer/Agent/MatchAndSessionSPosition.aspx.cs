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
            runTable = new DataTable();
            runTable.Columns.Add(new DataColumn("RUNS"));
            runTable.Columns.Add(new DataColumn("AMOUNT"));
            string Session1 = Request.QueryString["Session"];
            apiID.Value = Request.QueryString["MatchID"];
            firebasekey.Value = Request.QueryString["fk"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string SELECT = "Select * from Matches Where apiID = '" + apiID.Value + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
                string TeamA1 = dt.Rows[0]["TeamA"].ToString();
                string TeamB1 = dt.Rows[0]["TeamB"].ToString();
               

                string s = "select Session.sessionID,Session.session,Session.Runs,Session.Amount,Session.rate,Session.Mode,Session.DateTime,Session.Team,Session.clientID,clientmaster.Name from Session inner join clientmaster on Session.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["Agentcode"] + "' && Session.MatchID = '" + apiID.Value + "' && Session.Session = '" + Session1 + "' order by session.datetime DESC";
                MySqlCommand cmd1 = new MySqlCommand(s, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                dt = new DataTable();

                adp1.Fill(dt);
                
                
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    if (j == 0)
                    {

                        int runs = Convert.ToInt16(dt.Rows[j]["Runs"]);
                        int Amount = Convert.ToInt32(dt.Rows[j]["Amount"]);
                        Decimal Rate = Convert.ToDecimal(dt.Rows[j]["Rate"]);
                        string Mode = dt.Rows[j]["Mode"].ToString();
                        string ClientID = dt.Rows[j]["ClientID"].ToString();

                        string selectAgentshare = "select Agent_share From ClientMaster where ClientID = '" + ClientID + "'";
                        MySqlCommand selectAgentsharecmd = new MySqlCommand(selectAgentshare, cn);
                        MySqlDataAdapter selectAgentshareadp = new MySqlDataAdapter(selectAgentsharecmd);
                        DataTable selectAgentsharedt = new DataTable();
                        selectAgentshareadp.Fill(selectAgentsharedt);


                        Decimal AgentShare = Convert.ToDecimal(selectAgentsharedt.Rows[j]["Agent_Share"]);
                        Decimal AgentShare1 = AgentShare / 100;



                        for (int i = runs + 5; i >= runs - 5; i--)
                        {

                            DataRow row = runTable.NewRow();
                            row["RUNS"] = i.ToString();
                            row["Amount"] = CalculateAmount(Mode,
                                i, 0,
                                Rate,
                                runs, Amount,
                                AgentShare1).ToString();
                            runTable.Rows.Add(row.ItemArray);
                        }
                       
                    }
                    else
                    {

                        int runs = Convert.ToInt32(dt.Rows[j]["Runs"]);
                        int Amount = Convert.ToInt32(dt.Rows[j]["Amount"]);
                        Decimal Rate = Convert.ToDecimal(dt.Rows[j]["Rate"]);
                        string Mode = dt.Rows[j]["Mode"].ToString();
                        string ClientID = dt.Rows[j]["ClientID"].ToString();
                       

                        string selectAgentshare = "select Agent_share From ClientMaster where ClientID = '" + ClientID + "'";
                        MySqlCommand selectAgentsharecmd = new MySqlCommand(selectAgentshare, cn);
                        MySqlDataAdapter selectAgentshareadp = new MySqlDataAdapter(selectAgentsharecmd);
                        DataTable selectAgentsharedt = new DataTable();
                        selectAgentshareadp.Fill(selectAgentsharedt);


                        Decimal AgentShare = Convert.ToDecimal(selectAgentsharedt.Rows[0]["Agent_Share"]);
                        Decimal AgentShare1 = AgentShare / 100;
                        int highVal = Convert.ToInt32(runTable.Rows[0]["Runs"]);
                        int lowVal = Convert.ToInt32(runTable.Rows[runTable.Rows.Count - 1]["Runs"]);
                        if ((runs+5) > highVal)
                        {
                            for (int i = runs + 5; i > highVal; i--)
                            {
                                DataRow row = runTable.NewRow();
                                row["RUNS"] = i.ToString();
                                row["Amount"] = runTable.Rows[0]["Amount"];

                                runTable.Rows.InsertAt(row, (runs + 5 - i));
                            }
                        }
                        else if ((runs-5) < lowVal)
                        {
                            for (int i = lowVal-1; i >= runs - 5; i--)
                            {
                                DataRow row = runTable.NewRow();
                                row["RUNS"] = i.ToString();
                                row["Amount"] = runTable.Rows[runTable.Rows.Count - 1]["Amount"];

                                runTable.Rows.InsertAt(row, ((highVal-lowVal) + (lowVal-i)));
                            }
                        }

                        for (int i=0; i < runTable.Rows.Count;  i++)
                        {
                            DataRow row = runTable.Rows[i];
                            if (Convert.ToInt16(runTable.Rows[i]["Runs"])>= Convert.ToInt16(dt.Rows[0]["Runs"]) &&
                                Convert.ToInt16(runTable.Rows[i]["Runs"]) < Convert.ToInt16(dt.Rows[j]["Runs"]))
                            {

                                
                                row["AMOUNT"] = CalculateAmount(Mode,
                                    Convert.ToInt16(runTable.Rows[i]["Runs"]),
                                    Convert.ToDecimal(runTable.Rows[i]["Amount"]),
                                    Rate,
                                    runs,
                                    Amount,
                                    AgentShare1).ToString();
                            }
                            else
                            {
                                row["AMOUNT"] = CalculateAmount(Mode,
                                    Convert.ToInt16(runTable.Rows[i]["Runs"]),
                                    Convert.ToDecimal(runTable.Rows[i]["Amount"]),
                                    Rate,
                                    runs,
                                    Amount,
                                    AgentShare1).ToString();
                            }
                        }
                    }
                }
            }
        }
       public Decimal CalculateAmount(string Mode,int Initruns,Decimal InitAmount,Decimal Rate, int runs, int Amount, Decimal AgentShare1)
        {
            Decimal Difference = 0;

            if (Initruns < runs)
            {

                if (Mode == "Y")
                {
                    Difference = Amount * AgentShare1+ InitAmount;
                }
                else if (Mode == "N")
                {
                    Difference = Amount *-1 * AgentShare1 + InitAmount;
                }


            }
            if (Initruns >= runs)
            {
                if (Mode == "Y")
                {
                    Difference =  Amount *Rate * -1 * AgentShare1 + InitAmount;
                }
                else if (Mode == "N")
                {
                    Difference = Amount *Rate * AgentShare1 + InitAmount;
                }


            }
            return Difference;
        }

    }
}


