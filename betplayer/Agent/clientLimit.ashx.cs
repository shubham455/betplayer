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


namespace betplayer.Agent
{
    /// <summary>
    /// Summary description for clientLimit
    /// </summary>
    public class clientLimit : IHttpHandler,IReadOnlySessionState
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
                    ClientID = context.Request["ClientID" + i.ToString()],
                    ClientLimit = context.Request["ClientLimit" + i.ToString()],
                    FixLimit = context.Request["Fixlimit" + i.ToString()],
                });
            }
            int AgentID = Convert.ToInt16(context.Session["AgentID"]);
            
            string result = UpdateclientLimit(clientLimits, AgentID);
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
        public string UpdateclientLimit(List<Object> clientValues, int AgentID)
        {
            try
            {

                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    string checkAgentlimit = "Select AgentLimit From AgentMaster where AgentID = '"+ AgentID+"'";
                    MySqlCommand cmd1 = new MySqlCommand(checkAgentlimit, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    int AgentLimit = Convert.ToInt32(dt.Rows[0]["AgentLimit"]);
                    

                    int Total = 0;
                    foreach (Object client in clientValues)
                    {
                        int ClientCurrentLimit = Convert.ToInt32(client.GetType().GetProperty("ClientLimit").GetValue(client, null));

                        Total = Total + ClientCurrentLimit;
                    }

                    if (AgentLimit >= Total)
                    {
                        cn.Open();
                        foreach (Object client in clientValues)
                        {
                            string clientID = client.GetType().GetProperty("ClientID").GetValue(client, null).ToString();
                            string clientLimit = client.GetType().GetProperty("ClientLimit").GetValue(client, null).ToString();
                            string Fixlimit = client.GetType().GetProperty("FixLimit").GetValue(client, null).ToString();

                            string updatelimit = "Update ClientMaster set  CurrentLimit= '" + clientLimit + "',FixLimit = '"+Fixlimit+"'  Where ClientID = '" + clientID + "'";
                            MySqlCommand cmd = new MySqlCommand(updatelimit, cn);
                            cmd.ExecuteNonQuery();

                        }

                    }
                    else { return "unsuccess"; }
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