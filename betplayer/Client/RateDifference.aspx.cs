using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Client
{
    public partial class RateDifference : System.Web.UI.Page
    {
        public int RateDifferencevalue = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select RateDifference From  ClientMaster Where ClientID = '" + Session["ClientID"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                RateDifferencevalue = Convert.ToInt16(dt.Rows[0]["RateDifference"]);
                if(RateDifferencevalue == 0)
                {
                    RateDifference0.Checked = true;
                }
                else if (RateDifferencevalue == 1)
                {
                    RateDifference1.Checked = true;
                }
                else if (RateDifferencevalue == 2)
                {
                    RateDifference2.Checked = true;
                }
                else if (RateDifferencevalue == 3)
                {
                    RateDifference3.Checked = true;
                }
                else if (RateDifferencevalue == 4)
                {
                    RateDifference4.Checked = true;
                }
                else if (RateDifferencevalue == 5)
                {
                    RateDifference5.Checked = true;
                }

            }
        }

        protected void RateDifference0_CheckedChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "update ClientMaster Set RateDifference = '0' Where ClientID = '" + Session["ClientID"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void RateDifference1_CheckedChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "update ClientMaster Set RateDifference = '1' Where ClientID = '" + Session["ClientID"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void RateDifference2_CheckedChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "update ClientMaster Set RateDifference = '2' Where ClientID = '" + Session["ClientID"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void RateDifference3_CheckedChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "update ClientMaster Set RateDifference = '3' Where ClientID = '" + Session["ClientID"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "update ClientMaster Set RateDifference = '4' Where ClientID = '" + Session["ClientID"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void RateDifference5_CheckedChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "update ClientMaster Set RateDifference = '5' Where ClientID = '" + Session["ClientID"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}