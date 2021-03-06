﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace betplayer.Agent
{
    public partial class ClientDetails : System.Web.UI.Page
    {
        private DataTable dt;
        public DataTable MatchesDataTable { get { return dt; } }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["msg"] == "Add")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Client Added SuccessFully.....');", true);
                }
                else if (Request.QueryString["msg"] == "Update")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Client Data Updated SuccessFully.....');", true);
                }
            }
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From Clientmaster inner join AgentMaster on clientmaster.CreatedBy = agentmaster.code  where ClientMaster.CreatedBy = '" + Session["Agentcode"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
                
            }
        }



        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From Clientmaster inner join AgentMaster on clientmaster.CreatedBy = agentmaster.code  where ClientMaster.CreatedBy = '" + Session["Agentcode"] + "' && ClientMaster.Name Like '%" + txtsearch.Text + "%'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
            }

        }

        public void BindData()
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string s = "Select * From Clientmaster inner join AgentMaster on clientmaster.CreatedBy = agentmaster.code  where ClientMaster.CreatedBy = '" + Session["Agentcode"] + "'";
                MySqlCommand cmd = new MySqlCommand(s, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);


            }
        }

        protected void DropDownstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string selected = Request.Form["checkbox"];
                if(selected != null)
                {
                    string s = "update  ClientMaster set Status = '" + DropDownstatus.SelectedItem.Text + "' where ClientID in (" + selected + ")";
                    MySqlCommand cmd = new MySqlCommand(s, cn);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Select Anyone Client.....');", true);
                }
                
                
                BindData();

            }
        }
        

        protected void CheckboxID_CheckedChanged(object sender, EventArgs e)
        {
            CheckboxID.Checked = true;
        }
    }
}
