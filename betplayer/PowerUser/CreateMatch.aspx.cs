using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.poweruser
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

                    string datet = DateTime.Now.ToString("dd-MM-yyyy");
                   
                    string s = "Select * From Matches where Active  = '0' order by DateTime DESC";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    dt = new DataTable();
                    adp.Fill(dt);

                    string s4 = "update matches set okay = '0' ";
                    MySqlCommand cmd4 = new MySqlCommand(s4, cn);
                    cmd4.ExecuteNonQuery();

                    for (int i =0; i<dt.Rows.Count; i++)
                    {
                        int id = Convert.ToInt32(dt.Rows[i]["apiid"]);
                        string Date = dt.Rows[i]["Datetime"].ToString();
                        DateTime rowDate = DateTime.Parse(Date.ToString());
                        string fDate = rowDate.Date.ToString("dd-MM-yyyy");


                        if(datet == fDate)
                        {
                            string s1 = "update matches set okay = '1' where apiid = '"+id+"' ";
                            MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                            cmd1.ExecuteNonQuery();
                        }

                    }

                    string s2 = "Select * From Matches where okay  = '1' order by DateTime DESC";
                    MySqlCommand cmd2 = new MySqlCommand(s2, cn);
                    MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                    dt = new DataTable();
                    adp2.Fill(dt);

                }
            }
        }
        public string toTime(object DateTimefromDB)
        {
            DateTime oDate = DateTime.Parse(DateTimefromDB.ToString());
            return oDate.TimeOfDay.ToString();
        }
        public string toDateString(object date)
        {
            DateTime rowDate = DateTime.Parse(date.ToString());
            return rowDate.Date.ToString("dd-MM-yyyy");
        }

    }
}
