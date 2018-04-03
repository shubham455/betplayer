using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace betplayer.Client
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["clientID"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (SqlConnection cn = new SqlConnection(CN))
                {
                    cn.Open();
                    string SELECT = "Select Name From ClientMaster where ClientID = '" + Session["ClientID"] + "'";
                    SqlCommand cmd = new SqlCommand(SELECT, cn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    lbl1.InnerText = dt.Rows[0]["Name"].ToString();

                }
            }
        }
    }
}