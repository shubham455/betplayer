using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;
using System.Data;
using System.Web.SessionState;

namespace betplayer.PowerUser
{
    /// <summary>
    /// Summary description for LiveTvInputData
    /// </summary>
    public class LiveTvInputData : IHttpHandler, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            int UserID = Convert.ToInt16(context.Session["ClientID"]);
            if (IsClient(UserID))
            {
                string Result = InsertLiveTvInputData(context);
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
                string SELECT = "Select PowerUserID from PowerUserMaster Where PowerUserID = '" + id + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read()) return true;
                else return false;

            }
        }
        private string InsertLiveTvInputData(HttpContext context)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string IP = (context.Request["IP"]);
                string Port = (context.Request["Port"]);
                string Channel = context.Request["Channel"].ToString();

                if (IP != "")
                {
                    string Insert = "insert into  LiveTvIP (Value) values(@IP)";
                    MySqlCommand cmd = new MySqlCommand(Insert, cn);
                    cmd.Parameters.AddWithValue("@IP", IP);
                    cmd.ExecuteNonQuery();
                }
                if (Port != "")
                {
                    string Insert = "insert into  LiveTvPort (Value) values(@Port)";
                    MySqlCommand cmd = new MySqlCommand(Insert, cn);
                    cmd.Parameters.AddWithValue("@Port", Port);
                    cmd.ExecuteNonQuery();
                }
                if (Channel != "")
                {
                    string Insert = "insert into  LiveTvChannel (Value) values(@Channel)";
                    MySqlCommand cmd = new MySqlCommand(Insert, cn);
                    cmd.Parameters.AddWithValue("@Channel", Channel);
                    cmd.ExecuteNonQuery();
                }

            }
            return "success";
            
        }
    }
}