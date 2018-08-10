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
    public partial class Createpoweruser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string Select = "Select * From PoweruserMaster where ContactNo = @Contactno ";
                MySqlCommand cmd2 = new MySqlCommand(Select, cn);
                cmd2.Parameters.AddWithValue("@Contactno", txtContactno.Text);
                MySqlDataReader rdr = cmd2.ExecuteReader();
                if (rdr.Read())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Poweruser Already Exists.....');", true);
                }
                else
                {
                    rdr.Close();
                    string s = "insert into PoweruserMaster(Name,ContactNo,Password,Date,CreatedBy) values (@Name,@ContactNo,@Password,@Date,@CreatedBy); SELECT LAST_INSERT_ID()";
                    MySqlCommand cmd = new MySqlCommand(s, cn);

                    cmd.Parameters.AddWithValue("@Name", txtname.Text);
                    cmd.Parameters.AddWithValue("@ContactNo", txtContactno.Text);
                    cmd.Parameters.AddWithValue("@Password", txtpassword.Text);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("yyyy/MM/dd"));
                    cmd.Parameters.AddWithValue("@CreatedBy", Session["AdminCode"]);

                    int ID = Convert.ToInt16(cmd.ExecuteScalar());
                    string update = "Update PoweruserMaster Set Code = 'PU" + ID + "'where PoweruserID = '" + ID + "' ";
                    MySqlCommand cmd1 = new MySqlCommand(update, cn);
                    cmd1.ExecuteNonQuery();
                    Response.Redirect("~/Admin/PoweruserDetails.aspx?msg=Add");
                }
            }
        }
        

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PoweruserDetails.aspx");
        }
    }
}


