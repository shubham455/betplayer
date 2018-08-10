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
    public partial class poweruserdeatils : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable MatchesDataTable { get { return dt; } }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["msg"] == "Add")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Poweruser Added SuccessFully.....');", true);
                }
            }
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From PoweruserMaster where CreatedBy = '" + Session["Admincode"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
            }
        }



        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select* From PoweruserMaster Where Name Like '%" + txtsearch.Text + "%' and  CreatedBy = '" + Session["Admincode"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
            }

        }
    }
}
