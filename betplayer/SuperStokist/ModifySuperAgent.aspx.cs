using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.SuperStokist
{
    public partial class ModifySuperAgent : System.Web.UI.Page
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
                    string s = "Select * From SuperAgentMaster where SuperAgentID = '" + Id + "' ";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    txtcode.Text = dt.Rows[0]["Code"].ToString();
                    txtname.Text = dt.Rows[0]["Name"].ToString();
                    txtContactno.Text = dt.Rows[0]["ContactNo"].ToString();
                    txtPassword.Text = dt.Rows[0]["Password"].ToString();
                    txtAgentlimit.Text = dt.Rows[0]["Agentlimit"].ToString();
                    txtAgentShare.Text = dt.Rows[0]["myshare"].ToString();
                    txtMobileApp.Text = dt.Rows[0]["mymobamount"].ToString();
                    SessionDropDown.SelectedItem.Text = dt.Rows[0]["SessioncommisionType"].ToString();
                    MatchCommissionAgent.Value = dt.Rows[0]["MatchCommision"].ToString();
                    SessionCommissionAgent.Value = dt.Rows[0]["SessionCommision"].ToString();

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
                string s = "Update SuperAgentmaster set ContactNo= @ContactNo,Password=@Password,Agentlimit=@Agentlimit,myshare=@Agentshare,myMobAmount = @MobileApp,SessionCommisionType=@SessionType,MatchCommision= @MatchCommision,SessionCommision =@SessionCommision where SuperAgentID = '" + Id + "' ";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@ContactNo", txtContactno.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Agentlimit", txtAgentlimit.Text);
                cmd.Parameters.AddWithValue("@Agentshare", txtAgentShare.Text);
                cmd.Parameters.AddWithValue("@MobileApp", txtMobileApp.Text);
                cmd.Parameters.AddWithValue("@SessionType", SessionDropDown.SelectedItem.Text);
                if (MatchCommissionAgent.Value == "")
                {
                    MatchCommissionAgent.Value = "0";
                }
                if (SessionCommissionAgent.Value == "")
                {
                    SessionCommissionAgent.Value = "0";
                }
                cmd.Parameters.AddWithValue("@MatchCommision", MatchCommissionAgent.Value);
                cmd.Parameters.AddWithValue("@SessionCommision", SessionCommissionAgent.Value);

                cmd.ExecuteNonQuery();
                Response.Redirect("SuperAgentDetails.aspx?msg=Update");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("SuperAgentDetails.aspx");
        }
    }
}