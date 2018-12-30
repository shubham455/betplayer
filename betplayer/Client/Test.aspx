<%@ Page Language="C#" MasterPageFile="~/Client/Menu.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="betplayer.Client.Test" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h3 hidden="hidden">Session Idle:&nbsp;<span id="secondsIdle" hidden="hidden"></span>&nbsp;seconds.</h3>
    <asp:LinkButton ID="LinkButton1" runat="server" />

    <asp:LinkButton ID="lnkFake" runat="server" />

    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
        <div class="header">
            Session Expiring!
        </div>
        <div class="body">
            Your Session will expire in&nbsp;<span id="seconds"></span>&nbsp;seconds.<br />
            Do you want to reset?
        </div>
        <div class="footer" align="right">
            <asp:Button ID="btnYes" runat="server" Text="Yes" CssClass="yes" />
            <asp:Button ID="btnNo" runat="server" Text="No" CssClass="no" />
        </div>
    </asp:Panel>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td valign="top">

                    <table style="width: 100%" border="0" cellspacing="2" cellpadding="2">
                        <tbody>
                            <tr>
                                
                                    <marquee hspace="0" scrollamount="5" behavior="SCROLL" class="notifymark" onmouseover="this.stop();" onmouseout="this.start();"> <p class="price-btn price-btn-blue popup-with-zoom-anim" style="height: auto; font-size: 13px; font-weight: bold; text-decoration: blink;"><span id="ScoreMsg" style="text-decoration: blink !important;"></span></p>
                                <p style="color:#fff;" id="shownews"></p></marquee>
                                    <%--<td colspan="3" width="100%" align="center" class="TeamCombo" style="vertical-align: top; height: 10px;">--%>
                                    <%--<p class="price-btn price-btn-blue popup-with-zoom-anim" style="height: auto; font-size: 13px; font-weight: bold; text-decoration: blink;"><span id="ScoreMsg" style="text-decoration: blink !important;"></span></p>--%>

                            </tr>
                            <tr>
                                <td style="width: 40%; height: 20px;" align="center" class="TeamCombo">
                                    <div class="ScoreCard">
                                        <p>
                                            <span id="batsmanOne"></span>
                                            <br>
                                            <span id="batsmanTwo"></span>
                                        </p>
                                    </div>
                                </td>
                                <td style="width: 40%; height: 20px;" align="center" class="TeamCombo">
                                    <div class="ScoreCard_rtmScore ScoreCard" style="color: #000; height: 100%;">
                                        <p>
                                            <span id="LocalTeam"></span>
                                            <br />
                                            <br />
                                            <span id="VisitorTeam"></span>
                                            <br>
                                            <span id="Status"></span>
                                        </p>
                                    </div>
                                </td>
                                <td style="width: 20%; height: 20px;" align="center" class="TeamCombo">
                                    <div class="ScoreCard">
                                        <p>
                                            <img id="LastBall" style="height: 100%;" src="" />
                                        </p>
                                    </div>
                                </td>
                            </tr>

                        </tbody>
                    </table>

                </td>
            </tr>
            <tr>
                <td align="left" valign="top">

                    <table style="width: 100%; border-color: #000;" border="1" cellpadding="2" cellspacing="2">
                        <tbody>
                            <% foreach (System.Data.DataRow row in MatchesDataTable.Rows)
                                { %>
                            <tr>
                                <td height="35" align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite" style="vertical-align: middle; width: 30%;">RUNNER</td>
                                <td align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite" style="vertical-align: middle; width: 10%;">MIN/MAX BET</td>
                                <td align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite" style="vertical-align: middle; width: 20%;">POSITION</td>
                                <td align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite" style="vertical-align: middle; width: 20%;">LAGAI</td>
                                <td align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite" style="vertical-align: middle; width: 20%;">KHAI</td>

                            </tr>

                            <tr id="runnerrow1">
                                <td height="35" id="Team1" align="center" valign="middle" bgcolor="#FFF" style="vertical-align: middle; font-weight: bold;"><%: row["TeamA"] %></td>
                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; border: 1px solid black; bo vertical-align: middle">
                                    <label id="matchMinBet" style="color: red;"></label>
                                </td>
                                <td align="center" valign="middle" bgcolor="#FFF" border="1" class="FontTextWhite" style="color: #000; border: 1px solid black; vertical-align: middle">
                                    <asp:Label ID="PositionTeam1" runat="server"></asp:Label>
                                </td>
                                <td align="center" valign="middle" bgcolor="#1E90FF" style="vertical-align: middle; position: relative;">
                                    <div id="runnerfloat1" class="runnerfloat"></div>
                                    <input type="button" name="ButtonL" id="LRate1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_1', 'Runner', 'Lagai')" /></td>
                                <td align="center" valign="middle" bgcolor="#FF87A0" class="textTeamHead" style="vertical-align: middle; color: #000">
                                    <input type="button" name="ButtonK" id="KRate1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Runner', 'Khai')" /></td>

                            </tr>

                            <tr id="runnerrow2">
                                <td height="35" id="Team2" align="center" valign="middle" bgcolor="#FFF" style="vertical-align: middle; font-weight: bold;"><%: row["TeamB"] %></td>
                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; border: 1px solid black; vertical-align: middle">
                                    <label id="matchMaxBet" style="color: red;"></label>
                                </td>
                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; border: 1px solid black; vertical-align: middle">
                                    <asp:Label ID="PositionTeam2" runat="server"></asp:Label>
                                </td>
                                <td align="center" valign="middle" bgcolor="#1E90FF" class="textTeamHead" style="vertical-align: middle; position: relative;">
                                    <div id="runnerfloat2" class="runnerfloat"></div>
                                    <input type="button" name="ButtonL" id="LRate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_2', 'Runner', 'Lagai')" /></td>
                                <td align="center" valign="middle" bgcolor="#FF87A0" class="textTeamHead" style="vertical-align: middle; color: #000">
                                    <input type="button" name="ButtonK" id="KRate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL _hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_2', 'Runner', 'Khai')" /></td>
                            </tr>

                            <%if (emptyLedgerTable)
                                {
                            %>

                            <tr id="runnerrow3">
                                <td height="35" id="Team3" align="center" valign="middle" bgcolor="#FFF" style="vertical-align: middle; font-weight: bold;"><%: row["TeamC"] %></td>
                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; border: 1px solid black; vertical-align: middle">
                                    <label id="matchMinMaxBet" style="color: red;"></label>
                                </td>
                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; border: 1px solid black; vertical-align: middle">
                                    <asp:Label ID="PositionTeam3" runat="server"></asp:Label>
                                </td>
                                <td align="center" valign="middle" bgcolor="#1E90FF" class="textTeamHead" style="vertical-align: middle; position: relative;">
                                    <div id="runnerfloat3" class="runnerfloat"></div>
                                    <input type="button" name="ButtonL" id="LRate3" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_c', 'Runner', 'Lagai')" /></td>
                                <td align="center" valign="middle" bgcolor="#FF87A0" class="textTeamHead" style="vertical-align: middle; color: #000">
                                    <input type="button" name="ButtonK" id="KRate3" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL _hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_c', 'Runner', 'Khai')" /></td>
                            </tr>
                            <%  } //if
                                } //foreach
                            %>
                        </tbody>
                    </table>


                    <!--popup-->

                    <table width="100%">
                        <tr>
                            <td>
                                <div id="PlaceBet" style="border: 1px solid black; margin-top: 5px; display: none; width: 100%">
                                    <table width="98%" align="center">
                                        <tr>
                                            <td height="35" align="center" valign="middle" class="FontTextBlue" style="vertical-align: middle; border: 1px solid black;">
                                                <span id="Particular">&nbsp;</span>
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="98%">
                                        <tr>
                                            <td align="left">
                                                <label class="label-md" stacked="">&nbsp;ODDS</label>
                                            </td>
                                            <td width="50" align="center" class="FontTextBlue" valign="middle">&nbsp;</td>
                                            <td width="50" align="center" class="FontTextBlue"><span id="Name_Odds" style="font-size: 15px;"></span></td>
                                            <td width="50" align="center" class="FontTextBlue"><span id="Mode_Odds" style="font-size: 15px;"></span></td>

                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <style>
                                                    input#matchAmount::-webkit-input-placeholder { /* Chrome/Opera/Safari */
                                                        color: white;
                                                    }

                                                    input#matchAmount::-moz-placeholder { /* Firefox 19+ */
                                                        color: white;
                                                    }

                                                    input#matchAmount:-ms-input-placeholder { /* IE 10+ */
                                                        color: white;
                                                    }

                                                    input#matchAmount:-moz-placeholder { /* Firefox 18- */
                                                        color: white;
                                                    }
                                                </style>
                                                <input placeholder="Enter Amount" type="text" name="MatchAmount" id="matchAmount" style="background-color: #090; text-align: center; border: none; color: #FFF; font-weight: bold; height: 35px; width: 150px; margin-left: 5px; font-color: #FFF;">
                                            </td>
                                            <td width="50" align="left">
                                                <input name="AmountTime" type="button" id="AmountTime" size="4" maxlength="3" readonly autocomplete="OFF" style="border-color: transparent; background-color: transparent" class="AmountTime" />
                                            </td>
                                            <td width="50" align="center" class="FontTextBlue" valign="middle">
                                                <input type="button" name="Rate1_Odds" id="Rate1_Odds" value="" class="ButtonK" />
                                            </td>
                                            <td width="50" align="center" class="FontTextBlue" valign="middle">
                                                <input type="button" name="Rate2_Odds" id="Rate2_Odds" value="" class="ButtonK" />
                                            </td>

                                        </tr>
                                    </table>
                                    <br />
                                    <table width="98%">
                                        <tr>
                                            <td width="2%" align="center">&nbsp;</td>
                                            <td width="47%" align="center" bgcolor="#F00">
                                                <button onclick="clearTimer()" type="button" id="cmdCancel" name="cmdCancel" style="width: 100%; color: white; font-weight: bold; height: 34px; position: relative; background-color: #F00; border: none;">Cancel</button></td>
                                            <td width="2%" align="center">&nbsp;</td>
                                            <td width="47%" align="center" bgcolor="#090">
                                                <button onclick="doneClick()" type="button" id="cmdDone" name="cmdDone" style="width: 100%; color: white; font-weight: bold; background-color: #090; height: 34px; position: relative; border: none;">Place Bet</button></td>
                                            <td width="2%" align="center">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table width="98%" table="table">
                                        <tr height="40">
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(100)" value="100" />
                                            </td>
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(500)" value="500" />
                                            </td>
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(1000)" value="1,000" />
                                            </td>
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(5000)" value="5,000" />
                                            </td>
                                        </tr>
                                        <tr height="40">
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(10000)" value="10,000" />
                                            </td>
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(25000)" value="25,000" />
                                            </td>
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(50000)" value="50,000" />
                                            </td>
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(75000)" value="75,000" />
                                            </td>
                                        </tr>
                                        <tr height="40">
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(100000)" value="1,00,000" />
                                            </td>
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(200000)" value="2,00,000" />
                                            </td>
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(300000)" value="3,00,000" />
                                            </td>
                                            <td width="25%" align="center" bgcolor="#000" style="border: 5px solid white;">
                                                <input type="button" style="background-color: black; width: 100%; color: white; border: none;" onclick="SetAmount(500000)" value="5,00,000" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <!--end popup-->
                </td>
            </tr>
            <tr>
                <td align="center" valign="bottom" bgcolor="#FFFFFF"></td>
            </tr>
            <tr>
                <td height="35" align="center" class="TeamCombo">
                    <table width="99%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr bgcolor="#FFF" height="35px;">
                                <td class="FontTextWhite">&nbsp;<span style="color: #00F"></span>/<span style="color: #F00"></span></td>
                                <td width="100" style="font-size: 14px; font-family: Verdana, Geneva, sans-serif; font-weight: bold;">
                                    <td class="FontTextWhite">&nbsp;<span style="color: #00F;">Session Position</span>
                                        <span style="color: #00F">
                                            <asp:Label ID="lblAmount" runat="server" Font-Size="13pt" Font-Bold="true"></asp:Label></span>  </td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top">
                    <table style="width: 100%;" border="1" cellpadding="0" cellspacing="2">
                        <tbody id="SessionFancyTableBody">
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top">
                    <table width="90%" border="0" cellpadding="0" cellspacing="0" id="PlaceBet1" style="display: none;">
                        <tr>
                            <td height="35" align="center" valign="middle" bgcolor="#fff" class="FontTextWhite" style="vertical-align: middle">AMOUNT</td>
                            <td align="center" valign="middle" bgcolor="#fff" style="vertical-align: middle">
                                <input name="MatchAmount1" type="text" class="ClientText" id="MatchAmount1" onkeypress="" size="10" maxlength="7" readonly autocomplete="OFF" /></td>
                            <td align="center" valign="middle" bgcolor="#fff" style="vertical-align: middle"></td>
                            <td align="center" valign="middle" bgcolor="#fff" style="vertical-align: middle">
                                <input name="cmdDone1" type="button" class="FontTextBlue" style="height: 35px; width: 85px; font-size: 18px;" id="cmdDone1" onclick="doneClick()" value="Done" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>


    <div class="menu" id="menu" align="center">
        <ul class="nav">
            <% foreach (System.Data.DataRow row in MatchesDataTable1.Rows)
                { %>
            <li class="active"><a href="Test.aspx?id=<%: row["apiID"] %>&fk=<%: row["firebasekey"] %>&Type=<%: row["Type"] %>&RType=<%:row["AutoSession"] %>"><%: row["TeamA"] %> V <%: row["TeamB"] %> <%: row["Type"] %></a></li>
            <% } //foreach %>

            <li class="active"><a href="AllGamesList.aspx">BACK TO LIST</a></li>
        </ul>
    </div>

    <br />
    <table width="100%" border="1" cellpadding="2" cellspacing="2" id="MyBets">
        <tbody>
            <tr>
                <td style="height: 25px;" align="center" valign="middle" bgcolor="#FFAB91" class="FontTextWhite10px">Rate</td>
                <td align="center" valign="middle" bgcolor="#FFAB91" class="FontTextWhite10px">Amount</td>
                <td align="center" bgcolor="#FFAB91" style="text-align: center;" class="FontTextWhite10px">Mode</td>
                <td align="center" bgcolor="#FFAB91" style="text-align: center;" class="FontTextWhite10px">Team</td>
            </tr>

            <% foreach (System.Data.DataRow row in lastbetRunner1.Rows)
                { %>
            <tr>

                <td align="left" style="background: #FFF; color: black; text-align: center; height: 25px;" class="FontTextWhite10px "><%:row["Rate"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Amount"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Mode"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Team"] %></td>
            </tr>
            <% } //foreach %>
        </tbody>
    </table>
    <br />
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td height="25" align="center" bgcolor="#FFAB91" class="FontTextWhite10px">Session</td>
                <td align="center" valign="middle" bgcolor="#FFAB91" class="FontTextWhite10px">Rate</td>
                <td align="center" valign="middle" bgcolor="#FFAB91" class="FontTextWhite10px">Amount</td>
                <td align="center" bgcolor="#FFAB91" class="FontTextWhite10px">Runs</td>
                <td align="center" bgcolor="#FFAB91" class="FontTextWhite10px">Mode</td>
                <td align="center" bgcolor="#FFAB91" class="FontTextWhite10px">Dec</td>
            </tr>


            <% foreach (System.Data.DataRow row in lastBetSession1.Rows)
                { %>
            <tr>

                <td align="right" style="background: #FFF; color: black; text-align: center; height: 25px; width: 250px" class="FontTextWhite10px "><%:row["Session"] %></td>
                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Rate"] %></td>
                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Amount"] %></td>
                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Runs"] %></td>
                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Mode"] %></td>
            </tr>
            <% } //foreach %>
        </tbody>
    </table>
    <br />
    <br />
    <br />
    <table width="100%" border="0" cellspacing="2" cellpadding="0">
        <tbody>
            <tr>
                <td>

                    <table width="100%" border="0" cellpadding="0" cellspacing="0">

                        <tbody>
                            <tr onclick="javascript:ShowMatchBets();">
                                <td height="37" align="center" valign="middle" bgcolor="#fff" class="FontTextWhite10px" style="vertical-align: middle; border: 1px solid black; color: #F00">MATCH BOOK</td>
                            </tr>

                            <tr style="visibility: hidden; display: none;" id="MatchBook">
                                <td style="border: 1px solid black;">
                                    <table width="100%" border="1" cellpadding="2" cellspacing="2" id="MyBets">
                                        <tbody>
                                            <tr>
                                                <td style="height: 25px;" align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite10px">Rate</td>
                                                <td align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite10px">Amount</td>
                                                <td align="center" bgcolor="#00b0ff" style="text-align: center;" class="FontTextWhite10px">Mode</td>
                                                <td align="center" bgcolor="#00b0ff" style="text-align: center;" class="FontTextWhite10px">Team</td>
                                            </tr>

                                            <% foreach (System.Data.DataRow row in MatchesDataTable3.Rows)
                                                { %>
                                            <tr>

                                                <td align="left" style="background: #FFF; color: black; text-align: center; height: 25px;" class="FontTextWhite10px "><%:row["Rate"] %></td>
                                                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Amount"] %></td>
                                                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Mode"] %></td>
                                                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Team"] %></td>
                                            </tr>
                                            <% } //foreach %>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <table width="100%" border="0" cellpadding="0" cellspacing="0">

        <tbody>
            <tr onclick="javascript:ShowSessionBetsBook();">
                <td height="37" align="center" valign="middle" bgcolor="#fff" class="FontTextWhite10px" style="vertical-align: middle; border: 1px solid black; color: #F00">SESSION BOOK</td>
            </tr>
            <tr style="visibility: hidden; display: none;" id="SessionBook">
                <td style="border: 1px solid black;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td height="25" align="center" bgcolor="#00b0ff" class="FontTextWhite10px">Session</td>
                                <td align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite10px">Rate</td>
                                <td align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite10px">Amount</td>
                                <td align="center" bgcolor="#00b0ff" class="FontTextWhite10px">Runs</td>
                                <td align="center" bgcolor="#00b0ff" class="FontTextWhite10px">Mode</td>
                                <td align="center" bgcolor="#00b0ff" class="FontTextWhite10px">Dec</td>
                            </tr>


                            <% foreach (System.Data.DataRow row in MatchesDataTable5.Rows)
                                { %>
                            <tr>

                                <td align="center" style="background: #FFF; color: black; text-align: center; height: 25px; width: 250px" class="FontTextWhite10px "><%:row["Session"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Rate"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Amount"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Runs"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Mode"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["DEC"] %></td>
                            </tr>
                            <% } //foreach %>
                        </tbody>
                    </table>

                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <table width="100%" border="0" cellpadding="0" cellspacing="0">

        <tbody>
            <tr onclick="javascript:ShowFancyBetsBook();">
                <td height="37" align="center" valign="middle" bgcolor="#fff" class="FontTextWhite10px" style="vertical-align: middle; border: 1px solid black; color: #F00">FANCY BOOK</td>
            </tr>
            <tr style="visibility: hidden; display: none;" id="fancyBook">
                <td style="border: 1px solid black;">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td height="25" align="center" bgcolor="#00b0ff" class="FontTextWhite10px">Fancy</td>
                                <td align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite10px">Rate</td>
                                <td align="center" valign="middle" bgcolor="#00b0ff" class="FontTextWhite10px">Amount</td>
                                <td align="center" bgcolor="#00b0ff" class="FontTextWhite10px">Runs</td>
                                <td align="center" bgcolor="#00b0ff" class="FontTextWhite10px">Mode</td>
                                <td align="center" bgcolor="#00b0ff" class="FontTextWhite10px">Dec</td>
                            </tr>


                            <% foreach (System.Data.DataRow row in MatchesDataTable6.Rows)
                                { %>
                            <tr>

                                <td align="center" style="background: #FFF; color: black; text-align: center; height: 25px; width: 250px" class="FontTextWhite10px "><%:row["Session"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Rate"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Amount"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Runs"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Mode"] %></td>
                                <td align="center" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["DEC"] %></td>
                            </tr>
                            <% } //foreach %>
                        </tbody>
                    </table>

                </td>
            </tr>
        </tbody>
    </table>
    <!-- Modal -->
    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <span class="close" onclick="javascript:document.getElementById('myModal').style.display = 'none';location.reload();">&times;</span>
                <h2>Success...!!</h2>
            </div>
            <div class="modal-body">
                <img src="images/checked.svg" />
                <p>Bet Made Successfully...</p>
            </div>
            <div class="modal-footer">
            </div>
        </div>

    </div>

    <link rel="stylesheet" href="css/Home/mss_v1.css" />
    <div align="center" class="tv-container" style="margin: 15px 0">
        <ul id="p1"></ul>
    </div>
    <asp:HiddenField ID="firebasekey" runat="server" />
    <asp:HiddenField ID="apiID" runat="server" />
    <asp:HiddenField ID="RateDifference" runat="server" />
    <script src="https://www.gstatic.com/firebasejs/5.5.0/firebase.js"></script>
    <!-- player !-->
    <script src="js/Homejs/mss_v1.js" type="text/javascript"></script>
    <script src="js/Homejs/jsbn.js"></script>
    <script src="js/Homejs/money.js"></script>
    <script src="js/Homejs/BetDetailsCustom_v4.8.3.js"></script>
    <script>
        function ShowMatchBets(SessionName) {
            if (document.getElementById("MatchBook").style.visibility == "hidden") {
                document.getElementById("MatchBook").style.visibility = "visible";
                document.getElementById("MatchBook").style.display = "table-row";
            }
            else {
                document.getElementById("MatchBook").style.visibility = "hidden";
                document.getElementById("MatchBook").style.display = "none";
            }
        }

        function ShowSessionBetsBook(SessionName) {
            if (document.getElementById("SessionBook").style.visibility == "hidden") {
                document.getElementById("SessionBook").style.visibility = "visible";
                document.getElementById("SessionBook").style.display = "table-row";
            }
            else {
                document.getElementById("SessionBook").style.visibility = "hidden";
                document.getElementById("SessionBook").style.display = "none";
            }
        } function ShowFancyBetsBook(SessionName) {
            if (document.getElementById("fancyBook").style.visibility == "hidden") {
                document.getElementById("fancyBook").style.visibility = "visible";
                document.getElementById("fancyBook").style.display = "table-row";
            }
            else {
                document.getElementById("fancyBook").style.visibility = "hidden";
                document.getElementById("fancyBook").style.display = "none";
            }
        }
        window.onclick = function (event) {
            if (event.target == document.getElementById('myModal')) {
                document.getElementById('myModal').style.display = "none";
                location.reload();
            }
        }
    </script>
    <script type="text/javascript">
        function SessionExpireAlert(timeout) {
            var seconds = timeout / 1000;
            document.getElementsByName("secondsIdle").innerHTML = seconds;
            document.getElementsByName("seconds").innerHTML = seconds;
            setInterval(function () {
                seconds--;
                document.getElementById("seconds").innerHTML = seconds;
                document.getElementById("secondsIdle").innerHTML = seconds;
            }, 1000);
            setTimeout(function () {
                //Show Popup before 20 seconds of timeout.
                $find("mpeTimeout").show();
            }, timeout - 20 * 1000);
            setTimeout(function () {
                window.location = "Login.aspx";
            }, timeout);
        };
        function ResetSession() {
            //Redirect to refresh Session.
            window.location = window.location.href;
            SessionExpireAlert();
        }
    </script>



</asp:Content>
