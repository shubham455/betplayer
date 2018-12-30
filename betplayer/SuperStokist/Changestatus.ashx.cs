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
    /// Summary description for changestatus
    /// </summary>
    public class changestatus : IHttpHandler
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
                    string checkstatus = "Select Status,Code From SuperAgentMaster Where SuperAgentID = '" + id + "'";
                    MySqlCommand cmd1 = new MySqlCommand(checkstatus, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    string St = "";
                    string status = dt.Rows[0]["Status"].ToString();
                    if (status == "Active")
                    {
                        St = "Inactive";
                    }
                    else if (status == "Inactive")
                    {
                        St = "Active";
                    }
                    string Code = dt.Rows[0]["Code"].ToString();


                    string Agents = "Select AgentID From AgentMaster where CreatedBy = '" + Code + "'";
                    MySqlCommand Agentscmd = new MySqlCommand(Agents, cn);
                    MySqlDataAdapter Agentsadp = new MySqlDataAdapter(Agentscmd);
                    DataTable Agentsdt = new DataTable();
                    Agentsadp.Fill(Agentsdt);

                    for (int a = 0; a < Agentsdt.Rows.Count; a++)
                    {
                        int AgentID = Convert.ToInt16(Agentsdt.Rows[a]["AgentID"]);
                        string update = "Update AgentMaster Set Status = '" + St + "' where AgentID = '" + AgentID + "'";
                        MySqlCommand updatecmd = new MySqlCommand(update, cn);
                        updatecmd.ExecuteNonQuery();

                    }

                    string s = "update superagentmaster set Status = '" + St + "' where superagentid = '" + id + "'";
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