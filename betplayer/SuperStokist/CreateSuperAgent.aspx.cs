using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace betplayer.SuperStokist
{
    public partial class CreateSuperAgent : System.Web.UI.Page
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
                    string s3 = "Select * From SuperstockistMaster where SuperstockistID = '" + Session["SuperstockistID"] + "'";
                    MySqlCommand cmd3 = new MySqlCommand(s3, cn);
                    MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                    DataTable dt3 = new DataTable();
                    adp3.Fill(dt3);

                    int SuperstockistLimit = Convert.ToInt32(dt3.Rows[0]["Currentlimit"]);
                    decimal Total = 0;

                    string SuperstockistCode = dt3.Rows[0]["Agentlimit"].ToString();
                    string s4 = "Select * From SUperAgentMaster where CreatedBy = '" + Session["SuperstockistCode"] + "'";
                    MySqlCommand cmd4 = new MySqlCommand(s4, cn);
                    MySqlDataAdapter adp4 = new MySqlDataAdapter(cmd4);
                    DataTable dt4 = new DataTable();
                    adp4.Fill(dt4);

                    for (int i = 0; i < dt4.Rows.Count; i++)
                    {

                        decimal SuperAgentLimit = Convert.ToDecimal(dt4.Rows[i]["CurrentLimit"]);
                        Total = Total + SuperAgentLimit;

                    }

                    txtSuperstockistlimit.Text = (SuperstockistLimit - Total).ToString();
                    txtSuperstockistShare.Text = dt3.Rows[0]["myshare"].ToString();


                }
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string Select = "Select * From SuperAgentMaster where ContactNo = @Contactno ";
                MySqlCommand cmd2 = new MySqlCommand(Select, cn);
                cmd2.Parameters.AddWithValue("@Contactno", txtContactno.Text);
                MySqlDataReader rdr = cmd2.ExecuteReader();
                if (rdr.Read())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Agent Already Exists.....');", true);
                }
                else
                {
                    rdr.Close();
                    string s = "insert into SuperAgentMaster(Name,ContactNo,Password,Agentlimit,Currentlimit,FixLimit,myshare,mymobAmount,SessionCommisionType,Status,CreatedBy,Date,Mode,MatchCommision,SessionCommision) values (@Name,@Contact_No,@Password,@Agentlimit,@Currentlimit,@FixLimit,@Agentshare,@MobileAppAmount,@SessionType,@Status,@CreatedBy,@Date,@Mode,@MatchCommision,@SessionCommision); SELECT LAST_INSERT_ID()";
                    MySqlCommand cmd = new MySqlCommand(s, cn);

                    cmd.Parameters.AddWithValue("@Name", txtname.Text);
                    cmd.Parameters.AddWithValue("@Contact_No", txtContactno.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@Agentlimit", txtAgentlimit.Text);
                    cmd.Parameters.AddWithValue("@Currentlimit", txtAgentlimit.Text);
                    cmd.Parameters.AddWithValue("@Fixlimit", txtAgentlimit.Text);
                    cmd.Parameters.AddWithValue("@Agentshare", txtAgentShare.Text);
                    cmd.Parameters.AddWithValue("@MobileAppAmount", txtMobileApp.Text);
                    cmd.Parameters.AddWithValue("@SessionType", SessionDropDown.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Status", "Active");
                    cmd.Parameters.AddWithValue("@CreatedBy", Session["SuperStockistcode"]);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Today.ToString("yyyy/MM/dd"));
                    cmd.Parameters.AddWithValue("@Mode", "SuperStockist");
                    cmd.Parameters.AddWithValue("@MatchCommision", MatchCommissionAgent.Value);
                    cmd.Parameters.AddWithValue("@SessionCommision", SessionCommissionAgent.Value);


                    int ID = Convert.ToInt16(cmd.ExecuteScalar());
                    string update = "Update SuperAgentMaster Set Code = 'SA" + ID + "'where SuperAgentID = '" + ID + "' ";
                    MySqlCommand cmd1 = new MySqlCommand(update, cn);
                    cmd1.ExecuteNonQuery();


                    Response.Redirect("SuperAgentDetails.aspx?msg=Add");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

            Response.Redirect("SuperAgentDetails.aspx");

        }
        protected void txtClientlimit_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtSuperstockistlimit.Text) < Convert.ToInt32(txtAgentlimit.Text))
            {
                txtAgentlimit.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('SuperAgent Limit Do not Greater Than SuperStockist Limit.....');", true);
            }
        }

        protected void txtAgentShare_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToDecimal(txtSuperstockistShare.Text) < Convert.ToDecimal(txtAgentShare.Text))
            {
                txtAgentShare.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('SuperAgent Share Do not Greater Than SuperStockist Share.....');", true);
            }
        }


    }
}




