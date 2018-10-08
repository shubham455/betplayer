using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;

namespace betplayer.admin
{
    /// <summary>
    /// Summary description for changeagentstatus
    /// </summary>
    public class changeagentstatus : IHttpHandler
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
                    string checkstatus = "Select Status From SubAdminMaster Where SubAdminID = '" + id + "'";
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

                    string s = "update SubAdminMaster set Status = '" + St + "' where SubAdminID = '" + id + "'";
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
