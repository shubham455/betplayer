using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace betplayer.admin
{
    /// <summary>
    /// Summary description for SessionDeclare
    /// </summary>
    public class SessionDeclare : IHttpHandler, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            int UserID = Convert.ToInt16(context.Session["adminID"]);
            if (IsClient(UserID))
            {
                string Result = declareSession(context);
                if (Result == "success")
                    context.Response.Write(new JavaScriptSerializer().Serialize(new
                    {
                        status = true,
                        Result = Result
                    }));
                else context.Response.Write(new JavaScriptSerializer().Serialize(new
                {
                    status = false,
                    error = Result
                }));
            }
        }



        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        private bool IsClient(int id)
        {

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string SELECT = "Select AdminID from AdminMaster Where AdminID = '" + id + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read()) return true;
                else return false;

            }
        }
        private string declareSession(HttpContext context)
        {
            string SessionKey = context.Request["SessionKey"].ToString();
            int declarevalue = Convert.ToInt16(context.Request["declareValue"]);
            string Team = context.Request["Team"].ToString();
            string MatchID = context.Request["MatchID"].ToString();
            try
            {
                int TotalAmount = 0;

                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();

                    string s1 = "select * from Session where Session = @SessionKey && matchID= @MatchID  ORDER BY ClientID DESC;";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    cmd1.Parameters.AddWithValue("@SessionKey", SessionKey);
                    cmd1.Parameters.AddWithValue("@MatchID", MatchID);
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

                        string s2 = "select * from Session where Session = @SessionKey && matchID= @MatchID  ORDER BY ClientID DESC;";
                        MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                        cmd2.Parameters.AddWithValue("@SessionKey", SessionKey);
                        cmd2.Parameters.AddWithValue("@MatchID", MatchID);
                        MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd1);
                        DataTable dt2 = new DataTable();
                        adp1.Fill(dt2);
                        for (int j = i + 1; j <= dt2.Rows.Count;)
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
                                    cmd3.Parameters.AddWithValue("@Session", SessionKey);
                                    cmd3.Parameters.AddWithValue("@ClientID", clientID);
                                    cmd3.Parameters.AddWithValue("@MatchID", MatchID);
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
                                cmd3.Parameters.AddWithValue("@Session", SessionKey);
                                cmd3.Parameters.AddWithValue("@ClientID", clientID);
                                cmd3.Parameters.AddWithValue("@MatchID", MatchID);
                                cmd3.Parameters.AddWithValue("@TotalAmount", TotalAmount);
                                cmd3.ExecuteNonQuery();
                                TotalAmount = 0;
                            }
                            break;
                        }
                    }


                    string s = "Insert Into DeclaredSession (Session, declareRun,MatchID) values (@Session,@declareRun,@MatchID)";
                    MySqlCommand cmd = new MySqlCommand(s, cn);

                    cmd.Parameters.AddWithValue("@Session", SessionKey);
                    cmd.Parameters.AddWithValue("@declareRun", declarevalue);
                    cmd.Parameters.AddWithValue("@MatchID", MatchID);
                    

                    cmd.ExecuteNonQuery();
                    return "success";
                }
            }



            catch (Exception e)
            {
                return e.Message;
            }
        }
    }
}