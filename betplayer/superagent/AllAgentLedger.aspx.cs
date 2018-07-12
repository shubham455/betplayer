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
    public partial class AllAgentLedger : System.Web.UI.Page
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
            Receive.Columns.Add(new DataColumn("AgentName"));
            Receive.Columns.Add(new DataColumn("ContactNo"));
            Receive.Columns.Add(new DataColumn("OpenBalance"));
            Receive.Columns.Add(new DataColumn("CurrentBalance"));
            Receive.Columns.Add(new DataColumn("CloseBalance"));

            Give = new DataTable();
            Give.Columns.Add(new DataColumn("AgentName"));
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

                string SelectAgent = "Select AgentID,Name,ContactNo From AgentMaster where CreatedBy = '" + Session["SuperAgentcode"] + "'";
                MySqlCommand SelectAgentcmd = new MySqlCommand(SelectAgent, cn);
                MySqlDataAdapter SelectAgentadp = new MySqlDataAdapter(SelectAgentcmd);
                DataTable SelectAgentdt = new DataTable();
                SelectAgentadp.Fill(SelectAgentdt);

                
                for (int i = 0; i < SelectAgentdt.Rows.Count; i++)
                {
                    int AgentID = Convert.ToInt16(SelectAgentdt.Rows[i]["AgentID"]);

                    string s = "Select * From AgentLedger where AgentID = '" + AgentID + "'";
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
                            LedgerAmount = Balance * -1;

                        }



                        string CollectionAmount = "Select * From AgentCollectionmaster where AgentID = '" + AgentID + "'";
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
                        string Name = (SelectAgentdt.Rows[i]["Name"]).ToString();
                        string ContactNo = (SelectAgentdt.Rows[i]["ContactNo"]).ToString();

                        Giverow["AgentName"] = AgentID + "" + Name;
                        Giverow["ContactNo"] = ContactNo;
                        Giverow["OpenBalance"] = TotalbalanceAmount1;
                        Giverow["CurrentBalance"] = 0;
                        Giverow["CloseBalance"] = TotalbalanceAmount1;
                        Give.Rows.Add(Giverow.ItemArray);

                    }
                    else if (TotalbalanceAmount1 > 0)
                    {
                        string Name = (SelectAgentdt.Rows[i]["Name"]).ToString();
                        string ContactNo = (SelectAgentdt.Rows[i]["ContactNo"]).ToString();

                        Receiverow["AgentName"] = AgentID + "" + Name;
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