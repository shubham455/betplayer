﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;

namespace betplayer.admin
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["AdminID"] != null)
                {
                    Session.Remove("AdminID");
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
                string username = "";
                username = txtusername.Text;
                username = Regex.Replace(username, @"\d", "");


                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    if (username == "AD")
                    {

                        string SELECT = "Select * from AdminMaster Where Code = '" + txtusername.Text + "' and Password='" + txtpassword.Text + "'";
                        MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                        MySqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            rdr.Close();

                            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            int AdminID = Convert.ToInt16(dt.Rows[0]["AdminID"]);
                            string Admincode = (dt.Rows[0]["code"]).ToString();

                            Session["AdminID"] = AdminID;
                            Session["Admincode"] = Admincode;

                            Response.Redirect("TC.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Check Username & Password.....');", true);
                        }
                    }
                    else if (username == "PU")
                    {
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

                            Response.Redirect("../powerUser/ModifyMatches.aspx");
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
}