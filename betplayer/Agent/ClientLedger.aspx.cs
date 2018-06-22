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
    public partial class Client_Ledger : System.Web.UI.Page
    {
        private DataTable dt1;
        private DataTable runtable;
        private DataTable runtable1;
        public DataTable runTable { get { return runtable; } }
        public DataTable runTable1 { get { return runtable1; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();


                    string s = "Select * From ClientMaster where CreatedBy = '" + Session["AgentID"] + "' And  Mode = 'Agent'";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    dropdownClient.DataSource = dt;

                    dropdownClient.DataTextField = "Name";
                    dropdownClient.DataValueField = "ClientID";
                    dropdownClient.DataBind();


                    string s1 = "Select * From Clientledger where ClientID = '" + dropdownClient.SelectedValue + "'";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    runtable = new DataTable();
                    runtable1 = new DataTable();
                    adp1.Fill(runtable);
                    adp1.Fill(runtable1);
                }
            }
        }

        protected void dropdownClient_SelectedIndexChanged(object sender, EventArgs e)
        {

            runtable = new DataTable();
            runtable.Columns.Add(new DataColumn("Date"));
            runtable.Columns.Add(new DataColumn("CollectionName"));
            runtable.Columns.Add(new DataColumn("Dabit"));
            runtable.Columns.Add(new DataColumn("Credit"));
            runtable.Columns.Add(new DataColumn("Balance"));
            runtable.Columns.Add(new DataColumn("PaynmentDescription"));
            runtable.Columns.Add(new DataColumn("Remark"));

            runtable1 = new DataTable();
            runtable1.Columns.Add(new DataColumn("TotalDabitAmount"));
            runtable1.Columns.Add(new DataColumn("TotalCreditAmount"));
            runtable1.Columns.Add(new DataColumn("TotalBalanceAmount"));
           
            DataRow row1 = runtable1.NewRow();



            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "select matches.TeamA,matches.teamB,matches.DateTime,clientledger.Dabit,clientledger.Credit from ClientLedger inner join matches on clientledger.MatchID = matches.apiID where ClientID = '" + dropdownClient.SelectedValue + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt1 = new DataTable();
                adp.Fill(dt1);

                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    string TeamA = dt1.Rows[i]["TeamA"].ToString();
                    string TeamB = dt1.Rows[i]["TeamB"].ToString();

                    decimal Dabit = Convert.ToDecimal(dt1.Rows[i]["Dabit"]);
                    decimal Credit = Convert.ToDecimal(dt1.Rows[i]["Credit"]);
                    DataRow row = runTable.NewRow();

                    string timeFromDB = dt1.Rows[i]["DateTime"].ToString();
                    DateTime oDate = DateTime.Parse(timeFromDB);
                    string datetime = oDate.Date.ToString().Substring(0, 10);
                    row["Date"] = datetime;
                    row["PaynmentDescription"] = TeamA + "VS" + TeamB;
                    row["Dabit"] = Dabit;
                    row["Credit"] = Credit;

                    decimal Balance = 0, Balance1 = 0;
                    if (Dabit != 0)
                    {
                        Balance = Dabit * -1;
                    }
                    else if (Credit != 0)
                    {
                        Balance = Credit;
                    }
                    if (runtable.Rows.Count > 0)
                    {

                        for (int j = 0; j < runtable.Rows.Count; j++)
                        {

                            Balance1 = Convert.ToDecimal(runtable.Rows[j]["Balance"]);
                            Balance1 = Balance1 - Dabit;
                            Balance1 = Balance1 + Credit;
                            row["Balance"] = Balance1;
                        }
                    }
                    else
                    {
                        row["Balance"] = Balance;
                    }




                    runTable.Rows.Add(row.ItemArray);



                }
                decimal TotalDabitAmount1 = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal DabitAmount = Convert.ToDecimal(runtable.Rows[l]["Dabit"]);
                    TotalDabitAmount1 = TotalDabitAmount1 + DabitAmount;
                }

                row1["TotalDabitAmount"] = TotalDabitAmount1;

                decimal TotalCreditAmount1 = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal MatchAmount = Convert.ToDecimal(runtable.Rows[l]["Credit"]);
                    TotalCreditAmount1 = TotalCreditAmount1 + MatchAmount;
                }

                row1["TotalCreditAmount"] = TotalCreditAmount1;

                decimal TotalbalanceAmount1 = 0;
                for (int l = 0; l < runtable.Rows.Count; l++)
                {
                    decimal TotalAmount = Convert.ToDecimal(runtable.Rows[l]["Balance"]);
                    TotalbalanceAmount1 = TotalbalanceAmount1 + TotalAmount;
                }

                row1["TotalBalanceAmount"] = TotalbalanceAmount1;

            }
            runTable1.Rows.Add(row1.ItemArray);
        }

        protected void btnSave_ServerClick(object sender, EventArgs e)
        {

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Insert Into ClientCollectionMaster (Name,CollectionType,Date,Amount,PaynmentType,Remark,AgentID) values(@Name,@CollectionType,@Date,@Amount,@PaynmentType,@Remark,@AgentID)";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@Name", dropdownClient.Text);
                cmd.Parameters.AddWithValue("@CollectionType", Collection.Value);
                cmd.Parameters.AddWithValue("@Date", BillDate.Text);
                cmd.Parameters.AddWithValue("@Amount", Amount.Text);
                cmd.Parameters.AddWithValue("@PaynmentType", PaymentType.Value);
                cmd.Parameters.AddWithValue("@Remark", Remark.Text);
                cmd.Parameters.AddWithValue("@AgentID", Session["AgentID"]);
                cmd.ExecuteNonQuery();


            }
        }
    }
}