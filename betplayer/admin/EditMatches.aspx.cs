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
    public partial class EditMatches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                int Id = Convert.ToInt16(Request.QueryString["MatchID"]);
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    string s = "Select * From Matches where MatchesID = '" + Id + "' ";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    txtcode.Text = dt.Rows[0]["MatchesID"].ToString();
                    txtTeamA.Text = dt.Rows[0]["TeamA"].ToString();
                    txtTeamB.Text = dt.Rows[0]["TeamB"].ToString();
                    txtTime.Text = dt.Rows[0]["DateTime"].ToString();
                    txtMatchType.Text = dt.Rows[0]["Type"].ToString();
                }
            }
        }
        protected void submit_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["MatchID"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Update Matches set MatchesId = @MatchesID, TeamA = @TeamA, TeamB = @TeamB, DateTime= @Time, Type = @Type  where matchesID = '" + id + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@MatchesID", txtcode.Text);
                cmd.Parameters.AddWithValue("@TeamA", txtTeamA.Text);
                cmd.Parameters.AddWithValue("@TeamB", txtTeamB.Text);
                cmd.Parameters.AddWithValue("@Time", txtTime.Text);
                cmd.Parameters.AddWithValue("@Type", txtMatchType.Text);


                cmd.ExecuteNonQuery();

                Response.Redirect("ModifyMatches.aspx?msg=Add");

            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyMatches.aspx");
        }
    }
}