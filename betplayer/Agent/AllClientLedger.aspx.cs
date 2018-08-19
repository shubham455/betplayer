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
    public partial class AllClientLedger : System.Web.UI.Page
    {
        private DataTable Receive;
        private DataTable Give;
        private DataTable runtable;
        private DataTable runtable1;

        public DataTable PaynmentReceiveTable { get { return Receive; } }
        public DataTable PaynmentGiveTable { get { return Give; } }


        protected void Page_Load(object sender, EventArgs e)
        {

            runtable = new DataTable();
            runtable.Columns.Add(new DataColumn("Balance"));

            runtable1 = new DataTable();
            runtable1.Columns.Add(new DataColumn("TotalBalanceAmount"));

            Receive = new DataTable();
            Receive.Columns.Add(new DataColumn("ClientName"));
            Receive.Columns.Add(new DataColumn("ContactNo"));
            Receive.Columns.Add(new DataColumn("OpenBalance"));
            Receive.Columns.Add(new DataColumn("CurrentBalance"));
            Receive.Columns.Add(new DataColumn("CloseBalance"));

            Give = new DataTable();
            Give.Columns.Add(new DataColumn("ClientName"));
            Give.Columns.Add(new DataColumn("ContactNo"));
            Give.Columns.Add(new DataColumn("OpenBalance"));
            Give.Columns.Add(new DataColumn("CurrentBalance"));
            Give.Columns.Add(new DataColumn("CloseBalance"));

            DataRow row = runtable.NewRow();
            DataRow row1 = runtable1.NewRow();
            DataRow Receiverow = Receive.NewRow();
            DataRow Giverow = Give.NewRow();


            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string SelectClient = "Select ClientID,Name,Contact_No From ClientMaster where CreatedBy = '" + Session["Agentcode"] + "'";
                MySqlCommand SelectClientcmd = new MySqlCommand(SelectClient, cn);
                MySqlDataAdapter SelectClientadp = new MySqlDataAdapter(SelectClientcmd);
                DataTable SelectClientdt = new DataTable();
                SelectClientadp.Fill(SelectClientdt);

                for (int i = 0; i < SelectClientdt.Rows.Count; i++)
                {
                    int ClientID = Convert.ToInt16(SelectClientdt.Rows[i]["ClientID"]);

                    string s = "Select * From ClientLedger where ClientID = '" + ClientID + "'";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    decimal LedgerAmount = 0;
                    for (int j = 0; j < dt.Rows.Count; j++)
                    {
                        decimal Dabit = Convert.ToDecimal(dt.Rows[j]["Dabit"]);
                        decimal Credit = Convert.ToDecimal(dt.Rows[j]["Credit"]);
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
                                Balance1 = Balance1 - Dabit;
                                Balance1 = Balance1 + Credit;
                                
                                LedgerAmount = LedgerAmount + Balance1;
                            }
                        }
                        else
                        {
                            LedgerAmount = Balance ;

                        }
                        


                        string CollectionAmount = "Select * From ClientCollectionmaster where ClientID = '" + ClientID + "'";
                        MySqlCommand CollectionAmountcmd = new MySqlCommand(CollectionAmount, cn);
                        MySqlDataAdapter CollectionAmountadp = new MySqlDataAdapter(CollectionAmountcmd);
                        DataTable CollectionAmountdt = new DataTable();
                        CollectionAmountadp.Fill(CollectionAmountdt);
                        decimal CollectionBalance = 0, CollectionBalance1 = 0;
                        for (int l = 0; l < CollectionAmountdt.Rows.Count; l++)
                        {
                            //decimal CollectionDabit = Convert.ToDecimal(CollectionAmountdt.Rows[l]["Dabit"]);
                            decimal CollectionCredit = Convert.ToDecimal(CollectionAmountdt.Rows[l]["Amount"]);
                            string PaynmentDescription = (CollectionAmountdt.Rows[l]["PaynmentType"]).ToString();

                            if (PaynmentDescription == "Payment Received")
                            {
                                CollectionBalance = CollectionCredit * -1;
                            }
                            else if (PaynmentDescription == "Payment Paid")
                            {
                                CollectionBalance = CollectionCredit;
                            }
                            
                            CollectionBalance1 = CollectionBalance1 + CollectionBalance;
                        }
                        

                        Decimal FinalAmount = CollectionBalance1 + LedgerAmount;
                        row["Balance"] = FinalAmount;
                        runtable.Rows.Add(row.ItemArray);

                    }
                    decimal TotalbalanceAmount1 = 0;
                    for (int l = 1; l <= runtable.Rows.Count; l++)
                    {

                        if (l == runtable.Rows.Count)
                        {
                            l = l - 1;
                            decimal TotalAmount = Convert.ToDecimal(runtable.Rows[l]["Balance"]);
                            TotalbalanceAmount1 = TotalAmount;
                            l = l + 1;
                        }
                        else
                        {

                        }
                    }


                    row1["TotalBalanceAmount"] = TotalbalanceAmount1;

                    if (TotalbalanceAmount1 < 0)
                    {
                        TotalbalanceAmount1 = TotalbalanceAmount1 * -1;
                        string Name = (SelectClientdt.Rows[i]["Name"]).ToString();
                        string ContactNo = (SelectClientdt.Rows[i]["Contact_No"]).ToString();

                        Giverow["ClientName"] = ClientID + "" + Name;
                        Giverow["ContactNo"] = ContactNo;
                        Giverow["OpenBalance"] = TotalbalanceAmount1;
                        Giverow["CurrentBalance"] = 0;
                        Giverow["CloseBalance"] = TotalbalanceAmount1;
                        Give.Rows.Add(Giverow.ItemArray);

                    }
                    else if (TotalbalanceAmount1 > 0)
                    {
                        string Name = (SelectClientdt.Rows[i]["Name"]).ToString();
                        string ContactNo = (SelectClientdt.Rows[i]["Contact_No"]).ToString();

                        Receiverow["ClientName"] = ClientID + "" + Name;
                        Receiverow["ContactNo"] = ContactNo;
                        Receiverow["OpenBalance"] = TotalbalanceAmount1;
                        Receiverow["CurrentBalance"] = 0;
                        Receiverow["CloseBalance"] = TotalbalanceAmount1;

                        Receive.Rows.Add(Receiverow.ItemArray);
                    }
                    runtable.Clear();
                }
            }
        }
    }
}