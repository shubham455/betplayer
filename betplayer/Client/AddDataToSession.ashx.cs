using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;
using System.Data;


namespace betplayer.Client
{
    /// <summary>
    /// Summary description for AddDataToSession
    /// </summary>
    public class AddDataToSession : IHttpHandler, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            int UserID = Convert.ToInt16(context.Session["ClientID"]);
            if (IsClient(UserID))
            {
                string Result = AddEntryToSession(context, UserID);
                if (Result == "success")
                    context.Response.Write(new JavaScriptSerializer().Serialize(new
                    {
                        status = "success",
                        Result = Result
                    }));
               else if (Result == "unsuccess")
                    context.Response.Write(new JavaScriptSerializer().Serialize(new
                    {
                        status = "unsuccess",
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
                string SELECT = "Select ClientID from ClientMaster Where ClientID = '" + id + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read()) return true;
                else return false;

            }
        }
        private string AddEntryToSession(HttpContext context, int ClientID)
        {
            string Session = context.Request["Session"].ToString();
            Decimal Amount = Convert.ToDecimal(context.Request["Amount"]);
            Decimal Rate = Convert.ToDecimal(context.Request["Rate"]);
            int Run = Convert.ToInt16(context.Request["Run"]);
            string Team = context.Request["Team"].ToString();
            string Mode = context.Request["Mode"].ToString();
            string MatchID = context.Request["MatchID"].ToString();


            try
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string Clientlimit = "Select Client_Limit From ClientMaster where ClientID = '" + ClientID + "'";
                    MySqlCommand Clientlimitcmd = new MySqlCommand(Clientlimit, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(Clientlimitcmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    Decimal ClientLimit1 = Convert.ToDecimal(dt.Rows[0]["Client_Limit"]);


                    string CheckSession = "Select * From Session where matchID = '" + MatchID + "' order by DateTime DESC";
                    MySqlCommand Sessioncmd = new MySqlCommand(CheckSession, cn);
                    MySqlDataAdapter Sessionadp = new MySqlDataAdapter(Sessioncmd);
                    DataTable Sessiondt = new DataTable();
                    Sessionadp.Fill(Sessiondt);
                    decimal Amount1 = 0;
                    decimal FinalAmount = 0;
                    decimal FinalAmount1 = 0;
                    if (Sessiondt.Rows.Count > 0)
                    {

                        int lastAmount = Convert.ToInt32(Sessiondt.Rows[0]["Amount"]);
                        int Position = Convert.ToInt32(Sessiondt.Rows[0]["Position"]);
                        string mode = Sessiondt.Rows[0]["Mode"].ToString();
                        int run = Convert.ToInt16(Sessiondt.Rows[0]["Runs"]);
                        FinalAmount1 = Position;
                        if (mode != Mode )
                        {
                            if (run < Run)
                            {
                                FinalAmount = lastAmount - Amount;
                            }
                            else if (run > Run)
                            {
                                FinalAmount = lastAmount - Amount;
                            }
                            else if (run == Run)
                            {
                                FinalAmount = lastAmount - Amount;
                            }

                        }
                        else if (mode == Mode)
                        {
                            FinalAmount = lastAmount - Amount;
                            
                        }

                    }
                    else
                    {
                        FinalAmount = Amount * -1;
                        
                    }

                   

                    Decimal CheckClientAmount = FinalAmount1 - FinalAmount;

                    
                     string s = "Insert Into Session (ClientID,Session, Amount, Runs,Rate, Mode, DateTime, MatchID,Team,Position) values (@ClientID,@Session,@Amount,@Run,@Rate,@Mode,@DateTime,@MatchID,@Team,@Position)";
                        MySqlCommand cmd = new MySqlCommand(s, cn);
                        cmd.Parameters.AddWithValue("@ClientID", ClientID);
                        cmd.Parameters.AddWithValue("@Session", Session);
                        cmd.Parameters.AddWithValue("@Amount", Amount);
                        cmd.Parameters.AddWithValue("@Run", Run);
                        cmd.Parameters.AddWithValue("@Rate", Rate);
                        cmd.Parameters.AddWithValue("@Mode", Mode);
                        cmd.Parameters.AddWithValue("@DateTime", DateTime.Now);
                        cmd.Parameters.AddWithValue("@MatchID", MatchID);
                        cmd.Parameters.AddWithValue("@Team", Team);
                        cmd.Parameters.AddWithValue("@Position", CheckClientAmount);

                        cmd.ExecuteNonQuery();


                        string s1 = "Select Client_Limit From ClientMaster where ClientID = '" + ClientID + "'";
                        MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                        MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                        DataTable dt1 = new DataTable();
                        adp1.Fill(dt1);

                        decimal ClientLimit = Convert.ToDecimal(dt1.Rows[0]["Client_Limit"]);

                        if (Mode == "Y")
                        {
                            decimal deductedAmount = ClientLimit - Amount;
                            double dValue = double.Parse(deductedAmount.ToString());

                            string s2 = "Update ClientMaster Set Client_Limit = '" + dValue + "' where ClientId = '" + ClientID + "'";
                            MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                            cmd2.ExecuteNonQuery();
                        }
                        else if (Mode == "N")
                        {
                            decimal CalculateAmount = Rate * Amount;
                            decimal deductedAmount = ClientLimit - CalculateAmount;
                            double dValue = double.Parse(deductedAmount.ToString());

                            string s2 = "Update ClientMaster Set Client_Limit = '" + dValue + "' where ClientId = '" + ClientID + "'";
                            MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                            cmd2.ExecuteNonQuery();
                        }




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