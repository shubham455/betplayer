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


namespace betplayer.admin
{
    public partial class ScoreBoard : System.Web.UI.Page
    {
        string matchid,Manual;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            apiid.Value = Request.QueryString["MatchID"];
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
                 Manual =dt.Rows[0]["Manual"].ToString();
                if(Manual == "False")
                {
                    ChkAutomatic.Checked = true;
                }
                else if(Manual == "True")
                {
                    ChkManual.Checked = true;
                }


            }

        }
        

    }
}