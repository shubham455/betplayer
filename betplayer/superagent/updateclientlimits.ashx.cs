﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI;
using System.Web.Script.Serialization;

namespace betplayer.superagent
{
    /// <summary>
    /// Summary description for updateclientlimits
    /// </summary>
    public class updateclientlimits : IHttpHandler,IReadOnlySessionState
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
            string Agentcode = (context.Request["AgentCode"]);
            string SuperAgentcode = (context.Session["SuperAgentCode"]).ToString();


            string result = UpdateclientLimit(clientLimits, Agentcode, SuperAgentcode);
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
        public string UpdateclientLimit(List<Object> clientValues, string Agentcode , string SuperAgentcode)
        {
            try
            {

                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    string checkAgentlimit = "Select CurrentLimit From AgentMaster where Code = '" + Agentcode + "'";
                    MySqlCommand cmd1 = new MySqlCommand(checkAgentlimit, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    decimal AgentLimit = Convert.ToDecimal(dt.Rows[0]["CurrentLimit"]);
                    decimal Total = 0;
                    foreach (Object client in clientValues)
                    {
                        decimal ClientCurrentLimit = Convert.ToDecimal(client.GetType().GetProperty("ClientLimit").GetValue(client, null));

                        Total = Total + ClientCurrentLimit;
                    }

                    if (AgentLimit >= Total)
                    {
                        cn.Open();
                        foreach (Object client in clientValues)
                        {
                            string clientID = client.GetType().GetProperty("ClientID").GetValue(client, null).ToString();
                            decimal currentlimit = Convert.ToDecimal(client.GetType().GetProperty("ClientLimit").GetValue(client, null));
                            decimal Fixlimit = Convert.ToDecimal(client.GetType().GetProperty("FixLimit").GetValue(client, null));
                            decimal finallimit = currentlimit;

                            string clientLimit = "Select * From ClientMaster Where ClientID = '" + clientID + "'";
                            MySqlCommand clientLimitcmd = new MySqlCommand(clientLimit, cn);
                            MySqlDataAdapter clientLimitadp = new MySqlDataAdapter(clientLimitcmd);
                            DataTable clientLimitdt = new DataTable();
                            clientLimitadp.Fill(clientLimitdt);

                            decimal LastFixLimit = Convert.ToDecimal(clientLimitdt.Rows[0]["FixLimit"]);
                            decimal LastCurrentLimit = Convert.ToDecimal(clientLimitdt.Rows[0]["CurrentLimit"]);

                            if(LastFixLimit != Fixlimit || LastCurrentLimit != currentlimit)
                            {
                                string insert = "insert into ClientLimitWatch(ClientID,UpdatedBy,LastFixLimit,LastCurrentLimit,NewCurrentlimit,NewFixLimit,DateTime ) values (@ClientID,@UpdatedBy,@LastFixLimit,@LastCurrentLimit,@Currentlimit,@FixLimit,@DateTime)";
                                MySqlCommand insertcmd = new MySqlCommand(insert, cn);

                                insertcmd.Parameters.AddWithValue("@ClientID",clientID );
                                insertcmd.Parameters.AddWithValue("@UpdatedBy", SuperAgentcode);
                                insertcmd.Parameters.AddWithValue("@LastFixLimit", LastFixLimit);
                                insertcmd.Parameters.AddWithValue("@LastCurrentLimit", LastCurrentLimit);
                                insertcmd.Parameters.AddWithValue("@Currentlimit", currentlimit);
                                insertcmd.Parameters.AddWithValue("@Fixlimit", Fixlimit);
                                insertcmd.Parameters.AddWithValue("@DateTime", DateTime.Now.ToString());
                                insertcmd.ExecuteNonQuery();

                            }

                            string updatelimit = "Update ClientMaster set Client_Limit = '" + finallimit + "',CurrentLimit= '" + currentlimit + "',FixLimit = '" + Fixlimit + "'  Where ClientID = '" + clientID + "'";
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