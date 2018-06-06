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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {





            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {

                cn.Open();

                string SessionAmount = "Select * from SessionCalculation where MatchID = '1136620' order by ClientID DESC";
                MySqlCommand SessionAmountcmd = new MySqlCommand(SessionAmount, cn);
                MySqlDataAdapter SessionAmountadp = new MySqlDataAdapter(SessionAmountcmd);
                DataTable SessionAmountdt = new DataTable();
                SessionAmountadp.Fill(SessionAmountdt);
                gridview1.DataSource = SessionAmountdt;
                gridview1.DataBind();



            }
        }
    }
}


