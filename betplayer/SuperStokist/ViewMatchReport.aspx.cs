using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.SuperStokist
{
    public partial class ViewMatchReport : System.Web.UI.Page
    {
        private DataTable dt;
        private DataTable dt1;
        private DataTable ClientTable = new DataTable();
        private DataTable ClientTable1 = new DataTable();
        public DataTable ClientTableOrdered;
        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }
        public DataTable ClientDataTable1 { get { return ClientTableOrdered; } }


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



                    string s1 = "Select * From SuperAgentMaster where CreatedBy = '" + Session["SuperStockistCode"] + "'";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    adp1.Fill(dt1);

                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        string SuperAgentCode = dt1.Rows[i]["Code"].ToString();

                        string s2 = "Select ClientMaster.ClientID,ClientMaster.Name From ClientMaster inner join AgentMaster on ClientMaster.CreatedBy = AgentMaster.Code  where AgentMaster.CreatedBy = '" + SuperAgentCode + "'";
                        MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                        MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                        DataTable dt2 = new DataTable();
                        adp2.Fill(dt2);

                        for (int j = 0; j < dt2.Rows.Count; j++)
                        {
                            int ClientID = Convert.ToInt32(dt2.Rows[j]["ClientID"]);
                            string Name = "C" + ClientID + dt2.Rows[j]["Name"].ToString();

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
                    //ClientTable.Columns.Add(new DataColumn("DateTime"));
                    DataColumn colDateTime = new DataColumn("DateTime");
                    colDateTime.DataType = System.Type.GetType("System.DateTime");
                    ClientTable.Columns.Add(colDateTime);
                    ClientTable.Columns.Add(new DataColumn("Team"));
                    ClientTable.Columns.Add(new DataColumn("ClientID"));
                    ClientTable.Columns.Add(new DataColumn("Name"));
                    ClientTable.Columns.Add(new DataColumn("Createdby"));
                    ClientTable.Columns.Add(new DataColumn("Createdby1"));
                    ClientTable.Columns.Add(new DataColumn("Position1"));
                    ClientTable.Columns.Add(new DataColumn("Position2"));
                    ClientTable.Columns.Add(new DataColumn("Position3"));
                    ClientTable.Columns.Add(new DataColumn("Myshare"));
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


                    string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.createdby,AgentMaster.CreatedBy,runner.Position1,runner.Position2,runner.Position3,SuperAgentMaster.Myshare from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID inner join AgentMaster on ClientMaster.CreatedBy = AgentMaster.Code inner join SuperAgentMaster on AgentMaster.CreatedBy = SuperAgentMaster.Code where runner.MatchID = '" + MatchID + "' && runner.ClientID = '" + Dropdownclient.SelectedValue + "'  order by DateTime DESC";
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
                    int L = 0;
                    Decimal TeamCposition = 0;
                    Decimal TeamCposition2 = 0;
                    Decimal TeamposC = 0;
                    foreach (DataRow row in dt1.Rows)
                    {
                        string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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


                    if (dt1.Rows.Count > 0)
                    {
                        IEnumerable<DataRow> orderedRows = dt1.AsEnumerable();
                        DataTable TempClientTable = orderedRows.CopyToDataTable();
                        foreach (DataRow row in TempClientTable.Rows)
                        {
                            ClientTable.Rows.Add(row.ItemArray);
                        }
                        dt1.Clear();
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
                ClientTableOrdered = ClientTable;
            }

            decimal totalCalculation1 = 0, totalCalculation2 = 0, totalCalculation3 = 0;
            for (int d = 0; d < ClientTable.Rows.Count; d++)
            {
                decimal total1 = Convert.ToDecimal(ClientTable.Rows[d]["Position1"]);
                decimal total2 = Convert.ToDecimal(ClientTable.Rows[d]["Position2"]);
                decimal total3 = Convert.ToDecimal(ClientTable.Rows[d]["Position3"]);
                totalCalculation1 = totalCalculation1 + total1;
                totalCalculation2 = totalCalculation2 + total2;
                totalCalculation3 = totalCalculation3 + total3;

            }
            //finalposition1.Text = totalCalculation1.ToString();
            //finalposition2.Text = totalCalculation2.ToString();
            //finalposition3.Text = totalCalculation3.ToString();
            lblTotalPosition1.Text = totalCalculation1.ToString();
            lblTotalPosition2.Text = totalCalculation2.ToString();
            ClientCalculation();

        }



        public void Bets()
        {
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
            ClientTable.Columns.Add(new DataColumn("Createdby1"));
            ClientTable.Columns.Add(new DataColumn("Position1"));
            ClientTable.Columns.Add(new DataColumn("Position2"));
            ClientTable.Columns.Add(new DataColumn("Position3"));
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

                string share = "Select myshare,Code From SuperAgentMaster where CreatedBy = '" + Session["SuperStockistCode"] + "'";
                MySqlCommand sharecmd = new MySqlCommand(share, cn);
                MySqlDataAdapter shareadp = new MySqlDataAdapter(sharecmd);
                DataTable sharedt = new DataTable();
                shareadp.Fill(sharedt);
                decimal myshare1 = 0;
                if (sharedt.Rows.Count > 0)
                {
                    decimal myshare = Convert.ToDecimal(sharedt.Rows[0]["myshare"]);
                    myshare1 = myshare / 100;
                }
                for (int a = 0; a < sharedt.Rows.Count; a++)
                {
                    string SuperAgentcode = (sharedt.Rows[a]["Code"]).ToString();


                    int ID = Convert.ToInt32(Session["SuperAgentID"]);
                    string s11 = "Select code From AgentMaster where CreatedBy = '" + SuperAgentcode + "'";
                    MySqlCommand cmd11 = new MySqlCommand(s11, cn);
                    MySqlDataAdapter adp11 = new MySqlDataAdapter(cmd11);
                    DataTable dt11 = new DataTable();
                    adp11.Fill(dt11);

                    for (int i = 0; i < dt11.Rows.Count; i++)
                    {
                        DataRow row1 = ClientTable.NewRow();
                        string Agentcode = (dt11.Rows[i]["code"]).ToString();

                        string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.CreatedBy,AgentMaster.CreatedBy,runner.Position1,runner.Position2,runner.Position3 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID inner join AgentMaster on AgentMaster.Code = ClientMaster.CreatedBy where clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Agentcode + "' && runner.MatchID = '" + MatchID + "' order by DateTime DESC";
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
                        int L = 0;
                        Decimal TeamCposition = 0;
                        Decimal TeamCposition2 = 0;
                        Decimal TeamposC = 0;
                        foreach (DataRow row in dt1.Rows)
                        {
                            string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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


                        if (dt1.Rows.Count > 0)
                        {
                            IEnumerable<DataRow> orderedRows = dt1.AsEnumerable();
                            DataTable TempClientTable = orderedRows.CopyToDataTable();
                            foreach (DataRow row in TempClientTable.Rows)
                            {
                                ClientTable.Rows.Add(row.ItemArray);
                            }
                            dt1.Clear();
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
                    ClientTableOrdered = ClientTable;
                }

                decimal totalCalculation1 = 0, totalCalculation2 = 0, totalCalculation3 = 0;
                for (int d = 0; d < ClientTable.Rows.Count; d++)
                {
                    decimal total1 = Convert.ToDecimal(ClientTable.Rows[d]["Position1"]);
                    decimal total2 = Convert.ToDecimal(ClientTable.Rows[d]["Position2"]);
                    decimal total3 = Convert.ToDecimal(ClientTable.Rows[d]["Position3"]);
                    totalCalculation1 = totalCalculation1 + total1;
                    totalCalculation2 = totalCalculation2 + total2;
                    totalCalculation3 = totalCalculation3 + total3;

                }
                //finalposition1.Text = totalCalculation1.ToString();
                //finalposition2.Text = totalCalculation2.ToString();
                //finalposition3.Text = totalCalculation3.ToString();
                lblTotalPosition1.Text = totalCalculation1.ToString();
                lblTotalPosition2.Text = totalCalculation2.ToString();
                calculation();

            }

        }


        public void calculation()
        {
            string MatchID = Request.QueryString["MatchID"];
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


            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string Superstokistshare = "Select myshare,Code From Superstockistmaster where SuperStockistID = '" + Session["SuperStockistID"] + "'";
                MySqlCommand Superstokistsharecmd = new MySqlCommand(Superstokistshare, cn);
                MySqlDataAdapter Superstokistshareadp = new MySqlDataAdapter(Superstokistsharecmd);
                DataTable Superstokistsharedt = new DataTable();
                Superstokistshareadp.Fill(Superstokistsharedt);

                decimal myshare = Convert.ToDecimal(Superstokistsharedt.Rows[0]["myshare"]);
                decimal myshare1 = myshare / 100;

                string share = "Select myshare,Code From SuperAgentMaster where CreatedBy = '" + Session["SuperStockistCode"] + "'";
                MySqlCommand sharecmd = new MySqlCommand(share, cn);
                MySqlDataAdapter shareadp = new MySqlDataAdapter(sharecmd);
                DataTable sharedt = new DataTable();
                shareadp.Fill(sharedt);

                Decimal FinalTeamAPosition = 0, FinalTeamBPosition = 0, FinalTeamCPosition = 0;
                for (int a = 0; a < sharedt.Rows.Count; a++)
                {
                    decimal Superagentshare = Convert.ToDecimal(sharedt.Rows[a]["myshare"]);
                    decimal Superagentshare1 = Superagentshare / 100;
                    string SuperAgentcode = (sharedt.Rows[a]["Code"]).ToString();

                    decimal Agentshare = 0;
                    Decimal Clientshare1 = 0;
                    string s11 = "Select code,agentshare From AgentMaster where CreatedBy = '" + SuperAgentcode + "'";
                    MySqlCommand cmd11 = new MySqlCommand(s11, cn);
                    MySqlDataAdapter adp11 = new MySqlDataAdapter(cmd11);
                    DataTable dt11 = new DataTable();
                    adp11.Fill(dt11);
                    Decimal TeamAposition = 0;
                    Decimal TeamBposition = 0;
                    Decimal TeamCposition = 0;
                    for (int i = 0; i < dt11.Rows.Count; i++)
                    {
                        TeamAposition = 0;
                        TeamBposition = 0;
                        TeamCposition = 0;
                        string Agentcode = (dt11.Rows[i]["code"]).ToString();
                        Agentshare = Convert.ToDecimal(dt11.Rows[i]["Agentshare"]);

                        string Clientshare = "Select code,Agent_Share,ClientID From ClientMaster where CreatedBy = '" + Agentcode + "'";
                        MySqlCommand Clientsharecmd = new MySqlCommand(Clientshare, cn);
                        MySqlDataAdapter Clientshareadp = new MySqlDataAdapter(Clientsharecmd);
                        DataTable Clientsharedt = new DataTable();
                        Clientshareadp.Fill(Clientsharedt);

                        for (int b = 0; b < Clientsharedt.Rows.Count; b++)
                        {
                            int ClientID = Convert.ToInt16(Clientsharedt.Rows[b]["ClientID"]);
                            Clientshare1 = Convert.ToDecimal(Clientsharedt.Rows[b]["Agent_share"]);
                            string code = (Clientsharedt.Rows[b]["code"]).ToString();



                            string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,runner.Position1,runner.Position2,runner.Position3 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID where clientmaster.ClientID = '" + ClientID + "'  && runner.MatchID = '" + MatchID + "' order by DateTime DESC";
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
                                else if ("DRAW" == team && Mode1 == "L")
                                {
                                    Position = Amount;
                                }
                                else if ("DRAW" == team && Mode1 == "K")
                                {
                                    Position = Amount * -1;
                                }


                                Decimal FinalShare = myshare1 - Superagentshare1;
                                decimal Team1Amt1 = Convert.ToDecimal(Position * FinalShare);


                                row["Position1"] = TeamAposition1;

                                TeamAposition = TeamAposition + Team1Amt1;
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
                                else if ("DRAW" == team && Mode1 == "L")
                                {
                                    Position = Amount;
                                }
                                else if ("DRAW" == team && Mode1 == "K")
                                {
                                    Position = Amount * -1;
                                }

                                Decimal FinalShare = myshare1 - Superagentshare1;
                                decimal Team2Amt1 = Convert.ToDecimal(Position * FinalShare);

                                row["Position2"] = TeamBposition2;

                                TeamBposition = TeamBposition + Team2Amt1;
                                k++;
                            }
                            int L = 0;
                            Decimal TeamCposition2 = 0;

                            foreach (DataRow row in dt5.Rows)
                            {
                                string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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

                                Decimal FinalShare = myshare1 - Superagentshare1;
                                decimal Team3Amt1 = Convert.ToDecimal(Position * FinalShare);

                                row["Position3"] = TeamCposition2;

                                TeamCposition = TeamCposition + Team3Amt1;
                                L++;
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
                        }
                        decimal totalCalculation1 = 0, totalCalculation2 = 0, totalCalculation3 = 0;
                        for (int d = 0; d < ClientTable1.Rows.Count; d++)
                        {
                            decimal total1 = Convert.ToDecimal(ClientTable1.Rows[d]["Position1"]);
                            decimal total2 = Convert.ToDecimal(ClientTable1.Rows[d]["Position2"]);
                            decimal total3 = Convert.ToDecimal(ClientTable1.Rows[d]["Position3"]);
                            totalCalculation1 = totalCalculation1 + total1;
                            totalCalculation2 = totalCalculation2 + total2;
                            totalCalculation3 = totalCalculation3 + total3;

                        }
                        FinalTeamAPosition = FinalTeamAPosition + TeamAposition;
                        FinalTeamBPosition = FinalTeamBPosition + TeamBposition;
                        FinalTeamCPosition = FinalTeamCPosition + TeamCposition;
                    }
                }

                double dValue1 = double.Parse(FinalTeamAPosition.ToString());
                double dValue2 = double.Parse(FinalTeamBPosition.ToString());
                double dValue3 = double.Parse(FinalTeamCPosition.ToString());
                lblPositionA.Text = dValue1.ToString();
                lblPositionB.Text = dValue2.ToString();
                lblPositionB.Text = dValue3.ToString();
                if (FinalTeamAPosition > 0)
                {
                    lblPositionA.ForeColor = System.Drawing.Color.Blue;

                }
                else if (FinalTeamAPosition < 0)
                {
                    lblPositionA.ForeColor = System.Drawing.Color.Red;

                }

                if (FinalTeamBPosition > 0)
                {
                    lblPositionB.ForeColor = System.Drawing.Color.Blue;

                }
                else if (FinalTeamBPosition < 0)
                {
                    lblPositionB.ForeColor = System.Drawing.Color.Red;

                }
                if (FinalTeamCPosition > 0)
                {
                    lblTeamB.ForeColor = System.Drawing.Color.Blue;

                }
                else if (FinalTeamCPosition < 0)
                {
                    lblTeamB.ForeColor = System.Drawing.Color.Red;

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
            ClientTable1.Columns.Add(new DataColumn("Position3"));
            ClientTable1.Columns.Add(new DataColumn("SuperAgentShare"));
            DataRow Clientrow1 = ClientTable1.NewRow();

            string MatchID = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                Decimal TeamAposition = 0;
                Decimal TeamBposition = 0;
                Decimal TeamCposition = 0;

                string Superstokistshare = "Select myshare,Code From Superstockistmaster where SuperStockistID = '" + Session["SuperStockistID"] + "'";
                MySqlCommand Superstokistsharecmd = new MySqlCommand(Superstokistshare, cn);
                MySqlDataAdapter Superstokistshareadp = new MySqlDataAdapter(Superstokistsharecmd);
                DataTable Superstokistsharedt = new DataTable();
                Superstokistshareadp.Fill(Superstokistsharedt);

                decimal myshare = Convert.ToDecimal(Superstokistsharedt.Rows[0]["myshare"]);
                decimal myshare1 = myshare / 100;


                string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.createdby,runner.Position1,runner.Position2,runner.Position3,SuperAgentMaster.Myshare from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID inner join AgentMaster on ClientMaster.CreatedBy = AgentMaster.Code inner join SuperAgentMaster on AgentMaster.CreatedBy = SuperAgentMaster.Code where runner.MatchID = '" + MatchID + "' && runner.ClientID = '" + Dropdownclient.SelectedValue + "'  order by DateTime DESC";
                MySqlCommand cmd1 = new MySqlCommand(s, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                DataTable dt5 = new DataTable();
                adp1.Fill(dt5);

                int j = 0;
                Decimal SuperAgentShare1 = 0;
                if (dt5.Rows.Count > 0)
                {
                    Decimal SuperAgentShare = Convert.ToDecimal(dt5.Rows[j]["myshare"]);
                    SuperAgentShare1 = SuperAgentShare / 100;
                }
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
                    else if ("DRAW" == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }



                    Decimal FinalShare = myshare1 - SuperAgentShare1;
                    decimal Team1Amt1 = Convert.ToDecimal(Position * FinalShare);


                    row["Position1"] = TeamAposition1;

                    TeamAposition = TeamAposition + Team1Amt1;
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
                    else if ("DRAW" == team && Mode1 == "L")
                    {
                        Position = Amount;
                    }
                    else if ("DRAW" == team && Mode1 == "K")
                    {
                        Position = Amount * -1;
                    }

                    Decimal FinalShare = myshare1 - SuperAgentShare1;
                    decimal Team2Amt1 = Convert.ToDecimal(Position * FinalShare);

                    row["Position2"] = TeamBposition2;

                    TeamBposition = TeamBposition + Team2Amt1;
                    k++;
                }
                int L = 0;
                Decimal TeamCposition2 = 0;

                foreach (DataRow row in dt5.Rows)
                {
                    string selectteam = "select TeamA,TeamB From Matches where apiID = '" + MatchID + "'";
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

                    Decimal FinalShare = myshare1 - SuperAgentShare1;
                    decimal Team3Amt1 = Convert.ToDecimal(Position * FinalShare);

                    row["Position3"] = TeamCposition2;

                    TeamCposition = TeamCposition + Team3Amt1;
                    L++;
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
                double dValue3 = double.Parse(TeamCposition.ToString());
                lblPositionA.Text = dValue1.ToString();
                lblPositionB.Text = dValue2.ToString();
                lblPositionB.Text = dValue3.ToString();
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
                if (TeamCposition > 0)
                {
                    lblTeamB.ForeColor = System.Drawing.Color.Blue;

                }
                else if (TeamCposition < 0)
                {
                    lblTeamB.ForeColor = System.Drawing.Color.Red;

                }
            }
        }
    }
}
