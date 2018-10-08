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

namespace betplayer.SubAdmin
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
                    SuperAgentID = context.Request["AgentID" + i.ToString()],
                    SuperAgentLimit = context.Request["AgentLimit" + i.ToString()],
                    FixLimit = context.Request["FixLimit" + i.ToString()],
                });
            }
            int SuperStockistID = Convert.ToInt16(context.Session["SuperStockistID"]);

            string result = UpdateclientLimit(clientLimits, SuperStockistID);
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
        public string UpdateclientLimit(List<Object> clientValues, int SuperStockistID)
        {
            try
            {

                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string checkAgentlimit = "Select CurrentLimit From SuperStockistMaster where SuperStockistID = '" + SuperStockistID + "'";
                    MySqlCommand cmd1 = new MySqlCommand(checkAgentlimit, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    int SuperStockistlimit = Convert.ToInt32(dt.Rows[0]["CurrentLimit"]);


                    int Total = 0;
                    foreach (Object client in clientValues)
                    {
                        int SuperAgentCurrentLimit = Convert.ToInt32(client.GetType().GetProperty("SuperAgentLimit").GetValue(client, null));

                        Total = Total + SuperAgentCurrentLimit;
                    }

                    if (SuperStockistlimit >= Total)

                        foreach (Object client in clientValues)
                        {
                            string clientID = client.GetType().GetProperty("SuperAgentID").GetValue(client, null).ToString();
                            string clientLimit = client.GetType().GetProperty("SuperAgentLimit").GetValue(client, null).ToString();
                            string fixlimit = client.GetType().GetProperty("FixLimit").GetValue(client, null).ToString();



                            string updatelimit = "Update SuperAgentMaster set  Fixlimit = '" + fixlimit + "',CurrentLimit= '" + clientLimit + "'  Where SuperagentID = '" + clientID + "'";
                            MySqlCommand cmd = new MySqlCommand(updatelimit, cn);
                            cmd.ExecuteNonQuery();

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