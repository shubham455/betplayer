﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace betplayer.Client
{
    public partial class Change_Password2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {

            }
        }

        protected void btnChangepass_Click(object sender, EventArgs e)
        {
            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('New Password Does not Match');", true);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Give Username.....');", true);
            }
            else
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (SqlConnection cn = new SqlConnection(CN))
                {
                    cn.Open();
                    string SELECT = "Select * from ClientMaster Where Password= '" + txtOldPassword.Text + "'";
                    SqlCommand cmd = new SqlCommand(SELECT, cn);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        rdr.Close();
                        string Update = "Update ClientMaster Set Password = '" + txtConfirmPassword.Text + "' where Password = '" + txtOldPassword.Text + "'";
                        SqlCommand cmd1 = new SqlCommand(Update, cn);
                        cmd1.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Password Update Successfully...');", true);
                        txtOldPassword.Text = "";
                        txtNewPassword.Text = "";
                        txtConfirmPassword.Text = "";
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Old Password Does not Match');", true);
                    }

                }
            }
        }



       
        protected void txtNewPassword_TextChanged(object sender, EventArgs e)
        {
            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('New Password Does not Match');", true);

            }
        }
        protected void txtConfirmPassword_TextChanged(object sender, EventArgs e)
        {
            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('New Password Does not Match');", true);

            }
        }

    }
}