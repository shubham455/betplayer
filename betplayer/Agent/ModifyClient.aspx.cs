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
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {

                int Id = Convert.ToInt16(Request.QueryString["Id"]);
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    string s = "Select * From ClientMaster where ClientId = '" + Id + "' ";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    txtCode.Text = dt.Rows[0]["ClientID"].ToString();
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtContactNo.Text = dt.Rows[0]["Contact_No"].ToString();
                    txtPassword.Text = dt.Rows[0]["Password"].ToString();
                    txtclientLimit.Text = dt.Rows[0]["Client_Limit"].ToString();
                    DropDownMobileApp.SelectedItem.Text = dt.Rows[0]["MobileApp"].ToString();
                    DropDownstatus.SelectedItem.Text = dt.Rows[0]["Status"].ToString();
                    txtAgentshare.Text = dt.Rows[0]["Agent_Share"].ToString();
                    txtClientshare.Text = dt.Rows[0]["Client_Share"].ToString();
                    SessionDropDown.SelectedItem.Text = dt.Rows[0]["Session_Commision_Type"].ToString();

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
                string s = "Update ClientMaster set Name = @Name,Contact_No= @Contact_No,Password=@Password,Client_limit=@Clientlimit,Agent_Share=@Agentshare,Client_Share=@Clientshare,Session_Commision_Type=@SessionType,Status=@Status,MobileApp = @MobileApp where ClientId = '"+Id+"' ";
                MySqlCommand cmd = new MySqlCommand(s, cn);

                
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Contact_No", txtContactNo.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Clientlimit", txtclientLimit.Text);
                cmd.Parameters.AddWithValue("@Agentshare", txtAgentshare.Text);
                cmd.Parameters.AddWithValue("@Clientshare", txtClientshare.Text);
                cmd.Parameters.AddWithValue("@SessionType", SessionDropDown.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Status", DropDownstatus.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@MobileApp", DropDownMobileApp.SelectedItem.Text);

                cmd.ExecuteNonQuery();
                Response.Redirect("ClientDetails.aspx?msg=Update");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientDetails.aspx");
        }
    }
}