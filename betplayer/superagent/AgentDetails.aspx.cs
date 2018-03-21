using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace betplayer.Super_Agent
{
    public partial class AgentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string getStudentData()
        {
            string data = "";
            string constr = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select * From ClientMaster"))
                {
                    cmd.Connection = con;

                    cmd.Connection.Open();
                    using (SqlDataReader sqlRdr = cmd.ExecuteReader())
                    {
                        // table = new DataTable();  
                        // table.Load(reader);  
                        if (sqlRdr.HasRows)
                        {
                            while (sqlRdr.Read())
                            {
                                int SNo = sqlRdr.GetInt32(0);
                                string Name = (sqlRdr.GetString(1));
                                string ContactNo = sqlRdr.GetString(2);
                                string Passwod = sqlRdr.GetString(3);
                                string AgentLimit = sqlRdr.GetString(5);
                                string ClientLimit = sqlRdr.GetString(4);

                                string AgentShare = sqlRdr.GetString(6);
                                string ClientShare = sqlRdr.GetString(7);
                                string Client_Type = sqlRdr.GetString(8);
                                string Status = sqlRdr.GetString(9);
                                data += "<tr><td></td><td></td><td>" + SNo + "</td><td></td><td>" + Name + "</td><td>" + ContactNo + "</td><td>" + Passwod + "</td><td></td><td></td><td></td><td>" + Client_Type + "</td><td></td><td></td><td>" + AgentShare + "</td><td>" + ClientShare + "</td><td></td><td>" + Status + "</td></tr>";
                            }
                        }
                    }
                }
                return data;
            }
        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            string data = "";
            string constr = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select * From ClientMaster Where Name Like '%" + txtsearch.Text + "%'"))
                {
                    cmd.Connection = con;

                    cmd.Connection.Open();
                    using (SqlDataReader sqlRdr = cmd.ExecuteReader())
                    {
                        // table = new DataTable();  
                        // table.Load(reader);  
                        if (sqlRdr.HasRows)
                        {
                            while (sqlRdr.Read())
                            {
                                int SNo = sqlRdr.GetInt32(0);
                                string Name = (sqlRdr.GetString(1));
                                string ContactNo = sqlRdr.GetString(2);
                                string Passwod = sqlRdr.GetString(3);
                                string AgentLimit = sqlRdr.GetString(5);
                                string ClientLimit = sqlRdr.GetString(4);

                                string AgentShare = sqlRdr.GetString(6);
                                string ClientShare = sqlRdr.GetString(7);
                                string Client_Type = sqlRdr.GetString(8);
                                string Status = sqlRdr.GetString(9);
                                data += "<tr><td></td><td></td><td>" + SNo + "</td><td></td><td>" + Name + "</td><td>" + ContactNo + "</td><td>" + Passwod + "</td><td></td><td></td><td></td><td>" + Client_Type + "</td><td></td><td></td><td>" + AgentShare + "</td><td>" + ClientShare + "</td><td></td><td>" + Status + "</td></tr>";
                            }
                        }
                    }
                }

            }
        }
        public void BindData()
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From ClientMaster";
                SqlCommand cmd = new SqlCommand(s, cn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);

            }
        }
    }
}