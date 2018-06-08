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
    public partial class MatchSessionPlusMinusDisplay : System.Web.UI.Page
    {

        private DataTable dt;
        private DataTable runtable;
        private DataTable runtable1;

        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable runTable { get { return runtable; } }
        public DataTable runTable1 { get { return runtable1; } }
        protected void Page_Load(object sender, EventArgs e)
        {

            runtable = new DataTable();
            runtable.Columns.Add(new DataColumn("Name"));
            runtable.Columns.Add(new DataColumn("MatchAmount"));
            runtable.Columns.Add(new DataColumn("SessionAmount"));
            runtable.Columns.Add(new DataColumn("TotalAmount"));
            runtable.Columns.Add(new DataColumn("SessionCommision"));
            runtable.Columns.Add(new DataColumn("MatchCommision"));
            runtable.Columns.Add(new DataColumn("TotalCommisionAmount"));
            runtable.Columns.Add(new DataColumn("TotalNetAmount"));
            runtable.Columns.Add(new DataColumn("TotalHalfAmount"));
            runtable.Columns.Add(new DataColumn("MOBAppAmount"));
            runtable.Columns.Add(new DataColumn("FinalAmount"));


            runtable1 = new DataTable();
            runtable1.Columns.Add(new DataColumn("MatchAmount"));
            runtable1.Columns.Add(new DataColumn("SessionAmount"));
            runtable1.Columns.Add(new DataColumn("TotalPlusMinusAmount"));
            runtable1.Columns.Add(new DataColumn("Match1Amount"));
            runtable1.Columns.Add(new DataColumn("Session1Amount"));
            runtable1.Columns.Add(new DataColumn("TotalCommisionAmount"));
            runtable1.Columns.Add(new DataColumn("TotalNetAmount"));
            runtable1.Columns.Add(new DataColumn("TotalHalfAmount"));
            runtable1.Columns.Add(new DataColumn("TotalAppAmount"));
            runtable1.Columns.Add(new DataColumn("TotalFinalAmount"));
            DataRow row1 = runtable1.NewRow();




            int MatchID = Convert.ToInt32(Request.QueryString["MatchID"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "select clientmaster.clientID,clientmaster.Name from clientmaster inner join viewmatch on clientmaster.ClientID = viewmatch.ClientID  where MatchID = '" + MatchID + "' group by Name";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string Name = dt.Rows[i]["Name"].ToString();
                    string ID = dt.Rows[i]["ClientID"].ToString();
                    string CodeName = ID + Name;
                    DataRow row = runTable.NewRow();
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

                    row["TotalAmount"] = MatchTotalAmount + SessionTotalAmount;




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
                    string s5 = "Select SessionCommision,MatchCommision,Name  From AgentMaster where AgentID = '" + Session["AgentID"] + "' ";
                    MySqlCommand cmd5 = new MySqlCommand(s5, cn);
                    MySqlDataAdapter adp5 = new MySqlDataAdapter(cmd5);
                    DataTable dt5 = new DataTable();
                    adp5.Fill(dt5);
                    lblAgentName.Text = dt5.Rows[0]["Name"].ToString();
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


                    row["TotalCommisionAmount"] = TotalMatchCommision1 + SessionCommision;

                    Decimal TotalNetAmouunt = MatchTotalAmount + SessionTotalAmount + SessionCommision + TotalMatchCommision1;

                    Decimal TotalHalfAmount = TotalNetAmouunt / 2;

                    row["TotalNetAmount"] = TotalNetAmouunt;

                    row["TotalHalfAmount"] = TotalHalfAmount;

                    string s7 = "Select MobileApp From ClientMaster where  ClientID = '" + ID + "'";
                    MySqlCommand cmd7 = new MySqlCommand(s7, cn);
                    MySqlDataAdapter adp7 = new MySqlDataAdapter(cmd7);
                    DataTable dt7 = new DataTable();
                    adp7.Fill(dt7);
                    Decimal MobileAppAmount = 0;
                    String MobileApp = dt7.Rows[0]["MobileApp"].ToString();
                    if (MobileApp == "Yes")
                    {
                        MobileAppAmount = 100;
                        row["MOBAppAmount"] = MobileAppAmount;
                    }
                    else if (MobileApp == "NO")
                    {
                        MobileAppAmount = 0;
                        row["MOBAppAmount"] = MobileAppAmount;

                    }

                    row["FinalAmount"] = TotalHalfAmount + MobileAppAmount;


                    runTable.Rows.Add(row.ItemArray);
                }





                decimal TotalMatchAmount1 = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["MatchAmount"]);
                    TotalMatchAmount1 = TotalMatchAmount1 + MatchAmount;
                }

                row1["MatchAmount"] = TotalMatchAmount1;

                decimal TotalSessionAmount1 = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["SessionAmount"]);
                    TotalSessionAmount1 = TotalSessionAmount1 + MatchAmount;
                }

                row1["SessionAmount"] = TotalSessionAmount1;

                decimal TotalPlusMinusAmount = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal TotalAmount = Convert.ToDecimal(runtable.Rows[l]["TotalAmount"]);
                    TotalPlusMinusAmount = TotalPlusMinusAmount + TotalAmount;
                }

                row1["TotalPlusMinusAmount"] = TotalPlusMinusAmount;

                decimal Match1Amount = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["MatchCommision"]);
                    Match1Amount = Match1Amount + MatchAmount;
                }

                row1["Match1Amount"] = Match1Amount;

                decimal Session1Amount = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["SessionCommision"]);
                    Session1Amount = Session1Amount + MatchAmount;
                }

                row1["Session1Amount"] = Session1Amount;

                decimal TotalCommisionAmount = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["TotalCommisionAmount"]);
                    TotalCommisionAmount = TotalCommisionAmount + MatchAmount;
                }

                row1["TotalCommisionAmount"] = TotalCommisionAmount;

                decimal TotalNetAmount1 = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["TotalNetAmount"]);
                    TotalNetAmount1 = TotalNetAmount1 + MatchAmount;
                }

                row1["TotalNetAmount"] = TotalNetAmount1;

                decimal TotalHalfAmount1 = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["TotalHalfAmount"]);
                    TotalHalfAmount1 = TotalHalfAmount1 + MatchAmount;
                }

                row1["TotalHalfAmount"] = TotalHalfAmount1;

                decimal TotalAppAmount1 = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["MOBAppAmount"]);
                    TotalAppAmount1 = TotalAppAmount1 + MatchAmount;
                }

                row1["TotalAppAmount"] = TotalAppAmount1;

                decimal TotalFinalAmount1 = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["FinalAmount"]);
                    TotalFinalAmount1 = TotalFinalAmount1 + MatchAmount;
                }

                row1["TotalFinalAmount"] = TotalFinalAmount1;

                string s9 = "Select * From  Agentledger where AgentID = '"+Session["AgentID"]+"' && MatchID  = '"+MatchID+"'" ;
                MySqlCommand cmd9 = new MySqlCommand(s9, cn);
                MySqlDataReader rdr = cmd9.ExecuteReader();
                if (rdr.Read())
                {

                }
                else
                {
                    rdr.Close();
                    string s8 = "Insert Into Agentledger (AgentID,MatchID,Amount) Values(@AgentID,@MatchID,@Amount)";
                    MySqlCommand cmd8 = new MySqlCommand(s8, cn);
                    cmd8.Parameters.AddWithValue("@AgentID", Session["AgentID"]);
                    cmd8.Parameters.AddWithValue("@MatchID", MatchID);
                    cmd8.Parameters.AddWithValue("@Amount", TotalFinalAmount1);
                    cmd8.ExecuteNonQuery();
                }
            }

            runtable1.Rows.Add(row1.ItemArray);


        }
    }
}