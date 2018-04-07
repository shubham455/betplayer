using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace betplayer.Agent
{
    public partial class DashBoard : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AgentID"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (SqlConnection cn = new SqlConnection(CN))
                {
                    cn.Open();
                    string SELECT = "Select Name From AgentMAster where AgentID = '" + Session["AgentID"] + "'";
                    SqlCommand cmd = new SqlCommand(SELECT, cn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    lbl1.Text = dt.Rows[0]["Name"].ToString();

                }
            }
        }
    }
}