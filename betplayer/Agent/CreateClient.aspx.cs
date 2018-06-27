using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Globalization;


namespace Panchayat_System.Admin
{
    public partial class BirthCertificate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string s = "insert into ClientMaster() values (); SELECT LAST_INSERT_ID()";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    int ID = Convert.ToInt32(cmd.ExecuteScalar());
                    string s1 = "Select ClientID From ClientMaster where ClientID = '" + ID + "' ";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    txtcode.Text = "C" + dt.Rows[0]["ClientID"].ToString();

                    string s2 = "Update ClientMaster Set Code = '" + txtcode.Text + "' where ClientID = '"+ID+"'";
                    MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                    cmd2.ExecuteNonQuery();

                    string s3 = "Select Myshare,AgentLimit From AgentMaster where AgentID = '"+Session["AgentID"]+"'";
                    MySqlCommand cmd3 = new MySqlCommand(s3, cn);
                    MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                    DataTable dt3 = new DataTable();
                    adp3.Fill(dt3);
                    txtAgentlimit.Text = dt3.Rows[0]["Agentlimit"].ToString();
                    txtAgentShare2.Text = dt3.Rows[0]["myshare"].ToString();
                }
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string strNewPassword1 = GeneratePassword().ToString();

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string Select = "Select * From ClientMaster where Contact_No = @Contactno ";
                MySqlCommand cmd2 = new MySqlCommand(Select, cn);
                cmd2.Parameters.AddWithValue("@Contactno", txtContactno.Text);
                MySqlDataReader rdr = cmd2.ExecuteReader();
                if (rdr.Read())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Client Already Exists.....');", true);
                }
                else
                {
                    rdr.Close();
                    string s = "update  ClientMaster set  Name = @Name,Contact_No= @Contact_No,Password= @Password,Client_limit= @Clientlimit,Client_Share = @Clientshare,Session_Commision_Type= @Sessiontype,Status=@Status,CreatedBy=@CreatedBy,Date=@Date,Mode=@Mode,FixLimit=@FixLimit where code = @Code";
                    MySqlCommand cmd = new MySqlCommand(s, cn);

                    cmd.Parameters.AddWithValue("@Name", txtname.Text);
                    cmd.Parameters.AddWithValue("@Contact_No", txtContactno.Text);
                    cmd.Parameters.AddWithValue("@Password", strNewPassword1);
                    cmd.Parameters.AddWithValue("@Clientlimit", txtClientlimit.Text);
                    cmd.Parameters.AddWithValue("@Clientshare", txtClientShare.Text);
                    cmd.Parameters.AddWithValue("@SessionType", SessionDropDown.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Status", "active");
                    cmd.Parameters.AddWithValue("@CreatedBy", Session["Agentcode"]);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Today.ToString("yyyy/MM/dd"));
                    cmd.Parameters.AddWithValue("@Mode", "Agent");
                    cmd.Parameters.AddWithValue("@Code", txtcode.Text);
                    cmd.Parameters.AddWithValue("@FixLimit", txtClientlimit.Text);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/Agent/ClientDetails.aspx?msg=Add");
                }
            }
        }
        public string GeneratePassword()
        {
            string PasswordLength = "8";
            string NewPassword = "";

            string allowedChars = "";
            allowedChars = "1,2,3,4,5,6,7,8,9,0";
            allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
            allowedChars += "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";


            char[] sep = { ',' };
            string[] arr = allowedChars.Split(sep);


            string IDString = "";
            string temp = "";

            Random rand = new Random();

            for (int i = 0; i < Convert.ToInt32(PasswordLength); i++)
            {
                temp = arr[rand.Next(0, arr.Length)];
                IDString += temp;
                NewPassword = IDString;

            }
            return NewPassword;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Delete from  ClientMaster where Code = '"+txtcode.Text+"'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.ExecuteNonQuery();
                Response.Redirect("ClientDetails.aspx");
            }
        }

        protected void txtClientlimit_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtAgentlimit.Text) < Convert.ToInt32(txtClientlimit.Text))
            {
                txtClientlimit.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Client Limit Do not Greater Than Agent Limit.....');", true);
            }
        }

        protected void txtAgentShare_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToDecimal(txtAgentShare.Text) > Convert.ToDecimal(txtAgentShare2.Text))
            {
                txtAgentShare.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Agent Share Do not Greater Than My Share.....');", true);
            }
        }
    }
}




