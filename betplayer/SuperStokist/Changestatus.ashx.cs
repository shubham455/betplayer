using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI;
using System.Web.Script.Serialization;
using System.Data;

namespace betplayer.SuperStokist
{
    /// <summary>
    /// Summary description for Changestatus
    /// </summary>
    public class Changestatus : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            string result = ChangeclientStatus(Convert.ToInt16(context.Request["userId"]));
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
        public string ChangeclientStatus(int id)
        {
            try
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string checkstatus = "Select Status From AgentMaster Where AgentID = '" + id + "'";
                    MySqlCommand cmd1 = new MySqlCommand(checkstatus, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    string St = "";
                    string status = dt.Rows[0]["Status"].ToString();
                    if (status == "active")
                    {
                        St = "Inactive";
                    }
                    else if (status == "Inactive")
                    {
                        St = "active";
                    }

                    string s = "update agentmaster set Status = '" + St + "' where agentid = '" + id + "'";
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