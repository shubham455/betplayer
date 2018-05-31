using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
namespace betplayer.Agent
{
    /// <summary>
    /// Summary description for ChangeStatus
    /// </summary>
    public class ChangeStatus : IHttpHandler
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
                    string s = "update clientmaster set Status = 'Inactive' where clientid = '" + id + "'";
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
