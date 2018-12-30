using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Subadmin
{
    public partial class UpdateSuperStokistlimit : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable UpdateDataTable { get { return dt; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string Select = "Select * From SuperStockistMaster";
                MySqlCommand cmd = new MySqlCommand(Select, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);

            }
        }
    }
}