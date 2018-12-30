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
    public partial class ClientLoginDetails : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable MatchDataTable { get { return dt; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From ClientMaster Order By ClientID ASC";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt1 = new DataTable();
                adp.Fill(dt1);
                int a = 0;
                foreach (DataRow row in dt1.Rows)
                {
                    string ClientID = dt1.Rows[a]["ClientID"].ToString();
                    string Name = dt1.Rows[a]["name"].ToString();
                    string FinalName = ClientID + Name;
                    row["Name"] = FinalName;
                    a++;

                }
                dropdownclient.DataSource = dt1;
                dropdownclient.DataTextField = "Name";
                dropdownclient.DataValueField = "ClientID";
                dropdownclient.DataBind();


                string s1 = "Select ClientMaster.Name,Logindetails.ipAddress,logindetails.DateTime From LoginDetails inner join ClientMaster  on Logindetails.ClientID = clientMaster.ClientID order by DateTime DESC";
                MySqlCommand cmd1 = new MySqlCommand(s1, cn);
                MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                dt = new DataTable();
                adp1.Fill(dt);
            }
        }
        protected void BillDate_TextChanged(object sender, EventArgs e)
        {
            string datet = DateTime.Parse(BillDate.Text.ToString()).Date.ToString("dd-MM-yyyy");

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string s = "Select ClientMaster.Name,Logindetails.ipAddress,logindetails.DateTime From LoginDetails inner join ClientMaster  on Logindetails.ClientID = clientMaster.ClientID order by DateTime DESC";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    dt.AcceptChanges();
                    foreach (DataRow row in dt.Rows)
                    {
                        string rowDate = DateTime.Parse(row["DateTime"].ToString()).Date.ToString("dd-MM-yyyy");
                        if (datet != rowDate)
                        {
                            row.Delete();
                        }
                    }
                    dt.AcceptChanges();
                }
            }
        }
        protected void btnShow_ServerClick(object sender, EventArgs e)
        {
            string s = "";
            if (dropdownclient.SelectedItem.Text == "All Client")
            {
                s = "Select ClientMaster.Name,Logindetails.ipAddress,logindetails.DateTime From LoginDetails inner join ClientMaster  on Logindetails.ClientID = clientMaster.ClientID order by DateTime DESC";
            }
            else
            {
                s = "Select ClientMaster.Name,Logindetails.ipAddress,logindetails.DateTime From LoginDetails inner join ClientMaster  on Logindetails.ClientID = clientMaster.ClientID where logindetails.ClientID = '" + dropdownclient.SelectedValue + "' order by DateTime DESC";

            }
            string datet = DateTime.Parse(BillDate.Text.ToString()).Date.ToString("dd-MM-yyyy");

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();


                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    dt.AcceptChanges();
                    foreach (DataRow row in dt.Rows)
                    {
                        string rowDate = DateTime.Parse(row["DateTime"].ToString()).Date.ToString("dd-MM-yyyy");
                        if (datet != rowDate)
                        {
                            row.Delete();
                        }
                    }
                    dt.AcceptChanges();
                }
            }
        }
    }
}


