﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.poweruser
{
	public partial class Login1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["poweruserID"] != null)
                {
                    Session.Remove("poweruserID");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Logout Successfully.....');", true);
                }



            }
        }
        protected void Submitbtn_Click(object sender, EventArgs e)
        {

            if (txtusername.Text == "" && txtpassword.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Give Username & Password.....');", true);
            }

            else if (txtusername.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Give Username.....');", true);
            }
            else if (txtpassword.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Give Password.....');", true);
            }


            else
            {

                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string SELECT = "Select * from poweruserMaster Where Code = '" + txtusername.Text + "' and Password='" + txtpassword.Text + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataReader rdr = cmd.ExecuteReader();

                    if (rdr.Read())
                    {
                        rdr.Close();

                        MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);
                        int poweruserID = Convert.ToInt16(dt.Rows[0]["poweruserID"]);

                        Session["PoweruserID"] = poweruserID;

                        Response.Redirect("ModifyMatches.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Check Username & Password.....');", true);
                    }
                }
            }
        }
    }
}