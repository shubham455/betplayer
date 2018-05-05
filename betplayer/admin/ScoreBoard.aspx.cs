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
    public partial class ScoreBoard : System.Web.UI.Page
    {
        string matchid;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManuallyUpdation.aspx");
        }

        protected void txtrun_TextChanged(object sender, EventArgs e)
        {
            matchid = Request.QueryString["matchid"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Update CurrentMatch set TeamA_run = '" + txtrun.Text + "' where matchid = '" + matchid + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                txtrun.Text = "";
            }
        }

        protected void txtover_TextChanged(object sender, EventArgs e)
        {
            matchid = Request.QueryString["matchid"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Update CurrentMatch set TeamA_Over = '" + txtover.Text + "' where matchid = '" + matchid + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                txtover.Text = "";
            }
        }

        protected void txtwicket_TextChanged(object sender, EventArgs e)
        {
            matchid = Request.QueryString["matchid"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Update CurrentMatch set TeamA_Wicket = '" + txtwicket.Text + "' where matchid = '" + matchid + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                txtwicket.Text = "";
            }
        }

        protected void btnballstart_Click(object sender, EventArgs e)
        {
            Session["ball"] = btnballstart.Text ;
            string s = Session["ball"].ToString();
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            Session["ball"] = btn1.Text;
        }
    }
}