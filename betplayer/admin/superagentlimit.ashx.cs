using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI;
using System.Web.Script.Serialization;

namespace betplayer.admin
{
    /// <summary>
    /// Summary description for superagentlimit
    /// </summary>
    public class superagentlimit : IHttpHandler,IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            int Length = Convert.ToInt16(context.Request["Length"]);
            List<Object> clientLimits = new List<Object>();
            for (int i = 0; i < Length; i++)
            {
                clientLimits.Add(new
                {
                    AgentID = context.Request["AgentID" + i.ToString()],
                    AgentLimit = context.Request["AgentLimit" + i.ToString()],
                    FixLimit = context.Request["FixLimit" + i.ToString()],
                });
            }
            int AdminID = Convert.ToInt16(context.Session["AdminID"]);

            string result = UpdateclientLimit(clientLimits, AdminID);
            if (result == "success")
                context.Response.Write(new JavaScriptSerializer().Serialize(new
                {
                    status = "success"

                }));
            else if (result == "unsuccess")
                context.Response.Write(new JavaScriptSerializer().Serialize(new
                {
                    status = "unsuccess"

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
        public string UpdateclientLimit(List<Object> clientValues, int AdminID)
        {
            try
            {

                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    foreach (Object client in clientValues)
                    {
                        string clientID = client.GetType().GetProperty("AgentID").GetValue(client, null).ToString();
                        string clientLimit = client.GetType().GetProperty("AgentLimit").GetValue(client, null).ToString();
                        string fixlimit = client.GetType().GetProperty("FixLimit").GetValue(client, null).ToString();

                        string updatelimit = "Update SuperAgentMaster set  Agentlimit = '" + clientLimit+"', Fixlimit = '"+fixlimit+"',CurrentLimit= '" + clientLimit + "'  Where SuperagentID = '" + clientID + "'";
                        MySqlCommand cmd = new MySqlCommand(updatelimit, cn);
                        cmd.ExecuteNonQuery();

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