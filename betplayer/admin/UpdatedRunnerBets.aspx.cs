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
    public partial class UpdatedBets : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable MatchDataTable { get { return dt; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From updatedrunnerbets";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DateTime DateFromDB = Convert.ToDateTime(dt.Rows[0]["DateTime"]);
                    Date(DateFromDB);
                }
            }
        }
        public string Date(DateTime DateTimefromDB)
        {
            DateTime oDate = DateTime.Parse(DateTimefromDB.ToString());
            string datetime = "Time: " + oDate.TimeOfDay.ToString();
            string date = oDate.Date.ToString("dd-MM-yyyy");
            string time = oDate.TimeOfDay.ToString();
            return date;
        }
    }
}