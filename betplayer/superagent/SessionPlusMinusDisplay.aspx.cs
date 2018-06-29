using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.superagent
{
    public partial class SessionPlusMinusDisplay : System.Web.UI.Page
    {
        private DataTable dt;
        private DataTable runtable;
        private DataTable runtable1;
        private DataTable runtable2;


        public DataTable runTable { get { return runtable; } }
        public DataTable runTable1 { get { return runtable1; } }
        public DataTable runTable2 { get { return runtable2; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            runtable1 = new DataTable();
            runtable1.Columns.Add(new DataColumn("AgentName"));
            DataRow row1 = runtable1.NewRow();

            runtable = new DataTable();
            runtable.Columns.Add(new DataColumn("AgentName"));
            runtable.Columns.Add(new DataColumn("Name"));
            runtable.Columns.Add(new DataColumn("MatchAmount"));
            runtable.Columns.Add(new DataColumn("SessionAmount"));
            runtable.Columns.Add(new DataColumn("TotalAmount"));
            runtable.Columns.Add(new DataColumn("MatchCommision"));
            runtable.Columns.Add(new DataColumn("SessionCommision"));
            runtable.Columns.Add(new DataColumn("TotalCommisionAmount"));
            runtable.Columns.Add(new DataColumn("TotalNetAmount"));
            runtable.Columns.Add(new DataColumn("TotalHalfAmount"));
            runtable.Columns.Add(new DataColumn("MOBAppAmount"));
            runtable.Columns.Add(new DataColumn("SAAgentShare"));
            runtable.Columns.Add(new DataColumn("FinalAmount"));

            runtable2 = new DataTable();
            runtable2.Columns.Add(new DataColumn("MatchAmount"));
            runtable2.Columns.Add(new DataColumn("SessionAmount"));
            runtable2.Columns.Add(new DataColumn("TotalPlusMinusAmount"));
            runtable2.Columns.Add(new DataColumn("Match1Amount"));
            runtable2.Columns.Add(new DataColumn("Session1Amount"));
            runtable2.Columns.Add(new DataColumn("TotalCommisionAmount"));
            runtable2.Columns.Add(new DataColumn("TotalNetAmount"));
            runtable2.Columns.Add(new DataColumn("TotalHalfAmount"));
            runtable2.Columns.Add(new DataColumn("TotalAppAmount"));
            runtable2.Columns.Add(new DataColumn("TotalFinalAmount"));
            DataRow row2 = runtable2.NewRow();

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
                    string AgentName = Agentdt.Rows[a]["Name"].ToString();

                    string s = "select clientmaster.clientID,clientmaster.Name from clientmaster inner join viewmatch on clientmaster.ClientID = viewmatch.ClientID  where MatchID = '" + MatchID + "' && CreatedBy = '" + Agentcode + "'  group by Name";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    adp.Fill(dt);

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string Name = dt.Rows[i]["Name"].ToString();
                        string ID = dt.Rows[i]["ClientID"].ToString();
                        string CodeName = ID + Name;
                        DataRow row = runtable.NewRow();

                        row["Name"] = CodeName;
                        row["AgentName"] = AgentName;
                        row1["AgentName"] = AgentName;


                        //string s1 = "Select Amount From MatchCalculation where ClientID = '" + ID + "' and MatchID = '" + MatchID + "'";
                        //MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                        //MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                        //DataTable dt1 = new DataTable();
                        //adp1.Fill(dt1);
                        //int MatchTotalAmount = 0;
                        //for (int j = 0; j < dt1.Rows.Count; j++)
                        //{

                        //    int Amount = Convert.ToInt32(dt1.Rows[j]["Amount"]);

                        //    MatchTotalAmount = MatchTotalAmount + Amount;

                        //}
                        //if (MatchTotalAmount > 0)
                        //{
                        //    MatchTotalAmount = MatchTotalAmount * -1;
                        //}
                        //else if (MatchTotalAmount < 0)
                        //{
                        //    MatchTotalAmount = MatchTotalAmount * -1;
                        //}
                        int MatchTotalAmount = 0;
                        row["MatchAmount"] = MatchTotalAmount;

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
                        row["SessionAmount"] = SessionTotalAmount;
                        if (SessionTotalAmount > 0)
                        {
                            SessionTotalAmount = SessionTotalAmount * -1;
                        }
                        else if (SessionTotalAmount < 0)
                        {
                            SessionTotalAmount = SessionTotalAmount * -1;
                        }

                        row["SessionAmount"] = SessionTotalAmount;

                        Decimal TotalMatch = MatchTotalAmount + SessionTotalAmount;

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
                        //lblAgentName.Text = dt5.Rows[0]["Name"].ToString();
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

                        decimal totalcommision = TotalMatchCommision1 + SessionCommision;


                        row["TotalCommisionAmount"] = totalcommision;

                        Decimal Match = MatchTotalAmount + SessionTotalAmount;
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


                        Decimal TotalHalfAmount = TotalNetAmouunt / 2;

                        row["TotalNetAmount"] = TotalNetAmouunt;

                        row["TotalHalfAmount"] = TotalHalfAmount;

                        string s7 = "Select MobileApp,Agent_Share From ClientMaster where  ClientID = '" + ID + "'";
                        MySqlCommand cmd7 = new MySqlCommand(s7, cn);
                        MySqlDataAdapter adp7 = new MySqlDataAdapter(cmd7);
                        DataTable dt7 = new DataTable();
                        adp7.Fill(dt7);
                        Decimal MobileAppAmount = 0;
                        String MobileApp = dt7.Rows[0]["MobileApp"].ToString();
                        Decimal ClientAgentShare = Convert.ToDecimal(dt7.Rows[0]["Agent_Share"]);
                        decimal ClientAgentShare1 = ClientAgentShare / 100;
                        if (MobileApp == "Yes")
                        {
                            MobileAppAmount = 100 - (100 * ClientAgentShare1);
                            row["MOBAppAmount"] = MobileAppAmount;
                        }
                        else if (MobileApp == "NO")
                        {
                            MobileAppAmount = 0;
                            row["MOBAppAmount"] = MobileAppAmount;

                        }
                        string s8 = "Select AgentShare From AgentMaster where  AgentID = '" + AgentID + "'";
                        MySqlCommand cmd8 = new MySqlCommand(s8, cn);
                        MySqlDataAdapter adp8 = new MySqlDataAdapter(cmd8);
                        DataTable dt8 = new DataTable();
                        adp8.Fill(dt8);

                        Decimal AgentShare = Convert.ToDecimal(dt8.Rows[0]["AgentShare"]);
                        decimal AgentShare1 = AgentShare / 100;

                        row["SAAgentShare"] = 100 * AgentShare1;
                        row["FinalAmount"] = TotalHalfAmount + MobileAppAmount;


                        runtable.Rows.Add(row.ItemArray);
                        runtable1.Rows.Add(row1.ItemArray);


                        for (int b = 0; b >= runtable1.Rows.Count;)
                        {
                            string AgentName1 = runtable1.Rows[b]["AgentName"].ToString();
                            if (AgentName != AgentName1)
                            {
                                row1["AgentName"] = AgentName;
                                runtable1.Rows.Add(row1.ItemArray);
                                b++;
                            }
                            break;

                        }
                    }
                    decimal TotalMatchAmount1 = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["MatchAmount"]);
                        TotalMatchAmount1 = TotalMatchAmount1 + MatchAmount;
                    }

                    row2["MatchAmount"] = TotalMatchAmount1;

                    decimal TotalSessionAmount1 = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["SessionAmount"]);
                        TotalSessionAmount1 = TotalSessionAmount1 + MatchAmount;
                    }

                    row2["SessionAmount"] = TotalSessionAmount1;

                    decimal TotalPlusMinusAmount = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal TotalAmount = Convert.ToDecimal(runtable.Rows[l]["TotalAmount"]);
                        TotalPlusMinusAmount = TotalPlusMinusAmount + TotalAmount;
                    }

                    row2["TotalPlusMinusAmount"] = TotalPlusMinusAmount;

                    decimal Match1Amount = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["MatchCommision"]);
                        Match1Amount = Match1Amount + MatchAmount;
                    }

                    row2["Match1Amount"] = Match1Amount;

                    decimal Session1Amount = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["SessionCommision"]);
                        Session1Amount = Session1Amount + MatchAmount;
                    }

                    row2["Session1Amount"] = Session1Amount;

                    decimal TotalCommisionAmount = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["TotalCommisionAmount"]);
                        TotalCommisionAmount = TotalCommisionAmount + MatchAmount;
                    }

                    row2["TotalCommisionAmount"] = TotalCommisionAmount;

                    decimal TotalNetAmount1 = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["TotalNetAmount"]);
                        TotalNetAmount1 = TotalNetAmount1 + MatchAmount;
                    }

                    row2["TotalNetAmount"] = TotalNetAmount1;

                    decimal TotalHalfAmount1 = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["TotalHalfAmount"]);
                        TotalHalfAmount1 = TotalHalfAmount1 + MatchAmount;
                    }

                    row2["TotalHalfAmount"] = TotalHalfAmount1;

                    decimal TotalAppAmount1 = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["MOBAppAmount"]);
                        TotalAppAmount1 = TotalAppAmount1 + MatchAmount;
                    }

                    row2["TotalAppAmount"] = TotalAppAmount1;

                    decimal TotalFinalAmount1 = 0;
                    for (int l = 0; l < runtable.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["FinalAmount"]);
                        TotalFinalAmount1 = TotalFinalAmount1 + MatchAmount;
                    }

                    row2["TotalFinalAmount"] = TotalFinalAmount1;

                }
                runtable2.Rows.Add(row2.ItemArray);

            }
        }
    }
}

