using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;


namespace betplayer.Agent
{
    public partial class ModifyClient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int Id = Convert.ToInt16(Request.QueryString["Id"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                string s = "Select * From ClientMaster where ClientId = '"+Id+"' ";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                txtCode.Text = dt.Rows[0]["ClientID"].ToString();
                txtName.Text = dt.Rows[0]["Name"].ToString();
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                string s = "Update ClientMaster set Name = @Name,Contact_No= @Contact_No,Password=@Password,Client_limit=@Clientlimit,Agent_limit=@Agentlimit,Agent_Share=@Agentshare,Client_Share=@Clientshare,Session_Commision_Type=@SessionType,Status=@Status where ClientId = @ID ";
                MySqlCommand cmd = new MySqlCommand(s, cn);

                cmd.Parameters.AddWithValue("@ID", Session[ClientID]);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Contact_No", txtContactNo.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Clientlimit", txtClientshare.Text);
                cmd.Parameters.AddWithValue("@Agentlimit", txtClientshare.Text);
                cmd.Parameters.AddWithValue("@Agentshare", txtAgentshare.Text);
                cmd.Parameters.AddWithValue("@Clientshare", txtClientshare.Text);
                cmd.Parameters.AddWithValue("@SessionType", SessionDropDown.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Status", DropDownstatus.SelectedItem.Text);

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}