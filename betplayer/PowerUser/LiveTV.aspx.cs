using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.PowerUser
{
    public partial class LiveTV : System.Web.UI.Page
    {

        private DataTable dtIP;
        private DataTable dtPort;
        private DataTable dtChannel;

        public DataTable DTIP { get { return dtIP; } }
        public DataTable DTPort { get { return dtPort; } }
        public DataTable DTChannel { get { return dtChannel; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            firebasekey.Value = Request.QueryString["fk"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                String SelectIP = "Select * From LiveTvIP ";
                MySqlCommand cmdIP = new MySqlCommand(SelectIP, cn);
                MySqlDataAdapter adpIP = new MySqlDataAdapter(cmdIP);
                dtIP = new DataTable();
                adpIP.Fill(dtIP);

                String SelectPort = "Select * From LiveTvPort ";
                MySqlCommand cmdPort = new MySqlCommand(SelectPort, cn);
                MySqlDataAdapter adpPort = new MySqlDataAdapter(cmdPort);
                dtPort = new DataTable();
                adpPort.Fill(dtPort);

                String SelectChannel = "Select * From LiveTvChannel ";
                MySqlCommand cmdChannel = new MySqlCommand(SelectChannel, cn);
                MySqlDataAdapter adpChannel = new MySqlDataAdapter(cmdChannel);
                dtChannel = new DataTable();
                adpChannel.Fill(dtChannel);
            }
        }
    }
}