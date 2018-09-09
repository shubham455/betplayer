using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.Client
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientID"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {

                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string SELECT = "Select ClientID,Name,status,Currentlimit From ClientMaster where ClientID = '" + Session["ClientID"] + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    lblName.InnerText = dt.Rows[0]["Name"].ToString();
                    string status = dt.Rows[0]["status"].ToString();

                    if (status == "Inactive")
                    {
                        Response.Redirect("login.aspx");
                    }

                    int ClientID = Convert.ToInt32(dt.Rows[0]["ClientID"]);
                    int CurrentLimit = Convert.ToInt32(dt.Rows[0]["CurrentLimit"]);

                    string Runner = "Select Position1,Position2,position3 From Runner where ClientID = '" + ClientID + "' order by DateTime DESC ";
                    MySqlCommand Runnercmd = new MySqlCommand(Runner, cn);
                    MySqlDataAdapter Runneradp = new MySqlDataAdapter(Runnercmd);
                    DataTable Runnerdt = new DataTable();
                    Runneradp.Fill(Runnerdt);

                    if (Runnerdt.Rows.Count > 0)
                    {
                        int Position1 = Convert.ToInt32(Runnerdt.Rows[0]["Position1"]);
                        int Position2 = Convert.ToInt32(Runnerdt.Rows[0]["Position2"]);
                        int Position3 = Convert.ToInt32(Runnerdt.Rows[0]["Position3"]);

                        int TotalPosition = 0;
                        int SessionAmount = 0;
                        if (Position1 < 0 && Position2 < 0)
                        {
                            if (Position1 > Position2)
                            {
                                TotalPosition = Position2;

                                int ClientLimit = (CurrentLimit + TotalPosition);
                                SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                                int FinalClientLimit = ClientLimit - SessionAmount;
                                int ClientLimit1 = declareSessionAmount(ClientID);
                                int FinalClientLimit1 = FinalClientLimit - ClientLimit1;
                                lblAmount.InnerText = FinalClientLimit1.ToString();
                                updateClientlimit(ClientID, ClientLimit);
                            }
                            else if (Position2 > Position1)
                            {
                                TotalPosition = Position1;
                                int ClientLimit = (CurrentLimit + TotalPosition);
                                SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                                int FinalClientLimit = ClientLimit - SessionAmount;
                                int ClientLimit1 = declareSessionAmount(ClientID);
                                int FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                                lblAmount.InnerText = FinalClientLimit1.ToString();
                                updateClientlimit(ClientID, ClientLimit);
                            }
                        }
                        else if (Position1 > 0 && Position2 > 0)
                        {
                            if (Position1 < Position2)
                            {
                                TotalPosition = CurrentLimit;
                                int ClientLimit = (CurrentLimit);
                                SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                                int FinalClientLimit = ClientLimit - SessionAmount;
                                int ClientLimit1 = declareSessionAmount(ClientID);
                                int FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                                lblAmount.InnerText = FinalClientLimit1.ToString();
                                updateClientlimit(ClientID, ClientLimit); updateClientlimit(ClientID, ClientLimit);
                            }
                            else if (Position2 < Position1)
                            {
                                TotalPosition = CurrentLimit;
                                int ClientLimit = (CurrentLimit);
                                SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                                int FinalClientLimit = ClientLimit - SessionAmount;
                                int ClientLimit1 = declareSessionAmount(ClientID);
                                int FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                                lblAmount.InnerText = FinalClientLimit1.ToString();
                                updateClientlimit(ClientID, ClientLimit);
                            }
                        }


                        else if (Position1 < 0)
                        {
                            TotalPosition = Position1;
                            int ClientLimit = (CurrentLimit + TotalPosition);
                            SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                            int FinalClientLimit = ClientLimit - SessionAmount;
                            int ClientLimit1 = declareSessionAmount(ClientID);
                            int FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                            lblAmount.InnerText = FinalClientLimit1.ToString();
                            updateClientlimit(ClientID, ClientLimit);
                        }
                        else if (Position2 < 0)
                        {
                            TotalPosition = Position2;
                            int ClientLimit = (CurrentLimit + TotalPosition);
                            SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                            int FinalClientLimit = ClientLimit - SessionAmount;
                            int ClientLimit1 = declareSessionAmount(ClientID);
                            int FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                            lblAmount.InnerText = FinalClientLimit1.ToString();
                            updateClientlimit(ClientID, ClientLimit);
                        }
                        else if (Position3 < 0)
                        {
                            TotalPosition = Position2;
                            int ClientLimit = (CurrentLimit + TotalPosition);
                            SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                            int FinalClientLimit = ClientLimit - SessionAmount;
                            int ClientLimit1 = declareSessionAmount(ClientID);
                            int FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                            lblAmount.InnerText = FinalClientLimit1.ToString();
                            updateClientlimit(ClientID, ClientLimit);
                        }
                        else if (Position2 == 0)
                        {
                            lblAmount.InnerText = CurrentLimit.ToString();
                        }
                    }
                    else
                    {

                        int sessionamount = Convert.ToInt32(SessionCalculation(ClientID));
                        int ClientLimit1 = (CurrentLimit - sessionamount);
                        int TotalAMount = declareSessionAmount(ClientID);
                        int ClientLimit2 = ClientLimit1 + TotalAMount;

                        lblAmount.InnerText = (ClientLimit2).ToString();
                        updateClientlimit(ClientID, ClientLimit1);
                    }
                    
                }
            }
        }

        public void updateClientlimit(int ClientID, int Amount)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string update = "Update ClientMaster Set Client_Limit ='" + Amount + "' where ClientID = '" + ClientID + "'";
                MySqlCommand cmd = new MySqlCommand(update, cn);
                cmd.ExecuteNonQuery();

            }
        }
        public decimal SessionCalculation(int ClientID)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string CheckSession = "Select * From Session where  ClientID = '" + ClientID + "' order by DateTime DESC";
                MySqlCommand Sessioncmd = new MySqlCommand(CheckSession, cn);
                MySqlDataAdapter Sessionadp = new MySqlDataAdapter(Sessioncmd);
                DataTable Sessiondt = new DataTable();
                Sessionadp.Fill(Sessiondt);
                decimal Amount1 = 0;
                if (Sessiondt.Rows.Count > 0)
                {
                    decimal lastAmount = Convert.ToDecimal(Sessiondt.Rows[0]["Position"]);
                    Amount1 = lastAmount;
                }
                else
                {
                    Amount1 = 0;
                }
                return Amount1;

            }
        }
        public int declareSessionAmount(int ClientID)
        {
            int TotalAmount1 = 0;
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string Amount = "Select TotalAmount from SessionCalculation where ClientID = '" + ClientID + "'";
                MySqlCommand Amountcmd = new MySqlCommand(Amount, cn);
                MySqlDataAdapter Amountadp = new MySqlDataAdapter(Amountcmd);
                DataTable Amountdt = new DataTable();
                Amountadp.Fill(Amountdt);
                if (Amountdt.Rows.Count > 0)
                {
                    int TotalAmount = 0;
                    
                    for (int i = 0; i < Amountdt.Rows.Count; i++)
                    {
                        TotalAmount = Convert.ToInt32(Amountdt.Rows[i]["TotalAmount"]);
                        TotalAmount1 = TotalAmount1 + TotalAmount;
                    }
                    TotalAmount = 0;


                }
            }
            return TotalAmount1;
        }
    }
}