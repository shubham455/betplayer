using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace betplayer.SuperStokist
{
    public partial class MatchAndPositionSPosition : System.Web.UI.Page
    {
        private DataTable dt;
        private DataTable ClientTable = new DataTable();
        private DataTable runTable;
        public DataTable ClientTableOrdered;
        public DataTable MatchesDataTable { get { return ClientTableOrdered; } }
        public DataTable runTable1 { get { return runTable; } }
        public Boolean emptyLedgerTable = false;


        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request.QueryString["Type"];
            if (type == "Test" || type == "test")
            {
                emptyLedgerTable = true;
            }
            ClientTable.Columns.Add(new DataColumn("SessionID"));
            ClientTable.Columns.Add(new DataColumn("Session"));
            ClientTable.Columns.Add(new DataColumn("Runs"));
            ClientTable.Columns.Add(new DataColumn("Amount"));
            ClientTable.Columns.Add(new DataColumn("rate"));
            ClientTable.Columns.Add(new DataColumn("Mode"));
            //ClientTable.Columns.Add(new DataColumn("dateTime"));
            DataColumn colDateTime = new DataColumn("DateTime");
            colDateTime.DataType = System.Type.GetType("System.DateTime");
            ClientTable.Columns.Add(colDateTime);
            ClientTable.Columns.Add(new DataColumn("Team"));
            ClientTable.Columns.Add(new DataColumn("clientID"));
            ClientTable.Columns.Add(new DataColumn("Name"));
            ClientTable.Columns.Add(new DataColumn("CreatedBy"));
            ClientTable.Columns.Add(new DataColumn("CreatedBy1"));
            DataRow Clientrow = ClientTable.NewRow();



            runTable = new DataTable();
            runTable.Columns.Add(new DataColumn("RUNS"));
            runTable.Columns.Add(new DataColumn("AMOUNT"));
            string Session1 = Request.QueryString["Session"];
            apiID.Value = Request.QueryString["MatchID"];
            firebasekey.Value = Request.QueryString["fk"];
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();

                string SELECT = "Select * from Matches Where apiID = '" + apiID.Value + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string TeamA1 = dt.Rows[0]["TeamA"].ToString();
                    string TeamB1 = dt.Rows[0]["TeamB"].ToString();
                }

                decimal myshare1 = 0;
                string Superstokistshare = "Select myshare,Code From Superstockistmaster where SuperStockistID = '" + Session["SuperStockistID"] + "'";
                MySqlCommand Superstokistsharecmd = new MySqlCommand(Superstokistshare, cn);
                MySqlDataAdapter Superstokistshareadp = new MySqlDataAdapter(Superstokistsharecmd);
                DataTable Superstokistsharedt = new DataTable();
                Superstokistshareadp.Fill(Superstokistsharedt);
                if (Superstokistsharedt.Rows.Count > 0)
                {
                    decimal myshare = Convert.ToDecimal(Superstokistsharedt.Rows[0]["myshare"]);
                    myshare1 = myshare / 100;
                }
                string share = "Select myshare,Code From SuperAgentMaster where CreatedBy = '" + Session["SuperStockistCode"] + "'";
                MySqlCommand sharecmd = new MySqlCommand(share, cn);
                MySqlDataAdapter shareadp = new MySqlDataAdapter(sharecmd);
                DataTable sharedt = new DataTable();
                shareadp.Fill(sharedt);

                string check = "";
                for (int a = 0; a < sharedt.Rows.Count; a++)
                {
                    decimal Superagentshare = Convert.ToDecimal(sharedt.Rows[a]["myshare"]);
                    decimal Superagentshare1 = Superagentshare / 100;
                    string SuperAgentcode = (sharedt.Rows[a]["Code"]).ToString();

                    string s11 = "Select AgentID,code From AgentMaster where CreatedBy = '" + SuperAgentcode + "'";
                    MySqlCommand cmd11 = new MySqlCommand(s11, cn);
                    MySqlDataAdapter adp11 = new MySqlDataAdapter(cmd11);
                    DataTable dt11 = new DataTable();
                    adp11.Fill(dt11);

                    for (int o = 0; o < dt11.Rows.Count; o++)
                    {
                        int AgentID = Convert.ToInt16(dt11.Rows[o]["AgentID"]);
                        string Agentcode = (dt11.Rows[o]["code"]).ToString();



                        string s = "select Session.sessionID,Session.session,Session.Runs,Session.Amount,Session.rate,Session.Mode,Session.DateTime,Session.Team,Session.clientID,clientmaster.Name,clientmaster.CreatedBy,AgentMaster.CreatedBy from Session inner join clientmaster on Session.ClientID = clientmaster.ClientID inner join AgentMaster on  clientmaster.CreatedBy = AgentMaster.code inner join SuperAgentMaster on SuperAgentMaster.Code = AgentMaster.CreatedBy where  clientmaster.mode = 'Agent' && clientmaster.CreatedBy = '" + Agentcode + "'    && Session.MatchID = '" + apiID.Value + "' && Session.Session = '" + Session1 + "' order by Session.DateTime DESC";
                        MySqlCommand cmd1 = new MySqlCommand(s, cn);
                        MySqlDataAdapter adp1 = new MySqlDataAdapter(cmd1);
                        dt = new DataTable();
                        adp1.Fill(dt);


                        for (int j = 0; j < dt.Rows.Count; j++)
                        {
                            decimal finalshare = myshare1 - Superagentshare1;
                            if (check != "true")
                            {
                                if (j == 0)
                                {
                                    check = "true";
                                    int runs = Convert.ToInt16(dt.Rows[j]["Runs"]);
                                    int Amount = Convert.ToInt32(dt.Rows[j]["Amount"]);
                                    Decimal Rate = Convert.ToDecimal(dt.Rows[j]["Rate"]);
                                    string Mode = dt.Rows[j]["Mode"].ToString();
                                    string ClientID = dt.Rows[j]["ClientID"].ToString();
                                    for (int i = runs + 5; i >= runs - 5; i--)
                                    {

                                        DataRow row = runTable.NewRow();
                                        row["RUNS"] = i.ToString();
                                        row["Amount"] = CalculateAmount(Mode,
                                            i, 0,
                                            Rate,
                                            runs, Amount,
                                           finalshare).ToString();
                                        runTable.Rows.Add(row.ItemArray);
                                    }



                                }

                            }
                            else
                            {

                                int runs = Convert.ToInt32(dt.Rows[j]["Runs"]);
                                int Amount = Convert.ToInt32(dt.Rows[j]["Amount"]);
                                Decimal Rate = Convert.ToDecimal(dt.Rows[j]["Rate"]);
                                string Mode = dt.Rows[j]["Mode"].ToString();
                                string ClientID = dt.Rows[j]["ClientID"].ToString();
                                int highVal = Convert.ToInt32(runTable.Rows[0]["Runs"]);
                                int lowVal = Convert.ToInt32(runTable.Rows[runTable.Rows.Count - 1]["Runs"]);
                                if ((runs + 5) > highVal)
                                {
                                    for (int i = runs + 5; i > highVal; i--)
                                    {
                                        DataRow row = runTable.NewRow();
                                        row["RUNS"] = i.ToString();
                                        row["Amount"] = runTable.Rows[0]["Amount"];

                                        runTable.Rows.InsertAt(row, (runs + 5 - i));
                                    }
                                }
                                else if ((runs - 5) < lowVal)
                                {
                                    for (int i = lowVal - 1; i >= runs - 5; i--)
                                    {
                                        DataRow row = runTable.NewRow();
                                        row["RUNS"] = i.ToString();
                                        row["Amount"] = runTable.Rows[runTable.Rows.Count - 1]["Amount"];

                                        runTable.Rows.InsertAt(row, ((highVal - lowVal) + (lowVal - i)));
                                    }
                                }

                                for (int i = 0; i < runTable.Rows.Count; i++)
                                {
                                    DataRow row = runTable.Rows[i];
                                    if (Convert.ToInt16(runTable.Rows[i]["Runs"]) >= Convert.ToInt16(dt.Rows[0]["Runs"]) &&
                                        Convert.ToInt16(runTable.Rows[i]["Runs"]) < Convert.ToInt16(dt.Rows[j]["Runs"]))
                                    {


                                        row["AMOUNT"] = CalculateAmount(Mode,
                                            Convert.ToInt16(runTable.Rows[i]["Runs"]),
                                            Convert.ToDecimal(runTable.Rows[i]["Amount"]),
                                            Rate,
                                            runs,
                                            Amount,
                                            finalshare).ToString();
                                    }
                                    else
                                    {
                                        row["AMOUNT"] = CalculateAmount(Mode,
                                            Convert.ToInt16(runTable.Rows[i]["Runs"]),
                                            Convert.ToDecimal(runTable.Rows[i]["Amount"]),
                                            Rate,
                                            runs,
                                            Amount,
                                            finalshare).ToString();
                                    }
                                }
                            }
                        }
                        if (dt.Rows.Count > 0)
                        {
                            IEnumerable<DataRow> orderedRows = dt.AsEnumerable();
                            DataTable TempClientTable = orderedRows.CopyToDataTable();
                            foreach (DataRow row in TempClientTable.Rows)
                            {
                                ClientTable.Rows.Add(row.ItemArray);
                            }
                        }
                    }
                }

            }
            if (ClientTable.Rows.Count > 0)
            {
                IEnumerable<DataRow> orderedRows = from row in ClientTable.AsEnumerable()
                                                   orderby row.Field<DateTime>("DateTime") descending
                                                   select row;

                ClientTableOrdered = orderedRows.CopyToDataTable();

            }
            else
            {
                ClientTableOrdered = ClientTable;
            }
        }
        public double CalculateAmount(string Mode, int Initruns, Decimal InitAmount, Decimal Rate, int runs, int Amount, Decimal fianlshare)
        {
            Decimal Difference = 0;

            if (Initruns < runs)
            {

                if (Mode == "Y")
                {
                    Difference = Amount * fianlshare + InitAmount;
                }
                else if (Mode == "N")
                {
                    Difference = Amount * -1 * fianlshare + InitAmount;
                }


            }
            if (Initruns >= runs)
            {
                if (Mode == "Y")
                {
                    Difference = Amount * Rate * -1 * fianlshare + InitAmount;
                }
                else if (Mode == "N")
                {
                    Difference = Amount * Rate * fianlshare + InitAmount;
                }


            }
            double dvalue = double.Parse(Difference.ToString());
            return dvalue;
        }

    }
}


