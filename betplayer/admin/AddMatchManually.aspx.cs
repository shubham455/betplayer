using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace betplayer.admin
{
    public partial class AddMatchManually : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string s = "insert into Matches() values (); SELECT LAST_INSERT_ID()";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    cmd.Parameters.AddWithValue("@TeamA", txtTeamA.Text);
                    cmd.Parameters.AddWithValue("@TeamB", "");
                    cmd.Parameters.AddWithValue("@TeamC", "");
                    cmd.Parameters.AddWithValue("@Date", "");
                    cmd.Parameters.AddWithValue("@MatchType", "");

                    int ID = Convert.ToInt32(cmd.ExecuteScalar());
                    string s1 = "Select MatchesID From Matches where MatchesID = '" + ID + "' ";
                    MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    txtcode.Text = dt.Rows[0]["MatchesID"].ToString();
                }
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Update Matches set TeamA =@TeamA , TeamB =@TeamB, TeamC =@TeamC, apiID=@MatchesID, DateTime =@DateTime ,Type = @MatchType where MatchesId = @MatchesID";
                MySqlCommand cmd = new MySqlCommand(s, cn);
               
                
                cmd.Parameters.AddWithValue("@MatchesID", txtcode.Text);
                cmd.Parameters.AddWithValue("@TeamA", txtTeamA.Text);
                cmd.Parameters.AddWithValue("@TeamB", txtTeamB.Text);
                cmd.Parameters.AddWithValue("@TeamC", txtTeamC.Text);
                cmd.Parameters.AddWithValue("@DateTime", txtdate1.Text+"T "+txtTime.Text+ ":00.000Z");
                cmd.Parameters.AddWithValue("@MatchType", txtMatchType.Text);
                cmd.ExecuteNonQuery();
                txtcode.Text = "";
                txtTeamA.Text = "";
                txtTeamB.Text = "";
                txtTeamC.Text = "";
                txtdate1.Text = "";
                txtTime.Text = "";
                txtMatchType.Text = "";
            }
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {

        }
    }
}