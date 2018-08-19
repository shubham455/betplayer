using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Windows.Markup;


namespace betplayer.poweruser
{
    public partial class ScoreBoard : System.Web.UI.Page
    {
        string Manual;

        protected void Page_Load(object sender, EventArgs e)
        {
            firebasekey.Value = Request.QueryString["fk"];
            string MatchID = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From Matches Where apiID = '" + MatchID + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                Manual = dt.Rows[0]["Manual"].ToString();



            }

        }

        protected void matchAutoManualSystem_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void matchAutoManualSystem_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string MatchID = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                if (matchAutoManualSystem.SelectedItem.Text == "Automatic")
                {
                    string s = "Update Matches set Manual = '0' Where apiID = '" + MatchID + "'";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    cmd.ExecuteNonQuery();
                }
                else if (matchAutoManualSystem.SelectedItem.Text == "Manual")
                {

                    string s = "Update Matches set Manual = '1' Where apiID = '" + MatchID + "'";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}