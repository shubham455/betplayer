using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.Client
{
    public partial class BetDetails : System.Web.UI.Page
    {


        private DataTable dt;
        private DataTable dt1;
        private DataTable dt2;
        private DataTable dt3;
        public DataTable MatchesDataTable { get { return dt; } }
        public DataTable MatchesDataTable1 { get { return dt1; } }
        public DataTable MatchesDataTable2 { get { return dt2; } }
        public DataTable MatchesDataTable3 { get { return dt3; } }
        protected void Page_Load(object sender, EventArgs e)
        {

            apiID.Value = Request.QueryString["id"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string SELECT = "Select * from Matches Where apiID = '" + apiID.Value + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);

                string SMatches = "Select * from Matches where Status = '1' && Active = '1'";
                MySqlCommand cmd1 = new MySqlCommand(SMatches, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                dt1 = new DataTable();
                adp1.Fill(dt1);

                string TeamCMatches = "Select TeamC from Matches where Status = '1' && Active = '1'";
                MySqlCommand cmd2 = new MySqlCommand(TeamCMatches, cn);
                MySqlDataAdapter adp2 = new MySqlDataAdapter(cmd2);
                dt2 = new DataTable();
                adp2.Fill(dt2);

                string ClientID = Session["ClientID"].ToString();
                string ledger = "Select *  from ledger  where ClientID = '"+ClientID+"'";
                MySqlCommand cmd3 = new MySqlCommand(ledger, cn);
                MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                dt3 = new DataTable();
                adp3.Fill(dt3);




            }
        }
        //protected void AddMatchBitK_Click(object sender, EventArgs e)
        //{
        //    if (KhaiRate1.Value == "0.00")
        //    {

        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No Any Rate Found.');", true);
        //    }
        //    else
        //    {
        //        matchAmount.Enabled = true;
        //        Timer1.Enabled = true;
        //        Label1.Visible = true;
        //        Timer1_Tick(sender, e);
        //        //timer();


        //    }

        //}
        //protected void Timer1_Tick(object sender, EventArgs e)
        //{
        //    int seconds = 10;

        //    if (Convert.ToString(Label1.Text) != "")
        //    {
        //        seconds = int.Parse(Label1.Text);
        //    }
        //    else
        //    {
        //        seconds = Convert.ToInt32(10);//set some time count in default timer
        //    }
        //    Session["timeout"] = (seconds - 1).ToString();

        //    if (seconds > 0)
        //    {

        //        Label1.Text = (seconds - 1).ToString();
        //        if (Label1.Text == "8")
        //        {
        //            btnSumit.Visible = true;
        //        }

        //    }
        //    else
        //    {
        //        Timer1.Enabled = false;
        //        Label1.Visible = false;
        //        Label1.Text = "10";
        //        matchAmount.Text = "";
        //        matchAmount.Enabled = false;
        //        btnSumit.Visible = false;


        //    }
        //}
        
    }
}