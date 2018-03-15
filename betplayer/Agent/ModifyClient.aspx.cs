using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace betplayer.Agent
{
    public partial class ModifyClient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID = Convert.ToInt16(Request.QueryString["ClientID"]);
            if (!IsPostBack)
            {
                if (ID != 0)
                {
                    string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                    using (SqlConnection cn = new SqlConnection(CN))
                    {
                        cn.Open();
                        string s = "select * from ClientMaster where ClientID= '" + ID + "'";
                        SqlCommand cmd = new SqlCommand(s, cn);
                        SqlDataAdapter adp = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);

                        txtcode.Text = dt.Rows[0]["ClientID"].ToString();
                        txtname.Text = dt.Rows[0]["Name"].ToString();
                        txtcontactno.Text = dt.Rows[0]["Contact_No"].ToString();
                        txtpassword.Text = dt.Rows[0]["Password"].ToString();
                        txtclientlimit.Text = dt.Rows[0]["Client_limit"].ToString();
                        txtAgentLimit.Text = dt.Rows[0]["Agent_limit"].ToString();
                        txtAgentShare.Text = dt.Rows[0]["Agent_share"].ToString();
                        txtClientShare.Text = dt.Rows[0]["client_share"].ToString();
                        DropDownList1.SelectedItem.Text = dt.Rows[0]["Session_Commision_Type"].ToString();
                    }
                }
            }
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt16(Request.QueryString["ClientID"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(CN))
            {
                cn.Open();
                string s = "Update ClientMaster Set Name=@Name, Contact_No = @ContactNo, Password = @Password, Client_limit = @Client_limit, Agent_limit = @Agent_limit, Agent_Share = @Agent_Share, Client_Share = @Client_Share, Session_Commision_Type = @Session_Commision where ClientID = '" + ID + "'";
                SqlCommand cmd = new SqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@Name", txtname.Text);
                cmd.Parameters.AddWithValue("@ContactNo", txtcontactno.Text);
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text);

                cmd.Parameters.AddWithValue("@Client_limit", txtclientlimit.Text);
                cmd.Parameters.AddWithValue("@Agent_limit", txtAgentLimit.Text);
                cmd.Parameters.AddWithValue("@Agent_Share", txtAgentShare.Text);
                cmd.Parameters.AddWithValue("@Client_Share", txtClientShare.Text);

                cmd.Parameters.AddWithValue("@Session_Commision", DropDownList1.SelectedItem.Text);

                cmd.ExecuteNonQuery();
                Response.Redirect("~/Agent/ClientDetails.aspx?msg=Update");

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientDetails.aspx");
        }
    }

}
