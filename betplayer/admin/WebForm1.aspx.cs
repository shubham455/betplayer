using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            int LedgerAmount = 0;


            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {

                cn.Open();
                int TotalAmount1 = 0;
                string SessionAmount = "Select * from SessionCalculation where MatchID = '1136620' order by ClientID DESC";
                MySqlCommand SessionAmountcmd = new MySqlCommand(SessionAmount, cn);
                MySqlDataAdapter SessionAmountadp = new MySqlDataAdapter(SessionAmountcmd);
                DataTable SessionAmountdt = new DataTable();
                SessionAmountadp.Fill(SessionAmountdt);

                if (SessionAmountdt.Rows.Count > 0)
                {
                    int TotalAmount = 0;


                    for (int i = 0; i < SessionAmountdt.Rows.Count; i++)
                    {
                        TotalAmount = Convert.ToInt32(SessionAmountdt.Rows[i]["TotalAmount"]);
                        int ClientID = Convert.ToInt16(SessionAmountdt.Rows[i]["ClientID"]);
                        TotalAmount1 = TotalAmount1 + TotalAmount;


                        for (int j = i + 1; j <= SessionAmountdt.Rows.Count;)
                        {
                            if (SessionAmountdt.Rows.Count > j)
                            {
                                int clientID = Convert.ToInt16(SessionAmountdt.Rows[j]["clientID"]);
                                if (ClientID != clientID)
                                {

                                    LedgerAmount = LedgerAmount + TotalAmount1;


                                    string Runner = "Select Position1,Position2 from Runner where ClientID = '" + ClientID + "' && MatchID = '1136620' order by DateTime DESC";
                                    MySqlCommand Runnercmd = new MySqlCommand(Runner, cn);
                                    MySqlDataAdapter Runneradp = new MySqlDataAdapter(Runnercmd);
                                    DataTable Runnerdt = new DataTable();
                                    Runneradp.Fill(Runnerdt);

                                    if (Runnerdt.Rows.Count > 0)
                                    {
                                        int Position1 = Convert.ToInt32(Runnerdt.Rows[0]["Position1"]);
                                        int Position2 = Convert.ToInt32(Runnerdt.Rows[0]["Position2"]);

                                        if ("team_1" == "team_1")
                                        {
                                            LedgerAmount = LedgerAmount + Position1;
                                        }
                                        else { }
                                    }
                                    LedgerAmount = LedgerAmount - 100;


                                    string InsertClientLedger = "Insert Into ClientLedger (clientID,MatchID,Amount) values (@ClientID,@MatchID,@Amount)";
                                    MySqlCommand Insertclientcmd = new MySqlCommand(InsertClientLedger, cn);
                                    Insertclientcmd.Parameters.AddWithValue("@ClientID", ClientID);
                                    Insertclientcmd.Parameters.AddWithValue("@MatchID", 1136620);
                                    Insertclientcmd.Parameters.AddWithValue("@Amount", LedgerAmount);
                                    Insertclientcmd.ExecuteNonQuery();

                                    TotalAmount1 = 0;
                                    LedgerAmount = 0;



                                }
                            }
                            else
                            {
                                LedgerAmount = LedgerAmount + TotalAmount1;


                                string Runner = "Select Position1,Position2 from Runner where ClientID = '" + ClientID + "' && MatchID = '1136620' order by DateTime DESC";
                                MySqlCommand Runnercmd = new MySqlCommand(Runner, cn);
                                MySqlDataAdapter Runneradp = new MySqlDataAdapter(Runnercmd);
                                DataTable Runnerdt = new DataTable();
                                Runneradp.Fill(Runnerdt);

                                if (Runnerdt.Rows.Count > 0)
                                {
                                    int Position1 = Convert.ToInt32(Runnerdt.Rows[0]["Position1"]);
                                    int Position2 = Convert.ToInt32(Runnerdt.Rows[0]["Position2"]);

                                    if ("team_1" == "team_1")
                                    {
                                        LedgerAmount = LedgerAmount + Position1;
                                    }
                                    else { }
                                }
                                LedgerAmount = LedgerAmount - 100;


                                string InsertClientLedger = "Insert Into ClientLedger (clientID,MatchID,Amount) values (@ClientID,@MatchID,@Amount)";
                                MySqlCommand Insertclientcmd = new MySqlCommand(InsertClientLedger, cn);
                                Insertclientcmd.Parameters.AddWithValue("@ClientID", ClientID);
                                Insertclientcmd.Parameters.AddWithValue("@MatchID", 1136620);
                                Insertclientcmd.Parameters.AddWithValue("@Amount", LedgerAmount);
                                Insertclientcmd.ExecuteNonQuery();

                                TotalAmount1 = 0;
                                LedgerAmount = 0;

                            }
                            break;
                        }

                    }
                }
            }
        }
    }
}

