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
            
            string[,] arr = new string[100,100];
            runTable = new DataTable();
            runTable.Columns.Add(new DataColumn("RUNS"));
            runTable.Columns.Add(new DataColumn("AMOUNT"));
            string Session1 = Request.QueryString["Session"];
            apiID.Value = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();


                string s = "select Session.sessionID,Session.session,Session.Runs,Session.Amount,Session.rate,Session.Mode,Session.DateTime,Session.Team,Session.clientID,clientmaster.Name from Session inner join clientmaster on Session.ClientID = clientmaster.ClientID where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Session["AgentID"] + "' && Session.MatchID = '" + apiID.Value + "' && Session.Session = '" + Session1 + "'";
                MySqlCommand cmd1 = new MySqlCommand(s, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                dt = new DataTable();

                adp1.Fill(dt);
                Decimal LastValueDown = 0, LastValueUp = 0;
                Decimal Amount1 = 0, Amount2 = 0;
                Decimal LastDifferenceDown = 0, LastDifferenceUp = 0, LastDifferenceAmount1 = 0, LastDifferenceAmount2= 0;
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



                        for (int i = runs + 30; i >= runs - 30; i--)
                        {

                            DataRow row = runTable.NewRow();
                            row["RUNS"] = i.ToString();
                            if (i < runs)
                            {
                                if (Mode == "Y")
                                {
                                    Amount1 = (Amount  * AgentShare1 +  LastValueDown   );
                                    row["Amount"] =
                                        System.Drawing.Color.Red;
                                    row["AMOUNT"] = Amount1;
                                }
                                else if (Mode == "N")
                                {
                                    
                                    Amount1 =( Amount * Rate * -1 * AgentShare1 + LastValueDown );
                                    row["Amount"] =
                                        System.Drawing.Color.Red;
                                    row["AMOUNT"] = Amount1;
                                }


                            }
                            if (i >= runs)
                            {
                                if (Mode == "Y")
                                {
                                    Amount2 = (Amount * Rate * -1 * AgentShare1 + LastValueUp);
                                    row["Amount"] =
                                        System.Drawing.Color.Red;
                                    row["AMOUNT"] = Amount2;

                                }

                                else if (Mode == "N")
                                {
                                    Amount2 = (Amount * AgentShare1 +  LastValueUp  );
                                    row["Amount"] =
                                        System.Drawing.Color.Red;
                                    row["AMOUNT"] = Amount2;
                                }


                            }
                            

                            
                            runTable.Rows.Add(row.ItemArray);
                        }
                        LastDifferenceAmount1 = LastDifferenceAmount1 + Amount2;
                        LastDifferenceAmount2 = LastDifferenceAmount2 + Amount1;

                    }
                    else
                    {

                        
                        runTable.Clear();
                        int runs = Convert.ToInt16(dt.Rows[j]["Runs"]);
                        int Amount = Convert.ToInt32(dt.Rows[j]["Amount"]);
                        Decimal Rate = Convert.ToDecimal(dt.Rows[j]["Rate"]);
                        string Mode = dt.Rows[j]["Mode"].ToString();
                        string ClientID = dt.Rows[j]["ClientID"].ToString();
                        Amount1 = 0; Amount2 = 0;

                        string selectAgentshare = "select Agent_share From ClientMaster where ClientID = '" + ClientID + "'";
                        MySqlCommand selectAgentsharecmd = new MySqlCommand(selectAgentshare, cn);
                        MySqlDataAdapter selectAgentshareadp = new MySqlDataAdapter(selectAgentsharecmd);
                        DataTable selectAgentsharedt = new DataTable();
                        selectAgentshareadp.Fill(selectAgentsharedt);


                        Decimal AgentShare = Convert.ToDecimal(selectAgentsharedt.Rows[0]["Agent_Share"]);
                        Decimal AgentShare1 = AgentShare / 100;


                        for (int i = runs + 30; i >= runs - 30; i--)
                        {
                            if (i >= Convert.ToInt16(dt.Rows[0]["Runs"]) && i < Convert.ToInt16(dt.Rows[j]["Runs"]))
                            {
                               Decimal Amount5 = Convert.ToDecimal( arr[i,i]);
                                DataRow row = runTable.NewRow();
                                row["RUNS"] = i.ToString();
                                if (i < runs)
                                {
                                    if (Mode == "Y")
                                    {
                                        LastDifferenceAmount1 = Amount  * AgentShare1 + LastDifferenceUp  ;
                                        row["Amount"] =
                                            System.Drawing.Color.Red;
                                        row["AMOUNT"] = LastDifferenceAmount1;
                                    }
                                    else if (Mode == "N")
                                    {
                                        LastDifferenceAmount1 = Amount * -1 * AgentShare1  + LastDifferenceDown;
                                        row["Amount"] =
                                            System.Drawing.Color.Red;
                                        row["AMOUNT"] = LastDifferenceAmount1;
                                    }


                                }
                                if (i >= runs)
                                {
                                    if (Mode == "Y")
                                    {
                                        LastDifferenceAmount2 = Amount * Rate * -1  * AgentShare1 + LastDifferenceDown;
                                        row["Amount"] =
                                            System.Drawing.Color.Red;
                                        row["AMOUNT"] = LastDifferenceAmount2;
                                    }
                                    else if (Mode == "N")
                                    {
                                        LastDifferenceAmount2 = Amount * AgentShare1 + LastDifferenceUp;
                                        row["Amount"] =
                                            System.Drawing.Color.Red;
                                        row["AMOUNT"] = LastDifferenceAmount2;
                                    }


                                }


                                runTable.Rows.Add(row.ItemArray);
                            
                            }
                            else
                            {
                                DataRow row = runTable.NewRow();
                                row["RUNS"] = i.ToString();
                                if (i < runs)
                                {
                                    if (Mode == "Y")
                                    {
                                        Amount1 = Amount  * AgentShare1 + LastValueDown;
                                        row["Amount"] =
                                            System.Drawing.Color.Red;
                                        row["AMOUNT"] = Amount1;
                                    }
                                    else if (Mode == "N")
                                    {
                                        Amount1 = Amount * -1 * AgentShare1  + LastValueDown;
                                        row["Amount"] =
                                            System.Drawing.Color.Red;
                                        row["AMOUNT"] = Amount1;
                                    }


                                }
                                if (i >= runs)
                                {
                                    if (Mode == "Y")
                                    {
                                        Amount2 = Amount * Rate * -1 * AgentShare1 + LastValueUp;
                                        row["Amount"] =
                                            System.Drawing.Color.Red;
                                        row["AMOUNT"] = Amount2;
                                    }
                                    else if (Mode == "N")
                                    {
                                        Amount2 = Amount * Rate  * AgentShare1 + LastValueUp;
                                        row["Amount"] =
                                            System.Drawing.Color.Red;
                                        row["AMOUNT"] = Amount2;
                                    }


                                }


                                runTable.Rows.Add(row.ItemArray);

                            }
                        }
                    }


                    LastValueUp = 0;
                    LastValueDown = 0;
                    LastDifferenceUp = 0;
                    LastDifferenceDown = 0;
                    LastDifferenceUp = 0; LastDifferenceDown = 0;
                    LastValueDown = LastValueDown + Amount1;
                    LastValueUp = LastValueUp + Amount2;
                    LastDifferenceDown = LastDifferenceDown + LastDifferenceAmount2;
                    LastDifferenceUp = LastDifferenceUp + LastDifferenceAmount1;

                    
                    for (int i = 0; i < runTable.Rows.Count; i++)
                    {
                        arr[i,i] =runTable.Rows[i]["Runs"].ToString();
                        arr[i,i] =runTable.Rows[i]["Amount"].ToString();
                    }
                }

            }
        }
    }
}


