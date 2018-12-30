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
    public partial class BetDetails_Declare : System.Web.UI.Page
    {
        private DataTable dt;
        private DataTable dt1;
        private DataTable Sessiondt;
        private DataTable dt5;
        private DataTable dt6 = new DataTable();
        private DataTable dt9 = new DataTable();

        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }
        public DataTable SessionDataTable { get { return dt6; } }
        public DataTable FancyDataTable { get { return dt9; } }

        protected void Page_Load(object sender, EventArgs e)
        {


            dt6.Columns.Add(new DataColumn("SessionID"));
            dt6.Columns.Add(new DataColumn("Session"));
            dt6.Columns.Add(new DataColumn("Rate"));
            dt6.Columns.Add(new DataColumn("Amount"));
            dt6.Columns.Add(new DataColumn("Runs"));
            dt6.Columns.Add(new DataColumn("Mode"));
            dt6.Columns.Add(new DataColumn("DateTime"));
            dt6.Columns.Add(new DataColumn("Dec"));

            dt9.Columns.Add(new DataColumn("SessionID"));
            dt9.Columns.Add(new DataColumn("Session"));
            dt9.Columns.Add(new DataColumn("Rate"));
            dt9.Columns.Add(new DataColumn("Amount"));
            dt9.Columns.Add(new DataColumn("Runs"));
            dt9.Columns.Add(new DataColumn("Mode"));
            dt9.Columns.Add(new DataColumn("DateTime"));
            dt9.Columns.Add(new DataColumn("Dec"));


            string ClientID = Session["ClientID"] != null ? Session["ClientID"].ToString() : null;
            if (ClientID != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            int MatchID = Convert.ToInt32(Request.QueryString["id"]);

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From Runner where MatchID = @MatchID && ClientID =@ClientID order by DateTime DESC ";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@ClientID", ClientID);
                cmd.Parameters.AddWithValue("@MatchID", MatchID);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);


                string s1 = "Select TeamA,TeamB,WinnerTeam From Matches where apiID = @MatchID";
                MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                cmd1.Parameters.AddWithValue("@MatchID", MatchID);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                dt1 = new DataTable();
                adp1.Fill(dt1);
                string TeamA = dt1.Rows[0]["TeamA"].ToString();
                string TeamB = dt1.Rows[0]["TeamB"].ToString();
                lblteamA.Text = TeamA;
                lblteamB.Text = TeamB;
                string winnerteam = "";

                if (dt.Rows.Count > 0)
                {
                    lblteamA.Text = dt1.Rows[0]["TeamA"].ToString();
                    lblteamB.Text = dt1.Rows[0]["TeamB"].ToString();
                    winnerteam = dt1.Rows[0]["WinnerTeam"].ToString();
                }
                string winnerteamposition = "";
                if (winnerteam == TeamA)
                {
                    winnerteamposition = "position1";
                }
                else if (winnerteam == TeamB)
                {
                    winnerteamposition = "position2";
                }

                string checkbets = "Select * From Positions Where MatchID = '" + MatchID + "' && ClientID = '" + ClientID + "'";
                MySqlCommand checkbetscmd = new MySqlCommand(checkbets, cn);
                MySqlDataAdapter checkbetsadp = new MySqlDataAdapter(checkbetscmd);
                DataTable checkbetsdt = new DataTable();
                checkbetsadp.Fill(checkbetsdt);
                int FinalBetAmount = 0;

                if (winnerteamposition == "position1")
                {
                    FinalBetAmount = Convert.ToInt32(checkbetsdt.Rows[0]["Position1"]);
                }
                else if (winnerteamposition == "position2")
                {
                    FinalBetAmount = Convert.ToInt32(checkbetsdt.Rows[0]["Position2"]);
                }

                if (FinalBetAmount > 0)
                {
                    lblMatch.Text = "You Won(" + FinalBetAmount + ")Coins";
                }
                if (FinalBetAmount < 0)
                {
                    lblMatch.Text = "You Lose(" + FinalBetAmount + ")Coins";
                }

                int TotalAmount1 = 0;
                string Amount = "Select TotalAmount from SessionCalculation where MatchID = @MatchID && ClientID =@ClientID";
                MySqlCommand Amountcmd = new MySqlCommand(Amount, cn);
                Amountcmd.Parameters.AddWithValue("@ClientID", ClientID);
                Amountcmd.Parameters.AddWithValue("@MatchID", MatchID);
                MySqlDataAdapter Amountadp = new MySqlDataAdapter(Amountcmd);
                DataTable Amountdt = new DataTable();
                Amountadp.Fill(Amountdt);
                if (Amountdt.Rows.Count > 0)
                {
                    int TotalAmount = 0;


                    for (int i = 0; i < Amountdt.Rows.Count; i++)
                    {
                        TotalAmount = Convert.ToInt32(Amountdt.Rows[i]["TotalAmount"]);
                        TotalAmount1 = TotalAmount1 + TotalAmount;
                    }
                    TotalAmount = 0;

                    if (TotalAmount1 > 0)
                    {
                        lblSession.Text = "You Won(" + TotalAmount1 + ")Coins";
                    }
                    if (TotalAmount1 < 0)
                    {
                        lblSession.Text = "You Lose(" + TotalAmount1 + ")Coins";
                    }

                }
                int FinalPlusminus = (FinalBetAmount + TotalAmount1) - 100;
                if (FinalPlusminus > 0)
                {
                    lblfinalAmount.Text = "You Won(" + FinalPlusminus + ")Coins";
                }
                if (FinalPlusminus < 0)
                {
                    lblfinalAmount.Text = "You Lose(" + FinalPlusminus + ")Coins";
                }


                string selectSession = "select Session From Session  where ClientID  = @ClientID && MatchID = @MatchID && SessionBetType ='Session'  group by Session ";
                MySqlCommand selectSessioncmd = new MySqlCommand(selectSession, cn);
                selectSessioncmd.Parameters.AddWithValue("@MatchID", MatchID);
                selectSessioncmd.Parameters.AddWithValue("@ClientID", ClientID);
                MySqlDataAdapter selectSessionadp = new MySqlDataAdapter(selectSessioncmd);
                DataTable selectSessiondt = new DataTable();
                selectSessionadp.Fill(selectSessiondt);


                for (int i = 0; i < selectSessiondt.Rows.Count; i++)
                {
                    string Sessionname = selectSessiondt.Rows[i]["Session"].ToString();

                    string selectDeclaredSession = "select * from declaredSession where Session = '" + Sessionname + "' && MatchID = '" + MatchID + "' ";
                    MySqlCommand selectDeclaredSessioncmd = new MySqlCommand(selectDeclaredSession, cn);
                    MySqlDataReader rdr1 = selectDeclaredSessioncmd.ExecuteReader();

                    if (rdr1.Read())
                    {
                        rdr1.Close();
                        string selectSession1 = "select Session.SessionID, Session.session,Session.rate,Session.Amount,Session.Runs,Session.Mode,Session.DateTime,DeclaredSession.DeclareRun from Session inner join declaredSession on Session.Session = DeclaredSession.Session && Session.MatchID  = DeclaredSession.MatchID where Session.Session = '" + Sessionname + "' && declaredsession.MatchID = '" + MatchID + "' && Session.ClientID = '" + Session["ClientID"] + "'";
                        MySqlCommand selectSessioncmd1 = new MySqlCommand(selectSession1, cn);
                        MySqlDataAdapter selectSessionadp1 = new MySqlDataAdapter(selectSessioncmd1);
                        dt5 = new DataTable();
                        selectSessionadp1.Fill(dt5);

                    }

                    IEnumerable<DataRow> orderedRows = dt5.AsEnumerable();
                    DataTable dt7 = orderedRows.CopyToDataTable();
                    foreach (DataRow row in dt7.Rows)
                    {
                        dt6.Rows.Add(row.ItemArray);
                    }
                }

                string selectfancy = "select Session From Session  where ClientID  = @ClientID && MatchID = @MatchID && SessionBetType ='Fancy'  group by Session ";
                MySqlCommand selectfancycmd = new MySqlCommand(selectfancy, cn);
                selectfancycmd.Parameters.AddWithValue("@MatchID", MatchID);
                selectfancycmd.Parameters.AddWithValue("@ClientID", ClientID);
                MySqlDataAdapter selectfancyadp = new MySqlDataAdapter(selectfancycmd);
                DataTable selectfancydt = new DataTable();
                selectfancyadp.Fill(selectfancydt);


                for (int i = 0; i < selectfancydt.Rows.Count; i++)
                {
                    string Sessionname = selectfancydt.Rows[i]["Session"].ToString();

                    string selectDeclaredSession = "select * from declaredSession where Session = '" + Sessionname + "' && MatchID = '" + MatchID + "' ";
                    MySqlCommand selectDeclaredSessioncmd = new MySqlCommand(selectDeclaredSession, cn);
                    MySqlDataReader rdr1 = selectDeclaredSessioncmd.ExecuteReader();

                    if (rdr1.Read())
                    {
                        rdr1.Close();
                        string selectfancy1 = "select Session.SessionID, Session.session,Session.rate,Session.Amount,Session.Runs,Session.Mode,Session.DateTime,DeclaredSession.DeclareRun from Session inner join declaredSession on Session.Session = DeclaredSession.Session where Session.Session = '" + Sessionname + "' && declaredsession.MatchID = '" + MatchID + "' && Session.ClientID = '" + Session["ClientID"] + "'";
                        MySqlCommand selectfancycmd1 = new MySqlCommand(selectfancy1, cn);
                        MySqlDataAdapter selectfancyadp1 = new MySqlDataAdapter(selectfancycmd1);
                        dt5 = new DataTable();
                        selectfancyadp1.Fill(dt5);

                    }

                    IEnumerable<DataRow> orderedRows = dt5.AsEnumerable();
                    DataTable dt8 = orderedRows.CopyToDataTable();
                    foreach (DataRow row in dt8.Rows)
                    {
                        dt9.Rows.Add(row.ItemArray);
                    }
                }

            }
        }
    }
}