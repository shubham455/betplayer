using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.admin
{
    public partial class Modifypoweruser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {

                int Id = Convert.ToInt16(Request.QueryString["Id"]);
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    string s = "Select * From PoweruserMaster where PoweruserId = '" + Id + "' ";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    txtCode.Text = dt.Rows[0]["Code"].ToString();
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtContactNo.Text = dt.Rows[0]["ContactNo"].ToString();
                    txtPassword.Text = dt.Rows[0]["Password"].ToString();
                }
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt16(Request.QueryString["Id"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Update PoweruserMaster set ContactNo= @Contact_No,Password=@Password where PoweruserId = '" + Id + "' ";
                MySqlCommand cmd = new MySqlCommand(s, cn);


               
                cmd.Parameters.AddWithValue("@Contact_No", txtContactNo.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                
                cmd.ExecuteNonQuery();
                Response.Redirect("PoweruserDetails.aspx");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PoweruserDetails.aspx");
        }
    }
}