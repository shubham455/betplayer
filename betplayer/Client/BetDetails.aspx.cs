using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.Client
{
    public partial class BetDetails : System.Web.UI.Page
    {


        private DataTable dt;
        private DataTable dt1;
        private DataTable dt2;
        private DataTable dt3;
        private DataTable dt4;
        private DataTable dt5;
        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }
        public DataTable MatchesDataTable2 { get { return dt2; } }
        public DataTable MatchesDataTable3 { get { return dt3; } }
        public DataTable MatchesDataTable5 { get { return dt5; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                apiID.Value = Request.QueryString["id"];
                int ClientID = Convert.ToInt16(Session["ClientID"]);
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();

                    string SELECT = "Select * from Matches Where apiID = '" + apiID.Value + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    adp.Fill(dt);

                    string SMatches = "Select * from Matches where Status = '1' && Active = '1'";
                    MySqlCommand cmd1 = new MySqlCommand(SMatches, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                    dt1 = new DataTable();
                    adp1.Fill(dt1);

                    string TeamCMatches = "Select TeamC from Matches where Status = '1' && Active = '1'";
                    MySqlCommand cmd2 = new MySqlCommand(TeamCMatches, cn);
                    MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                    dt2 = new DataTable();
                    adp2.Fill(dt2);

                    string Session = "Select *  from Session where ClientID  = @ClientID && MatchID = @MatchID order by DateTime DESC";
                    MySqlCommand Sessioncmd = new MySqlCommand(Session, cn);
                    Sessioncmd.Parameters.AddWithValue("@MatchID", apiID.Value);
                    Sessioncmd.Parameters.AddWithValue("@ClientID", ClientID);
                    MySqlDataAdapter sessionadp = new MySqlDataAdapter(Sessioncmd);
                    dt5 = new DataTable();
                    sessionadp.Fill(dt5);

                    
                    string runner = "Select *  from runner  where ClientID = '" + ClientID + "' and MatchID = '" + apiID.Value + "' order by DateTime DESC";
                    MySqlCommand cmd3 = new MySqlCommand(runner, cn);
                    MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                    dt3 = new DataTable();
                    adp3.Fill(dt3);
                    if (dt3.Rows.Count > 0)
                    {
                        PositionTeam1.Text = dt3.Rows[0]["Position1"].ToString();
                        PositionTeam2.Text = dt3.Rows[0]["Position2"].ToString();
                    }
                    else
                    {
                        PositionTeam1.Text = "0.00";
                        PositionTeam2.Text = "0.00";
                    }

                    string result = "SELECT * FROM ViewMatch WHERE ClientID='" + ClientID + "' && MatchID = '" + apiID.Value + "'";
                    MySqlCommand resultcmd = new MySqlCommand(result, cn);
                    MySqlDataReader rdr = resultcmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        
                    }
                    else
                    {
                        rdr.Close();
                        string insert = "Insert Into ViewMatch (MatchID,ClientID) values (@MatchID,@ClientID)";
                        MySqlCommand insertcmd = new MySqlCommand(insert, cn);
                        insertcmd.Parameters.AddWithValue("@MatchID", apiID.Value);
                        insertcmd.Parameters.AddWithValue("@ClientID", ClientID);
                        insertcmd.ExecuteNonQuery();

                        string checkfordeduction = "Select *  from viewmatch  where ClientID = '" + ClientID + "' and MatchID = '" + apiID.Value + "'";
                        MySqlCommand cmd4 = new MySqlCommand(checkfordeduction, cn);
                        MySqlDataAdapter adp4 = new MySqlDataAdapter(cmd4);
                        dt4 = new DataTable();
                        adp4.Fill(dt4);
                        if (dt4.Rows.Count > 0)
                        {
                            int Isview = Convert.ToInt16(dt4.Rows[0]["Isview"]);
                            if (Isview == 0)
                            {
                                string coinDeduct = "Select Client_limit From ClientMaster where ClientID = '" + ClientID + "'";
                                MySqlCommand cmd5 = new MySqlCommand(coinDeduct, cn);
                                MySqlDataAdapter adp5 = new MySqlDataAdapter(cmd5);
                                DataTable dt = new DataTable();
                                adp5.Fill(dt);
                                int clientlimit = Convert.ToInt32(dt.Rows[0]["Client_Limit"]);
                                int Deductdlimit = clientlimit - 100;

                                string update = "update clientmaster set client_Limit =@Deductdlimit where clientID = @ClientID";
                                MySqlCommand cmd6 = new MySqlCommand(update, cn);
                                cmd6.Parameters.AddWithValue("@Deductdlimit", Deductdlimit);
                                cmd6.Parameters.AddWithValue("@ClientID", ClientID);
                                cmd6.ExecuteNonQuery();

                                string update1 = "update viewmatch set Isview = '1' where clientID = '" + ClientID + "' && MatchID = '" + apiID.Value + "'";
                                MySqlCommand cmd7 = new MySqlCommand(update1, cn);
                                cmd7.ExecuteNonQuery();
                            }

                        }
                        else
                        {
                           
                        }
                    }
                }
            }
        }

    }
}