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

            int TotalAmount = 0;
            int declarevalue = 50;
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string s1 = "select * from Session where Session = '6 over Chennai Super Kings' && matchID='1136620'  ORDER BY ClientID DESC;";
                MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                adp1.Fill(dt1);

                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    int Amount = Convert.ToInt32(dt1.Rows[i]["Amount"]);
                    string Mode = dt1.Rows[i]["Mode"].ToString();
                    int Runs = Convert.ToInt16(dt1.Rows[i]["Runs"]);
                    int clientID = Convert.ToInt32(dt1.Rows[i]["ClientID"]);

                    if (declarevalue == Runs)
                    {
                        if (Mode == "Y")
                        {
                            TotalAmount = TotalAmount + Amount;

                        }
                        else if (Mode == "N")
                        {
                            TotalAmount = TotalAmount - Amount;
                        }

                    }
                    else if (declarevalue < Runs)
                    {
                        if (Mode == "Y")
                        {
                            TotalAmount = TotalAmount - Amount;

                        }
                        else if (Mode == "N")
                        {
                            TotalAmount = TotalAmount + Amount;
                        }

                    }
                    else if (declarevalue > Runs)
                    {
                        if (Mode == "Y")
                        {
                            TotalAmount = TotalAmount + Amount;

                        }
                        else if (Mode == "N")
                        {
                            TotalAmount = TotalAmount - Amount;
                        }

                    }

                    string s2 = "select * from Session where Session = '8 over Chennai Super Kings' && matchID='1136620'  ORDER BY ClientID DESC;";
                    MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                    MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd1);
                    DataTable dt2 = new DataTable();
                    adp1.Fill(dt2);
                    for (int j = i+1; j <= dt2.Rows.Count;)
                    {
                        if (dt2.Rows.Count > j)
                        {
                            int ClientID = Convert.ToInt32(dt2.Rows[j]["ClientID"]);
                            if (clientID == ClientID)
                            {

                            }
                            else
                            {
                                string StoreAmount = "Insert Into sessioncalculation (Session,ClientID,MatchID,TotalAmount) Values (@Session,@ClientID,@MatchID,@TotalAmount)";
                                MySqlCommand cmd3 = new MySqlCommand(StoreAmount, cn);
                                cmd3.Parameters.AddWithValue("@Session", "6 over Chennai Super Kings");
                                cmd3.Parameters.AddWithValue("@ClientID", clientID);
                                cmd3.Parameters.AddWithValue("@MatchID", "1136620");
                                cmd3.Parameters.AddWithValue("@TotalAmount", TotalAmount);
                                cmd3.ExecuteNonQuery();
                                TotalAmount = 0;
                            }
                            break;
                        }
                        else
                        {

                            string StoreAmount = "Insert Into sessioncalculation (Session,ClientID,MatchID,TotalAmount) Values (@Session,@ClientID,@MatchID,@TotalAmount)";
                            MySqlCommand cmd3 = new MySqlCommand(StoreAmount, cn);
                            cmd3.Parameters.AddWithValue("@Session", "6 over Chennai Super Kings");
                            cmd3.Parameters.AddWithValue("@ClientID", clientID);
                            cmd3.Parameters.AddWithValue("@MatchID", "1136620");
                            cmd3.Parameters.AddWithValue("@TotalAmount", TotalAmount);
                            cmd3.ExecuteNonQuery();
                            TotalAmount = 0;
                        }
                        break;
                    }
                }
            }
        }
    }
}
