using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;


namespace betplayer
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

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
                    if (username == "A")
                    {

                        string SELECT = "Select * from AgentMaster Where Code = '" + txtusername.Text + "' and Password='" + txtpassword.Text + "' and Status = 'active'";
                        MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                        MySqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            rdr.Close();

                            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            int AgentID = Convert.ToInt16(dt.Rows[0]["AgentID"]);
                            string Agentcode = (dt.Rows[0]["Code"]).ToString();

                            Session["AgentID"] = AgentID;
                            Session["Agentcode"] = Agentcode;

                            Response.Redirect("TC.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Check Username & Password.....');", true);
                        }
                    }
                    else if (username == "SA")
                    {
                        string SELECT = "Select * from SuperAgentMaster Where Code = '" + txtusername.Text + "' and Password='" + txtpassword.Text + "'";
                        MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                        MySqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            rdr.Close();

                            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            int SuperAgentID = Convert.ToInt16(dt.Rows[0]["SuperAgentID"]);
                            string SuperAgentCode = dt.Rows[0]["Code"].ToString();

                            Session["SuperAgentID"] = SuperAgentID;
                            Session["SuperAgentCode"] = SuperAgentCode;

                            Response.Redirect("../Superagent/TC.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Check Username & Password.....');", true);
                        }
                    }
                    else if (username == "SS")
                    {
                        string SELECT = "Select * from SuperStockistMaster Where Code = '" + txtusername.Text + "' and Password='" + txtpassword.Text + "'";
                        MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                        MySqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            rdr.Close();

                            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            int SuperStockistID = Convert.ToInt16(dt.Rows[0]["SuperStockistID"]);
                            string SuperStockistCode = dt.Rows[0]["Code"].ToString();

                            Session["SuperStockistID"] = SuperStockistID;
                            Session["SuperStockistCode"] = SuperStockistCode;

                            Response.Redirect("../Superstokist/TC.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Check Username & Password.....');", true);
                        }
                    }
                    else if (username == "SBA")
                    {
                        string SELECT = "Select * from SubAdminMaster Where Code = '" + txtusername.Text + "' and Password='" + txtpassword.Text + "'";
                        MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                        MySqlDataReader rdr = cmd.ExecuteReader();
                        if (rdr.Read())
                        {
                            rdr.Close();

                            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            int SubAdminID = Convert.ToInt16(dt.Rows[0]["SubAdminID"]);
                            string Admincode = (dt.Rows[0]["code"]).ToString();

                            Session["subAdminID"] = SubAdminID;
                            Session["subAdmincode"] = Admincode;

                            Response.Redirect("../SubAdmin/TC.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Check Username & Password.....');", true);
                        }
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