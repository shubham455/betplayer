﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Subadmin
{
    public partial class AgentLedger : System.Web.UI.Page
    {
        private DataTable dt1;
        private DataTable runtable;
        private DataTable runtable1;
        public DataTable LedgerTableOrdered;
        public DataTable runTable { get { return runtable; } }
        public DataTable runTable1 { get { return runtable1; } }
        public Boolean emptyLedgerTable = false;

        protected void Page_Load(object sender, EventArgs e)
        {


            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();


                    string s = "Select * From SuperstockistMaster where CreatedBy = '" + Session["Admincode"] + "'";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    dropdownsuperstockist.DataSource = dt;
                    dropdownsuperstockist.DataTextField = "Name";
                    dropdownsuperstockist.DataValueField = "SuperstockistID";
                    dropdownsuperstockist.DataBind();





                    string s1 = "Select * From Superstockistledger where SuperstockistID = '" + dropdownsuperstockist.SelectedValue + "'";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    runtable1 = new DataTable();
                    runtable = new DataTable();
                    LedgerTableOrdered = new DataTable();
                    adp1.Fill(runtable1);
                    adp1.Fill(runtable);
                    adp1.Fill(LedgerTableOrdered);
                }
            }
        }


        protected void dropdownsuperstockist_SelectedIndexChanged(object sender, EventArgs e)
        {


            runtable = new DataTable();
            DataColumn colDateTime = new DataColumn("Date");
            colDateTime.DataType = System.Type.GetType("System.DateTime");
            runtable.Columns.Add(colDateTime);
            runtable.Columns.Add(new DataColumn("CollectionID"));
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
                string s = "select matches.TeamA,matches.teamB,matches.DateTime,Superstockistledger.Dabit,Superstockistledger.Credit,Superstockistledger.SuperstockistledgerID from Superstockistledger inner join matches on Superstockistledger.MatchID = matches.apiID where SuperstockistID = '" + dropdownsuperstockist.SelectedValue + "' order by Matches.DateTime ASC";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt1 = new DataTable();
                adp.Fill(dt1);


                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    string DateFromDB = dt1.Rows[i]["DateTime"].ToString();
                    DateTime oDate = DateTime.Parse(DateFromDB);
                    string datetime = oDate.Date.ToString();

                    string ID = dt1.Rows[i]["SuperstockistledgerID"].ToString();
                    string TeamA = dt1.Rows[i]["TeamA"].ToString();
                    string TeamB = dt1.Rows[i]["TeamB"].ToString();
                    decimal Dabit = Convert.ToDecimal(dt1.Rows[i]["Dabit"]);
                    decimal Credit = Convert.ToDecimal(dt1.Rows[i]["Credit"]);

                    row["Date"] = oDate;     //row["Date"] = datetime;
                    row["CollectionID"] = ID;     //row["Date"] = datetime;
                    row["PaynmentDescription"] = TeamA + "VS" + TeamB;
                    row["Dabit"] = Dabit * -1;
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
                        for (int k = 0; k < runtable.Rows.Count; k++)
                        {
                            Balance1 = Convert.ToDecimal(runtable.Rows[k]["Balance"]);
                            Balance1 = Balance1 + Balance;

                            row["Balance"] = Balance1;
                        }
                    }
                    else
                    {
                        row["Balance"] = Balance;
                    }

                    runTable.Rows.Add(row.ItemArray);
                }

                string s1 = "Select * From SuperstockistCollectionMaster where SuperstockistID = '" + dropdownsuperstockist.SelectedValue + "'";
                MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                adp1.Fill(dt);

                for (int j = 0; j < dt.Rows.Count; j++)
                {

                    string CollectionDate = dt.Rows[j]["Date"].ToString();
                    DateTime date = DateTime.Parse(CollectionDate);
                    string Date1 = date.Date.ToString();


                    string ID = dt.Rows[j]["SuperStockistCollectionMasterID"].ToString();
                    string CollectionName = dt.Rows[j]["CollectionType"].ToString();
                    int Amount = Convert.ToInt32(dt.Rows[j]["Amount"]);
                    string PaynmentDescription = dt.Rows[j]["PaynmentType"].ToString();
                    string Remark = dt.Rows[j]["Remark"].ToString();

                    row["Date"] = date;        //row["Date"] = Date1;
                    row["CollectionID"] = ID;
                    row["CollectionName"] = CollectionName;
                    row["Remark"] = Remark;
                    if (PaynmentDescription == "Payment Received")
                    {
                        row["Dabit"] = Amount * -1;
                        row["Credit"] = 0;
                        row["Balance"] = Amount * -1;
                    }
                    else if (PaynmentDescription == "Payment Paid")
                    {
                        row["Credit"] = Amount;
                        row["Dabit"] = 0;
                        row["Balance"] = Amount;
                    }



                    row["PaynmentDescription"] = PaynmentDescription;

                    runTable.Rows.Add(row.ItemArray);

                }

                if (runtable.Rows.Count > 0)
                {
                    IEnumerable<DataRow> orderedRows = runTable.AsEnumerable()
                    .OrderBy(r => r.Field<DateTime>("Date"));

                    LedgerTableOrdered = orderedRows.CopyToDataTable();

                    for (int l = 0; l < LedgerTableOrdered.Rows.Count; l++)
                    {
                        DateTime date = DateTime.Parse(LedgerTableOrdered.Rows[0]["Date"].ToString());
                        LedgerTableOrdered.Rows[0]["Date"] = date.Date.ToString();
                        if (l > 0)
                        {
                            LedgerTableOrdered.Rows[l]["Balance"] = Convert.ToDecimal(LedgerTableOrdered.Rows[l - 1]["Balance"]) + Convert.ToDecimal(LedgerTableOrdered.Rows[l]["Dabit"]) + Convert.ToDecimal(LedgerTableOrdered.Rows[l]["Credit"]);


                        }

                    }


                    decimal TotalDabitAmount1 = 0;
                    for (int l = 0; l < LedgerTableOrdered.Rows.Count; l++)
                    {
                        decimal DabitAmount = Convert.ToDecimal(LedgerTableOrdered.Rows[l]["Dabit"]);
                        TotalDabitAmount1 = TotalDabitAmount1 + DabitAmount;
                    }

                    row1["TotalDabitAmount"] = TotalDabitAmount1;

                    decimal TotalCreditAmount1 = 0;
                    for (int l = 0; l < LedgerTableOrdered.Rows.Count; l++)
                    {
                        decimal MatchAmount = Convert.ToDecimal(LedgerTableOrdered.Rows[l]["Credit"]);
                        TotalCreditAmount1 = TotalCreditAmount1 + MatchAmount;
                    }

                    row1["TotalCreditAmount"] = TotalCreditAmount1;


                    decimal TotalbalanceAmount1 = 0;
                    for (int l = 0; l < LedgerTableOrdered.Rows.Count; l++)
                    {
                        decimal TotalAmount = Convert.ToDecimal(LedgerTableOrdered.Rows[l]["Balance"]);
                        TotalbalanceAmount1 = TotalbalanceAmount1 + TotalAmount;
                    }

                    row1["TotalBalanceAmount"] = TotalbalanceAmount1;


                    runTable1.Rows.Add(row1.ItemArray);
                }
                else
                {
                    emptyLedgerTable = true;

                }
            }
        }


        protected void btnSave_ServerClick(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Insert Into SuperstockistCollectionMaster (SuperstockistID,CollectionType,Date,Amount,PaynmentType,Remark,AdminID,Type) values(@SuperstockistID,@CollectionType,@Date,@Amount,@PaynmentType,@Remark,@AdminID,@Type)";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@SuperstockistID", dropdownsuperstockist.Text);
                cmd.Parameters.AddWithValue("@CollectionType", dropdowncollection.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Date", BillDate.Text);
                cmd.Parameters.AddWithValue("@Amount", Amount.Text);
                cmd.Parameters.AddWithValue("@PaynmentType", PaymentType1.SelectedValue);
                cmd.Parameters.AddWithValue("@Remark", Remark.Text);
                cmd.Parameters.AddWithValue("@AdminID", Session["SubAdminID"]);
                cmd.Parameters.AddWithValue("@Type", "SubAdmin");
                cmd.ExecuteNonQuery();

                string superstockist = "select CurrentLimit From Superstockistmaster Where SuperStockistID = '" + dropdownsuperstockist.Text + "'";
                MySqlCommand superstockistcmd = new MySqlCommand(superstockist, cn);
                MySqlDataAdapter superstockistadp = new MySqlDataAdapter(superstockistcmd);
                DataTable superstockistdt = new DataTable();
                superstockistadp.Fill(superstockistdt);

                decimal superstockistcurrentlimit = Convert.ToDecimal(superstockistdt.Rows[0]["CurrentLimit"]);
                decimal FinalAmount = 0;
                if (PaymentType1.SelectedValue == "Payment Paid")
                {
                    FinalAmount = superstockistcurrentlimit - Convert.ToDecimal(Amount.Text);
                }
                else if (PaymentType1.SelectedValue == "Payment Received")
                {
                    FinalAmount = superstockistcurrentlimit + Convert.ToDecimal(Amount.Text);
                }

                string update = "Update Superstockistmaster Set CurrentLimit = '" + FinalAmount + "' where SuperStockistID = '" + dropdownsuperstockist.Text + "'";
                MySqlCommand updatecmd = new MySqlCommand(update, cn);
                updatecmd.ExecuteNonQuery();


                Amount.Text = "";

                dropdownsuperstockist_SelectedIndexChanged(sender, e);
                Response.Redirect("SuperstockistLedger.aspx", true);

            }
        }


    }
}