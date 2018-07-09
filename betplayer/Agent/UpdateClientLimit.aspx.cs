using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.Agent
{
    public partial class UpdateClientLimit : System.Web.UI.Page
    {
        private DataTable UpdateTable;
        public DataTable UpdateDataTable { get { return UpdateTable; } }


        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateTable = new DataTable();
            UpdateTable.Columns.Add(new DataColumn("ClientID"));
            UpdateTable.Columns.Add(new DataColumn("Name"));
            UpdateTable.Columns.Add(new DataColumn("FixLimit"));
            UpdateTable.Columns.Add(new DataColumn("CurrentLimit"));
            UpdateTable.Columns.Add(new DataColumn("UsedLimit"));
            DataRow row = UpdateTable.NewRow();


            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string Select = "Select * From ClientMaster where  CreatedBy = '" + Session["Agentcode"] + "'";
                MySqlCommand cmd = new MySqlCommand(Select, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                Decimal Total = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int ClientID = Convert.ToInt16(dt.Rows[i]["ClientID"]);
                    String Name = dt.Rows[i]["Name"].ToString();
                    string FixLimit = dt.Rows[i]["Fixlimit"].ToString();

                    Decimal ClientCurrentLimit = Convert.ToDecimal(dt.Rows[i]["CurrentLimit"]);
                    Total = Total + ClientCurrentLimit;
                    row["ClientID"] = ClientID;
                    row["Name"] = Name;
                    row["Fixlimit"] = FixLimit;
                    row["Currentlimit"] = ClientCurrentLimit;

                    
                    string Agentlimit = "Select * From AgentMaster where AgentID = '" + Session["AgentID"] + "'";
                    MySqlCommand Agentlimitcmd = new MySqlCommand(Agentlimit, cn);
                    MySqlDataAdapter Agentlimitadp = new MySqlDataAdapter(Agentlimitcmd);
                    DataTable Agentlimitdt = new DataTable();
                    Agentlimitadp.Fill(Agentlimitdt);

                    agentlimit.Value = Agentlimitdt.Rows[0]["Agentlimit"].ToString();

                    for (int j = 0; j < dt.Rows.Count;)
                    {
                        //int ClientID = Convert.ToInt32(dt.Rows[j]["ClientID"]);
                        string Runner = "Select Position1,Position2 From Runner where ClientID = '" + ClientID + "' order by DateTime DESC ";
                        MySqlCommand Runnercmd = new MySqlCommand(Runner, cn);
                        MySqlDataAdapter Runneradp = new MySqlDataAdapter(Runnercmd);
                        DataTable Runnerdt = new DataTable();
                        Runneradp.Fill(Runnerdt);

                        if (Runnerdt.Rows.Count > 0)
                        {
                            int Position1 = Convert.ToInt32(Runnerdt.Rows[0]["Position1"]);
                            int Position2 = Convert.ToInt32(Runnerdt.Rows[0]["Position2"]);

                            int TotalPosition = 0;
                            if(Position1<0 && Position2 <0 )
                            {
                                if(Position1 > Position2)
                                {
                                    TotalPosition = Position2;
                                }
                                else if (Position2 > Position1)
                                {
                                    TotalPosition = Position1;
                                }
                            }
                            else if (Position1 > 0 && Position2 > 0)
                            {
                                if (Position1 < Position2)
                                {
                                    TotalPosition = Position1;
                                }
                                else if (Position2 < Position1)
                                {
                                    TotalPosition = Position2;
                                }
                            }

                            else if (Position1 < 0)
                            {
                                TotalPosition = Position1;
                            }
                            else if (Position2 < 0)
                            {
                                TotalPosition = Position2;
                            }



                            row["Usedlimit"] = TotalPosition;
                        }
                        else
                        {
                            row["Usedlimit"] = 0;
                        }
                        UpdateTable.Rows.Add(row.ItemArray);
                        break;
                    }
                    TotalLimit.Value = String.Format("{0:C0}", Total);
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
    }
}