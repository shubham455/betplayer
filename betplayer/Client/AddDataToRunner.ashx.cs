using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;

namespace betplayer.Client
{
    /// <summary>
    /// Summary description for AddDataToLedger
    /// </summary>
    public class AddDataToLedger : IHttpHandler, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            int UserID = Convert.ToInt16(context.Session["ClientID"]);
            if (IsClient(UserID))
            {
                string Result = AddEntryToLedger(context, UserID);
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
                string SELECT = "Select ClientID from ClientMaster Where ClientID = '" + id + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read()) return true;
                else return false;

            }
        }
        private string AddEntryToLedger(HttpContext context, int ClientID)
        {
            string Amount = context.Request["Amount"].ToString();
            string Rate = context.Request["Rate"].ToString();
            string Team = context.Request["Team"].ToString();
            string Mode = context.Request["Mode"].ToString();
            string MatchID = context.Request["MatchID"].ToString();
            string Position1 = context.Request["Team1Position"].ToString();
            string Position2 = context.Request["Team2Position"].ToString();

            try
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string s = "Insert Into runner (ClientID, Amount, Rate, Mode, DateTime, MatchID,Team,Position1,Position2) values (@ClientID,@Amount,@Rate,@Mode,@DateTime,@MatchID,@Team,@Position1,@Position2)";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    cmd.Parameters.AddWithValue("@ClientID", ClientID);
                    cmd.Parameters.AddWithValue("@Amount", Amount);
                    cmd.Parameters.AddWithValue("@Rate", Rate);
                    cmd.Parameters.AddWithValue("@Mode", Mode);
                    cmd.Parameters.AddWithValue("@DateTime", DateTime.Now);
                    cmd.Parameters.AddWithValue("@MatchID", MatchID);
                    cmd.Parameters.AddWithValue("@Team", Team);
                    cmd.Parameters.AddWithValue("@Position1", Position1);
                    cmd.Parameters.AddWithValue("@Position2", Position2);
                    cmd.ExecuteNonQuery();
                    BindData(ClientID);
                    return "success";
                }
            }
            catch (Exception e)
            {
                return e.Message;
            }

        }
        private void BindData(int id)
        {

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From Runner where ClientID ='" + id + "' ";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
            }
        }
        
    }
}