using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.MatchSessionPlusMinus
{
    public class Admin
    {

        public string name { get; set; }
        public List<Superstockist> SuperstockistsData { get; set; }
        public Total total { get; set; }
        public Admin(string AdminID, string MatchID)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string Admin = "Select * From AdminMaster where AdminID = '" + AdminID + "'";
                MySqlCommand Admincmd = new MySqlCommand(Admin, cn);
                MySqlDataAdapter Adminadp = new MySqlDataAdapter(Admincmd);
                DataTable dt = new DataTable();
                Adminadp.Fill(dt);
                name = dt.Rows[0][1].ToString();
                string AdminCode = dt.Rows[0]["code"].ToString();

                string Superstockist = "Select SuperstockistID,Code,Name From SuperstockistMaster where Createdby = '" + AdminCode + "' Order by Name ASC";
                MySqlCommand Superstockistcmd = new MySqlCommand(Superstockist, cn);
                MySqlDataAdapter Superstockistadp = new MySqlDataAdapter(Superstockistcmd);
                DataTable Superstockistdt = new DataTable();
                Superstockistadp.Fill(Superstockistdt);
                List<Superstockist> superStockistList = new List<Superstockist>();

                for (int b = 0; b < Superstockistdt.Rows.Count; b++)
                {
                    Superstockist superStockist = new Superstockist(Superstockistdt.Rows[b]["SuperstockistID"].ToString(), MatchID);
                    if (superStockist.SuperAgentsData.Count > 0)
                        superStockistList.Add(superStockist);
                }
                SuperstockistsData = superStockistList;
                total = AdminTotal(superStockistList);
                updateadminledger(total, MatchID, AdminID);
            }
        }
        public Total AdminTotal(List<Superstockist> superstockislist)
        {
            Total totaled = new Total();
            totaled.TotalMatchAmount = 0;
            totaled.TotalCommisionAmount = 0;
            totaled.TotalSessionAmount = 0;
            totaled.TotalPlusMinusAmount = 0;
            totaled.Match1Amount = 0;
            totaled.Session1Amount = 0;
            totaled.TotalNetAmount = 0;
            totaled.TotalHalfAmount = 0;
            totaled.TotalAppAmount = 0;
            totaled.TotalSAAmount = 0;
            totaled.TotalFinalAmount = 0;
            foreach (Superstockist Superstockist in superstockislist)
            {
                totaled.TotalMatchAmount += Superstockist.total.TotalMatchAmount;
                totaled.TotalCommisionAmount += Superstockist.total.TotalCommisionAmount;
                totaled.TotalSessionAmount += Superstockist.total.TotalSessionAmount;
                totaled.TotalPlusMinusAmount += Superstockist.total.TotalPlusMinusAmount;
                totaled.Match1Amount += Superstockist.total.Match1Amount;
                totaled.Session1Amount += Superstockist.total.Session1Amount;
                totaled.TotalNetAmount += Superstockist.total.TotalNetAmount;
                totaled.TotalHalfAmount += Superstockist.total.TotalHalfAmount;
                totaled.TotalAppAmount += Superstockist.total.TotalAppAmount;
                totaled.TotalSAAmount += Superstockist.total.TotalSAAmount;
                totaled.TotalFinalAmount += Superstockist.total.TotalFinalAmount;
            }

            return totaled;
        }
        public void updateadminledger(Total total, string MatchID, string AdminID)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string matchdeclare = "Select * From matches where apiID = '" + MatchID + "'";
                MySqlCommand cmd = new MySqlCommand(matchdeclare, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                int declear = Convert.ToInt16(dt.Rows[0]["declear"]);

                if (declear == 1)
                {
                    decimal Dabit = 0, Credit = 0;
                    string Remark = "";
                    if (total.TotalFinalAmount < 0)
                    {
                        Dabit = total.TotalFinalAmount * -1;
                        Remark = "Admin Plus";

                    }
                    else if (total.TotalFinalAmount > 0)
                    {
                        Credit = total.TotalFinalAmount;
                        Remark = "Admin Minus";
                    }

                    string s9 = "Select * From  Adminledger where AdminID = '" + AdminID + "' && MatchID  = '" + MatchID + "'";
                    MySqlCommand cmd9 = new MySqlCommand(s9, cn);
                    MySqlDataReader rdr = cmd9.ExecuteReader();
                    if (rdr.Read())
                    {
                        rdr.Close();
                        string s10 = "Select Amount from Adminledger where AdminID = '" + AdminID + "' && MatchID  = '" + MatchID + "'";
                        MySqlCommand cmd10 = new MySqlCommand(s10, cn);
                        MySqlDataAdapter adp10 = new MySqlDataAdapter(cmd10);
                        DataTable dt10 = new DataTable();
                        adp10.Fill(dt10);

                        decimal Amount = Convert.ToDecimal(dt10.Rows[0]["Amount"]);
                        if (Amount != total.TotalFinalAmount)
                        {

                            string s11 = "update AdminLedger set Amount = @Amount,Dabit =@Dabit,Credit=@Credit  where AdminID = '" + AdminID + "' && MatchID = '" + MatchID + "'";
                            MySqlCommand cmd11 = new MySqlCommand(s11, cn);
                            cmd11.Parameters.AddWithValue("@Amount", total.TotalFinalAmount);
                            cmd11.Parameters.AddWithValue("@Dabit", Dabit);
                            cmd11.Parameters.AddWithValue("@Credit", Credit);
                            cmd11.ExecuteNonQuery();

                            string updatematches = "update matches set AdminAmount = '" + total.TotalFinalAmount + "' where apiID = '" + MatchID + "' ";
                            MySqlCommand updatematchescmd = new MySqlCommand(updatematches, cn);
                            updatematchescmd.ExecuteNonQuery();
                        }

                    }
                    else
                    {

                        rdr.Close();
                        string s8 = "Insert Into Adminledger (AdminID,MatchID,Amount,Dabit,Credit,Remark) Values (@AdminID,@MatchID,@Amount,@Dabit,@Credit,@Remark)";
                        MySqlCommand cmd8 = new MySqlCommand(s8, cn);
                        cmd8.Parameters.AddWithValue("@AdminID", AdminID);
                        cmd8.Parameters.AddWithValue("@MatchID", MatchID);
                        cmd8.Parameters.AddWithValue("@Amount", total.TotalFinalAmount);
                        cmd8.Parameters.AddWithValue("@Dabit", Dabit);
                        cmd8.Parameters.AddWithValue("@Credit", Credit);
                        cmd8.Parameters.AddWithValue("@Remark", Remark);
                        cmd8.ExecuteNonQuery();


                        string updatematches = "update matches set AdminAmount = '" + total.TotalFinalAmount + "' where apiID = '" + MatchID + "' ";
                        MySqlCommand updatematchescmd = new MySqlCommand(updatematches, cn);
                        updatematchescmd.ExecuteNonQuery();
                    }
                }
            }
        }
    }

    public class Superstockist
    {

        public string name { get; set; }
        public List<Superagent> SuperAgentsData { get; set; }
        public Total total { get; set; }
        public Superstockist(string SuperstockistID, string MatchID)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string Superstockist = "Select SuperstockistID,Code,Name From SuperstockistMaster where SuperstockistID = '" + SuperstockistID + "' Order by Name ASC";
                MySqlCommand Superstockistcmd = new MySqlCommand(Superstockist, cn);
                MySqlDataAdapter Superstockistadp = new MySqlDataAdapter(Superstockistcmd);
                DataTable dt = new DataTable();
                Superstockistadp.Fill(dt);
                name = dt.Rows[0]["Name"].ToString();
                string SuperstockistCode = dt.Rows[0]["code"].ToString();

                string SuperAgent = "Select SuperAgentID,Code,Name From SuperAgentMaster where Createdby = '" + SuperstockistCode + "' Order by Name ASC";
                MySqlCommand SuperAgentcmd = new MySqlCommand(SuperAgent, cn);
                MySqlDataAdapter SuperAgentadp = new MySqlDataAdapter(SuperAgentcmd);
                DataTable SuperAgentdt = new DataTable();
                SuperAgentadp.Fill(SuperAgentdt);
                List<Superagent> superagentList = new List<Superagent>();

                for (int b = 0; b < SuperAgentdt.Rows.Count; b++)
                {
                    Superagent superAgent = new Superagent(SuperAgentdt.Rows[b]["SuperAgentID"].ToString(), MatchID);
                    if (superAgent.AgentsData.Count > 0)
                        superagentList.Add(superAgent);
                }
                SuperAgentsData = superagentList;
                total = SSTotal(superagentList);
            }
        }

        public Total SSTotal(List<Superagent> superagentlist)
        {
            Total totaled = new Total();
            totaled.TotalMatchAmount = 0;
            totaled.TotalCommisionAmount = 0;
            totaled.TotalSessionAmount = 0;
            totaled.TotalPlusMinusAmount = 0;
            totaled.Match1Amount = 0;
            totaled.Session1Amount = 0;
            totaled.TotalNetAmount = 0;
            totaled.TotalHalfAmount = 0;
            totaled.TotalAppAmount = 0;
            totaled.TotalSAAmount = 0;
            totaled.TotalFinalAmount = 0;
            foreach (Superagent SuperAgent in superagentlist)
            {
                totaled.TotalMatchAmount += SuperAgent.total.TotalMatchAmount;
                totaled.TotalCommisionAmount += SuperAgent.total.TotalCommisionAmount;
                totaled.TotalSessionAmount += SuperAgent.total.TotalSessionAmount;
                totaled.TotalPlusMinusAmount += SuperAgent.total.TotalPlusMinusAmount;
                totaled.Match1Amount += SuperAgent.total.Match1Amount;
                totaled.Session1Amount += SuperAgent.total.Session1Amount;
                totaled.TotalNetAmount += SuperAgent.total.TotalNetAmount;
                totaled.TotalHalfAmount += SuperAgent.total.TotalHalfAmount;
                totaled.TotalAppAmount += SuperAgent.total.TotalAppAmount;
                totaled.TotalSAAmount += SuperAgent.total.TotalSAAmount;
                totaled.TotalFinalAmount += SuperAgent.total.TotalFinalAmount;
            }

            return totaled;
        }
    }
    public class Superagent
    {
        public string name { get; set; }
        public List<Agent> AgentsData { get; set; }
        public Total total { get; set; }
        public Superagent(string SuperAgentID, string MatchID)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string SuperAgent = "Select SuperAgentID,Code,Name From SuperAgentMaster where SuperAgentID = '" + SuperAgentID + "' Order by Name ASC";
                MySqlCommand SuperAgentcmd = new MySqlCommand(SuperAgent, cn);
                MySqlDataAdapter SuperAgentadp = new MySqlDataAdapter(SuperAgentcmd);
                DataTable dt = new DataTable();
                SuperAgentadp.Fill(dt);
                name = dt.Rows[0]["Name"].ToString();
                string SuperAgentCode = dt.Rows[0]["code"].ToString();

                string Agent = "Select AgentID,Code,Name From AgentMaster where Createdby = '" + SuperAgentCode + "' Order by Name ASC";
                MySqlCommand Agentcmd = new MySqlCommand(Agent, cn);
                MySqlDataAdapter Agentadp = new MySqlDataAdapter(Agentcmd);
                DataTable Agentdt = new DataTable();
                Agentadp.Fill(Agentdt);
                List<Agent> agentlist = new List<Agent>();
                for (int b = 0; b < Agentdt.Rows.Count; b++)
                {
                    Agent agent = new Agent(Agentdt.Rows[b]["AgentID"].ToString(), MatchID);
                    if (agent.ClientDataTable.Rows.Count > 1)
                        agentlist.Add(agent);
                }
                total = SATotal(agentlist, MatchID);
                AgentsData = agentlist;

            }
        }



        public Total SATotal(List<Agent> AgentDataList, string MatchID)
        {
            Total totaled = new Total();
            totaled.TotalMatchAmount = 0;
            totaled.TotalCommisionAmount = 0;
            totaled.TotalSessionAmount = 0;
            totaled.TotalPlusMinusAmount = 0;
            totaled.Match1Amount = 0;
            totaled.Session1Amount = 0;
            totaled.TotalNetAmount = 0;
            totaled.TotalHalfAmount = 0;
            totaled.TotalAppAmount = 0;
            totaled.TotalSAAmount = 0;
            totaled.TotalFinalAmount = 0;
            foreach (Agent AgentData in AgentDataList)
            {
                DataTable DataT = AgentData.ClientDataTable;
                decimal MatchAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["MatchAmount"]);
                totaled.TotalMatchAmount = totaled.TotalMatchAmount + MatchAmount;

                decimal SessionAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["SessionAmount"]);
                totaled.TotalSessionAmount = totaled.TotalSessionAmount + SessionAmount;

                decimal TotalAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["TotalAmount"]);
                totaled.TotalPlusMinusAmount = totaled.TotalPlusMinusAmount + TotalAmount;

                decimal MatchCommisionAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["MatchCommision"]);
                totaled.Match1Amount = totaled.Match1Amount + MatchCommisionAmount;

                decimal MatchSessionAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["SessionCommision"]);
                totaled.Session1Amount = totaled.Session1Amount + MatchSessionAmount;

                decimal ToComAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["TotalCommisionAmount"]);
                totaled.TotalCommisionAmount = totaled.TotalCommisionAmount + ToComAmount;

                decimal ToNetAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["TotalNetAmount"]);
                totaled.TotalNetAmount = totaled.TotalNetAmount + ToNetAmount;

                decimal ToAppAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["MOBAppAmount"]);
                totaled.TotalAppAmount = totaled.TotalAppAmount + ToAppAmount;

                decimal ToSAAgentAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["SAAgentShare"]);
                totaled.TotalSAAmount = totaled.TotalSAAmount + ToSAAgentAmount;

                decimal ToFinalAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["FinalAmount"]);
                totaled.TotalFinalAmount = totaled.TotalFinalAmount + ToFinalAmount;
            }

            return totaled;
        }
    }
    public class Agent
    {
        public string name { get; set; }
        public DataTable ClientDataTable { get; set; }
        public Agent(string AgentID, string MatchID)
        {
            DataTable ClientTable = new DataTable();
            ClientTable.Columns.Add(new DataColumn("Name"));
            ClientTable.Columns.Add(new DataColumn("MatchAmount"));
            ClientTable.Columns.Add(new DataColumn("SessionAmount"));
            ClientTable.Columns.Add(new DataColumn("TotalAmount"));
            ClientTable.Columns.Add(new DataColumn("MatchCommision"));
            ClientTable.Columns.Add(new DataColumn("SessionCommision"));
            ClientTable.Columns.Add(new DataColumn("TotalCommisionAmount"));
            ClientTable.Columns.Add(new DataColumn("TotalNetAmount"));
            ClientTable.Columns.Add(new DataColumn("TotalHalfAmount"));
            ClientTable.Columns.Add(new DataColumn("SHR"));
            ClientTable.Columns.Add(new DataColumn("MOBAppAmount"));
            ClientTable.Columns.Add(new DataColumn("SAAgentShare"));
            ClientTable.Columns.Add(new DataColumn("FinalAmount"));
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string Agent = "Select AgentID,Code,Name From AgentMaster where AgentID = '" + AgentID + "' Order by Name ASC";
                MySqlCommand Agentcmd = new MySqlCommand(Agent, cn);
                MySqlDataAdapter Agentadp = new MySqlDataAdapter(Agentcmd);
                DataTable dt = new DataTable();
                Agentadp.Fill(dt);
                name = dt.Rows[0]["Name"].ToString();

                string s1 = "select clientmaster.clientID,clientmaster.Name from clientmaster inner join viewmatch on clientmaster.ClientID = viewmatch.ClientID  where MatchID = '" + MatchID + "' && CreatedBy = '" + "A" + AgentID + "'  group by ClientMaster.ClientID";
                MySqlCommand Agentcmd1 = new MySqlCommand(s1, cn);
                MySqlDataAdapter Agentadp1 = new MySqlDataAdapter(Agentcmd1);
                DataTable Agentdt = new DataTable();
                Agentadp1.Fill(Agentdt);

                for (int i = 0; i < Agentdt.Rows.Count; i++)
                {

                    string ID = Agentdt.Rows[i]["clientID"].ToString();
                    DataRow row = ClientTable.NewRow();
                    Client client = new Client(ID, MatchID);

                    row["Name"] = client.name;
                    row["MatchAmount"] = client.MatchAmount;
                    row["SessionAmount"] = client.SessionAmount;
                    row["TotalAmount"] = client.TotalAmount;
                    row["MatchCommision"] = client.MatchCommision;
                    row["SessionCommision"] = client.SessionCommision;
                    row["TotalCommisionAmount"] = client.TotalCommisionAmount;
                    row["TotalNetAmount"] = client.TotalNetAmount;
                    row["TotalHalfAmount"] = client.TotalHalfAmount;
                    row["SHR"] = client.SHR;
                    row["MOBAppAmount"] = client.MOBAppAmount;
                    row["SAAgentShare"] = client.SAAgentShare;
                    row["FinalAmount"] = client.FinalAmount;

                    ClientTable.Rows.Add(row.ItemArray);
                }
                AgentTotal(ClientTable);
                ClientDataTable = ClientTable;

            }
        }
        public void AgentTotal(DataTable ClientDataTable)
        {
            DataRow total = ClientDataTable.NewRow();
            Decimal TotalMatchAmount1 = 0;

            decimal TotalCommisionAmount = 0;


            decimal TotalSessionAmount1 = 0;
            decimal TotalPlusMinusAmount = 0;
            decimal Match1Amount = 0;
            decimal Session1Amount = 0;
            decimal TotalNetAmount1 = 0;
            decimal TotalHalfAmount1 = 0;
            decimal TotalAppAmount1 = 0;
            decimal TotalSAAmount1 = 0;
            decimal TotalFinalAmount1 = 0;
            for (int l = 0; l < ClientDataTable.Rows.Count; l++)
            {
                decimal MatchAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["MatchAmount"]);
                TotalMatchAmount1 = TotalMatchAmount1 + MatchAmount;
                decimal SessionAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["SessionAmount"]);
                TotalSessionAmount1 = TotalSessionAmount1 + SessionAmount;

                decimal TotalAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["TotalAmount"]);
                TotalPlusMinusAmount = TotalPlusMinusAmount + TotalAmount;

                decimal MatchCommisionAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["MatchCommision"]);
                Match1Amount = Match1Amount + MatchCommisionAmount;

                decimal MatchSessionAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["SessionCommision"]);
                Session1Amount = Session1Amount + MatchSessionAmount;

                decimal ToComAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["TotalCommisionAmount"]);
                TotalCommisionAmount = TotalCommisionAmount + ToComAmount;

                decimal ToNetAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["TotalNetAmount"]);
                TotalNetAmount1 = TotalNetAmount1 + ToNetAmount;



                decimal ToAppAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["MOBAppAmount"]);
                TotalAppAmount1 = TotalAppAmount1 + ToAppAmount;


                decimal ToSAAgentAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["SAAgentShare"]);
                TotalSAAmount1 = TotalSAAmount1 + ToSAAgentAmount;

                decimal ToFinalAmount = Convert.ToDecimal(ClientDataTable.Rows[l]["FinalAmount"]);
                TotalFinalAmount1 = TotalFinalAmount1 + ToFinalAmount;

            }

            total["MatchAmount"] = TotalMatchAmount1;
            total["SessionAmount"] = TotalSessionAmount1;
            total["TotalAmount"] = TotalPlusMinusAmount;
            total["MatchCommision"] = Match1Amount;
            total["SessionCommision"] = Session1Amount;
            total["TotalCommisionAmount"] = TotalCommisionAmount;
            total["TotalNetAmount"] = TotalNetAmount1;
            total["TotalHalfAmount"] = TotalHalfAmount1;
            total["MOBAppAmount"] = TotalAppAmount1;
            total["SAAgentShare"] = TotalSAAmount1;
            total["FinalAmount"] = TotalFinalAmount1;

            ClientDataTable.Rows.Add(total.ItemArray);
        }
    }
    public class Client
    {
        public string name { get; set; }
        public string MatchAmount { get; set; }
        public string SessionAmount { get; set; }
        public string TotalAmount { get; set; }
        public string MatchCommision { get; set; }
        public string SessionCommision { get; set; }
        public string TotalCommisionAmount { get; set; }
        public string TotalNetAmount { get; set; }
        public string TotalHalfAmount { get; set; }
        public string SHR { get; set; }
        public string MOBAppAmount { get; set; }
        public string SAAgentShare { get; set; }
        public string FinalAmount { get; set; }


        public Client(string ID, string MatchID)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string s = "select clientmaster.clientID,clientmaster.Name from clientmaster inner join viewmatch on clientmaster.ClientID = viewmatch.ClientID  where MatchID = '" + MatchID + "' && Clientmaster.ClientID = '" + ID + "'  group by ClientMaster.ClientID";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                string Name = dt.Rows[0]["Name"].ToString();
                string ClientID = dt.Rows[0]["ClientID"].ToString();
                string CodeName = ClientID + Name;
                

                
                name = CodeName;
                string s1 = "Select Amount From MatchCalculation where ClientID = '" + ID + "' and MatchID = '" + MatchID + "'";
                MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);
                int MatchTotalAmount = 0;
                for (int j = 0; j < dt1.Rows.Count; j++)
                {
                    int Amount = Convert.ToInt32(dt1.Rows[j]["Amount"]);
                    MatchTotalAmount = MatchTotalAmount + Amount;
                }
                if (MatchTotalAmount > 0)
                {
                    MatchTotalAmount = MatchTotalAmount * -1;
                }
                else if (MatchTotalAmount < 0)
                {
                    MatchTotalAmount = MatchTotalAmount * -1;
                }
                double MatchTotalAmountvalue = double.Parse(MatchTotalAmount.ToString());
                MatchAmount = MatchTotalAmountvalue.ToString();

                string s2 = "Select TotalAmount From SessionCalculation where ClientID = '" + ID + "' and MatchID = '" + MatchID + "'";
                MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                adp2.Fill(dt2);
                int SessionTotalAmount = 0;
                for (int k = 0; k < dt2.Rows.Count; k++)
                {
                    int Amount = Convert.ToInt32(dt2.Rows[k]["TotalAmount"]);
                    SessionTotalAmount = SessionTotalAmount + Amount;
                }
                //row["SessionAmount"] = SessionTotalAmount;
                if (SessionTotalAmount > 0)
                {
                    SessionTotalAmount = SessionTotalAmount * -1;
                }
                else if (SessionTotalAmount < 0)
                {
                    SessionTotalAmount = SessionTotalAmount * -1;
                }
                double SessionTotalAmountvalue = double.Parse(SessionTotalAmount.ToString());
                SessionAmount = SessionTotalAmountvalue.ToString();

                Decimal TotalMatch = MatchTotalAmount + SessionTotalAmount;
                double TotalMatchvalue = double.Parse(TotalMatch.ToString());
                TotalAmount = TotalMatchvalue.ToString();

                string s3 = "Select Session From DeclaredSession where MatchID = '" + MatchID + "'";
                MySqlCommand cmd3 = new MySqlCommand(s3, cn);
                MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                DataTable dt3 = new DataTable();
                adp3.Fill(dt3);
                int TotalAmount1 = 0;
                for (int m = 0; m < dt3.Rows.Count; m++)
                {
                    string Session = dt3.Rows[m]["Session"].ToString();
                    string s4 = "Select Amount From Session where MatchID = '" + MatchID + "' && ClientID = '" + ID + "' && Session = '" + Session + "'";
                    MySqlCommand cmd4 = new MySqlCommand(s4, cn);
                    MySqlDataAdapter adp4 = new MySqlDataAdapter(cmd4);
                    DataTable dt4 = new DataTable();
                    adp4.Fill(dt4);

                    for (int n = 0; n < dt4.Rows.Count; n++)
                    {
                        int Amount = Convert.ToInt32(dt4.Rows[n]["Amount"]);
                        TotalAmount1 = TotalAmount1 + Amount;
                    }
                }
                Decimal SessionCommision1 = 0, MatchCommision1 = 0, SuperstockistShare1 = 0;
                string s55 = "Select * from sharetable where MatchID = '" + MatchID + "' && ClientID = '" + ID + "'";
                MySqlCommand cmd55 = new MySqlCommand(s55, cn);
                MySqlDataAdapter adp55 = new MySqlDataAdapter(cmd55);
                DataTable dt55 = new DataTable();
                adp55.Fill(dt55);
                if (dt55.Rows.Count > 0)
                {
                    SessionCommision1 = Convert.ToDecimal(dt55.Rows[0]["SSsessionComm"]);
                    MatchCommision1 = Convert.ToDecimal(dt55.Rows[0]["SSMatchComm"]);
                    SuperstockistShare1 = Convert.ToDecimal(dt55.Rows[0]["SSshare"]);
                }

                Decimal SessionCommision2 = SessionCommision1 / 100;
                Decimal SessionCommision3 = TotalAmount1 * SessionCommision2;
                double SessionCommisionvalue = double.Parse(SessionCommision3.ToString());
                SessionCommision = SessionCommisionvalue.ToString();
                decimal TotalMatchCommision1 = 0;

                Decimal MatchCommision2 = MatchCommision1 / 100;


                string s6 = "Select Amount From MatchCalculation where MatchID = '" + MatchID + "' && ClientID = '" + ID + "'";
                MySqlCommand cmd6 = new MySqlCommand(s6, cn);
                MySqlDataAdapter adp6 = new MySqlDataAdapter(cmd6);
                DataTable dt6 = new DataTable();
                adp6.Fill(dt6);

                if (dt6.Rows.Count > 0)
                {
                    Decimal MatchAmount = Convert.ToDecimal(dt6.Rows[0]["Amount"]);
                    if (MatchAmount > 0)
                    {
                        MatchAmount = MatchAmount * -1;
                        double TotalMatchCommisionvalue = double.Parse(TotalMatchCommision1.ToString());
                        MatchCommision = TotalMatchCommisionvalue.ToString();
                    }
                    else if (MatchAmount < 0)
                    {
                        MatchAmount = MatchAmount * -1;
                        TotalMatchCommision1 = MatchCommision2 * MatchAmount;
                        double TotalMatchCommisionvalue1 = double.Parse(TotalMatchCommision1.ToString());
                        MatchCommision = TotalMatchCommisionvalue1.ToString();
                    }
                    else { MatchCommision = (0).ToString(); }
                }
                else { MatchCommision = (0).ToString(); }
                decimal totalcommision = TotalMatchCommision1 + SessionCommision3;
                double totalcommisionvalue = double.Parse(totalcommision.ToString());
                TotalCommisionAmount = totalcommisionvalue.ToString();

                Decimal Match = MatchTotalAmount + SessionTotalAmount;
                Decimal Commision = SessionCommision3 + TotalMatchCommision1;
                Decimal To = 0;

                if (Match > 0)
                {
                    To = Match - Commision;
                }
                else if (Match < 0)
                {
                    To = Match - Commision;
                }

                Decimal TotalNetAmouunt = To;


                double TotalNetAmouuntvalue = double.Parse(TotalNetAmouunt.ToString());
                TotalNetAmount = TotalNetAmouuntvalue.ToString();


                decimal Adminshare = 1;

                decimal SuperAgentShare2 = SuperstockistShare1 / 100;
                decimal finalshare = Adminshare - SuperAgentShare2;
                Decimal TotalSAShareAmount = TotalNetAmouunt * SuperAgentShare2;
                double TotalSAShareAmountvalue = double.Parse(TotalSAShareAmount.ToString());
                SAAgentShare = TotalSAShareAmountvalue.ToString();
                SHR = SuperstockistShare1 + "%";
                Decimal MobileAppAmount = 0;


                string superstockistcode = "select clientmaster.CreatedBy,Agentmaster.CreatedBy,SuperAgentmaster.CreatedBy From ClientMaster inner join AgentMaster on Clientmaster.CreatedBy = AgentMaster.Code inner join superagentmaster on Agentmaster.createdBy = superagentmaster.code where Clientmaster.clientID = '" + ID + "'";
                MySqlCommand superstockistcodecmd = new MySqlCommand(superstockistcode, cn);
                MySqlDataAdapter superstockistcodeadp = new MySqlDataAdapter(superstockistcodecmd);
                DataTable superstockistcodedt = new DataTable();
                superstockistcodeadp.Fill(superstockistcodedt);
                string SuperstockistCode = superstockistcodedt.Rows[0]["CreatedBy2"].ToString();


                string superstockistMobileApp = "select MymobAmount From Superstockistmaster where  Code = '" + SuperstockistCode + "'";
                MySqlCommand superstockistMobileAppcmd = new MySqlCommand(superstockistMobileApp, cn);
                MySqlDataAdapter superstockistMobileAppadp = new MySqlDataAdapter(superstockistMobileAppcmd);
                DataTable superstockistMobileAppdt = new DataTable();
                superstockistMobileAppadp.Fill(superstockistMobileAppdt);
                string MobileApp = superstockistMobileAppdt.Rows[0]["MymobAmount"].ToString();


                MobileAppAmount = Convert.ToDecimal(MobileApp);
                MOBAppAmount = MobileApp.ToString();
                decimal finalAmount = (TotalNetAmouunt - TotalSAShareAmount) + MobileAppAmount;
                double finalAmountvalue = double.Parse(finalAmount.ToString());
                FinalAmount = finalAmountvalue.ToString();
            }

        }
    }
    public class Total
    {
        public Decimal TotalMatchAmount;
        public decimal TotalCommisionAmount;
        public decimal TotalSessionAmount;
        public decimal TotalPlusMinusAmount;
        public decimal Match1Amount;
        public decimal Session1Amount;
        public decimal TotalNetAmount;
        public decimal TotalHalfAmount;
        public decimal TotalAppAmount;
        public decimal TotalSAAmount;
        public decimal TotalFinalAmount;
    }
}
