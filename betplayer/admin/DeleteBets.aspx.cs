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
    public partial class DeleteBets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {

                int Id = Convert.ToInt16(Request.QueryString["BetID"]);
                string type = Request.QueryString["type"];

                if (type == "Runner")
                {

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
                        txtClient.Text = dt.Rows[0]["Name"].ToString();
                        txtPosition1.Text = dt.Rows[0]["Position1"].ToString();
                        txtposition2.Text = dt.Rows[0]["Position2"].ToString();
                        txtDate.Text = DateTime.Parse(dt.Rows[0]["DateTime"].ToString()).ToString("yyyy-MM-dd HH:mm:ss");

                    }
                }
                else if (type == "Session")
                {

                }
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt16(Request.QueryString["BetId"]);
            int matchId = Convert.ToInt32(Request.QueryString["matchId"]);
            string type = (Request.QueryString["type"]);

            if (type == "Runner")
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();
                    string delete = "Delete from Runner where RunnerID = '" + Id + "'";
                    MySqlCommand cmd = new MySqlCommand(delete, cn);
                    cmd.ExecuteNonQuery();

                     
                    Response.Redirect("MatchAndSessionPosition.aspx?MatchID=" + matchId);

                }
            }
            else if (type == "Session")
            {

            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgentDetails.aspx");
        }
    }
}