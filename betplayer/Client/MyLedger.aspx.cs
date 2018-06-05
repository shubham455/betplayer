using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Client
{
    public partial class MyLedger : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable MatchesDataTable { get { return dt; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            int ClientID = Convert.ToInt32(Session["ClientID"]);
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string SELECT = "select matches.TeamA,matches.TeamB,matches.DateTime,clientledger.Amount,clientledger.Dabit,clientledger.Credit from matches inner Join ClientLedger on matches.apiID = Clientledger.MatchID where clientledger.ClientID= @ClientID";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                cmd.Parameters.AddWithValue("@ClientID", ClientID);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    string TeamA = dt.Rows[0]["TeamA"].ToString();
                    string TeamB = dt.Rows[0]["TeamB"].ToString();
                    foreach (DataRow row in dt.Rows)
                    {
                        string timeFromDB = row["DateTime"].ToString();
                        //DateTime oDate = DateTime.ParseExact(timeFromDB, "yyyy-MM-ddTHH:mm tt", System.Globalization.CultureInfo.InvariantCulture);
                        DateTime oDate = DateTime.Parse(timeFromDB);
                        string datetime = "Date: " + oDate.Date.ToString().Substring(0,10);
                        row["DateTime"] = datetime;
                    }

                }

                for (int i = 0; i< dt.Rows.Count;  i++)
                {
                    int Amount = Convert.ToInt32(dt.Rows[0]["Amount"]);
                   

                }

            }
        }
    }
}