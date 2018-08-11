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
    public partial class ModifySessionBets : System.Web.UI.Page
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
                    string s = "select Session.SessionID,session.session,session.rate,session.Amount,session.runs,session.Mode,session.DateTime,session.Team,session.clientID,clientmaster.Name,clientmaster.CreatedBy from Session inner join clientmaster on session.ClientID = clientmaster.ClientID where  Session.SessionID = '" + Id + "' ";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    txtcode.Text = dt.Rows[0]["SessionID"].ToString();
                    txtSession.Text = dt.Rows[0]["session"].ToString();
                    txtRate.Text = dt.Rows[0]["Rate"].ToString();
                    txtAmount.Text = dt.Rows[0]["Amount"].ToString();
                    txtruns.Text = dt.Rows[0]["runs"].ToString();
                    txtMode.Text = dt.Rows[0]["Mode"].ToString();
                    txtTeam.Text = dt.Rows[0]["Team"].ToString();
                    txtDate.Text = DateTime.Parse(dt.Rows[0]["DateTime"].ToString()).ToString("yyyy-MM-dd HH:mm:ss");

                }
            }

        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt16(Request.QueryString["BetId"]);
            int matchId = Convert.ToInt32(Request.QueryString["matchId"]);
            string firebasekey = Request.QueryString["fk"];
            string Session = Request.QueryString["Session"];
            string type = (Request.QueryString["type"]);


            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Update Session set Rate= @Rate,Amount=@Amount,Mode=@Mode,Team=@Team,DateTime= @DateTime  where SessionID = '" + Id + "' ";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@Rate", txtRate.Text);
                cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
                cmd.Parameters.AddWithValue("@Mode", txtMode.Text);
                cmd.Parameters.AddWithValue("@Team", txtTeam.Text);
                cmd.Parameters.AddWithValue("@DateTime", (txtDate.Text));
                cmd.ExecuteNonQuery();

                string s1 = "insert into updatedSessionBets (SessionID,Session,Rate,Amount,Mode,Team,DateTime,Remark) values(@SessionID,@Session,@Rate,@Amount,@Mode,@Team,@DateTime,@Remark)";
                MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                cmd1.Parameters.AddWithValue("@SessionID", Id);
                cmd1.Parameters.AddWithValue("@Session", txtSession.Text);
                cmd1.Parameters.AddWithValue("@Rate", txtRate.Text);
                cmd1.Parameters.AddWithValue("@Amount", txtAmount.Text);
                cmd1.Parameters.AddWithValue("@Mode", txtMode.Text);
                cmd1.Parameters.AddWithValue("@Team", txtTeam.Text);
                cmd1.Parameters.AddWithValue("@DateTime", (txtDate.Text));
                cmd1.Parameters.AddWithValue("@Remark", (txtRemark.Text));
                cmd1.ExecuteNonQuery();

                if (type == "Match")
                {
                    Response.Redirect("MatchAndSessionSPosition.aspx?MatchID=" + matchId + "&&Session=" + Session + "&&fk=" + firebasekey);
                }
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            int matchId = Convert.ToInt32(Request.QueryString["matchId"]);
            string firebasekey = Request.QueryString["fk"];
            string Session = Request.QueryString["Session"];
            Response.Redirect("MatchAndSessionSPosition.aspx?MatchID=" + matchId + "&&Session=" + Session + "&&fk=" + firebasekey);
        }
    }
}