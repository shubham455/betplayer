using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Client
{
    /// <summary>
    /// Summary description for Redirect
    /// </summary>
    public class Redirect : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            string result = RedirectPage(context, Convert.ToInt16(context.Request["MatchID"]));
            if (result == "0")
                context.Response.Write(new JavaScriptSerializer().Serialize(new
                {
                    status = '0',
                   
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
        public string RedirectPage(HttpContext context, int apiID)
        {

            int status;
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From Matches where apiID = '" + apiID + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                status = Convert.ToInt16(dt.Rows[0]["Status"].ToString());

                if (dt.Rows.Count > 0)
                {
                    if (status == 11 || status == 0)
                    {
                        context.Response.Redirect("BetDetails_Declare.aspx?apiID=", false);
                        context.ApplicationInstance.CompleteRequest();
                    }
                    else if (status == 1)
                    {
                        context.Response.Redirect("BetDetails.aspx?apiID=" + apiID);
                    }
                }
                return status.ToString();

            }


        }

    }
}