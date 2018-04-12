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
    public partial class ClientDetails : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable MatchesDataTable { get { return dt; } }

        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["msg"] == "Add")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Client Added SuccessFully.....');", true);
                }
            }
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (SqlConnection cn = new SqlConnection(CN))
                {
                    cn.Open();
                    string s = "Select * From ClientMaster";
                    SqlCommand cmd = new SqlCommand(s, cn);
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    adp.Fill(dt);
                }
            }
        


        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(CN))
            {
                cn.Open();
                string s = "Select* From ClientMaster Where Name Like '%" + txtsearch.Text + "%'";
                SqlCommand cmd = new SqlCommand(s, cn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
            }

        }

        public void BindData()
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From ClientMaster";
                SqlCommand cmd = new SqlCommand(s, cn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);


            }
        }

        protected void DropDownstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(CN))
            {
                cn.Open();
                string s = "update  ClientMaster set Status = '" + DropDownstatus.SelectedItem.Text + "' where ClientID = 1";
                SqlCommand cmd = new SqlCommand(s, cn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
                BindData();

            }
        }
        public string delete(string id)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(CN))
            {
                cn.Open();
                string s = "delete from clientmaster  where clientid = '" + id + "'";
                SqlCommand cmd = new SqlCommand(s, cn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
                BindData();
                return dt.ToString();

            }
        }

        protected void CheckboxID_CheckedChanged(object sender, EventArgs e)
        {
            CheckboxID.Checked = true;
        }
    }
}
