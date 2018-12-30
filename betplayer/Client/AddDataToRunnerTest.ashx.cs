using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;

namespace betplayer.Client
{
    /// <summary>
    /// Summary description for AddDataToRunnerTest
    /// </summary>
    public class AddDataToRunnerTest : IHttpHandler, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/json";
            int UserID = Convert.ToInt16(context.Session["ClientID"]);
            if (IsClient(UserID))
            {
                string Result = AddEntryToLedger(context, UserID);
                if (Result == "success")
                    context.Response.Write(new JavaScriptSerializer().Serialize(new
                    {
                        status = "success",
                        Result = Result
                    }));
                else if (Result == "unsuccess")
                    context.Response.Write(new JavaScriptSerializer().Serialize(new
                    {
                        status = "unsuccess",
                        Result = Result
                    }));
                else context.Response.Write(new JavaScriptSerializer().Serialize(new
                {
                    status = false,
                    error = Result
                }));
            }
        }



        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        private bool IsClient(int id)
        {

            string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            using (MySqlConnection cn = new MySqlConnection(CN))
            {
                cn.Open();
                string SELECT = "Select ClientID from ClientMaster Where ClientID = '" + id + "'";
                MySqlCommand cmd = new MySqlCommand(SELECT, cn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read()) return true;
                else return false;

            }
        }
        private string AddEntryToLedger(HttpContext context, int ClientID)
        {

            Decimal Amount = Convert.ToDecimal(context.Request["Amount"]);
            Decimal Rate = Convert.ToDecimal(context.Request["Rate"]);
            string Team = context.Request["Team"].ToString();
            string Mode = context.Request["Mode"].ToString();
            string MatchID = context.Request["MatchID"].ToString();
            decimal Position1 = Convert.ToDecimal(context.Request["Team1Position"]);
            decimal Position2 = Convert.ToDecimal(context.Request["Team2Position"]);
            decimal Position3 = Convert.ToDecimal(context.Request["TeamcPosition"]);
            try
            {
                string CN = ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
                using (MySqlConnection cn = new MySqlConnection(CN))
                {
                    cn.Open();

                    string Clientlimit = "Select Client_Limit From ClientMaster where ClientID = '" + ClientID + "'";
                    MySqlCommand Clientlimitcmd = new MySqlCommand(Clientlimit, cn);
                    MySqlDataAdapter adp = new MySqlDataAdapter(Clientlimitcmd);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    Decimal ClientLimit1 = Convert.ToDecimal(dt.Rows[0]["Client_Limit"]);


                    string SelectTeam = "Select * From Matches Where ApiID = '" + MatchID + "'";
                    MySqlCommand SelectTeamcmd = new MySqlCommand(SelectTeam, cn);
                    MySqlDataAdapter SelectTeamadp = new MySqlDataAdapter(SelectTeamcmd);
                    DataTable SelectTeamdt = new DataTable();
                    SelectTeamadp.Fill(SelectTeamdt);

                    String TeamA = SelectTeamdt.Rows[0]["TeamA"].ToString();
                    String TeamB = SelectTeamdt.Rows[0]["TeamB"].ToString();
                    String TeamC = SelectTeamdt.Rows[0]["TeamC"].ToString();


                    string lastbet = "Select * From Runner where matchID = '" + MatchID + "'  and ClientID = '" + ClientID + "' order by Datetime DESC";
                    MySqlCommand lastbetcmd = new MySqlCommand(lastbet, cn);
                    MySqlDataAdapter lastbetadp = new MySqlDataAdapter(lastbetcmd);
                    DataTable lastbetdt = new DataTable();
                    lastbetadp.Fill(lastbetdt);
                    Decimal CheckClientAmount = 0;
                    if (lastbetdt.Rows.Count > 0)
                    {
                        string teamname = lastbetdt.Rows[0]["Team"].ToString();
                        string mode = lastbetdt.Rows[0]["Mode"].ToString();
                        int lastbetPosition1 = Convert.ToInt32(lastbetdt.Rows[0]["Position1"]);
                        int lastbetPosition2 = Convert.ToInt32(lastbetdt.Rows[0]["Position2"]);
                        int lastbetPosition3 = Convert.ToInt32(lastbetdt.Rows[0]["Position3"]);

                        if (TeamA == Team && Mode == "L")
                        {
                            Position1 = lastbetPosition1 + (Rate * Amount);
                            Position2 = lastbetPosition2 + (-1 * Amount);
                            Position3 = lastbetPosition3 + (-1 * Amount);
                        }
                        else if (TeamA == Team && Mode == "K")
                        {
                            Position1 = lastbetPosition1 - (Rate * Amount);
                            Position2 = lastbetPosition2 - (-1 * Amount);
                            Position3 = lastbetPosition3 - (-1 * Amount);
                        }
                        else if (TeamB == Team && Mode == "L")
                        {
                            Position1 = lastbetPosition1 + (-1 * Amount);
                            Position2 = lastbetPosition2 + (Rate * Amount);
                            Position3 = lastbetPosition3 + (-1 * Amount);
                        }
                        else if (TeamB == Team && Mode == "K")
                        {
                            Position1 = lastbetPosition1 - (-1 * Amount);
                            Position2 = lastbetPosition2 - (Rate * Amount);
                            Position3 = lastbetPosition3 - (-1 * Amount);
                        }
                        else if (TeamC == Team && Mode == "L")
                        {
                            Position3 = lastbetPosition3 + (Rate * Amount);
                            Position1 = lastbetPosition1 + (-1 * Amount);
                            Position2 = lastbetPosition2 + (-1 * Amount);
                        }
                        else if (TeamC == Team && Mode == "K")
                        {
                            Position3 = lastbetPosition3 - (-Rate * Amount);
                            Position1 = lastbetPosition1 + (1 * Amount);
                            Position2 = lastbetPosition2 + (1 * Amount);
                        }
                        double dvalue1 = double.Parse(Position1.ToString());
                        double dvalue2 = double.Parse(Position2.ToString());
                        double dvalue3 = double.Parse(Position3.ToString());
                        Position1 = Convert.ToDecimal(dvalue1);
                        Position2 = Convert.ToDecimal(dvalue2);
                        Position3 = Convert.ToDecimal(dvalue3);


                        if (Mode == "L" && Team == TeamA)
                        {
                            decimal tempClientlimit = 0;
                            if (lastbetPosition1 > 0 && lastbetPosition2 > 0 && lastbetPosition3 > 0)
                            {
                                if (lastbetPosition2 <= lastbetPosition3)
                                {
                                    tempClientlimit = ClientLimit1 + lastbetPosition2;
                                    if (Amount > tempClientlimit)
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }
                                else if (lastbetPosition3 <= lastbetPosition2)
                                {
                                    tempClientlimit = ClientLimit1 + lastbetPosition3;
                                    if (Amount > tempClientlimit)
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }
                            }
                            else
                            {

                                if (lastbetPosition1 <= lastbetPosition2 && lastbetPosition1 <= lastbetPosition3)
                                {
                                    lastbetPosition1 = lastbetPosition1 * -1;
                                    tempClientlimit = ClientLimit1 + lastbetPosition1;
                                }
                                else if (lastbetPosition2 <= lastbetPosition1 && lastbetPosition2 <= lastbetPosition3)
                                {
                                    lastbetPosition2 = lastbetPosition2 * -1;
                                    tempClientlimit = ClientLimit1 + lastbetPosition2;
                                }
                                else if (lastbetPosition3 <= lastbetPosition1 && lastbetPosition3 <= lastbetPosition2)
                                {
                                    lastbetPosition3 = lastbetPosition3 * -1;
                                    tempClientlimit = ClientLimit1 + lastbetPosition3;
                                }
                                else
                                {
                                    tempClientlimit = ClientLimit1;
                                }
                            }
                            if (CheckClientAmount >= 0)
                            {

                                if (lastbetPosition2 <= lastbetPosition3)
                                {
                                    if (Position2 <= Position3)
                                    {
                                        Position2 = Position2 * -1;
                                        if (tempClientlimit >= Position2)
                                        {
                                            CheckClientAmount = 1000;
                                            Position2 = Position2 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else if (Position3 <= Position2)
                                    {
                                        Position3 = Position3 * -1;
                                        if (tempClientlimit >= Position3)
                                        {
                                            CheckClientAmount = 1000;
                                            Position3 = Position3 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }

                                else if (lastbetPosition3 <= lastbetPosition2)
                                {
                                    if (Position2 <= Position3)
                                    {

                                        Position2 = Position2 * -1;
                                        if (tempClientlimit >= Position2)
                                        {
                                            CheckClientAmount = 1000;
                                            Position2 = Position2 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else if (Position3 <= Position2)
                                    {
                                        Position3 = Position3 * -1;
                                        if (tempClientlimit >= Position3)
                                        {
                                            CheckClientAmount = 1000;
                                            Position3 = Position3 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }
                            }
                        }



                        else if (Mode == "K" && Team == TeamA)
                        {
                            if (lastbetPosition1 > 0 && lastbetPosition2 > 0 && lastbetPosition3 > 0)
                            {
                                decimal tempclientlimit = ClientLimit1 + lastbetPosition1;
                                Position1 = Position1 * -1;
                                decimal finalposition = lastbetPosition1 + Position1;
                                if (tempclientlimit >= finalposition)
                                {
                                    Position1 = Position1 * -1;

                                }
                                else
                                {
                                    CheckClientAmount = 1000 * -1;
                                }
                            }
                            else
                            {
                                CheckClientAmount = CheckCoinsForKhai(lastbetPosition1, lastbetPosition2, lastbetPosition3, Position1, Position2, Position3, ClientLimit1, Amount, Rate);
                            }
                        }
                        else if (Mode == "L" && Team == TeamB)
                        {

                            decimal tempClientlimit = 0;
                            if (lastbetPosition1 > 0 && lastbetPosition2 > 0 && lastbetPosition3 > 0)
                            {
                                if (lastbetPosition1 <= lastbetPosition3)
                                {
                                    tempClientlimit = ClientLimit1 + lastbetPosition1;
                                    if (Amount > tempClientlimit)
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }
                                else if (lastbetPosition3 <= lastbetPosition1)
                                {
                                    tempClientlimit = ClientLimit1 + lastbetPosition3;
                                    if (Amount > tempClientlimit)
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }
                            }
                            else
                            {

                                if (lastbetPosition1 <= lastbetPosition2 && lastbetPosition1 <= lastbetPosition3)
                                {
                                    lastbetPosition1 = lastbetPosition1 * -1;
                                    tempClientlimit = ClientLimit1 + lastbetPosition1;
                                }
                                else if (lastbetPosition2 <= lastbetPosition1 && lastbetPosition2 <= lastbetPosition3)
                                {
                                    lastbetPosition2 = lastbetPosition2 * -1;
                                    tempClientlimit = ClientLimit1 + lastbetPosition2;
                                }
                                else if (lastbetPosition3 <= lastbetPosition1 && lastbetPosition3 <= lastbetPosition2)
                                {
                                    lastbetPosition3 = lastbetPosition3 * -1;
                                    tempClientlimit = ClientLimit1 + lastbetPosition3;
                                }
                                else
                                {
                                    tempClientlimit = ClientLimit1;
                                }
                            }
                            if (CheckClientAmount >= 0)
                            {
                                if (lastbetPosition1 <= lastbetPosition3)
                                {
                                    if (Position1 <= Position3)
                                    {
                                        Position1 = Position1 * -1;
                                        if (tempClientlimit >= Position1)
                                        {
                                            CheckClientAmount = 1000;
                                            Position1 = Position1 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else if (Position3 <= Position1)
                                    {
                                        Position3 = Position3 * -1;
                                        if (tempClientlimit >= Position3)
                                        {
                                            CheckClientAmount = 1000;
                                            Position3 = Position3 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }

                                else if (lastbetPosition3 <= lastbetPosition1)
                                {
                                    if (Position1 <= Position3)
                                    {

                                        Position1 = Position1 * -1;
                                        if (tempClientlimit >= Position1)
                                        {
                                            CheckClientAmount = 1000;
                                            Position1 = Position1 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else if (Position3 <= Position1)
                                    {
                                        Position3 = Position3 * -1;
                                        if (tempClientlimit >= Position3)
                                        {
                                            CheckClientAmount = 1000;
                                            Position3 = Position3 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }
                            }
                        }

                        else if (Mode == "K" && Team == TeamB)
                        {
                            if (lastbetPosition1 > 0 && lastbetPosition2 > 0 && lastbetPosition3 > 0)
                            {
                                decimal tempclientlimit = ClientLimit1 + lastbetPosition2;
                                Position2 = Position2 * -1;
                                decimal finalposition = lastbetPosition2 + Position2;
                                if (tempclientlimit >= finalposition)
                                {
                                    CheckClientAmount = 1000;
                                    Position2 = Position2 * -1;

                                }
                                else
                                {
                                    CheckClientAmount = 1000 * -1;
                                }
                            }
                            else
                            {
                                CheckClientAmount = CheckCoinsForKhai(lastbetPosition1, lastbetPosition2, lastbetPosition3, Position1, Position2, Position3, ClientLimit1, Amount, Rate);
                            }
                        }
                        else if (Mode == "L" && Team == TeamC)
                        {


                            decimal tempClientlimit = 0;
                            if (lastbetPosition1 > 0 && lastbetPosition2 > 0 && lastbetPosition3 > 0)
                            {
                                if (lastbetPosition1 <= lastbetPosition2)
                                {
                                    tempClientlimit = ClientLimit1 + lastbetPosition1;
                                    if (Amount > tempClientlimit)
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }
                                else if (lastbetPosition3 <= lastbetPosition1)
                                {
                                    tempClientlimit = ClientLimit1 + lastbetPosition3;
                                    if (Amount > tempClientlimit)
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }
                            }
                            else
                            {

                                if (lastbetPosition1 <= lastbetPosition2 && lastbetPosition1 <= lastbetPosition3)
                                {
                                    lastbetPosition1 = lastbetPosition1 * -1;
                                    tempClientlimit = ClientLimit1 + lastbetPosition1;
                                }
                                else if (lastbetPosition2 <= lastbetPosition1 && lastbetPosition2 <= lastbetPosition3)
                                {
                                    lastbetPosition2 = lastbetPosition2 * -1;
                                    tempClientlimit = ClientLimit1 + lastbetPosition2;
                                }
                                else if (lastbetPosition3 <= lastbetPosition1 && lastbetPosition3 <= lastbetPosition2)
                                {
                                    lastbetPosition3 = lastbetPosition3 * -1;
                                    tempClientlimit = ClientLimit1 + lastbetPosition3;
                                }
                                else
                                {
                                    tempClientlimit = ClientLimit1;
                                }
                            }
                            if (CheckClientAmount >= 0)
                            {
                                if (lastbetPosition1 <= lastbetPosition2)
                                {
                                    if (Position1 <= Position2)
                                    {
                                        Position1 = Position1 * -1;
                                        if (tempClientlimit >= Position1)
                                        {
                                            CheckClientAmount = 1000;
                                            Position1 = Position1 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else if (Position2 <= Position1)
                                    {
                                        Position2 = Position2 * -1;
                                        if (tempClientlimit >= Position2)
                                        {
                                            CheckClientAmount = 1000;
                                            Position2 = Position2 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }

                                else if (lastbetPosition2 <= lastbetPosition1)
                                {
                                    if (Position1 <= Position2)
                                    {

                                        Position1 = Position1 * -1;
                                        if (tempClientlimit >= Position1)
                                        {
                                            CheckClientAmount = 1000;
                                            Position1 = Position1 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else if (Position2 <= Position1)
                                    {
                                        Position2 = Position2 * -1;
                                        if (tempClientlimit >= Position2)
                                        {
                                            CheckClientAmount = 1000;
                                            Position2 = Position2 * -1;
                                        }
                                        else
                                        {
                                            CheckClientAmount = 1000 * -1;
                                        }
                                    }
                                    else
                                    {
                                        CheckClientAmount = 1000 * -1;
                                    }
                                }
                            }
                        }

                        else if (Mode == "K" && Team == TeamC)
                        {
                            if (lastbetPosition1 > 0 && lastbetPosition2 > 0 && lastbetPosition3 > 0)
                            {
                                decimal tempclientlimit = ClientLimit1 + lastbetPosition3;
                                Position3 = Position3 * -1;
                                decimal finalposition = lastbetPosition3 + Position3;
                                if (tempclientlimit >= finalposition)
                                {
                                    CheckClientAmount = 1000;
                                    Position3 = Position3 * -1;

                                }
                                else
                                {
                                    CheckClientAmount = 1000 * -1;
                                }
                            }
                            else
                            {
                                CheckClientAmount = CheckCoinsForKhai(lastbetPosition1, lastbetPosition2, lastbetPosition3, Position1, Position2, Position3, ClientLimit1, Amount, Rate);
                            }
                        }
                    }
                    else
                    {
                        if (TeamA == Team && Mode == "L")
                        {
                            Position1 = (Rate * Amount);
                            Position2 = (-1 * Amount);
                            Position3 = (-1 * Amount);
                        }
                        else if (TeamA == Team && Mode == "K")
                        {
                            Position1 = -(Rate * Amount);
                            Position2 = -(-1 * Amount);
                            Position3 = -(-1 * Amount);
                        }
                        else if (TeamB == Team && Mode == "L")
                        {
                            Position1 = (-1 * Amount);
                            Position2 = (Rate * Amount);
                            Position3 = (-1 * Amount);
                        }
                        else if (TeamB == Team && Mode == "K")
                        {
                            Position1 = -(-1 * Amount);
                            Position2 = -(Rate * Amount);
                            Position3 = -(-1 * Amount);
                        }
                        else if (TeamC == Team && Mode == "L")
                        {
                            Position3 = (Rate * Amount);
                            Position1 = (-1 * Amount);
                            Position2 = (-1 * Amount);
                        }
                        else if (TeamC == Team && Mode == "K")
                        {
                            Position3 = (-Rate * Amount);
                            Position1 = (1 * Amount);
                            Position2 = (1 * Amount);
                        }
                        double dvalue1 = double.Parse(Position1.ToString());
                        double dvalue2 = double.Parse(Position2.ToString());
                        double dvalue3 = double.Parse(Position3.ToString());
                        Position1 = Convert.ToDecimal(dvalue1);
                        Position2 = Convert.ToDecimal(dvalue2);
                        Position3 = Convert.ToDecimal(dvalue3);

                        if (Position1 <= Position2 && Position1 <= Position3)
                        {
                            if (Position1 < 0) { Position1 = Position1 * -1; }
                            if (Position1 <= ClientLimit1)
                            {
                                CheckClientAmount = ClientLimit1 + Position1;
                                Position1 = Position1 * -1;
                            }
                            else
                            {
                                CheckClientAmount = 1000 * -1;
                            }
                        }

                        else if (Position2 <= Position1 && Position2 <= Position3)
                        {
                            if (Position2 < 0) { Position2 = Position2 * -1; }
                            if (Position2 <= ClientLimit1)
                            {
                                CheckClientAmount = ClientLimit1 + Position2;
                                Position2 = Position2 * -1;
                            }
                            else
                            {
                                CheckClientAmount = 1000 * -1;
                            }
                        }
                        else if (Position3 <= Position1 && Position3 <= Position2)
                        {
                            if (Position3 < 0) { Position3 = Position3 * -1; }
                            if (Position3 <= ClientLimit1)
                            {
                                CheckClientAmount = ClientLimit1 + Position3;
                                Position3 = Position3 * -1;
                            }
                            else
                            {
                                CheckClientAmount = 1000 * -1;
                            }
                        }
                    }


                    if (CheckClientAmount < 0)
                    {
                        return "unsuccess";
                    }
                    else
                    {

                        string s = "Insert Into runner (ClientID, Amount, Rate, Mode, DateTime, MatchID,Team,Position1,Position2,Position3) values (@ClientID,@Amount,@Rate,@Mode,@DateTime,@MatchID,@Team,@Position1,@Position2,@Position3)";
                        MySqlCommand cmd = new MySqlCommand(s, cn);
                        cmd.Parameters.AddWithValue("@ClientID", ClientID);
                        cmd.Parameters.AddWithValue("@Amount", Amount);
                        cmd.Parameters.AddWithValue("@Rate", Rate);
                        cmd.Parameters.AddWithValue("@Mode", Mode);
                        cmd.Parameters.AddWithValue("@DateTime", DateTime.Now);
                        cmd.Parameters.AddWithValue("@MatchID", MatchID);
                        cmd.Parameters.AddWithValue("@Team", Team);
                        cmd.Parameters.AddWithValue("@Position1", Position1);
                        cmd.Parameters.AddWithValue("@Position2", Position2);
                        cmd.Parameters.AddWithValue("@Position3", Position3);
                        cmd.ExecuteNonQuery();


                        string check = "Select * from Sharetable where  MatchID = '" + MatchID + "' && ClientID = '" + ClientID + "'";
                        MySqlCommand checkcmd = new MySqlCommand(check, cn);
                        MySqlDataReader rdr = checkcmd.ExecuteReader();
                        if (rdr.Read())
                        {

                        }
                        else
                        {
                            rdr.Close();
                            string s3 = "Select Agent_Share,Createdby,MatchComm,SessionComm from ClientMaster where ClientID = '" + ClientID + "'";
                            MySqlCommand cmd3 = new MySqlCommand(s3, cn);
                            MySqlDataAdapter adp3 = new MySqlDataAdapter(cmd3);
                            DataTable dt3 = new DataTable();
                            adp3.Fill(dt3);
                            string ClientShare = dt3.Rows[0]["Agent_Share"].ToString();
                            string ClientMatchcomm = dt3.Rows[0]["MatchComm"].ToString();
                            string ClientSessionComm = dt3.Rows[0]["SessionComm"].ToString();
                            string Agentcode = dt3.Rows[0]["CreatedBy"].ToString();


                            string s4 = "Select AgentShare,Createdby,MatchCommision,SessionCommision from AgentMaster where code = '" + Agentcode + "'";
                            MySqlCommand cmd4 = new MySqlCommand(s4, cn);
                            MySqlDataAdapter adp4 = new MySqlDataAdapter(cmd4);
                            DataTable dt4 = new DataTable();
                            adp4.Fill(dt4);
                            string AgentShare = dt4.Rows[0]["AgentShare"].ToString();
                            string AgentMatchCommision = dt4.Rows[0]["MatchCommision"].ToString();
                            string AgentSessionCommision = dt4.Rows[0]["SessionCommision"].ToString();
                            string SuperAgentCode = dt4.Rows[0]["CreatedBy"].ToString();


                            string s5 = "Select myshare,Createdby,MatchCommision,SessionCommision from SuperAgentMaster where code = '" + SuperAgentCode + "'";
                            MySqlCommand cmd5 = new MySqlCommand(s5, cn);
                            MySqlDataAdapter adp5 = new MySqlDataAdapter(cmd5);
                            DataTable dt5 = new DataTable();
                            adp5.Fill(dt5);
                            string SAgentShare = dt5.Rows[0]["myshare"].ToString();
                            string SAgentMatchCommision = dt5.Rows[0]["MatchCommision"].ToString();
                            string SAgentSessionCommision = dt5.Rows[0]["SessionCommision"].ToString();
                            string superstokistcode = dt5.Rows[0]["CreatedBy"].ToString();

                            string s6 = "Select myshare,Createdby,MatchCommision,SessionCommision from Superstockistmaster where code = '" + superstokistcode + "'";
                            MySqlCommand cmd6 = new MySqlCommand(s6, cn);
                            MySqlDataAdapter adp6 = new MySqlDataAdapter(cmd6);
                            DataTable dt6 = new DataTable();
                            adp6.Fill(dt6);
                            string SSShare = dt6.Rows[0]["myshare"].ToString();
                            string SSMatchComm = dt6.Rows[0]["MatchCommision"].ToString();
                            string SSsessionComm = dt6.Rows[0]["SessionCommision"].ToString();



                            string s7 = "Insert into sharetable (ClientID,MatchID,AgentShare,SAgentshare,ClientShare,ClientMatchComm,ClientSessionComm,AgentMatchComm,AgentSessionComm,SAgentMatchComm,SAgentSessionComm,SSMatchComm,SSsessioncomm,SSshare) values(@ClientID,@MatchID,@AgentShare,@SAgentShare,@ClientShare,@ClientMatchComm,@ClientSessionComm,@AgentMatchComm,@AgentSessionComm,@SAgentMatchComm,@SAgentSessionComm,@SSMatchComm,@SSsessionComm,@SSshare)";
                            MySqlCommand cmd7 = new MySqlCommand(s7, cn);

                            cmd7.Parameters.AddWithValue("@ClientID", ClientID);
                            cmd7.Parameters.AddWithValue("@MatchID", MatchID);
                            cmd7.Parameters.AddWithValue("@AgentShare", AgentShare);
                            cmd7.Parameters.AddWithValue("@SAgentShare", SAgentShare);
                            cmd7.Parameters.AddWithValue("@ClientShare", ClientShare);
                            cmd7.Parameters.AddWithValue("@ClientMatchComm", ClientMatchcomm);
                            cmd7.Parameters.AddWithValue("@ClientSessioncomm", ClientSessionComm);
                            cmd7.Parameters.AddWithValue("@AgentMatchComm", AgentMatchCommision);
                            cmd7.Parameters.AddWithValue("@AgentSessionComm", AgentSessionCommision);
                            cmd7.Parameters.AddWithValue("@SAgentMatchComm", SAgentMatchCommision);
                            cmd7.Parameters.AddWithValue("@SAgentSessionComm", SAgentSessionCommision);
                            cmd7.Parameters.AddWithValue("@SSMatchComm", SSMatchComm);
                            cmd7.Parameters.AddWithValue("@SSsessionComm", SSsessionComm);
                            cmd7.Parameters.AddWithValue("@SSshare", SSShare);
                            cmd7.ExecuteNonQuery();

                        }
                        return "success";

                    }

                }

            }

            catch (Exception e)
            {
                return e.Message;
            }
        }
        public Decimal CheckCoinsForLagai(int lastbetPosition1, int lastbetPosition2, int lastbetPosition3, int Position1, int Position2, int Position3, decimal ClientLimit1)
        {
            Decimal CheckClientAmount = 0;
            if (lastbetPosition1 <= lastbetPosition2 && lastbetPosition1 <= lastbetPosition3)
            {
                if (Position1 <= Position2 && Position1 <= Position3)
                {
                    if (Position2 < Position3)
                    {
                        if (lastbetPosition1 < 0)
                        {
                            decimal checklastposition = lastbetPosition1;
                            if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                            if (checklastposition > 0)
                            {
                                if (lastbetPosition1 < 0)
                                {
                                    ClientLimit1 = ClientLimit1 + checklastposition;
                                }
                            }
                            if (Position1 < 0) { Position1 = Position1 * -1; }
                            if (ClientLimit1 >= Position1)
                            {
                                Position1 = Position1 * -1;
                                CheckClientAmount = 1000;
                            }
                            else
                            {
                                CheckClientAmount = 1000 * -1;
                            }
                        }
                    }
                    else
                    {
                        CheckClientAmount = 1000 * -1;
                    }
                }
                else if (Position2 <= Position1 && Position2 <= Position3)
                {
                    if (lastbetPosition1 < 0)
                    {
                        decimal checklastposition = lastbetPosition1;
                        if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                        if (checklastposition > 0)
                        {
                            if (lastbetPosition1 < 0)
                            {
                                ClientLimit1 = ClientLimit1 + checklastposition;
                            }
                        }
                        if (Position2 < 0) { Position2 = Position2 * -1; }
                        if (ClientLimit1 >= Position2)
                        {
                            Position2 = Position2 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        CheckClientAmount = 1000 * -1;
                    }
                }
                else if (Position3 <= Position1 && Position3 <= Position2)
                {
                    if (lastbetPosition1 < 0)
                    {
                        decimal checklastposition = lastbetPosition1;
                        if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                        if (checklastposition > 0)
                        {
                            if (lastbetPosition1 < 0)
                            {
                                ClientLimit1 = ClientLimit1 + checklastposition;
                            }
                        }
                        if (Position3 < 0) { Position3 = Position3 * -1; }
                        if (ClientLimit1 >= Position3)
                        {
                            Position3 = Position3 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        CheckClientAmount = 1000 * -1;
                    }
                }
            }
            if (lastbetPosition2 <= lastbetPosition1 && lastbetPosition2 <= lastbetPosition3)
            {
                if (Position1 <= Position2 && Position1 <= Position3)
                {

                    decimal checklastposition = lastbetPosition2;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        if (lastbetPosition2 < 0)
                        {
                            ClientLimit1 = ClientLimit1 + checklastposition;
                        }
                    }
                    if (Position1 < 0) { Position1 = Position1 * -1; }
                    if (ClientLimit1 >= Position1)
                    {
                        Position1 = Position1 * -1;
                        CheckClientAmount = 1000;
                    }
                    else
                    {
                        CheckClientAmount = 1000 * -1;
                    }

                }
                else if (Position2 <= Position1 && Position2 <= Position3)
                {
                    if (lastbetPosition2 < 0)
                    {
                        decimal checklastposition = lastbetPosition2;
                        if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                        if (checklastposition > 0)
                        {
                            if (lastbetPosition2 < 0)
                            {
                                ClientLimit1 = ClientLimit1 + checklastposition;
                            }
                        }
                        if (Position2 < 0) { Position2 = Position2 * -1; }
                        if (ClientLimit1 >= Position2)
                        {
                            Position2 = Position2 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        CheckClientAmount = 1000 * -1;
                    }
                }
                else if (Position3 <= Position1 && Position3 <= Position2)
                {
                    if (lastbetPosition2 < 0)
                    {
                        decimal checklastposition = lastbetPosition2;
                        if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                        if (checklastposition > 0)
                        {
                            if (lastbetPosition2 < 0)
                            {
                                ClientLimit1 = ClientLimit1 + checklastposition;
                            }
                        }
                        if (Position3 < 0) { Position3 = Position3 * -1; }
                        if (ClientLimit1 >= Position3)
                        {
                            Position3 = Position3 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
            }
            if (lastbetPosition3 <= lastbetPosition1 && lastbetPosition3 <= lastbetPosition2)
            {
                if (Position1 < Position2 && Position1 < Position3)
                {
                    if (lastbetPosition3 < 0)
                    {
                        decimal checklastposition = lastbetPosition3;
                        if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                        if (checklastposition > 0)
                        {
                            if (lastbetPosition3 < 0)
                            {
                                ClientLimit1 = ClientLimit1 + checklastposition;
                            }
                        }
                        if (Position1 < 0) { Position1 = Position1 * -1; }
                        if (ClientLimit1 >= Position1)
                        {
                            Position1 = Position1 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        CheckClientAmount = 1000 * -1;
                    }
                }
                else if (Position2 <= Position1 && Position2 <= Position3)
                {
                    if (lastbetPosition3 < 0)
                    {
                        decimal checklastposition = lastbetPosition3;
                        if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                        if (checklastposition > 0)
                        {
                            if (lastbetPosition3 < 0)
                            {
                                ClientLimit1 = ClientLimit1 + checklastposition;
                            }
                        }
                        if (Position2 < 0) { Position2 = Position2 * -1; }
                        if (ClientLimit1 >= Position2)
                        {
                            Position2 = Position2 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        CheckClientAmount = 1000 * -1;
                    }
                }
                else if (Position3 <= Position1 && Position3 <= Position2)
                {
                    if (lastbetPosition3 < 0)
                    {
                        decimal checklastposition = lastbetPosition3;
                        if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                        if (checklastposition > 0)
                        {
                            if (lastbetPosition3 < 0)
                            {
                                ClientLimit1 = ClientLimit1 + checklastposition;
                            }
                        }
                        if (Position3 < 0) { Position3 = Position3 * -1; }
                        if (ClientLimit1 >= Position3)
                        {
                            Position3 = Position3 * -1;
                            CheckClientAmount = 1000;

                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        CheckClientAmount = 1000 * -1;
                    }
                }
            }
            return CheckClientAmount;
        }
        public Decimal CheckCoinsForKhai(int lastbetPosition1, int lastbetPosition2, int lastbetPosition3, decimal Position1, decimal Position2, decimal Position3, decimal ClientLimit1, decimal Amount, decimal Rate)
        {
            Decimal CheckClientAmount = 0;
            if (lastbetPosition1 <= lastbetPosition2 && lastbetPosition1 <= lastbetPosition3)
            {
                if (Position1 <= Position2 && Position1 <= Position3)
                {
                    decimal checklastposition = lastbetPosition1;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        ClientLimit1 = ClientLimit1 + checklastposition;
                    }
                    if (lastbetPosition1 < 0)
                    {
                        Position1 = Position1 * -1;
                        if (ClientLimit1 >= Position1)
                        {
                            Position1 = Position1 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        Position1 = Amount * Rate;
                        if (ClientLimit1 >= Position1)
                        {
                            Position1 = Position1 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
                else if (Position2 <= Position1 && Position2 <= Position3)
                {

                    decimal checklastposition = lastbetPosition1;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        ClientLimit1 = ClientLimit1 + checklastposition;
                    }
                    if (lastbetPosition1 < 0)
                    {
                        Position2 = Position2 * -1;
                        if (ClientLimit1 >= Position2)
                        {
                            Position2 = Position2 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        Position2 = Amount * Rate;
                        if (ClientLimit1 >= Position2)
                        {
                            Position2 = Position2 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
                else if (Position3 <= Position1 && Position3 <= Position2)
                {
                    decimal checklastposition = lastbetPosition1;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        ClientLimit1 = ClientLimit1 + checklastposition;
                    }
                    if (lastbetPosition1 < 0)
                    {
                        Position3 = Position3 * -1;
                        if (ClientLimit1 >= Position3)
                        {
                            Position3 = Position3 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        Position3 = Amount * Rate;
                        if (ClientLimit1 >= Position3)
                        {
                            Position3 = Position3 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
            }
            else if (lastbetPosition2 <= lastbetPosition1 && lastbetPosition2 <= lastbetPosition3)
            {
                if (Position1 <= Position2 && Position1 <= Position3)
                {
                    decimal checklastposition = lastbetPosition2;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        ClientLimit1 = ClientLimit1 + checklastposition;
                    }
                    if (lastbetPosition2 < 0)
                    {
                        Position1 = Position1 * -1;
                        if (ClientLimit1 >= Position1)
                        {
                            Position1 = Position1 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        Position1 = Amount * Rate;
                        if (ClientLimit1 >= Position1)
                        {
                            Position1 = Position1 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
                else if (Position2 <= Position1 && Position2 <= Position3)
                {
                    decimal checklastposition = lastbetPosition2;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        ClientLimit1 = ClientLimit1 + checklastposition;
                    }
                    if (lastbetPosition2 < 0)
                    {
                        Position2 = Position2 * -1;
                        if (ClientLimit1 >= Position2)
                        {
                            Position2 = Position2 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        Position2 = Amount * Rate;
                        if (ClientLimit1 >= Position2)
                        {
                            Position2 = Position2 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
                else if (Position3 <= Position1 && Position3 <= Position2)
                {
                    decimal checklastposition = lastbetPosition2;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        ClientLimit1 = ClientLimit1 + checklastposition;
                    }
                    if (lastbetPosition2 < 0)
                    {
                        Position3 = Position3 * -1;
                        if (ClientLimit1 >= Position3)
                        {
                            Position3 = Position3 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        Position3 = Amount * Rate;
                        if (ClientLimit1 >= Position3)
                        {
                            Position3 = Position3 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
            }
            else if (lastbetPosition3 <= lastbetPosition1 && lastbetPosition3 <= lastbetPosition2)
            {
                if (Position1 <= Position2 && Position1 <= Position3)
                {
                    decimal checklastposition = lastbetPosition3;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        ClientLimit1 = ClientLimit1 + checklastposition;
                    }
                    if (lastbetPosition3 < 0)
                    {
                        Position1 = Position1 * -1;
                        if (ClientLimit1 >= Position1)
                        {
                            Position1 = Position1 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        Position1 = Amount * Rate;
                        if (ClientLimit1 >= Position1)
                        {
                            Position1 = Position1 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
                else if (Position2 <= Position1 && Position2 <= Position3)
                {

                    decimal checklastposition = lastbetPosition3;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        ClientLimit1 = ClientLimit1 + checklastposition;
                    }
                    if (lastbetPosition3 < 0)
                    {
                        Position2 = Position2 * -1;
                        if (ClientLimit1 >= Position2)
                        {
                            Position2 = Position2 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        Position2 = Amount * Rate;
                        if (ClientLimit1 >= Position2)
                        {
                            Position2 = Position2 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
                else if (Position3 <= Position1 && Position3 <= Position2)
                {
                    decimal checklastposition = lastbetPosition3;
                    if (checklastposition < 0) { checklastposition = checklastposition * -1; }
                    if (checklastposition > 0)
                    {
                        ClientLimit1 = ClientLimit1 + checklastposition;
                    }
                    if (lastbetPosition3 < 0)
                    {
                        Position3 = Position3 * -1;
                        if (ClientLimit1 >= Position3)
                        {
                            Position3 = Position3 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                    else
                    {
                        Position3 = Amount * Rate;
                        if (ClientLimit1 >= Position3)
                        {
                            Position3 = Position3 * -1;
                            CheckClientAmount = 1000;
                        }
                        else
                        {
                            CheckClientAmount = 1000 * -1;
                        }
                    }
                }
            }
            return CheckClientAmount;
        }
    }
}