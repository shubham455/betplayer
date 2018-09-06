using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace betplayer.poweruser
{
    public partial class MatchRates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            firebasekey.Value = Request.QueryString["fk"];
        }

        protected void btnDeclare_ServerClick(object sender, EventArgs e)
        {
            string apiID = Request.QueryString["Matchid"];

            int LedgerAmount = 0;
            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                string Match = "Select * From Matches where apiID = '" + apiID + "'";
                MySqlCommand Matchcmd = new MySqlCommand(Match, cn);
                MySqlDataAdapter Matchadp = new MySqlDataAdapter(Matchcmd);
                DataTable Matchdt = new DataTable();
                Matchadp.Fill(Matchdt);
                string Declear = Matchdt.Rows[0]["Declear"].ToString();
                if (Declear == "False")
                {
                    cn.Open();
                    int TotalAmount1 = 0;
                    string SessionAmount = "Select * from SessionCalculation where MatchID = '" + apiID + "' order by ClientID DESC";
                    MySqlCommand SessionAmountcmd = new MySqlCommand(SessionAmount, cn);
                    MySqlDataAdapter SessionAmountadp = new MySqlDataAdapter(SessionAmountcmd);
                    DataTable SessionAmountdt = new DataTable();
                    SessionAmountadp.Fill(SessionAmountdt);

                    if (SessionAmountdt.Rows.Count > 0)
                    {
                        int TotalAmount = 0;


                        for (int i = 0; i < SessionAmountdt.Rows.Count; i++)
                        {
                            TotalAmount = Convert.ToInt32(SessionAmountdt.Rows[i]["TotalAmount"]);
                            int ClientID = Convert.ToInt16(SessionAmountdt.Rows[i]["ClientID"]);
                            TotalAmount1 = TotalAmount1 + TotalAmount;


                            for (int j = i + 1; j <= SessionAmountdt.Rows.Count;)
                            {
                                if (SessionAmountdt.Rows.Count > j)
                                {
                                    int clientID = Convert.ToInt16(SessionAmountdt.Rows[j]["clientID"]);
                                    if (ClientID != clientID)
                                    {

                                        LedgerAmount = LedgerAmount + TotalAmount1;


                                        string Runner = "Select Position1,Position2 from Runner where ClientID = '" + ClientID + "' && MatchID = '" + apiID + "' order by DateTime DESC";
                                        MySqlCommand Runnercmd = new MySqlCommand(Runner, cn);
                                        MySqlDataAdapter Runneradp = new MySqlDataAdapter(Runnercmd);
                                        DataTable Runnerdt = new DataTable();
                                        Runneradp.Fill(Runnerdt);
                                        Decimal MatchtotalAmount = 0;
                                        if (Runnerdt.Rows.Count > 0)
                                        {
                                            int Position1 = Convert.ToInt32(Runnerdt.Rows[0]["Position1"]);
                                            int Position2 = Convert.ToInt32(Runnerdt.Rows[0]["Position2"]);

                                            if (team_selector1.Value == "team_1")
                                            {
                                                MatchtotalAmount = Position1;
                                                LedgerAmount = LedgerAmount + Position1;
                                            }
                                            else if (team_selector1.Value == "team_2")
                                            {
                                                MatchtotalAmount = Position2;
                                                LedgerAmount = LedgerAmount + Position2;
                                            }

                                        }
                                        LedgerAmount = LedgerAmount - 100;
                                        int Dabit = 0, Credit = 0;
                                        if (LedgerAmount > 0)
                                        {
                                            Dabit = LedgerAmount;
                                        }
                                        else if (LedgerAmount < 0)
                                        {
                                            Credit = LedgerAmount;
                                        }

                                        string AddMatchCalculation = "Insert into MatchCalculation (MatchID,ClientID,Amount) Values( @MatchID,@ClientID,@Amount)";
                                        MySqlCommand AddMatchCalculationcmd = new MySqlCommand(AddMatchCalculation, cn);
                                        AddMatchCalculationcmd.Parameters.AddWithValue("@ClientID", ClientID);
                                        AddMatchCalculationcmd.Parameters.AddWithValue("@MatchID", apiID);
                                        AddMatchCalculationcmd.Parameters.AddWithValue("@Amount", MatchtotalAmount);
                                        AddMatchCalculationcmd.ExecuteNonQuery();

                                        string clearusedlimit = "update runner set Position1 = '0',Position2 = '0' where ClientID = '" + ClientID + "' && MatchID = '" + apiID + "' order by DateTime DESC ";
                                        MySqlCommand clearusedlimitcmd = new MySqlCommand(clearusedlimit, cn);
                                        clearusedlimitcmd.ExecuteNonQuery();


                                        if (LedgerAmount < 0)
                                        {
                                            string Selectcurrentlimit = "Select * from ClientMaster where ClientID = '" + ClientID + "'";
                                            MySqlCommand Selectcurrentlimitcmd = new MySqlCommand(Selectcurrentlimit, cn);
                                            MySqlDataAdapter Selectcurrentlimitadp = new MySqlDataAdapter(Selectcurrentlimitcmd);
                                            DataTable Selectcurrentlimitdt = new DataTable();
                                            Selectcurrentlimitadp.Fill(Selectcurrentlimitdt);

                                            decimal currentlimit = Convert.ToDecimal(Selectcurrentlimitdt.Rows[0]["CurrentLimit"]);

                                            decimal finaldeductedamount = currentlimit + LedgerAmount;

                                            string updateamount = "update clientmaster set Currentlimit = '" + finaldeductedamount + "' where ClientID = '" + ClientID + "' ";
                                            MySqlCommand updateamountcmd = new MySqlCommand(updateamount, cn);
                                            updateamountcmd.ExecuteNonQuery();
                                        }


                                        string MatchBet = "select count(clientID) From runner where MatchID = '" + apiID + "' && ClientID = '" + ClientID + "' ";
                                        MySqlCommand MatchBetcmd = new MySqlCommand(MatchBet, cn);
                                        string MatchBetcount = MatchBetcmd.ExecuteScalar().ToString();

                                        string SessionBet = "select count(clientID) From session where MatchID = '" + apiID + "' && ClientID = '" + ClientID + "' ";
                                        MySqlCommand SessionBetcmd = new MySqlCommand(SessionBet, cn);
                                        string SessionBetcount = SessionBetcmd.ExecuteScalar().ToString();


                                        string InsertClientLedger = "Insert Into ClientLedger (clientID,MatchID,Dabit,Credit,Amount,MatchBets,SessionBets) values (@ClientID,@MatchID,@Dabit,@Credit,@Amount,@MatchBets,@SessionBets)";
                                        MySqlCommand Insertclientcmd = new MySqlCommand(InsertClientLedger, cn);
                                        Insertclientcmd.Parameters.AddWithValue("@ClientID", ClientID);
                                        Insertclientcmd.Parameters.AddWithValue("@MatchID", apiID);
                                        Insertclientcmd.Parameters.AddWithValue("@Dabit", Dabit);
                                        Insertclientcmd.Parameters.AddWithValue("@Credit", Credit);
                                        Insertclientcmd.Parameters.AddWithValue("@Amount", LedgerAmount);
                                        Insertclientcmd.Parameters.AddWithValue("@MatchBets", MatchBetcount);
                                        Insertclientcmd.Parameters.AddWithValue("@SessionBets", SessionBetcount);
                                        Insertclientcmd.ExecuteNonQuery();

                                        TotalAmount1 = 0;
                                        LedgerAmount = 0;
                                    }
                                }
                                else
                                {
                                    LedgerAmount = LedgerAmount + TotalAmount1;


                                    string Runner = "Select Position1,Position2 from Runner where ClientID = '" + ClientID + "' && MatchID = '" + apiID + "' order by DateTime DESC";
                                    MySqlCommand Runnercmd = new MySqlCommand(Runner, cn);
                                    MySqlDataAdapter Runneradp = new MySqlDataAdapter(Runnercmd);
                                    DataTable Runnerdt = new DataTable();
                                    Runneradp.Fill(Runnerdt);
                                    decimal MatchtotalAmount = 0;
                                    if (Runnerdt.Rows.Count > 0)
                                    {
                                        int Position1 = Convert.ToInt32(Runnerdt.Rows[0]["Position1"]);
                                        int Position2 = Convert.ToInt32(Runnerdt.Rows[0]["Position2"]);

                                        if (team_selector1.Value == "team_1")
                                        {
                                            MatchtotalAmount = Position1;
                                            LedgerAmount = LedgerAmount + Position1;
                                        }
                                        else if (team_selector1.Value == "team_2")
                                        {
                                            MatchtotalAmount = Position2;
                                            LedgerAmount = LedgerAmount + Position2;
                                        }
                                    }
                                    LedgerAmount = LedgerAmount - 100;
                                    int Dabit = 0, Credit = 0;
                                    if (LedgerAmount > 0)
                                    {
                                        Dabit = LedgerAmount;
                                    }
                                    else if (LedgerAmount < 0)
                                    {
                                        Credit = LedgerAmount;
                                    }

                                    string AddMatchCalculation = "Insert into MatchCalculation (MatchID,ClientID,Amount) Values( @MatchID,@ClientID,@Amount)";
                                    MySqlCommand AddMatchCalculationcmd = new MySqlCommand(AddMatchCalculation, cn);
                                    AddMatchCalculationcmd.Parameters.AddWithValue("@ClientID", ClientID);
                                    AddMatchCalculationcmd.Parameters.AddWithValue("@MatchID", apiID);
                                    AddMatchCalculationcmd.Parameters.AddWithValue("@Amount", MatchtotalAmount);
                                    AddMatchCalculationcmd.ExecuteNonQuery();

                                    string clearusedlimit = "update runner set Position1 = '0',Position2 = '0' where ClientID = '" + ClientID + "' && MatchID = '" + apiID + "' order by DateTime DESC ";
                                    MySqlCommand clearusedlimitcmd = new MySqlCommand(clearusedlimit, cn);
                                    clearusedlimitcmd.ExecuteNonQuery();


                                    if (LedgerAmount < 0)
                                    {
                                        string Selectcurrentlimit = "Select * from ClientMaster where ClientID = '" + ClientID + "'";
                                        MySqlCommand Selectcurrentlimitcmd = new MySqlCommand(Selectcurrentlimit, cn);
                                        MySqlDataAdapter Selectcurrentlimitadp = new MySqlDataAdapter(Selectcurrentlimitcmd);
                                        DataTable Selectcurrentlimitdt = new DataTable();
                                        Selectcurrentlimitadp.Fill(Selectcurrentlimitdt);

                                        decimal currentlimit = Convert.ToDecimal(Selectcurrentlimitdt.Rows[0]["CurrentLimit"]);

                                        decimal finaldeductedamount = currentlimit + LedgerAmount;

                                        string updateamount = "update clientmaster set Currentlimit = '" + finaldeductedamount + "' where ClientID = '" + ClientID + "' ";
                                        MySqlCommand updateamountcmd = new MySqlCommand(updateamount, cn);
                                        updateamountcmd.ExecuteNonQuery();
                                    }


                                    string MatchBet = "select count(clientID) From runner where MatchID = '" + apiID + "' && ClientID = '" + ClientID + "' ";
                                    MySqlCommand MatchBetcmd = new MySqlCommand(MatchBet, cn);
                                    string MatchBetcount = MatchBetcmd.ExecuteScalar().ToString();

                                    string SessionBet = "select count(clientID) From session where MatchID = '" + apiID + "' && ClientID = '" + ClientID + "' ";
                                    MySqlCommand SessionBetcmd = new MySqlCommand(SessionBet, cn);
                                    string SessionBetcount = SessionBetcmd.ExecuteScalar().ToString();



                                    string InsertClientLedger = "Insert Into ClientLedger (clientID,MatchID,Dabit,Credit,Amount,MatchBets,SessionBets) values (@ClientID,@MatchID,@Dabit,@Credit,@Amount,@MatchBets,@SessionBets)";
                                    MySqlCommand Insertclientcmd = new MySqlCommand(InsertClientLedger, cn);
                                    Insertclientcmd.Parameters.AddWithValue("@ClientID", ClientID);
                                    Insertclientcmd.Parameters.AddWithValue("@MatchID", apiID);
                                    Insertclientcmd.Parameters.AddWithValue("@Dabit", Dabit);
                                    Insertclientcmd.Parameters.AddWithValue("@Credit", Credit);
                                    Insertclientcmd.Parameters.AddWithValue("@Amount", LedgerAmount);
                                    Insertclientcmd.Parameters.AddWithValue("@MatchBets", MatchBetcount);
                                    Insertclientcmd.Parameters.AddWithValue("@SessionBets", SessionBetcount);
                                    Insertclientcmd.ExecuteNonQuery();

                                    string SELECT = "Update Matches Set Status = '11', Declear = '1', winnerTeam ='" + team_selector1.Value + "' Where apiID = '" + apiID + "'";
                                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                                    cmd.ExecuteNonQuery();

                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Match Declared Succesfully.....');", true);
                                }
                                break;
                            }

                        }

                    }
                    else
                    {
                        string RunnerClientID = "Select ClientID From Runner group by ClientID";
                        MySqlCommand RunnerClientIDcmd = new MySqlCommand(RunnerClientID, cn);
                        MySqlDataAdapter RunnerClientIDadp = new MySqlDataAdapter(RunnerClientIDcmd);
                        DataTable RunnerClientIDdt = new DataTable();
                        RunnerClientIDadp.Fill(RunnerClientIDdt);

                        for (int a = 0; a < RunnerClientIDdt.Rows.Count; a++)
                        {
                            int ClientID = Convert.ToInt16(RunnerClientIDdt.Rows[a]["ClientID"]);

                            string Runner = "Select Position1,Position2 from Runner where ClientID = '" + ClientID + "' && MatchID = '" + apiID + "' order by DateTime DESC";
                            MySqlCommand Runnercmd = new MySqlCommand(Runner, cn);
                            MySqlDataAdapter Runneradp = new MySqlDataAdapter(Runnercmd);
                            DataTable Runnerdt = new DataTable();
                            Runneradp.Fill(Runnerdt);
                            decimal MatchtotalAmount = 0;
                            if (Runnerdt.Rows.Count > 0)
                            {
                                int Position1 = Convert.ToInt32(Runnerdt.Rows[0]["Position1"]);
                                int Position2 = Convert.ToInt32(Runnerdt.Rows[0]["Position2"]);

                                if (team_selector1.Value == "team_1")
                                {
                                    MatchtotalAmount = Position1;
                                    LedgerAmount = LedgerAmount + Position1;
                                }
                                else if (team_selector1.Value == "team_2")
                                {
                                    MatchtotalAmount = Position2;
                                    LedgerAmount = LedgerAmount + Position2;
                                }
                            }
                            LedgerAmount = LedgerAmount - 100;
                            int Dabit = 0, Credit = 0;
                            if (LedgerAmount > 0)
                            {
                                Dabit = LedgerAmount;
                            }
                            else if (LedgerAmount < 0)
                            {
                                Credit = LedgerAmount;
                            }

                            string AddMatchCalculation = "Insert into MatchCalculation (MatchID,ClientID,Amount) Values( @MatchID,@ClientID,@Amount)";
                            MySqlCommand AddMatchCalculationcmd = new MySqlCommand(AddMatchCalculation, cn);
                            AddMatchCalculationcmd.Parameters.AddWithValue("@ClientID", ClientID);
                            AddMatchCalculationcmd.Parameters.AddWithValue("@MatchID", apiID);
                            AddMatchCalculationcmd.Parameters.AddWithValue("@Amount", MatchtotalAmount);
                            AddMatchCalculationcmd.ExecuteNonQuery();

                            string clearusedlimit = "update runner set Position1 = '0',Position2 = '0' where ClientID = '"+ClientID+"' && MatchID = '"+apiID+"' order by DateTime DESC ";
                            MySqlCommand clearusedlimitcmd = new MySqlCommand(clearusedlimit, cn);
                            clearusedlimitcmd.ExecuteNonQuery();


                           if(LedgerAmount < 0)
                            {
                                string Selectcurrentlimit = "Select * from ClientMaster where ClientID = '" + ClientID + "'";
                                MySqlCommand Selectcurrentlimitcmd = new MySqlCommand(Selectcurrentlimit, cn);
                                MySqlDataAdapter Selectcurrentlimitadp = new MySqlDataAdapter(Selectcurrentlimitcmd);
                                DataTable Selectcurrentlimitdt = new DataTable();
                                Selectcurrentlimitadp.Fill(Selectcurrentlimitdt);

                                decimal currentlimit = Convert.ToDecimal(Selectcurrentlimitdt.Rows[0]["CurrentLimit"]);

                                decimal finaldeductedamount = currentlimit + LedgerAmount;

                                string updateamount = "update clientmaster set Currentlimit = '" + finaldeductedamount + "',client_limit= '"+finaldeductedamount+"' where ClientID = '" + ClientID + "' ";
                                MySqlCommand updateamountcmd = new MySqlCommand(updateamount, cn);
                                updateamountcmd.ExecuteNonQuery();
                            }


                            string MatchBet = "select count(clientID) From runner where MatchID = '" + apiID + "' && ClientID = '" + ClientID + "' ";
                            MySqlCommand MatchBetcmd = new MySqlCommand(MatchBet, cn);
                            string MatchBetcount = MatchBetcmd.ExecuteScalar().ToString();

                            string SessionBet = "select count(clientID) From session where MatchID = '" + apiID + "' && ClientID = '" + ClientID + "' ";
                            MySqlCommand SessionBetcmd = new MySqlCommand(SessionBet, cn);
                            string SessionBetcount = SessionBetcmd.ExecuteScalar().ToString();



                            string InsertClientLedger = "Insert Into ClientLedger (clientID,MatchID,Dabit,Credit,Amount,MatchBets,SessionBets) values (@ClientID,@MatchID,@Dabit,@Credit,@Amount,@MatchBets,@SessionBets)";
                            MySqlCommand Insertclientcmd = new MySqlCommand(InsertClientLedger, cn);
                            Insertclientcmd.Parameters.AddWithValue("@ClientID", ClientID);
                            Insertclientcmd.Parameters.AddWithValue("@MatchID", apiID);
                            Insertclientcmd.Parameters.AddWithValue("@Dabit", Dabit);
                            Insertclientcmd.Parameters.AddWithValue("@Credit", Credit);
                            Insertclientcmd.Parameters.AddWithValue("@Amount", LedgerAmount);
                            Insertclientcmd.Parameters.AddWithValue("@MatchBets", MatchBetcount);
                            Insertclientcmd.Parameters.AddWithValue("@SessionBets", SessionBetcount);
                            Insertclientcmd.ExecuteNonQuery();
                        }


                            string SELECT = "Update Matches Set Status = '11', Declear = '1', winnerTeam ='"+ team_selector1.Value+"'  Where apiID = '" + apiID + "'";
                            MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                            cmd.ExecuteNonQuery();

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Match Declared Succesfully.....');", true);
                        }
                    }
                


                else if (Declear == "True")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Match Already Declared.....');", true);

                }
                }
            }



            protected void btnUnDeclare_ServerClick(object sender, EventArgs e)
            {
                string apiID = Request.QueryString["Matchid"];
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();


                    string SELECT = "Update Matches Set Status = '1', Declear = '0' Where apiID = '" + apiID + "'";
                    MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                    cmd.ExecuteNonQuery();

                    string Delete = "Delete From clientledger where MatchID = '" + apiID + "'";
                    MySqlCommand Deletecmd = new MySqlCommand(Delete, cn);
                    Deletecmd.ExecuteNonQuery();

                    string DeleteMatchCalcultion = "Delete From MatchCalculation where MatchID = '" + apiID + "'";
                    MySqlCommand DeleteMatchCalcultioncmd = new MySqlCommand(DeleteMatchCalcultion, cn);
                    DeleteMatchCalcultioncmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Match UnDeclared.....');", true);
                }

            }
        }
    }