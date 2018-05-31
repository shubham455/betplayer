using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.admin
{
    public partial class MatchRates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            apiid.Value = Request.QueryString["MatchID"];
        }

        protected void btnDeclare_ServerClick(object sender, EventArgs e)
        {
            string apiID = Request.QueryString["id"];
           
            {

            }
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string SELECT = "Update Matches Set Declare = '"+true+"' Where  apiID = '" + apiID + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                cmd.ExecuteNonQuery();

            }
        }

            protected void btnUnDeclare_ServerClick(object sender, EventArgs e)
            {
                string apiID = Request.QueryString["id"];
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();

                    string SELECT = "Update Matches Set Declare = '0' Where TeamName = '" + apiID + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    cmd.ExecuteNonQuery();

                }

            }
        }
    }