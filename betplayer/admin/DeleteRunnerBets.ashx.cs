using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;
using System.Data;
using System.Web.UI;

namespace betplayer.admin
{
    /// <summary>
    /// Summary description for DeleteRunnerBets
    /// </summary>
    public class DeleteRunnerBets : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            string result = Delete(Convert.ToInt16(context.Request["RunnerID"]));
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

                    string s1 = "Select * From Runner where RunnerID = '" + id + "'";
                    MySqlCommand cmd2 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd2);
                    DataTable dt = new DataTable();
                    adp1.Fill(dt);
                    int RunnerID = Convert.ToInt32(dt.Rows[0]["RunnerID"]);
                    string Rate = (dt.Rows[0]["Rate"]).ToString();
                    string Amount = (dt.Rows[0]["Amount"]).ToString();
                    string Mode = (dt.Rows[0]["Mode"]).ToString();
                    string Team = (dt.Rows[0]["Team"]).ToString();
                    string Position1 = (dt.Rows[0]["Position1"]).ToString();
                    string Position2 = (dt.Rows[0]["Position2"]).ToString();
                    string DT = DateTime.Parse(dt.Rows[0]["DateTime"].ToString()).ToString("yyyy-MM-dd HH:mm:ss");

                    string s2 = "insert into updatedRunnerBets (RunnerID,Rate,Amount,Mode,Team,Position1,Position2,DateTime,Remark) values(@RunnerID,@Rate1,@Amount,@Mode,@Team,@Position1,@Position2,@DateTime,@Remark)";
                    MySqlCommand cmd1 = new MySqlCommand(s2, cn);
                    cmd1.Parameters.AddWithValue("@RunnerID", RunnerID);
                    cmd1.Parameters.AddWithValue("@Rate1", Rate);
                    cmd1.Parameters.AddWithValue("@Amount", Amount);
                    cmd1.Parameters.AddWithValue("@Mode", Mode);
                    cmd1.Parameters.AddWithValue("@Team", Team);
                    cmd1.Parameters.AddWithValue("@Position1", Position1);
                    cmd1.Parameters.AddWithValue("@Position2", Position2);
                    cmd1.Parameters.AddWithValue("@DateTime", DT);
                    cmd1.Parameters.AddWithValue("@Remark", "Delete");
                    cmd1.ExecuteNonQuery();




                    string s = "delete from Runner  where RunnerID = '" + id + "'";
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