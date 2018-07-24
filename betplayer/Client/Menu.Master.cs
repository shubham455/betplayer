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

                    if(status  == "Inactive")
                    {
                        Response.Redirect("login.aspx");
                    }

                    int ClientID = Convert.ToInt32(dt.Rows[0]["ClientID"]);
                    int CurrentLimit = Convert.ToInt32(dt.Rows[0]["CurrentLimit"]);

                    string Runner = "Select Position1,Position2 From Runner where ClientID = '" + ClientID + "' order by DateTime DESC ";
                    MySqlCommand Runnercmd = new MySqlCommand(Runner, cn);
                    MySqlDataAdapter Runneradp = new MySqlDataAdapter(Runnercmd);
                    DataTable Runnerdt = new DataTable();
                    Runneradp.Fill(Runnerdt);

                    if (Runnerdt.Rows.Count > 0)
                    {
                        int Position1 = Convert.ToInt32(Runnerdt.Rows[0]["Position1"]);
                        int Position2 = Convert.ToInt32(Runnerdt.Rows[0]["Position2"]);

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
                                lblAmount.InnerText = FinalClientLimit.ToString();
                                updateClientlimit(ClientID, ClientLimit);
                            }
                            else if (Position2 > Position1)
                            {
                                TotalPosition = Position1;
                                int ClientLimit = (CurrentLimit + TotalPosition);
                                SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                                int FinalClientLimit = ClientLimit - SessionAmount;
                                lblAmount.InnerText = FinalClientLimit.ToString();
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
                                lblAmount.InnerText = FinalClientLimit.ToString();
                                updateClientlimit(ClientID, ClientLimit); updateClientlimit(ClientID, ClientLimit);
                            }
                            else if (Position2 < Position1)
                            {
                                TotalPosition = CurrentLimit;
                                int ClientLimit = (CurrentLimit);
                                SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                                int FinalClientLimit = ClientLimit - SessionAmount;
                                lblAmount.InnerText = FinalClientLimit.ToString();
                                updateClientlimit(ClientID, ClientLimit);
                            }
                        }

                        else if (Position1 < 0)
                        {
                            TotalPosition = Position1;
                            int ClientLimit = (CurrentLimit + TotalPosition);
                            SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                            int FinalClientLimit = ClientLimit - SessionAmount;
                            lblAmount.InnerText = FinalClientLimit.ToString();
                            updateClientlimit(ClientID, ClientLimit);
                        }
                        else if (Position2 < 0)
                        {
                            TotalPosition = Position2;
                            int ClientLimit = (CurrentLimit + TotalPosition);
                            SessionAmount = Convert.ToInt32(SessionCalculation(ClientID));
                            int FinalClientLimit = ClientLimit - SessionAmount;
                            lblAmount.InnerText = FinalClientLimit.ToString();
                            updateClientlimit(ClientID, ClientLimit);
                        }
                    }
                    else
                    {

                        int sessionamount = Convert.ToInt32(SessionCalculation(ClientID));
                        int ClientLimit1 = (CurrentLimit - sessionamount);
                        lblAmount.InnerText = (ClientLimit1).ToString();
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
    }
}