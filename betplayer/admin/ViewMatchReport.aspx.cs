using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.admin
{
    public partial class ViewMatchReport : System.Web.UI.Page
    {
        private DataTable dt;
        private DataTable dt1;
        private DataTable ClientTable = new DataTable();
        private DataTable ClientTable1 = new DataTable();
        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }
        public DataTable ClientDataTable1 { get { return ClientTable; } }


        private DataTable runtable;


        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                Bets();


                runtable = new DataTable();
                runtable.Columns.Add(new DataColumn("ClientID"));
                runtable.Columns.Add(new DataColumn("Name"));
                DataRow row = runtable.NewRow();

                string MatchID = Request.QueryString["MatchID"];
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();

                    string SELECT = "Select * from Matches Where apiID = '" + MatchID + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    string TeamA = dt.Rows[0]["TeamA"].ToString();
                    string TeamB = dt.Rows[0]["TeamB"].ToString();
                    lblTeamA.Text = TeamA;
                    lblTeamB.Text = TeamB;
                    lblTeamA1.Text = TeamA;
                    lblTeamB1.Text = TeamB;


                    string s2 = "Select * From ClientMaster";
                    MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                    MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                    DataTable dt2 = new DataTable();
                    adp2.Fill(dt2);

                    for (int j = 0; j < dt2.Rows.Count; j++)
                    {
                        int ClientID = Convert.ToInt32(dt2.Rows[j]["ClientID"]);
                        string Name = "C"+ClientID +dt2.Rows[j]["Name"].ToString();

                        row["ClientID"] = ClientID;
                        row["Name"] = Name;
                        runtable.Rows.Add(row.ItemArray);
                    }
                }
                Dropdownclient.DataSource = runtable;
                Dropdownclient.DataTextField = "Name";
                Dropdownclient.DataValueField = "ClientID";
                Dropdownclient.DataBind();
            }
        }

        protected void Dropdownclient_SelectedIndexChanged(object sender, EventArgs e)
        {


            int MatchID = Convert.ToInt32(Request.QueryString["MatchID"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                if (Dropdownclient.SelectedItem.Text == "All Client")
                {
                    Bets();

                }
                else
                {
                    ClientTable.Columns.Add(new DataColumn("runnerID"));
                    ClientTable.Columns.Add(new DataColumn("Amount"));
                    ClientTable.Columns.Add(new DataColumn("Rate"));
                    ClientTable.Columns.Add(new DataColumn("Mode"));
                    ClientTable.Columns.Add(new DataColumn("DateTime"));
                    ClientTable.Columns.Add(new DataColumn("Team"));
                    ClientTable.Columns.Add(new DataColumn("ClientID"));
                    ClientTable.Columns.Add(new DataColumn("Name"));
                    ClientTable.Columns.Add(new DataColumn("Createdby"));
                    ClientTable.Columns.Add(new DataColumn("Position1"));
                    ClientTable.Columns.Add(new DataColumn("Position2"));
                    DataRow Clientrow = ClientTable.NewRow();

                    string SELECT = "Select * from Matches Where apiID = '" + MatchID + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    adp.Fill(dt);
                    string TeamA1 = dt.Rows[0]["TeamA"].ToString();
                    string TeamB1 = dt.Rows[0]["TeamB"].ToString();
                    lblTeamA.Text = TeamA1;
                    lblTeamB.Text = TeamB1;



                    string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.createdby,runner.Position1,runner.Position2 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID where  runner.MatchID = '" + MatchID + "' && runner.ClientID = '" + Dropdownclient.SelectedValue + "'  order by DateTime DESC";
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

                    foreach (DataRow row in dt1.Rows)
                    {

                        string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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

                        row["Position1"] = Position;


                        j++;
                    }

                    int k = 0;
                    foreach (DataRow row in dt1.Rows)
                    {
                        string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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
                        row["Position2"] = Position;
                        k++;
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

                    decimal totalPosition1 = 0, totalPosition2 = 0;
                    for (int a = 0; a < ClientTable.Rows.Count; a++)
                    {
                        decimal Position1 = Convert.ToDecimal(ClientTable.Rows[a]["Position1"]);
                        decimal Position2 = Convert.ToDecimal(ClientTable.Rows[a]["Position2"]);
                        totalPosition1 = totalPosition1 + Position1;
                        totalPosition2 = totalPosition2 + Position2;
                    }
                    lblTotalPosition1.Text = totalPosition1.ToString();
                    lblTotalPosition2.Text = totalPosition2.ToString();

                    ClientCalculation();
                }
            }

        }



        public void Bets()
        {
            ClientTable.Columns.Add(new DataColumn("runnerID"));
            ClientTable.Columns.Add(new DataColumn("Amount"));
            ClientTable.Columns.Add(new DataColumn("Rate"));
            ClientTable.Columns.Add(new DataColumn("Mode"));
            ClientTable.Columns.Add(new DataColumn("DateTime"));
            ClientTable.Columns.Add(new DataColumn("Team"));
            ClientTable.Columns.Add(new DataColumn("ClientID"));
            ClientTable.Columns.Add(new DataColumn("Name"));
            ClientTable.Columns.Add(new DataColumn("CreatedBy"));
            ClientTable.Columns.Add(new DataColumn("CreatedBy1"));
            ClientTable.Columns.Add(new DataColumn("Position1"));
            ClientTable.Columns.Add(new DataColumn("Position2"));
            DataRow Clientrow = ClientTable.NewRow();



            string MatchID = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string SELECT = "Select * from Matches Where apiID = '" + MatchID + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
                string TeamA1 = dt.Rows[0]["TeamA"].ToString();
                string TeamB1 = dt.Rows[0]["TeamB"].ToString();
                lblTeamA.Text = TeamA1;
                lblTeamB.Text = TeamB1;


                string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.CreatedBy,AgentMaster.CreatedBy,runner.Position1,runner.Position2 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID inner join AgentMaster on  clientmaster.CreatedBy = AgentMaster.code where  runner.MatchID = '" + MatchID + "' order by DateTime DESC";
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

                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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

                lblPositionA.Text = Teampos.ToString();
                if (Teampos > 0)
                {
                    lblPositionA.ForeColor = System.Drawing.Color.Blue;
                }
                else if (Teampos < 0)
                {
                    lblPositionA.ForeColor = System.Drawing.Color.Red;
                }


                int k = 0;
                Decimal TeamBposition = 0;
                Decimal TeamBposition2 = 0;
                Decimal TeamposB = 0;
                foreach (DataRow row in dt1.Rows)
                {
                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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


                lblPositionB.Text = TeamposB.ToString();
                if (TeamposB > 0)
                {
                    lblPositionB.ForeColor = System.Drawing.Color.Blue;
                }
                else if (TeamposB < 0)
                {
                    lblPositionB.ForeColor = System.Drawing.Color.Red;
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
            ClientTable1.Columns.Add(new DataColumn("CreatedBy"));
            ClientTable1.Columns.Add(new DataColumn("Position1"));
            ClientTable1.Columns.Add(new DataColumn("Position2"));
            DataRow Clientrow1 = ClientTable1.NewRow();



            string MatchID = Request.QueryString["MatchID"];

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

                string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.CreatedBy,AgentMaster.CreatedBy,superagentmaster.CreatedBy,runner.Position1,runner.Position2 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID inner join AgentMaster on  clientmaster.CreatedBy = AgentMaster.code inner join SuperAgentMaster on AgentMaster.CreatedBy = SuperAgentMaster.code   where  runner.MatchID = '" + MatchID + "' order by DateTime DESC";
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

                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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
                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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

                decimal finalpos1 = 0, finalpos2 = 0;
                for (int a = 0; a < ClientDataTable1.Rows.Count; a++)
                {
                    decimal totalposition1 = Convert.ToDecimal(ClientDataTable1.Rows[a]["Position1"]);
                    decimal totalposition2 = Convert.ToDecimal(ClientDataTable1.Rows[a]["Position2"]);
                    finalpos1 = finalpos1 + totalposition1;
                    finalpos2 = finalpos2 + totalposition2;
                }

                lblTotalPosition1.Text = finalpos1.ToString();
                lblTotalPosition2.Text = finalpos2.ToString();


                double Team1Amt1 = double.Parse(TeamAposition.ToString());
                double Team2Amt1 = double.Parse(TeamBposition.ToString());
                lblPositionA.Text = Team1Amt1.ToString();
                lblPositionB.Text = Team2Amt1.ToString();
                if (Team1Amt1 > 0)
                {
                    lblPositionA.ForeColor = System.Drawing.Color.Blue;

                }
                else if (Team1Amt1 < 0)
                {
                    lblPositionA.ForeColor = System.Drawing.Color.Red;

                }

                if (Team2Amt1 > 0)
                {
                    lblPositionB.ForeColor = System.Drawing.Color.Blue;

                }
                else if (Team2Amt1 < 0)
                {
                    lblPositionB.ForeColor = System.Drawing.Color.Red;

                }
            }
        }

        public void ClientCalculation()
        {

            ClientTable1.Columns.Add(new DataColumn("runnerID"));
            ClientTable1.Columns.Add(new DataColumn("Amount"));
            ClientTable1.Columns.Add(new DataColumn("Rate"));
            ClientTable1.Columns.Add(new DataColumn("Mode"));
            ClientTable1.Columns.Add(new DataColumn("DateTime"));
            ClientTable1.Columns.Add(new DataColumn("Team"));
            ClientTable1.Columns.Add(new DataColumn("ClientID"));
            ClientTable1.Columns.Add(new DataColumn("Name"));
            ClientTable1.Columns.Add(new DataColumn("CreatedBy"));
            ClientTable1.Columns.Add(new DataColumn("Position1"));
            ClientTable1.Columns.Add(new DataColumn("Position2"));
            DataRow Clientrow1 = ClientTable1.NewRow();

            string MatchID = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                Decimal TeamAposition = 0;
                Decimal TeamBposition = 0;

                

                string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.createdby,runner.Position1,runner.Position2 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID where Clientmaster.clientID = '" + Dropdownclient.SelectedValue + "' and runner.MatchID = '" + MatchID + "' order by DateTime DESC";
                MySqlCommand cmd1 = new MySqlCommand(s, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                DataTable dt5 = new DataTable();
                adp1.Fill(dt5);
                int j = 0;

                Decimal TeamAposition1 = 0;
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

                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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


                    string selectAgentshare = "select Agent_share,createdby From ClientMaster where ClientID = '" + clientID + "'";
                    MySqlCommand selectAgentsharecmd = new MySqlCommand(selectAgentshare, cn);
                    MySqlDataAdapter selectAgentshareadp = new MySqlDataAdapter(selectAgentsharecmd);
                    DataTable selectAgentsharedt = new DataTable();
                    selectAgentshareadp.Fill(selectAgentsharedt);
                    TeamAposition1 = 0;

                    Decimal Clientshare = Convert.ToDecimal(selectAgentsharedt.Rows[0]["Agent_Share"]);

                    decimal finalClientshare = Clientshare / 100;
                    Decimal FinalShare = 1 - finalClientshare;
                    TeamAposition1 = Convert.ToDecimal(Position * FinalShare);

                    row["Position1"] = TeamAposition1;

                    TeamAposition = TeamAposition + TeamAposition1;


                    j++;
                }

                int k = 0;

                Decimal TeamBposition2 = 0;

                foreach (DataRow row in dt5.Rows)
                {
                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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


                    string selectAgentshare = "select Agent_share,createdby From ClientMaster where ClientID = '" + clientID + "'";
                    MySqlCommand selectAgentsharecmd = new MySqlCommand(selectAgentshare, cn);
                    MySqlDataAdapter selectAgentshareadp = new MySqlDataAdapter(selectAgentsharecmd);
                    DataTable selectAgentsharedt = new DataTable();
                    selectAgentshareadp.Fill(selectAgentsharedt);
                    TeamBposition2 = 0;

                    Decimal Clientshare = Convert.ToDecimal(selectAgentsharedt.Rows[0]["Agent_Share"]);



                    decimal finalClientshare = Clientshare / 100;
                    Decimal FinalShare = 1 - finalClientshare;
                    TeamBposition2 = Convert.ToDecimal(Position * FinalShare);

                    row["Position2"] = TeamBposition2;

                    TeamBposition = TeamBposition + TeamBposition2;



                    k++;
                }



                if (dt5.Rows.Count > 0)
                {
                    IEnumerable<DataRow> orderedRows = dt5.AsEnumerable();
                    DataTable TempClientTable = orderedRows.CopyToDataTable();
                    foreach (DataRow row11 in TempClientTable.Rows)
                    {
                        ClientTable1.Rows.Add(row11.ItemArray);
                    }
                }



                double dValue1 = double.Parse(TeamAposition.ToString());
                double dValue2 = double.Parse(TeamBposition.ToString());
                lblPositionA.Text = dValue1.ToString();
                lblPositionB.Text = dValue2.ToString();
                if (TeamAposition > 0)
                {
                    lblPositionA.ForeColor = System.Drawing.Color.Blue;

                }
                else if (TeamAposition < 0)
                {
                    lblPositionA.ForeColor = System.Drawing.Color.Red;

                }
                if (TeamBposition > 0)
                {
                    lblPositionB.ForeColor = System.Drawing.Color.Blue;

                }
                else if (TeamBposition < 0)
                {
                    lblPositionB.ForeColor = System.Drawing.Color.Red;

                }
            }

        }
    }
}
