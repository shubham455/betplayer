using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Superstokist
{
    public partial class Updatesuperagentlimit : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable UpdateDataTable { get { return dt; } }


        protected void Page_Load(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string Select = "Select * From SuperAgentMaster where  CreatedBy = '" + Session["SuperStockistcode"] + "'";
                MySqlCommand cmd = new MySqlCommand(Select, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);


                string Superstockistlimit = "Select * From SuperStockistMaster where SuperStockistID = '" + Session["SuperStockistID"] + "'";
                MySqlCommand Superstockistlimitcmd = new MySqlCommand(Superstockistlimit, cn);
                MySqlDataAdapter Superstockistlimitadp = new MySqlDataAdapter(Superstockistlimitcmd);
                DataTable Superstockistlimitdt = new DataTable();
                Superstockistlimitadp.Fill(Superstockistlimitdt);

                SuperStockistLimit.Value = Superstockistlimitdt.Rows[0]["Currentlimit"].ToString();


                string SuperAgentlimit = "Select * From SuperAgentMaster where CreatedBy = '" + Session["SuperStockistCode"] + "'";
                MySqlCommand SuperAgentlimitcmd = new MySqlCommand(SuperAgentlimit, cn);
                MySqlDataAdapter SuperAgentlimitadp = new MySqlDataAdapter(SuperAgentlimitcmd);
                DataTable SuperAgentlimitdt = new DataTable();
                SuperAgentlimitadp.Fill(SuperAgentlimitdt);
                decimal Total = 0;
                for (int i = 0; i < SuperAgentlimitdt.Rows.Count; i++)
                {
                    decimal Superagentlimit = Convert.ToDecimal(SuperAgentlimitdt.Rows[0]["Currentlimit"]);
                    Total = Total + Superagentlimit;

                }
                TotalLimit.Value = Total.ToString();
            }
        }
    }
}