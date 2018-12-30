﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.SubAdmin
{
    public partial class MatchAndSessionPosition : System.Web.UI.Page
    {
        private DataTable dt;
        private DataTable dt1;
        private DataTable ClientTable = new DataTable();
        private DataTable ClientTable1 = new DataTable();
        public DataTable ClientTableOrdered;
        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }
        public DataTable ClientDataTable1 { get { return ClientTableOrdered; } }
        public Boolean emptyLedgerTable = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request.QueryString["Type"];
            if (type == "Test" || type == "test")
            {
                emptyLedgerTable = true;
            }

            ClientTable.Columns.Add(new DataColumn("runnerID"));
            ClientTable.Columns.Add(new DataColumn("Amount"));
            ClientTable.Columns.Add(new DataColumn("Rate"));
            ClientTable.Columns.Add(new DataColumn("Mode"));
            //ClientTable.Columns.Add(new DataColumn("DateTime"));
            DataColumn colDateTime = new DataColumn("DateTime");
            colDateTime.DataType = System.Type.GetType("System.DateTime");
            ClientTable.Columns.Add(colDateTime);
            ClientTable.Columns.Add(new DataColumn("Team"));
            ClientTable.Columns.Add(new DataColumn("ClientID"));
            ClientTable.Columns.Add(new DataColumn("Name"));
            ClientTable.Columns.Add(new DataColumn("Createdby"));
            ClientTable.Columns.Add(new DataColumn("AgentCreatedby"));
            ClientTable.Columns.Add(new DataColumn("SuperAgentCreatedby"));
            ClientTable.Columns.Add(new DataColumn("Position1"));
            ClientTable.Columns.Add(new DataColumn("Position2"));
            ClientTable.Columns.Add(new DataColumn("Position3"));
            DataRow Clientrow = ClientTable.NewRow();



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
                lblTeamA.Text = TeamA1;
                lblTeamB.Text = TeamB1;


                string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.CreatedBy,AgentMaster.CreatedBy,SuperAgentMaster.CreatedBy,runner.Position1,runner.Position2,runner.Position3 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID inner join AgentMaster on  clientmaster.CreatedBy = AgentMaster.code inner join SuperAgentMaster on SuperAgentMaster.Code = AgentMaster.CreatedBy where  runner.MatchID = '" + apiID.Value + "' order by DateTime DESC";
                MySqlCommand cmd1 = new MySqlCommand(s, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                dt1 = new DataTable();
                adp1.Fill(dt1);

                int l = 0;
                foreach (DataRow row in dt1.Rows)
                {
                    string Mode1 = "";
                    string Mode = dt1.Rows[l]["Mode"].ToString();
                    if (Mode == "K")
                    {
                        Mode1 = "L";

                    }
                    else if (Mode == "L")
                    {
                        Mode1 = "K";

                    }
                    row["Mode"] = Mode1;
                    row["Mode"] = Mode1;
                    l++;
                }
                int j = 0;
                Decimal TeamAposition = 0;
                Decimal TeamAposition1 = 0;
                Decimal Teampos = 0;
                foreach (DataRow row in dt1.Rows)
                {

                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + apiID.Value + "'";
                    MySqlCommand selectteamcmd = new MySqlCommand(selectteam, cn);
                    MySqlDataAdapter selectteamadp = new MySqlDataAdapter(selectteamcmd);
                    DataTable selectteamdt = new DataTable();
                    selectteamadp.Fill(selectteamdt);
                    string TeamA = selectteamdt.Rows[0]["TeamA"].ToString();
                    string TeamB = selectteamdt.Rows[0]["TeamB"].ToString();
                    lblTeamA.Text = TeamA;
                    lblTeamB.Text = TeamB;

                    string team = dt1.Rows[j]["Team"].ToString();

                    Decimal Position = 0;
                    Decimal Amount = Convert.ToDecimal(dt1.Rows[j]["Amount"]);
                    Decimal Rate = Convert.ToDecimal(dt1.Rows[j]["Rate"]);
                    int clientID = Convert.ToInt32(dt1.Rows[j]["ClientID"]);
                    string Mode1 = "";
                    string Mode = dt1.Rows[j]["Mode"].ToString();
                    if (Mode == "K")
                    {
                        Mode1 = "L";
                    }
                    else if (Mode == "L")
                    {
                        Mode1 = "K";
                    }


                    if (TeamA == team && Mode1 == "K")
                    {
                        Position = Amount * Rate;
                    }
                    else if (TeamA == team && Mode1 == "L")
                    {
                        Position = Amount * Rate * -1;
                    }
                    else if (TeamB == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }
                    else if (TeamB == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }

                    row["Position1"] = Position;

                    TeamAposition = TeamAposition + Position;

                    string selectAgentshare = "select Agent_share From ClientMaster where ClientID = '" + clientID + "'";
                    MySqlCommand selectAgentsharecmd = new MySqlCommand(selectAgentshare, cn);
                    MySqlDataAdapter selectAgentshareadp = new MySqlDataAdapter(selectAgentsharecmd);
                    DataTable selectAgentsharedt = new DataTable();
                    selectAgentshareadp.Fill(selectAgentsharedt);
                    TeamAposition1 = 0;

                    Decimal AgentShare1 = Convert.ToDecimal(selectAgentsharedt.Rows[0]["Agent_Share"]);

                    TeamAposition1 = (Position * AgentShare1) / 100;

                    Teampos = Teampos + TeamAposition1;
                    j++;
                }

                Team1Amt.Text = Teampos.ToString();
                if (Teampos > 0)
                {
                    Team1Amt.ForeColor = System.Drawing.Color.Blue;
                }
                else if (Teampos < 0)
                {
                    Team1Amt.ForeColor = System.Drawing.Color.Red;
                }


                int k = 0;
                Decimal TeamBposition = 0;
                Decimal TeamBposition2 = 0;
                Decimal TeamposB = 0;
                foreach (DataRow row in dt1.Rows)
                {
                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + apiID.Value + "'";
                    MySqlCommand selectteamcmd = new MySqlCommand(selectteam, cn);
                    MySqlDataAdapter selectteamadp = new MySqlDataAdapter(selectteamcmd);
                    DataTable selectteamdt = new DataTable();
                    selectteamadp.Fill(selectteamdt);
                    string TeamA = selectteamdt.Rows[0]["TeamA"].ToString();
                    string TeamB = selectteamdt.Rows[0]["TeamB"].ToString();


                    string team = dt1.Rows[k]["Team"].ToString();

                    string Mode1 = "";
                    Decimal Position = 0;
                    Decimal Amount = Convert.ToDecimal(dt1.Rows[k]["Amount"]);
                    Decimal Rate = Convert.ToDecimal(dt1.Rows[k]["Rate"]);
                    string Mode = dt1.Rows[k]["Mode"].ToString();
                    int clientID = Convert.ToInt32(dt1.Rows[k]["ClientID"]);

                    if (Mode == "K")
                    {
                        Mode1 = "L";
                    }
                    else if (Mode == "L")
                    {
                        Mode1 = "K";
                    }


                    if (TeamA == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }
                    else if (TeamA == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if (TeamB == team && Mode1 == "K")
                    {
                        Position = Amount * Rate;
                    }
                    else if (TeamB == team && Mode1 == "L")
                    {
                        Position = Amount * Rate * -1;
                    }
                    else if ("DRAW" == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }

                    row["Position2"] = Position;
                    k++;

                    TeamBposition = TeamBposition + Position;


                    string selectAgentshare1 = "select Agent_share From ClientMaster where ClientID = '" + clientID + "'";
                    MySqlCommand selectAgentsharecmd1 = new MySqlCommand(selectAgentshare1, cn);
                    MySqlDataAdapter selectAgentshareadp1 = new MySqlDataAdapter(selectAgentsharecmd1);
                    DataTable selectAgentsharedt1 = new DataTable();
                    selectAgentshareadp1.Fill(selectAgentsharedt1);


                    Decimal AgentShare = Convert.ToDecimal(selectAgentsharedt1.Rows[0]["Agent_Share"]);

                    TeamBposition2 = (Position * AgentShare) / 100;
                    TeamposB = TeamposB + TeamBposition2;



                }


                Team2Amt.Text = TeamposB.ToString();
                if (TeamposB > 0)
                {
                    Team2Amt.ForeColor = System.Drawing.Color.Blue;
                }
                else if (TeamposB < 0)
                {
                    Team2Amt.ForeColor = System.Drawing.Color.Red;
                }

                int L = 0;
                Decimal TeamCposition = 0;
                Decimal TeamCposition2 = 0;
                Decimal TeamposC = 0;
                foreach (DataRow row in dt1.Rows)
                {
                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + apiID.Value + "'";
                    MySqlCommand selectteamcmd = new MySqlCommand(selectteam, cn);
                    MySqlDataAdapter selectteamadp = new MySqlDataAdapter(selectteamcmd);
                    DataTable selectteamdt = new DataTable();
                    selectteamadp.Fill(selectteamdt);
                    string TeamA = selectteamdt.Rows[0]["TeamA"].ToString();
                    string TeamB = selectteamdt.Rows[0]["TeamB"].ToString();


                    string team = dt1.Rows[L]["Team"].ToString();

                    string Mode1 = "";
                    Decimal Position = 0;
                    Decimal Amount = Convert.ToDecimal(dt1.Rows[L]["Amount"]);
                    Decimal Rate = Convert.ToDecimal(dt1.Rows[L]["Rate"]);
                    string Mode = dt1.Rows[L]["Mode"].ToString();
                    int clientID = Convert.ToInt32(dt1.Rows[L]["ClientID"]);

                    if (Mode == "K")
                    {
                        Mode1 = "L";
                    }
                    else if (Mode == "L")
                    {
                        Mode1 = "K";
                    }


                    if (TeamA == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }
                    else if (TeamA == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if (TeamB == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }
                    else if (TeamB == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "L")
                    {
                        Position = Amount * Rate * -1;
                    }
                    else if ("DRAW" == team && Mode1 == "K")
                    {
                        Position = Amount * Rate;
                    }

                    row["Position3"] = Position;
                    L++;

                    TeamCposition = TeamCposition + Position;


                    string selectAgentshare1 = "select Agent_share From ClientMaster where ClientID = '" + clientID + "'";
                    MySqlCommand selectAgentsharecmd1 = new MySqlCommand(selectAgentshare1, cn);
                    MySqlDataAdapter selectAgentshareadp1 = new MySqlDataAdapter(selectAgentsharecmd1);
                    DataTable selectAgentsharedt1 = new DataTable();
                    selectAgentshareadp1.Fill(selectAgentsharedt1);


                    Decimal AgentShare = Convert.ToDecimal(selectAgentsharedt1.Rows[0]["Agent_Share"]);

                    TeamCposition2 = (Position * AgentShare) / 100;
                    TeamposC = TeamposC + TeamCposition2;
                }


                Team3Amt.Text = TeamposC.ToString();
                if (TeamposC > 0)
                {
                    Team3Amt.ForeColor = System.Drawing.Color.Blue;
                }
                else if (TeamposC < 0)
                {
                    Team3Amt.ForeColor = System.Drawing.Color.Red;
                }
                if (dt1.Rows.Count > 0)
                {
                    IEnumerable<DataRow> orderedRows = dt1.AsEnumerable();
                    DataTable TempClientTable = orderedRows.CopyToDataTable();
                    foreach (DataRow row in TempClientTable.Rows)
                    {
                        ClientTable.Rows.Add(row.ItemArray);
                    }
                }
            }
            if (ClientTable.Rows.Count > 0)
            {
                IEnumerable<DataRow> orderedRows = from row in ClientTable.AsEnumerable()
                                                   orderby row.Field<DateTime>("DateTime") descending
                                                   select row;

                ClientTableOrdered = orderedRows.CopyToDataTable();

            }
            else
            {
                ClientTableOrdered = dt1;
            }
            calculation();
        }


        public void calculation()

        {

            ClientTable1.Columns.Add(new DataColumn("runnerID"));
            ClientTable1.Columns.Add(new DataColumn("Amount"));
            ClientTable1.Columns.Add(new DataColumn("Rate"));
            ClientTable1.Columns.Add(new DataColumn("Mode"));
            ClientTable1.Columns.Add(new DataColumn("DateTime"));
            ClientTable1.Columns.Add(new DataColumn("Team"));
            ClientTable1.Columns.Add(new DataColumn("ClientID"));
            ClientTable1.Columns.Add(new DataColumn("Name"));
            ClientTable1.Columns.Add(new DataColumn("Position1"));
            ClientTable1.Columns.Add(new DataColumn("Position2"));
            ClientTable1.Columns.Add(new DataColumn("Position3"));
            DataRow Clientrow1 = ClientTable1.NewRow();

            apiID.Value = Request.QueryString["MatchID"];

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string scode = "Select * From SuperAgentMaster where CreatedBy = '" + Session["Admincode"] + "'";
                MySqlCommand scodecmd = new MySqlCommand(scode, cn);
                MySqlDataAdapter scodeadp = new MySqlDataAdapter(scodecmd);
                DataTable scodedt = new DataTable();
                scodeadp.Fill(scodedt);

                Decimal TeamAposition = 0;
                Decimal TeamBposition = 0;
                Decimal TeamCposition = 0;

                string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.CreatedBy,AgentMaster.CreatedBy,superagentmaster.CreatedBy,runner.Position1,runner.Position2,runner.Position3 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID inner join AgentMaster on  clientmaster.CreatedBy = AgentMaster.code inner join SuperAgentMaster on AgentMaster.CreatedBy = SuperAgentMaster.code   where  runner.MatchID = '" + apiID.Value + "' order by DateTime DESC";
                MySqlCommand cmd1 = new MySqlCommand(s, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                DataTable dt5 = new DataTable();
                adp1.Fill(dt5);
                int j = 0;


                int l = 0;
                foreach (DataRow row in dt5.Rows)
                {
                    string Mode1 = "";
                    string Mode = dt5.Rows[l]["Mode"].ToString();
                    if (Mode == "K")
                    {
                        Mode1 = "L";

                    }
                    else if (Mode == "L")
                    {
                        Mode1 = "K";

                    }
                    row["Mode"] = Mode1;
                    row["Mode"] = Mode1;
                    l++;
                }
                foreach (DataRow row in dt5.Rows)
                {

                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + apiID.Value + "'";
                    MySqlCommand selectteamcmd = new MySqlCommand(selectteam, cn);
                    MySqlDataAdapter selectteamadp = new MySqlDataAdapter(selectteamcmd);
                    DataTable selectteamdt = new DataTable();
                    selectteamadp.Fill(selectteamdt);
                    string TeamA = selectteamdt.Rows[0]["TeamA"].ToString();
                    string TeamB = selectteamdt.Rows[0]["TeamB"].ToString();
                    lblTeamA.Text = TeamA;
                    lblTeamB.Text = TeamB;

                    string team = dt5.Rows[j]["Team"].ToString();

                    Decimal Position = 0;
                    Decimal Amount = Convert.ToDecimal(dt5.Rows[j]["Amount"]);
                    Decimal Rate = Convert.ToDecimal(dt5.Rows[j]["Rate"]);
                    int clientID = Convert.ToInt32(dt5.Rows[j]["ClientID"]);
                    string Mode1 = "";
                    string Mode = dt5.Rows[j]["Mode"].ToString();
                    if (Mode == "K")
                    {
                        Mode1 = "L";
                    }
                    else if (Mode == "L")
                    {
                        Mode1 = "K";
                    }


                    if (TeamA == team && Mode1 == "K")
                    {
                        Position = Amount * Rate;
                    }
                    else if (TeamA == team && Mode1 == "L")
                    {
                        Position = Amount * Rate * -1;
                    }
                    else if (TeamB == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }
                    else if (TeamB == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }
                    string sscode = dt5.Rows[j]["CreatedBy2"].ToString();
                    string ssshare = "Select * From SuperstockistMaster where code = '" + sscode + "'";
                    MySqlCommand sssharecmd = new MySqlCommand(ssshare, cn);
                    MySqlDataAdapter ssshareadp = new MySqlDataAdapter(sssharecmd);
                    DataTable sssharedt = new DataTable();
                    ssshareadp.Fill(sssharedt);

                    decimal superstockistshare = Convert.ToDecimal(sssharedt.Rows[0]["myshare"]);

                    decimal myshare = 100;
                    decimal myshare1 = myshare / 100;
                    decimal SAgentShare = superstockistshare / 100;
                    Decimal FinalShare = myshare1 - SAgentShare;

                    decimal Team1Amt = (Position * FinalShare);


                    row["Position1"] = Position;

                    TeamAposition = TeamAposition + Team1Amt;



                    j++;
                }

                int k = 0;
                foreach (DataRow row in dt5.Rows)
                {
                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + apiID.Value + "'";
                    MySqlCommand selectteamcmd = new MySqlCommand(selectteam, cn);
                    MySqlDataAdapter selectteamadp = new MySqlDataAdapter(selectteamcmd);
                    DataTable selectteamdt = new DataTable();
                    selectteamadp.Fill(selectteamdt);
                    string TeamA = selectteamdt.Rows[0]["TeamA"].ToString();
                    string TeamB = selectteamdt.Rows[0]["TeamB"].ToString();


                    string team = dt5.Rows[k]["Team"].ToString();

                    string Mode1 = "";
                    Decimal Position = 0;
                    Decimal Amount = Convert.ToDecimal(dt5.Rows[k]["Amount"]);
                    Decimal Rate = Convert.ToDecimal(dt5.Rows[k]["Rate"]);
                    string Mode = dt5.Rows[k]["Mode"].ToString();
                    int clientID = Convert.ToInt32(dt5.Rows[k]["ClientID"]);

                    if (Mode == "K")
                    {
                        Mode1 = "L";
                    }
                    else if (Mode == "L")
                    {
                        Mode1 = "K";
                    }


                    if (TeamA == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }
                    else if (TeamA == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if (TeamB == team && Mode1 == "K")
                    {
                        Position = Amount * Rate;
                    }
                    else if (TeamB == team && Mode1 == "L")
                    {
                        Position = Amount * Rate * -1;
                    }
                    else if ("DRAW" == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }

                    string sscode = dt5.Rows[k]["CreatedBy2"].ToString();
                    string ssshare = "Select * From SuperstockistMaster where code = '" + sscode + "'";
                    MySqlCommand sssharecmd = new MySqlCommand(ssshare, cn);
                    MySqlDataAdapter ssshareadp = new MySqlDataAdapter(sssharecmd);
                    DataTable sssharedt = new DataTable();
                    ssshareadp.Fill(sssharedt);

                    decimal superstockistshare = Convert.ToDecimal(sssharedt.Rows[0]["myshare"]);

                    decimal myshare = 100;
                    decimal myshare1 = myshare / 100;
                    decimal SAgentShare = superstockistshare / 100;
                    Decimal FinalShare = myshare1 - SAgentShare;

                    decimal Team1Amt = (Position * FinalShare);


                    row["Position2"] = Position;

                    TeamBposition = TeamBposition + Team1Amt;
                    k++;
                }
                int L = 0;
                foreach (DataRow row in dt5.Rows)
                {
                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + apiID.Value + "'";
                    MySqlCommand selectteamcmd = new MySqlCommand(selectteam, cn);
                    MySqlDataAdapter selectteamadp = new MySqlDataAdapter(selectteamcmd);
                    DataTable selectteamdt = new DataTable();
                    selectteamadp.Fill(selectteamdt);
                    string TeamA = selectteamdt.Rows[0]["TeamA"].ToString();
                    string TeamB = selectteamdt.Rows[0]["TeamB"].ToString();


                    string team = dt5.Rows[L]["Team"].ToString();

                    string Mode1 = "";
                    Decimal Position = 0;
                    Decimal Amount = Convert.ToDecimal(dt5.Rows[L]["Amount"]);
                    Decimal Rate = Convert.ToDecimal(dt5.Rows[L]["Rate"]);
                    string Mode = dt5.Rows[L]["Mode"].ToString();
                    int clientID = Convert.ToInt32(dt5.Rows[L]["ClientID"]);

                    if (Mode == "K")
                    {
                        Mode1 = "L";
                    }
                    else if (Mode == "L")
                    {
                        Mode1 = "K";
                    }


                    if (TeamA == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }
                    else if (TeamA == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if (TeamB == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }
                    else if (TeamB == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "L")
                    {
                        Position = Amount * Rate * -1;
                    }
                    else if ("DRAW" == team && Mode1 == "K")
                    {
                        Position = Amount * Rate;
                    }

                    string sscode = dt5.Rows[L]["CreatedBy2"].ToString();
                    string ssshare = "Select * From SuperstockistMaster where code = '" + sscode + "'";
                    MySqlCommand sssharecmd = new MySqlCommand(ssshare, cn);
                    MySqlDataAdapter ssshareadp = new MySqlDataAdapter(sssharecmd);
                    DataTable sssharedt = new DataTable();
                    ssshareadp.Fill(sssharedt);

                    decimal superstockistshare = Convert.ToDecimal(sssharedt.Rows[0]["myshare"]);

                    decimal myshare = 100;
                    decimal myshare1 = myshare / 100;
                    decimal SAgentShare = superstockistshare / 100;
                    Decimal FinalShare = myshare1 - SAgentShare;

                    decimal Team1Amt = (Position * FinalShare);


                    row["Position3"] = Position;

                    TeamCposition = TeamCposition + Team1Amt;
                    L++;
                }
                decimal finalpos1 = 0, finalpos2 = 0, finalpos3 = 0;
                for (int a = 0; a < ClientDataTable1.Rows.Count; a++)
                {
                    decimal totalposition1 = Convert.ToDecimal(ClientDataTable1.Rows[a]["Position1"]);
                    decimal totalposition2 = Convert.ToDecimal(ClientDataTable1.Rows[a]["Position2"]);
                    decimal totalposition3 = Convert.ToDecimal(ClientDataTable1.Rows[a]["Position3"]);
                    finalpos1 = finalpos1 + totalposition1;
                    finalpos2 = finalpos2 + totalposition2;
                    finalpos3 = finalpos3 + totalposition3;
                }

                finalposition1.Text = finalpos1.ToString();
                finalposition2.Text = finalpos2.ToString();
                finalposition3.Text = finalpos3.ToString();


                double Team1Amt1 = double.Parse(TeamAposition.ToString());
                double Team2Amt1 = double.Parse(TeamBposition.ToString());
                double Team3Amt1 = double.Parse(TeamCposition.ToString());
                Team1Amt.Text = Team1Amt1.ToString();
                Team2Amt.Text = Team2Amt1.ToString();
                Team3Amt.Text = Team3Amt1.ToString();
                if (Team1Amt1 > 0)
                {
                    Team1Amt.ForeColor = System.Drawing.Color.Blue;

                }
                else if (Team1Amt1 < 0)
                {
                    Team1Amt.ForeColor = System.Drawing.Color.Red;

                }

                if (Team2Amt1 > 0)
                {
                    Team2Amt.ForeColor = System.Drawing.Color.Blue;

                }
                else if (Team2Amt1 < 0)
                {
                    Team2Amt.ForeColor = System.Drawing.Color.Red;

                }
                if (Team3Amt1 > 0)
                {
                    Team3Amt.ForeColor = System.Drawing.Color.Blue;

                }
                else if (Team3Amt1 < 0)
                {
                    Team3Amt.ForeColor = System.Drawing.Color.Red;

                }
            }
        }
    }
}

