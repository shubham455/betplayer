﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Globalization;
using ASPSnippets.SmsAPI;


namespace Panchayat_System.Admin
{
    public partial class BirthCertificate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {


            string strNewPassword1 = GeneratePassword().ToString();

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(CN))
            {
                cn.Open();
                string s = "insert into ClientMaster(Name,Contact_No,Password,Client_limit,Agent_limit,Agent_Share,Client_Share,Session_Commision_Type,Status) values (@Name,@Contact_No,@Password,@Clientlimit,@Agentlimit,@Agentshare,@Clientshare,@SessionType,@Status)";
                SqlCommand cmd = new SqlCommand(s, cn);
                cmd.Parameters.AddWithValue("@Name", txtname.Text);
                cmd.Parameters.AddWithValue("@Contact_No", txtContactno.Text);
                cmd.Parameters.AddWithValue("@Password", strNewPassword1);
                cmd.Parameters.AddWithValue("@Clientlimit", txtClientlimit.Text);
                cmd.Parameters.AddWithValue("@Agentlimit", txtAgentlimit.Text);
                cmd.Parameters.AddWithValue("@Agentshare", txtAgentShare.Text);
                cmd.Parameters.AddWithValue("@Clientshare", txtClientShare.Text);
                cmd.Parameters.AddWithValue("@SessionType", SessionDropDown.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Status", "active");

                cmd.ExecuteNonQuery();
                Response.Redirect("~/Agent/ClientDetails.aspx?msg=Add");

            }
        }
        public string GeneratePassword()
        {
            string PasswordLength = "8";
            string NewPassword = "";

            string allowedChars = "";
            allowedChars = "1,2,3,4,5,6,7,8,9,0";
            allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
            allowedChars += "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";


            char[] sep = { ',' };
            string[] arr = allowedChars.Split(sep);


            string IDString = "";
            string temp = "";

            Random rand = new Random();

            for (int i = 0; i < Convert.ToInt32(PasswordLength); i++)
            {
                temp = arr[rand.Next(0, arr.Length)];
                IDString += temp;
                NewPassword = IDString;

            }
            return NewPassword;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientDetails.aspx");
        }
    }
}



