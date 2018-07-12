using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.superagent
{
    public partial class CompanymatchplusminusDisplay : System.Web.UI.Page
    {
        private DataTable AgentName;
        public List<DataTable> AgentDataList = new List<DataTable>();
        public List<DataTable> TotalAgentDataList = new List<DataTable>();
        public DataTable TotalDT = new DataTable();


        public DataTable agentname { get { return AgentName; } }
        public Decimal TotalMatchAmount1 = 0;
        public decimal TotalCommisionAmount = 0;
        public decimal TotalSessionAmount1 = 0;
        public decimal TotalPlusMinusAmount = 0;
        public decimal Match1Amount = 0;
        public decimal Session1Amount = 0;
        public decimal TotalNetAmount1 = 0;
        public decimal TotalHalfAmount1 = 0;
        public decimal TotalAppAmount1 = 0;
        public decimal TotalSAAmount1 = 0;
        public decimal TotalFinalAmount1 = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            AgentName = new DataTable();
            AgentName.Columns.Add(new DataColumn("agentname"));
            AgentName.Columns.Add(new DataColumn("agentID"));
            AgentName.Columns.Add(new DataColumn("code"));
            DataRow row1 = AgentName.NewRow();




            int MatchID = Convert.ToInt32(Request.QueryString["MatchID"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string SuperAgent = "Select Name From SuperAgentMaster where SuperAgentID = '" + Session["SuperAgentID"] + "'";
                MySqlCommand SuperAgentcmd = new MySqlCommand(SuperAgent, cn);
                MySqlDataAdapter SuperAgentadp = new MySqlDataAdapter(SuperAgentcmd);
                DataTable SuperAgentdt = new DataTable();
                SuperAgentadp.Fill(SuperAgentdt);
                lblName.Text = SuperAgentdt.Rows[0]["Name"].ToString();


                string Agent = "Select AgentID,Code,Name From AgentMaster where Createdby = '" + Session["SuperAgentCode"] + "'";
                MySqlCommand Agentcmd = new MySqlCommand(Agent, cn);
                MySqlDataAdapter Agentadp = new MySqlDataAdapter(Agentcmd);
                DataTable Agentdt = new DataTable();
                Agentadp.Fill(Agentdt);
                for (int a = 0; a < Agentdt.Rows.Count; a++)
                {
                    string AgentID = Agentdt.Rows[a]["AgentID"].ToString();
                    string Agentcode = Agentdt.Rows[a]["code"].ToString();
                    string agentname = Agentdt.Rows[a]["Name"].ToString();

                    row1["AgentName"] = agentname;
                    row1["agentID"] = AgentID;
                    row1["code"] = Agentcode;

                    AgentName.Rows.Add(row1.ItemArray);
                    AgentDataList.Add(FetchClientData(Convert.ToInt32(AgentID), Agentcode));
                }
                Total(AgentDataList);
                SATotal(AgentDataList);
            }
        }
        public void Total(List<DataTable> AgentDatalist)
        {

            foreach (DataTable DataT in AgentDataList)
            {
                DataRow total = DataT.NewRow();
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
                for (int l = 0; l < DataT.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(DataT.Rows[l]["MatchAmount"]);
                    TotalMatchAmount1 = TotalMatchAmount1 + MatchAmount;
                    decimal SessionAmount = Convert.ToDecimal(DataT.Rows[l]["SessionAmount"]);
                    TotalSessionAmount1 = TotalSessionAmount1 + SessionAmount;

                    decimal TotalAmount = Convert.ToDecimal(DataT.Rows[l]["TotalAmount"]);
                    TotalPlusMinusAmount = TotalPlusMinusAmount + TotalAmount;

                    decimal MatchCommisionAmount = Convert.ToDecimal(DataT.Rows[l]["MatchCommision"]);
                    Match1Amount = Match1Amount + MatchCommisionAmount;

                    decimal MatchSessionAmount = Convert.ToDecimal(DataT.Rows[l]["SessionCommision"]);
                    Session1Amount = Session1Amount + MatchSessionAmount;

                    decimal ToComAmount = Convert.ToDecimal(DataT.Rows[l]["TotalCommisionAmount"]);
                    TotalCommisionAmount = TotalCommisionAmount + ToComAmount;

                    decimal ToNetAmount = Convert.ToDecimal(DataT.Rows[l]["TotalNetAmount"]);
                    TotalNetAmount1 = TotalNetAmount1 + ToNetAmount;

                    decimal ToHalfAmount = Convert.ToDecimal(DataT.Rows[l]["TotalHalfAmount"]);
                    TotalHalfAmount1 = TotalHalfAmount1 + ToHalfAmount;

                    decimal ToAppAmount = Convert.ToDecimal(DataT.Rows[l]["MOBAppAmount"]);
                    TotalAppAmount1 = TotalAppAmount1 + ToAppAmount;


                    decimal ToSAAgentAmount = Convert.ToDecimal(DataT.Rows[l]["SAAgentShare"]);
                    TotalSAAmount1 = TotalSAAmount1 + ToSAAgentAmount;

                    decimal ToFinalAmount = Convert.ToDecimal(DataT.Rows[l]["FinalAmount"]);
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

                DataT.Rows.Add(total.ItemArray);
            }
        }

        public void SATotal(List<DataTable> AgentDatalist)
        {

            TotalMatchAmount1 = 0;
            TotalCommisionAmount = 0;
            TotalSessionAmount1 = 0;
            TotalPlusMinusAmount = 0;
            Match1Amount = 0;
            Session1Amount = 0;
            TotalNetAmount1 = 0;
            TotalHalfAmount1 = 0;
            TotalAppAmount1 = 0;
            TotalSAAmount1 = 0;
            TotalFinalAmount1 = 0;
            foreach (DataTable DataT in AgentDataList)
            {
                decimal MatchAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["MatchAmount"]);
                TotalMatchAmount1 = TotalMatchAmount1 + MatchAmount;

                decimal SessionAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["SessionAmount"]);
                TotalSessionAmount1 = TotalSessionAmount1 + SessionAmount;

                decimal TotalAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["TotalAmount"]);
                TotalPlusMinusAmount = TotalPlusMinusAmount + TotalAmount;

                decimal MatchCommisionAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["MatchCommision"]);
                Match1Amount = Match1Amount + MatchCommisionAmount;

                decimal MatchSessionAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["SessionCommision"]);
                Session1Amount = Session1Amount + MatchSessionAmount;

                decimal ToComAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["TotalCommisionAmount"]);
                TotalCommisionAmount = TotalCommisionAmount + ToComAmount;

                decimal ToNetAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["TotalNetAmount"]);
                TotalNetAmount1 = TotalNetAmount1 + ToNetAmount;

                decimal ToHalfAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["TotalHalfAmount"]);
                TotalHalfAmount1 = TotalHalfAmount1 + ToHalfAmount;

                decimal ToAppAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["MOBAppAmount"]);
                TotalAppAmount1 = TotalAppAmount1 + ToAppAmount;


                decimal ToSAAgentAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["SAAgentShare"]);
                TotalSAAmount1 = TotalSAAmount1 + ToSAAgentAmount;

                decimal ToFinalAmount = Convert.ToDecimal(DataT.Rows[DataT.Rows.Count - 1]["FinalAmount"]);
                TotalFinalAmount1 = TotalFinalAmount1 + ToFinalAmount;
            }
            SAMatchAmount.Text = TotalMatchAmount1.ToString();
            SASessionAmount.Text = TotalSessionAmount1.ToString();
            SATotalAmount.Text = TotalPlusMinusAmount.ToString();
            SAMatchCommision.Text = Match1Amount.ToString();
            SASessionCommision.Text = Session1Amount.ToString();
            SATotalCommisionAmount.Text = TotalCommisionAmount.ToString();
            SATotalNetAmount.Text = TotalNetAmount1.ToString();
            SATotalHalfAmount.Text = TotalHalfAmount1.ToString();
            SAMOBAppAmount.Text = TotalAppAmount1.ToString();
            SBSAAgentShare.Text = TotalSAAmount1.ToString();
            SAFinalAmount.Text = TotalFinalAmount1.ToString();

            Label1.Text = TotalMatchAmount1.ToString();
            Label2.Text = TotalSessionAmount1.ToString();
            Label3.Text = TotalPlusMinusAmount.ToString();
            Label4.Text = Match1Amount.ToString();
            Label5.Text = Session1Amount.ToString();
            Label6.Text = TotalCommisionAmount.ToString();
            Label7.Text = TotalNetAmount1.ToString();
            Label8.Text = TotalHalfAmount1.ToString();
            Label9.Text = TotalAppAmount1.ToString();
            Label10.Text = TotalSAAmount1.ToString();
            Label11.Text = TotalFinalAmount1.ToString();

        }

        public DataTable FetchClientData(int AgentID, string AgentCode)
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
            ClientTable.Columns.Add(new DataColumn("MOBAppAmount"));
            ClientTable.Columns.Add(new DataColumn("SAAgentShare"));
            ClientTable.Columns.Add(new DataColumn("FinalAmount"));

            int MatchID = Convert.ToInt32(Request.QueryString["MatchID"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string s = "select clientmaster.clientID,clientmaster.Name from clientmaster inner join viewmatch on clientmaster.ClientID = viewmatch.ClientID  where MatchID = '" + MatchID + "' && CreatedBy = '" + AgentCode + "'  group by ClientMaster.Name";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string Name = dt.Rows[i]["Name"].ToString();
                    string ID = dt.Rows[i]["ClientID"].ToString();
                    string CodeName = ID + Name;
                    DataRow row = ClientTable.NewRow();

                    row["Name"] = CodeName;

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
                    row["MatchAmount"] = MatchTotalAmount;


                    row["SessionAmount"] = 0;

                    Decimal TotalMatch = MatchTotalAmount;
                    row["TotalAmount"] = TotalMatch;

                    string s3 = "Select Session From DeclaredSession where MatchID = '" + MatchID + "'";
                    MySqlCommand cmd3 = new MySqlCommand(s3, cn);
                    MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                    DataTable dt3 = new DataTable();
                    adp3.Fill(dt3);
                    int TotalAmount = 0;
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
                            TotalAmount = TotalAmount + Amount;
                        }
                    }
                    string s5 = "Select SessionCommision,MatchCommision,Name  From AgentMaster where CreatedBy = '" + Session["SuperAgentCode"] + "' ";
                    MySqlCommand cmd5 = new MySqlCommand(s5, cn);
                    MySqlDataAdapter adp5 = new MySqlDataAdapter(cmd5);
                    DataTable dt5 = new DataTable();
                    adp5.Fill(dt5);

                    Decimal SessionCommision1 = Convert.ToDecimal(dt5.Rows[0]["SessionCommision"]);
                    Decimal SessionCommision2 = SessionCommision1 / 100;
                    Decimal SessionCommision = TotalAmount * SessionCommision2;

                    row["SessionCommision"] = SessionCommision;
                    decimal TotalMatchCommision1 = 0;
                    Decimal MatchCommision = Convert.ToDecimal(dt5.Rows[0]["MatchCommision"]);
                    Decimal MatchCommision1 = MatchCommision / 100;

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
                            row["MatchCommision"] = TotalMatchCommision1;
                        }
                        else if (MatchAmount < 0)
                        {
                            MatchAmount = MatchAmount * -1;
                            TotalMatchCommision1 = MatchCommision1 * MatchAmount;
                            row["MatchCommision"] = TotalMatchCommision1;
                        }
                    }
                    else { row["MatchCommision"] = 0; }
                    decimal totalcommision = TotalMatchCommision1 + SessionCommision;
                    row["TotalCommisionAmount"] = totalcommision;

                    Decimal Match = MatchTotalAmount;
                    Decimal Commision = SessionCommision + TotalMatchCommision1;
                    Decimal To = 0;

                    if (Match > 0)
                    {
                        To = Match - Commision;
                    }
                    else if (Match < 0)
                    {
                        To = Match + Commision;
                    }

                    Decimal TotalNetAmouunt = To;

                    string ClientShare = "Select Agent_Share From ClientMaster where CreatedBy = '" + AgentCode + "'";
                    MySqlCommand ClientSharecmd = new MySqlCommand(ClientShare, cn);
                    MySqlDataAdapter ClientShareadp = new MySqlDataAdapter(ClientSharecmd);
                    DataTable ClientSharedt = new DataTable();
                    ClientShareadp.Fill(ClientSharedt);

                    decimal ClientShare1 = Convert.ToDecimal(ClientSharedt.Rows[i]["Agent_Share"]);
                    decimal ClientMaster2 = 100 / ClientShare1;
                    Decimal TotalHalfAmount = TotalNetAmouunt / ClientMaster2;

                    row["TotalNetAmount"] = TotalNetAmouunt;

                    row["TotalHalfAmount"] = TotalHalfAmount;

                    string SuperAgentShare = "Select Code,AgentShare From SuperAgentMaster where SuperAgentID = '" + Session["SuperAgentID"] + "'";
                    MySqlCommand SuperAgentSharecmd = new MySqlCommand(SuperAgentShare, cn);
                    MySqlDataAdapter SuperAgentShareadp = new MySqlDataAdapter(SuperAgentSharecmd);
                    DataTable SuperAgentSharedt = new DataTable();
                    SuperAgentShareadp.Fill(SuperAgentSharedt);

                    decimal SuperAgentShare1 = Convert.ToDecimal(SuperAgentSharedt.Rows[0]["AgentShare"]);
                    decimal SuperAgentShare2 = 100 / SuperAgentShare1;
                    Decimal TotalSAShareAmount = TotalHalfAmount / ClientMaster2;
                    row["SAAgentShare"] = TotalSAShareAmount;

                    Decimal MobileAppAmount = 0;

                    string s7 = "Select MobApp From AgentMaster where  code = '" + AgentCode + "'";
                    MySqlCommand cmd7 = new MySqlCommand(s7, cn);
                    MySqlDataAdapter adp7 = new MySqlDataAdapter(cmd7);
                    DataTable dt7 = new DataTable();
                    adp7.Fill(dt7);
                    MobileAppAmount = 0;
                    String MobileApp = dt7.Rows[0]["MobApp"].ToString();

                    MobileAppAmount = Convert.ToDecimal(MobileApp);
                    row["MOBAppAmount"] = MobileAppAmount;


                    row["FinalAmount"] = TotalSAShareAmount + MobileAppAmount;

                    ClientTable.Rows.Add(row.ItemArray);

                }
                return ClientTable;
            }

        }
    }
}