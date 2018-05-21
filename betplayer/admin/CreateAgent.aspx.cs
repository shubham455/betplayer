using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.admin
{
    public partial class CreateAgent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit_Click(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "insert into AgentMaster(Name,ContactNo,Password,Agentlimit,Remlimit,myshare,AgentShare,mymobshare,agentmobshare,status,CreatedBy,Date) values (@Name,@Contact_No,@Password,@Agentlimit,@Remlimit,@myshare,@Agentshare,@mymobshare,@agentmobshare,@Status,@CreatedBy,@Date);  SELECT LAST_INSERT_ID()";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@Name", txtname.Text);
                cmd.Parameters.AddWithValue("@Contact_No", txtcontactno.Text);
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text);

                cmd.Parameters.AddWithValue("@Agentlimit", txtagentlimit.Text);
                cmd.Parameters.AddWithValue("@Remlimit", txtRemlimit.Text);
                cmd.Parameters.AddWithValue("@myshare", txtmyshare.Text);
                cmd.Parameters.AddWithValue("@Agentshare", txtagentshare.Text);
                cmd.Parameters.AddWithValue("@mymobshare", txtmymobshare.Text);
                cmd.Parameters.AddWithValue("@agentmobshare", txtagentmobshare.Text);
                cmd.Parameters.AddWithValue("@Status", "active");
                cmd.Parameters.AddWithValue("@CreatedBy", Session["SuperAgentID"]);
                cmd.Parameters.AddWithValue("@Date", DateTime.Today.ToString("yyyy/MM/dd"));

                int ID = Convert.ToInt16(cmd.ExecuteScalar());
                string update = "Update AgentMaster Set Code = 'A" + ID + "'where AgentID = '" + ID + "' ";
                MySqlCommand cmd1 = new MySqlCommand(update, cn);
                cmd1.ExecuteNonQuery();

                Response.Redirect("AgentDetails.aspx?msg=Add");

            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgentDetails.aspx");
        }
    }
}




