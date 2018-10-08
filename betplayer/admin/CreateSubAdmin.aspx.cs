using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace betplayer.admin
{
    public partial class CreateSubAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string Select = "Select * From SubAdminMaster where ContactNo = @Contactno ";
                MySqlCommand cmd2 = new MySqlCommand(Select, cn);
                cmd2.Parameters.AddWithValue("@Contactno", txtContactno.Text);
                MySqlDataReader rdr = cmd2.ExecuteReader();
                if (rdr.Read())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('SubAdmin Already Exists.....');", true);
                }
                else
                {
                    rdr.Close();
                    string s = "insert into SubAdminMaster(Name,ContactNo,Password,Date,CreatedBy,status) values (@Name,@ContactNo,@Password,@Date,@CreatedBy,@Status); SELECT LAST_INSERT_ID()";
                    MySqlCommand cmd = new MySqlCommand(s, cn);

                    cmd.Parameters.AddWithValue("@Name", txtname.Text);
                    cmd.Parameters.AddWithValue("@ContactNo", txtContactno.Text);
                    cmd.Parameters.AddWithValue("@Password", txtpassword.Text);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("yyyy/MM/dd"));
                    cmd.Parameters.AddWithValue("@CreatedBy", Session["AdminCode"]);
                    cmd.Parameters.AddWithValue("@status", "Active");

                    int ID = Convert.ToInt16(cmd.ExecuteScalar());
                    string update = "Update SubAdminMaster Set Code = 'SBA" + ID + "'where SubAdminID = '" + ID + "' ";
                    MySqlCommand cmd1 = new MySqlCommand(update, cn);
                    cmd1.ExecuteNonQuery();
                    Response.Redirect("~/Admin/SubAdminDetails.aspx?msg=Add");
                }
            }
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("SubAdminDetails.aspx");
        }
    }
}



