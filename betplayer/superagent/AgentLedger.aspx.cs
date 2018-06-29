using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Super_Agent
{
    public partial class Agent_Ledger : System.Web.UI.Page
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


                    string s = "Select * From AgentMaster where CreatedBy = '" + Session["SuperAgentcode"] + "' And  Mode = 'SuperAgent'";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    dropdownAgent.DataSource = dt;
                    dropdownAgent.DataTextField = "Name";
                    dropdownAgent.DataValueField = "AgentID";
                    dropdownAgent.DataBind();


                    string s1 = "Select * From Agentledger where AgentID = '" + dropdownAgent.SelectedValue + "'";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    runtable1 = new DataTable();
                    runtable = new DataTable();
                    adp1.Fill(runtable1);
                    adp1.Fill(runtable);
                }
            }
        }


        public void dropdownAgent_SelectedIndexChanged(object sender, EventArgs e)
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

            DataRow row = runTable.NewRow();
            DataRow row1 = runtable1.NewRow();



            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "select matches.TeamA,matches.teamB,matches.DateTime,agentledger.Dabit,agentledger.Credit from agentLedger inner join matches on agentledger.MatchID = matches.apiID where AgentID = '" + dropdownAgent.SelectedValue + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt1 = new DataTable();
                adp.Fill(dt1);
                lblAmount.Text = "0";
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    string s1 = "Select * From AgentCollectionMaster where AgentID = '" + dropdownAgent.SelectedValue + "'";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    adp1.Fill(dt);

                    //string CollectionDate = dt.Rows[i]["Date"].ToString();
                    //DateTime date = DateTime.Parse(CollectionDate);
                    //string Date1 = date.Date.ToString().Substring(0, 10);

                    string DateFromDB = dt1.Rows[i]["DateTime"].ToString();
                    DateTime oDate = DateTime.Parse(DateFromDB);
                    string datetime = oDate.Date.ToString().Substring(0, 10);


                    //if (Date1 == datetime)
                    //{
                    //    string CollectionName = dt.Rows[0]["CollectionType"].ToString();
                    //    string Amount = dt.Rows[0]["Amount"].ToString();
                    //    string PaynmentDescription = dt.Rows[0]["PaynmentType"].ToString();

                    //    row["CollectionName"] = CollectionName;
                    //    row["Dabit"] = Amount;
                    //    row["PaynmentDescription"] = PaynmentDescription;
                    //}
                    //else
                    //{
                    string TeamA = dt1.Rows[i]["TeamA"].ToString();
                    string TeamB = dt1.Rows[i]["TeamB"].ToString();
                    decimal Dabit = Convert.ToDecimal(dt1.Rows[i]["Dabit"]);
                    decimal Credit = Convert.ToDecimal(dt1.Rows[i]["Credit"]);

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
                    lblAmount.Text = "0";
                    if (runtable.Rows.Count > 0)
                    {
                        for (int k = 0; k < runtable.Rows.Count; k++)
                        {
                            Balance1 = Convert.ToDecimal(runtable.Rows[k]["Balance"]);
                            Balance1 = Balance1 - Dabit;
                            Balance1 = Balance1 + Credit;
                            row["Balance"] = Balance1;
                            lblAmount.Text = Balance1.ToString();
                        }
                    }
                    else
                    {
                        row["Balance"] = Balance;
                        lblAmount.Text = Balance.ToString();
                    }

                    runTable.Rows.Add(row.ItemArray);
                }
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


            runTable1.Rows.Add(row1.ItemArray);
        }

        protected void btnSave_ServerClick(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Insert Into AgentCollectionMaster (AgentID,CollectionType,Date,Amount,PaynmentType,Remark,SuperAgentID) values(@ClientID,@CollectionType,@Date,@Amount,@PaynmentType,@Remark,@AgentID)";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@ClientID", dropdownAgent.Text);
                cmd.Parameters.AddWithValue("@CollectionType", Collection.Value);
                cmd.Parameters.AddWithValue("@Date", BillDate.Text);
                cmd.Parameters.AddWithValue("@Amount", Amount.Text);
                cmd.Parameters.AddWithValue("@PaynmentType", PaymentType.Value);
                cmd.Parameters.AddWithValue("@Remark", Remark.Text);
                cmd.Parameters.AddWithValue("@AgentID", Session["SuperAgentID"]);
                cmd.ExecuteNonQuery();

                Amount.Text = "";
                Remark.Text = "";
                BillDate.Text = DateTime.Now.ToString("dd/MM/yyyy");

                dropdownAgent_SelectedIndexChanged(sender, e);



            }
        }
    }
}