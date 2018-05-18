using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.admin
{
    public partial class CreateMatch : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable MatchesDataTable { get { return dt; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string s = "Select * From Matches where Active  = '0'";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    adp.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        DateTime DateTimeFromDB = Convert.ToDateTime(dt.Rows[0]["DateTime"]);
                        Time(DateTimeFromDB);
                        foreach (DataRow row in dt.Rows)
                        {
                            string timeFromDB = row["DateTime"].ToString();
                            //DateTime oDate = DateTime.ParseExact(timeFromDB, "yyyy-MM-ddTHH:mm tt", System.Globalization.CultureInfo.InvariantCulture);
                            DateTime oDate = DateTime.Parse(timeFromDB);
                            string datetime = "Date: " + oDate.Date.ToString() + " Time: " + oDate.TimeOfDay.ToString();
                            string date = oDate.Date.ToString("yyyy-MM-dd");
                            string time = oDate.TimeOfDay.ToString();
                            row["DateTime"] = time;


                        }
                    }
                    else { }

                }
            }
        }
        public string Time(DateTime DateTimefromDB)
        {

            //DateTime oDate = DateTime.ParseExact(timeFromDB, "yyyy-MM-ddTHH:mm tt", System.Globalization.CultureInfo.InvariantCulture);
            DateTime oDate = DateTime.Parse(DateTimefromDB.ToString());
            string datetime = "Time: " + oDate.TimeOfDay.ToString();
            string date = oDate.Date.ToString("yyyy-MM-dd");
            string time = oDate.TimeOfDay.ToString();
            return date;
        }
    }
}
