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
    public partial class ModifySuperSuperstockist : System.Web.UI.Page
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
                    string s = "Select * From SuperstockistMaster where SuperstockistID = '" + Id + "' ";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    txtcode.Text = dt.Rows[0]["Code"].ToString();
                    txtname.Text = dt.Rows[0]["Name"].ToString();
                    txtContactno.Text = dt.Rows[0]["ContactNo"].ToString();
                    txtPassword.Text = dt.Rows[0]["Password"].ToString();
                    txtSuperstockistlimit.Text = dt.Rows[0]["Currentlimit"].ToString();
                    txtSuperstockistShare.Text = dt.Rows[0]["myshare"].ToString();
                    txtMobileApp.Text = dt.Rows[0]["mymobamount"].ToString();
                    SessionDropDown.SelectedItem.Text = dt.Rows[0]["SessioncommisionType"].ToString();
                    MatchCommissionSuperstockist.Value = dt.Rows[0]["MatchCommision"].ToString();
                    SessionCommissionSuperstockist.Value = dt.Rows[0]["SessionCommision"].ToString();

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
                string s = "Update Superstockistmaster set ContactNo= @ContactNo,Password=@Password,CurrentLimit=@Superstockistlimit,myshare=@Superstockistshare,myMobAmount = @MobileApp,SessionCommisionType=@SessionType,MatchCommision= @MatchCommision,SessionCommision =@SessionCommision where SuperstockistID = '" + Id + "' ";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@ContactNo", txtContactno.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Superstockistlimit", txtSuperstockistlimit.Text);
                cmd.Parameters.AddWithValue("@Superstockistshare", txtSuperstockistShare.Text);
                cmd.Parameters.AddWithValue("@MobileApp", txtMobileApp.Text);
                cmd.Parameters.AddWithValue("@SessionType", SessionDropDown.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@MatchCommision", MatchCommissionSuperstockist.Value);
                cmd.Parameters.AddWithValue("@SessionCommision", SessionCommissionSuperstockist.Value);

                cmd.ExecuteNonQuery();
                Response.Redirect("SuperstockistDetails.aspx");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("SuperstockistDetails.aspx");
        }
    }
}