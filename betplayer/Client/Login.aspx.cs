using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;

namespace betplayer.Client
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
            if (!IsPostBack)
            {
                FillCapctha();
                if (Session["clientID"] != null )
                {
                    Session.Abandon();
                }
               
               
               
            }
        }
        protected void Submitbtn_Click(object sender, EventArgs e)
        {
            string captcha = (Session["captcha"].ToString());
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

            else if (txtCaptcha.Text != captcha.ToString())
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('captcha invalid....');", true);
            }

            else
            {

                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (SqlConnection cn = new SqlConnection(CN))
                {
                    cn.Open();
                    string SELECT = "Select * from ClientMaster Where Name = '" + txtusername.Text + "' and Password='" + txtpassword.Text + "'";
                    SqlCommand cmd = new SqlCommand(SELECT, cn);
                    SqlDataReader rdr = cmd.ExecuteReader();
                    if (rdr.Read())
                    {
                        rdr.Close();

                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);
                        int ClientID = Convert.ToInt16(dt.Rows[0]["ClientID"]);

                        Session["ClientID"] = ClientID;
                        Session["clientUsername"] = txtusername.Text;
                        Response.Redirect("~/Client/Terms_Condition.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Check Username & Password.....');", true);
                    }
                }
            }
        }
        void FillCapctha()

        {

            try

            {

                Random random = new Random();

                string combination = "0123456789";

                StringBuilder captcha = new StringBuilder();

                for (int i = 0; i < 4; i++)
                {

                    captcha.Append(combination[random.Next(combination.Length)]);

                    Session["captcha"] = captcha.ToString();

                    imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();

                }
            }

            catch

            {

                throw;

            }
        }
        protected void btnRefresh_Click(object sender, EventArgs e)

        {

            FillCapctha();

        }

        protected void btnHOME_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}

