﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;


namespace betplayer.Client
{

    public partial class AllGamesList : System.Web.UI.Page
    {

        private DataTable dt;
        public DataTable MatchesDataTable { get { return dt; } }
        protected void Page_Load(object sender, EventArgs e)
        {

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From Matches where Active = '1' order by DateTime DESC ";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string TeamA = dt.Rows[0]["TeamA"].ToString();
                    string TeamB = dt.Rows[0]["TeamB"].ToString();
                    foreach (DataRow row in dt.Rows)
                    {
                        string timeFromDB = row["DateTime"].ToString();
                        //DateTime oDate = DateTime.ParseExact(timeFromDB, "yyyy-MM-ddTHH:mm tt", System.Globalization.CultureInfo.InvariantCulture);
                        DateTime oDate = DateTime.Parse(timeFromDB);
                        string datetime = "Date: " + oDate.Date.ToString().Substring(0, 10) + " Time: " + oDate.TimeOfDay.ToString();
                        row["DateTime"] = datetime;
                    }

                }
                else
                {

                }

            }
        }
        public string TeamtoImgpath(string TeamA)
        {
            if (TeamA == "Delhi Daredevils")
            {
                return "images/Teams_Image/DD.png";
            }
            else if (TeamA == "Royal Challengers Bangalore")
            {
                return "images/Teams_Image/RCB.png";
            }
            else if (TeamA == "Kolkata Knight Riders")
            {
                return "images/Teams_Image/KKR.png";
            }
            else if (TeamA == "Kings XI Punjab")
            {
                return "images/Teams_Image/KXIP.png";
            }
            else if (TeamA == "Mumbai Indians")
            {
                return "images/Teams_Image/MI.png";
            }
            else if (TeamA == "Chennai Super Kings")
            {
                return "images/Teams_Image/CSK.png";
            }
            else if (TeamA == "Sunrisers Hyderabad")
            {
                return "images/Teams_Image/SRH.png";
            }
            else if (TeamA == "Rajasthan Royals")
            {
                return "images/Teams_Image/RR.png";
            }
            return "";
        }
        public int redirect(int apiID)
        {
            int status;
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From Matches where apiID = '" + apiID + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
                status = Convert.ToInt16(dt.Rows[0]["Status"].ToString());
                
                if (dt.Rows.Count < 0)
                {
                    if (status == 11)
                    {
                        Response.Redirect("BetDetails_Declare.aspx?apiID");
                    }
                    else if (status == 1)
                    {
                        Response.Redirect("BetDetails.aspx?apiID");
                    }
                    else if (status == 0)
                    {
                        Response.Redirect("BetDetails_Declare.aspx?apiID");
                    }

                }return status;
                


            }
        }
    }
}