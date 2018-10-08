﻿using System;
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
    public partial class CompanySessionPlusMinusDisplay : System.Web.UI.Page
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

            int MatchID = Convert.ToInt32(Request.QueryString["MatchID"]);
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
                    if (TotalFinalAmount1 < 0)
                    {
                        Dabit = TotalFinalAmount1;
                        Remark = "SuperAgent Plus";

                    }
                    else if (TotalFinalAmount1 > 0)
                    {
                        Credit = TotalFinalAmount1;
                        Remark = "SuperAgent Minus";
                    }

                    string s9 = "Select * From  SuperAgentledger where SuperAgentID = '" + Session["SuperAgentID"] + "' && MatchID  = '" + MatchID + "'";
                    MySqlCommand cmd9 = new MySqlCommand(s9, cn);
                    MySqlDataReader rdr = cmd9.ExecuteReader();
                    if (rdr.Read())
                    {

                    }
                    else
                    {

                        rdr.Close();
                        string s8 = "Insert Into SuperAgentledger (SuperAgentID,MatchID,Amount,Dabit,Credit,Remark) Values(@SuperAgentID,@MatchID,@Amount,@Dabit,@Credit,@Remark)";
                        MySqlCommand cmd8 = new MySqlCommand(s8, cn);
                        cmd8.Parameters.AddWithValue("@SuperAgentID", Session["SuperAgentID"]);
                        cmd8.Parameters.AddWithValue("@MatchID", MatchID);
                        cmd8.Parameters.AddWithValue("@Amount", TotalFinalAmount1);
                        cmd8.Parameters.AddWithValue("@Dabit", Dabit);
                        cmd8.Parameters.AddWithValue("@Credit", Credit);
                        cmd8.Parameters.AddWithValue("@Remark", Remark);

                        cmd8.ExecuteNonQuery();
                    }
                }
            }
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


                    row["MatchAmount"] = 0;

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
                    row["SessionAmount"] = SessionTotalAmountvalue;

                    Decimal TotalMatch = SessionTotalAmount;

                    double TotalMatchvalue = double.Parse(TotalMatch.ToString());
                    row["TotalAmount"] = TotalMatchvalue;

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

                    string s55 = "Select * from sharetable where MatchID = '" + MatchID + "' && ClientID = '" + ID + "'";
                    MySqlCommand cmd55 = new MySqlCommand(s55, cn);
                    MySqlDataAdapter adp55 = new MySqlDataAdapter(cmd55);
                    DataTable dt55 = new DataTable();
                    adp55.Fill(dt55);

                    string s5 = "Select SessionCommision,MatchCommision,Name  From SuperAgentMaster where SuperAgentID = '" + Session["SuperAgentID"] + "' ";
                    MySqlCommand cmd5 = new MySqlCommand(s5, cn);
                    MySqlDataAdapter adp5 = new MySqlDataAdapter(cmd5);
                    DataTable dt5 = new DataTable();
                    adp5.Fill(dt5);

                    Decimal SessionCommision1 = Convert.ToDecimal(dt55.Rows[0]["SAgentSessionComm"]);
                    Decimal SessionCommision2 = SessionCommision1 / 100;
                    Decimal SessionCommision = TotalAmount * SessionCommision2;

                    double SessionCommisionvalue = double.Parse(SessionCommision.ToString());
                    row["SessionCommision"] = SessionCommisionvalue;


                    row["MatchCommision"] = 0;
                    decimal totalcommision = SessionCommision;

                    double totalcommisionvalue = double.Parse(totalcommision.ToString());
                    row["TotalCommisionAmount"] = totalcommisionvalue;

                    Decimal Match = SessionTotalAmount;
                    Decimal Commision = SessionCommision;
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


                    decimal ClientShare1 = Convert.ToDecimal(dt55.Rows[i]["Clientshare"]);
                    decimal ClientMaster2 = ClientShare1 / 100;
                    Decimal TotalHalfAmount = TotalNetAmouunt * ClientMaster2;


                    double TotalNetAmouuntvalue = double.Parse(TotalNetAmouunt.ToString());
                    row["TotalNetAmount"] = TotalNetAmouuntvalue;
                    double TotalHalfAmountvalue = double.Parse(TotalHalfAmount.ToString());
                    row["TotalHalfAmount"] = TotalHalfAmountvalue;



                    decimal SuperAgentShare1 = Convert.ToDecimal(dt55.Rows[0]["SAgentshare"]);
                    decimal SuperAgentShare2 = SuperAgentShare1 / 100;
                    Decimal TotalSAShareAmount = TotalNetAmouunt * SuperAgentShare2;
                    Decimal TotalSAShareAmount1 = TotalNetAmouunt - TotalSAShareAmount;

                    double TotalSAShareAmountvalue = double.Parse(TotalSAShareAmount.ToString());

                    row["SAAgentShare"] = TotalSAShareAmountvalue;

                    Decimal MobileAppAmount = 0;

                    string s7 = "Select myMobAmount From SuperAgentMaster where  SuperAgentID = '" + Session["SuperAgentID"] + "'";
                    MySqlCommand cmd7 = new MySqlCommand(s7, cn);
                    MySqlDataAdapter adp7 = new MySqlDataAdapter(cmd7);
                    DataTable dt7 = new DataTable();
                    adp7.Fill(dt7);
                    MobileAppAmount = 0;
                    String MobileApp = dt7.Rows[0]["myMobAmount"].ToString();

                    MobileAppAmount = Convert.ToDecimal(MobileApp);

                    double MobileAppAmountvalue = double.Parse(MobileAppAmount.ToString());
                    row["MOBAppAmount"] = MobileAppAmountvalue;

                    decimal finalAmount = TotalSAShareAmount1 + MobileAppAmount;
                    double finalAmountvalue = double.Parse(finalAmount.ToString());
                    row["FinalAmount"] = finalAmountvalue;

                    ClientTable.Rows.Add(row.ItemArray);

                }
                return ClientTable;
            }

        }
    }
}