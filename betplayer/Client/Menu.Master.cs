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
                    string SELECT = "Select ClientID,Name,status,Currentlimit,Client_Limit From ClientMaster where ClientID = '" + Session["ClientID"] + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    string ClientID1 = dt.Rows[0]["ClientID"].ToString();
                    string ClientName = dt.Rows[0]["Name"].ToString();

                    lblName.InnerText = ClientID1 + ClientName;
                    string status = dt.Rows[0]["status"].ToString();

                    if (status == "Inactive")
                    {
                        Response.Redirect("login.aspx");
                    }

                    Decimal ClientID = Convert.ToDecimal(dt.Rows[0]["ClientID"]);
                    Decimal CurrentLimit = Convert.ToDecimal(dt.Rows[0]["CurrentLimit"]);
                    Decimal CheckClientLimit = Convert.ToDecimal(dt.Rows[0]["Client_Limit"]);

                    if (CheckClientLimit < 0)
                    {
                        Response.Redirect("login.aspx");
                    }

                    string Runner = "Select Position1,Position2,position3 From Runner where ClientID = '" + ClientID + "' order by DateTime DESC ";
                    MySqlCommand Runnercmd = new MySqlCommand(Runner, cn);
                    MySqlDataAdapter Runneradp = new MySqlDataAdapter(Runnercmd);
                    DataTable Runnerdt = new DataTable();
                    Runneradp.Fill(Runnerdt);

                    if (Runnerdt.Rows.Count > 0)
                    {
                        Decimal Position1 = Convert.ToDecimal(Runnerdt.Rows[0]["Position1"]);
                        Decimal Position2 = Convert.ToDecimal(Runnerdt.Rows[0]["Position2"]);
                        Decimal Position3 = Convert.ToDecimal(Runnerdt.Rows[0]["Position3"]);

                        Decimal TotalPosition = 0;
                        Decimal SessionAmount = 0;
                        if (Position1 < 0 && Position2 < 0)
                        {
                            if (Position1 > Position2)
                            {
                                TotalPosition = Position2;

                                Decimal ClientLimit = (CurrentLimit + TotalPosition);
                                SessionAmount = Convert.ToDecimal(SessionCalculation(ClientID));
                                Decimal FinalClientLimit = ClientLimit - SessionAmount;
                                Decimal ClientLimit1 = declareSessionAmount(ClientID);
                                Decimal FinalClientLimit1 = 0;
                                if (ClientLimit1 < 0)
                                {
                                    FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                                }
                                else
                                {
                                    FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                                }
                                double dValue = double.Parse(FinalClientLimit1.ToString());
                                lblAmount.InnerText = dValue.ToString();
                                updateClientlimit(ClientID, FinalClientLimit1);
                            }
                            else if (Position2 > Position1)
                            {
                                TotalPosition = Position1;
                                Decimal ClientLimit = (CurrentLimit + TotalPosition);
                                SessionAmount = Convert.ToDecimal(SessionCalculation(ClientID));
                                Decimal FinalClientLimit = ClientLimit - SessionAmount;
                                Decimal ClientLimit1 = declareSessionAmount(ClientID);
                                Decimal FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                                double dValue = double.Parse(FinalClientLimit1.ToString());
                                lblAmount.InnerText = dValue.ToString();
                                updateClientlimit(ClientID, FinalClientLimit1);
                            }
                        }
                        else if (Position1 > 0 && Position2 > 0)
                        {
                            if (Position1 < Position2)
                            {
                                TotalPosition = CurrentLimit;
                                Decimal ClientLimit = (CurrentLimit);
                                SessionAmount = Convert.ToDecimal(SessionCalculation(ClientID));
                                Decimal FinalClientLimit = ClientLimit - SessionAmount;
                                Decimal ClientLimit1 = declareSessionAmount(ClientID);
                                Decimal FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                                double dValue = double.Parse(FinalClientLimit1.ToString());
                                lblAmount.InnerText = dValue.ToString();
                                updateClientlimit(ClientID, FinalClientLimit1); updateClientlimit(ClientID, ClientLimit);
                            }
                            else if (Position2 < Position1)
                            {
                                TotalPosition = CurrentLimit;
                                Decimal ClientLimit = (CurrentLimit);
                                SessionAmount = Convert.ToDecimal(SessionCalculation(ClientID));
                                Decimal FinalClientLimit = ClientLimit - SessionAmount;
                                Decimal ClientLimit1 = declareSessionAmount(ClientID);
                                Decimal FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                                double dValue = double.Parse(FinalClientLimit1.ToString());
                                lblAmount.InnerText = dValue.ToString();
                                updateClientlimit(ClientID, FinalClientLimit1);
                            }
                        }


                        else if (Position1 < 0)
                        {
                            TotalPosition = Position1;
                            Decimal ClientLimit = (CurrentLimit + TotalPosition);
                            SessionAmount = Convert.ToDecimal(SessionCalculation(ClientID));
                            Decimal FinalClientLimit = ClientLimit - SessionAmount;
                            Decimal ClientLimit1 = declareSessionAmount(ClientID);
                            Decimal FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                            double dValue = double.Parse(FinalClientLimit1.ToString());
                            lblAmount.InnerText = dValue.ToString();
                            updateClientlimit(ClientID, FinalClientLimit1);
                        }
                        else if (Position2 < 0)
                        {
                            TotalPosition = Position2;
                            Decimal ClientLimit = (CurrentLimit + TotalPosition);
                            SessionAmount = Convert.ToDecimal(SessionCalculation(ClientID));
                            Decimal FinalClientLimit = ClientLimit - SessionAmount;
                            Decimal ClientLimit1 = declareSessionAmount(ClientID);
                            Decimal FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                            double dValue = double.Parse(FinalClientLimit1.ToString());
                            lblAmount.InnerText = dValue.ToString();
                            updateClientlimit(ClientID, FinalClientLimit1);
                        }
                        else if (Position3 < 0)
                        {
                            TotalPosition = Position2;
                            Decimal ClientLimit = (CurrentLimit + TotalPosition);
                            SessionAmount = Convert.ToDecimal(SessionCalculation(ClientID));
                            Decimal FinalClientLimit = ClientLimit - SessionAmount;
                            Decimal ClientLimit1 = declareSessionAmount(ClientID);
                            Decimal FinalClientLimit1 = FinalClientLimit + ClientLimit1;
                            double dValue = double.Parse(FinalClientLimit1.ToString());
                            lblAmount.InnerText = dValue.ToString();
                            updateClientlimit(ClientID, FinalClientLimit1);
                        }
                        else if (Position2 == 0)
                        {
                            double dValue = double.Parse(CurrentLimit.ToString());
                            lblAmount.InnerText = dValue.ToString();
                            
                        }
                    }
                    else
                    {

                        Decimal sessionamount = Convert.ToDecimal(SessionCalculation(ClientID));
                        Decimal ClientLimit1 = (CurrentLimit - sessionamount);
                        Decimal TotalAMount = declareSessionAmount(ClientID);
                        Decimal ClientLimit2 = ClientLimit1 + TotalAMount;
                        double dValue = double.Parse(ClientLimit2.ToString());
                        lblAmount.InnerText = dValue.ToString();
                        
                        updateClientlimit(ClientID, ClientLimit2);
                    }

                }
            }
        }

        public void updateClientlimit(Decimal ClientID, Decimal Amount)
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
        public decimal SessionCalculation(Decimal ClientID)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string CheckSession = "Select * From Session where  ClientID = '" + ClientID + "' Group By Session";
                MySqlCommand Sessioncmd = new MySqlCommand(CheckSession, cn);
                MySqlDataAdapter Sessionadp = new MySqlDataAdapter(Sessioncmd);
                DataTable Sessiondt = new DataTable();
                Sessionadp.Fill(Sessiondt);
                decimal Amount1 = 0;
                if (Sessiondt.Rows.Count > 0)
                {
                    for (int i = 0; i < Sessiondt.Rows.Count; i++)
                    {
                        string session = (Sessiondt.Rows[i]["Session"]).ToString();

                        string CheckSession1 = "Select * From Session where  ClientID = '" + ClientID + "' && Session = '" + session + "' order by  DATETIME DESC";
                        MySqlCommand Sessioncmd1 = new MySqlCommand(CheckSession1, cn);
                        MySqlDataAdapter Sessionadp1 = new MySqlDataAdapter(Sessioncmd1);
                        DataTable Sessiondt1 = new DataTable();
                        Sessionadp1.Fill(Sessiondt1);
                        if (Sessiondt1.Rows.Count > 0)
                        {
                            decimal lastAmount = Convert.ToDecimal(Sessiondt1.Rows[0]["Position"]);
                            Amount1 = Amount1 + lastAmount;
                        }
                    }
                }
                else
                {
                    Amount1 = 0;
                }
                return Amount1;

            }
        }
        public Decimal declareSessionAmount(Decimal ClientID)
        {
            Decimal TotalAmount1 = 0;
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
                    Decimal TotalAmount = 0;

                    for (int i = 0; i < Amountdt.Rows.Count; i++)
                    {
                        TotalAmount = Convert.ToDecimal(Amountdt.Rows[i]["TotalAmount"]);
                        TotalAmount1 = TotalAmount1 + TotalAmount;
                    }
                    TotalAmount = 0;


                }
            }
            return TotalAmount1;
        }
    }
}