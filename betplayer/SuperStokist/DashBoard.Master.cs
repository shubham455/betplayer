﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.SuperStokist
{
    public partial class DashBoard : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SuperStockistID"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string SELECT = "Select Name,status From SuperStockistMaster where SuperStockistID = '" + Session["SuperStockistID"] + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    lbl1.Text = dt.Rows[0]["Name"].ToString();
                    string status = dt.Rows[0]["status"].ToString();

                    if(status == "Inactive")
                    {
                        Response.Redirect("login.aspx");
                    }

                }
            }
        }
    }
}
