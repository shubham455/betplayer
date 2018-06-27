using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.Client
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientID"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string SELECT = "Select Name,Client_limit From ClientMaster where ClientID = '" + Session["ClientID"] + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    lblName.InnerText = dt.Rows[0]["Name"].ToString();
                    lblAmount.InnerText = dt.Rows[0]["Client_limit"].ToString().TrimEnd('0');

                }
            }
        }
    }
}