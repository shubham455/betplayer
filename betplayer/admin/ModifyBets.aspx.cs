﻿using System;
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
    public partial class ModifyBets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {

                int Id = Convert.ToInt16(Request.QueryString["BetID"]);
                string type = Request.QueryString["type"];

                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    string s = "select runner.runnerID,runner.Amount,runner.rate,runner.Mode,runner.DateTime,runner.Team,runner.clientID,clientmaster.Name,clientmaster.CreatedBy,runner.Position1,runner.Position2 from Runner inner join clientmaster on runner.ClientID = clientmaster.ClientID where  Runner.RunnerID = '" + Id + "' ";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    txtcode.Text = dt.Rows[0]["RunnerID"].ToString();
                    txtRate.Text = dt.Rows[0]["Rate"].ToString();
                    txtAmount.Text = dt.Rows[0]["Amount"].ToString();
                    txtMode.Text = dt.Rows[0]["Mode"].ToString();
                    txtTeam.Text = dt.Rows[0]["Team"].ToString();

                    txtPosition1.Text = dt.Rows[0]["Position1"].ToString();
                    txtposition2.Text = dt.Rows[0]["Position2"].ToString();
                    txtDate.Text = DateTime.Parse(dt.Rows[0]["DateTime"].ToString()).ToString("yyyy-MM-dd HH:mm:ss");

                }
            }
        }



        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt16(Request.QueryString["BetId"]);
            int matchId = Convert.ToInt32(Request.QueryString["matchId"]);
            string firebasekey = Request.QueryString["fk"].ToString();
            string type = (Request.QueryString["type"]);


            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Update Runner set Rate= @Rate,Amount=@Amount,Mode=@Mode,Team=@Team,Position1 = @Position1,Position2=@Position2,DateTime= @DateTime  where RunnerID = '" + Id + "' ";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@Rate", txtRate.Text);
                cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
                cmd.Parameters.AddWithValue("@Mode", txtMode.Text);
                cmd.Parameters.AddWithValue("@Team", txtTeam.Text);
                cmd.Parameters.AddWithValue("@Position1", txtPosition1.Text);
                cmd.Parameters.AddWithValue("@Position2", txtposition2.Text);

                cmd.Parameters.AddWithValue("@DateTime", (txtDate.Text));

                cmd.ExecuteNonQuery();

                string s1 = "insert into updatedRunnerBets (RunnerID,Rate,Amount,Mode,Team,Position1,Position2,DateTime,Remark) values(@RunnerID,@Rate1,@Amount,@Mode,@Team,@Position1,@Position2,@DateTime,@Remark)";
                MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                cmd1.Parameters.AddWithValue("@RunnerID", Id);
                cmd1.Parameters.AddWithValue("@Rate1", txtRate.Text);
                cmd1.Parameters.AddWithValue("@Amount", txtAmount.Text);
                cmd1.Parameters.AddWithValue("@Mode", txtMode.Text);
                cmd1.Parameters.AddWithValue("@Team", txtTeam.Text);
                cmd1.Parameters.AddWithValue("@Position1", txtPosition1.Text);
                cmd1.Parameters.AddWithValue("@Position2", txtposition2.Text);
                cmd1.Parameters.AddWithValue("@DateTime", (txtDate.Text));
                cmd1.Parameters.AddWithValue("@Remark", (txtRemark.Text));
                cmd1.ExecuteNonQuery();

                if (type == "Match")
                {
                    Response.Redirect("MatchAndSessionPosition.aspx?MatchID=" + matchId + "&&fk=" + firebasekey);

                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            int matchId = Convert.ToInt32(Request.QueryString["matchId"]);
            string firebasekey = Request.QueryString["fk"].ToString();
            Response.Redirect("MatchAndSessionPosition.aspx?MatchID=" + matchId + "&&fk=" + firebasekey);
        }
    }
}