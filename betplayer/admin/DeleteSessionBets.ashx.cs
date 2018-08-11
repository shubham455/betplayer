using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.Script.Serialization;

namespace betplayer.admin
{
    /// <summary>
    /// Summary description for DeleteSessionBets
    /// </summary>
    public class DeleteSessionBets : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            string result = Delete(Convert.ToInt16(context.Request["SessionID"]));
            if (result == "success")
                context.Response.Write(new JavaScriptSerializer().Serialize(new
                {
                    status = true,
                    userDeletedId = context.Request["userId"]
                }));
            else context.Response.Write(new JavaScriptSerializer().Serialize(new
            {
                status = false,
                error = result
            }));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        public string Delete(int id)
        {
            try
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();

                    string s1 = "Select * From Session where SessionID = '" + id + "'";
                    MySqlCommand cmd2 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd2);
                    DataTable dt = new DataTable();
                    adp1.Fill(dt);
                    int SessionID = Convert.ToInt32(dt.Rows[0]["SessionID"]);
                    string Session = (dt.Rows[0]["Session"]).ToString();
                    string Rate = (dt.Rows[0]["Rate"]).ToString();
                    string Amount = (dt.Rows[0]["Amount"]).ToString();
                    string Mode = (dt.Rows[0]["Mode"]).ToString();
                    string Team = (dt.Rows[0]["Team"]).ToString();
                    string DT = DateTime.Parse(dt.Rows[0]["DateTime"].ToString()).ToString("yyyy-MM-dd HH:mm:ss");

                    string s2 = "insert into updatedSessionBets (SessionID,Session,Rate,Amount,Mode,Team,DateTime,Remark) values(@SessionID,@Session,@Rate1,@Amount,@Mode,@Team,@DateTime,@Remark)";
                    MySqlCommand cmd1 = new MySqlCommand(s2, cn);
                    cmd1.Parameters.AddWithValue("@SessionID", SessionID);
                    cmd1.Parameters.AddWithValue("@Session", Session);
                    cmd1.Parameters.AddWithValue("@Rate1", Rate);
                    cmd1.Parameters.AddWithValue("@Amount", Amount);
                    cmd1.Parameters.AddWithValue("@Mode", Mode);
                    cmd1.Parameters.AddWithValue("@Team", Team);
                    cmd1.Parameters.AddWithValue("@DateTime", DT);
                    cmd1.Parameters.AddWithValue("@Remark", "Delete");
                    cmd1.ExecuteNonQuery();


                    string s = "delete from Session  where SessionID = '" + id + "'";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
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