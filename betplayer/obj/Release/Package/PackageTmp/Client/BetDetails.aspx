<%@ Page Language="C#" MasterPageFile="~/Client/Menu.Master" AutoEventWireup="true" CodeBehind="BetDetails.aspx.cs" Inherits="betplayer.Client.BetDetails" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td align="left" valign="top">

                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                            <tr>
                                                <!--<td colspan="2" height="35" align="center" class="TeamCombo">
            	<p class="price-btn price-btn-blue popup-with-zoom-anim">KOLKATA V BANGLOR (IPLT20)</p>
            </td>-->
                                                <td colspan="2" height="35" align="center" class="TeamCombo">
                                                    <p class="price-btn price-btn-blue popup-with-zoom-anim" style="height: auto; font-size: 13px; font-weight: bold; text-decoration: blink;"><span id="ScoreMsg" style="text-decoration: blink !important;"></span></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="70%" height="35" align="center" class="TeamCombo">
                                                    <div class="ScoreCard_rtmScore ScoreCard" style="color: #fff; height: 100%;">
                                                        <p>
                                                            <span id="LocalTeam"></span>
                                                            <br>
                                                            <span id="VisitorTeam"></span>
                                                            <br>
                                                            <span id="Status"></span>
                                                        </p>
                                                    </div>
                                                </td>
                                                <td width="30%" height="35" align="center" class="TeamCombo">
                                                    <div class="ScoreCard">
                                                        <p>
                                                            <span id="LastBall"></span>
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
                                    <% foreach (System.Data.DataRow row in MatchesDataTable.Rows)
                                        { %>
                                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                                        <tbody>
                                            <tr>
                                                <td width="25%" height="35" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle">RUNNER</td>
                                                <td width="20%" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle">LAGAI</td>
                                                <td width="20%" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle">KHAI</td>
                                                <td width="35%" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle">POSITION</td>
                                            </tr>

                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="FontTextBlue" style="vertical-align: middle"><%: row["TeamA"] %></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" style="vertical-align: middle">
                                                    <input type="button" name="ButtonL" id="LRate1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_1', 'Runner', 'Lagai')"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="ButtonK" id="KRate1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Runner', 'Khai')"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                   <asp:Label id="PositionTeam1" runat="server" ></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="FontTextBlue" style="vertical-align: middle"><%: row["TeamB"] %></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="vertical-align: middle">
                                                    <input type="button" name="ButtonL" id="LRate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_2', 'Runner', 'Lagai')"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="ButtonK" id="KRate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL _hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_2', 'Runner', 'Khai')"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <asp:Label id="PositionTeam2" runat="server" ></asp:Label>
                                                </td>
                                            </tr>




                                        </tbody>
                                    </table>
                                    <% } //foreach %>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="bottom" bgcolor="#FFFFFF"></td>
                            </tr>
                            <tr>
                                <td height="35" align="center" class="TeamCombo">
                                    <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                            <tr bgcolor="#CCFFFF" height="35px;">
                                                <td class="FontTextWhite">&nbsp;<span style="color: #00F">Session Plus</span>/<span style="color: #F00">Minus</span></td>
                                                <td width="100" style="font-size: 14px; font-family: Verdana, Geneva, sans-serif; font-weight: bold;">
                                                    <span style="color: #00F">0</span>                 </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="top">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="2">
                                        <tbody>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px" style="vertical-align: middle">
                                                    <h3>SESSION</h3>
                                                </td>
                                                <td height="35" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px" style="vertical-align: middle">NOT</td>
                                                <td height="35" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px" style="vertical-align: middle">RATE</td>
                                                <td height="35" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px" style="vertical-align: middle">YES</td>
                                                <td align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px" style="vertical-align: middle">RATE</td>
                                            </tr>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="Session1" id="Session1" value="NONE" class="ButtonSess" onclick="ShowSession(1)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="Not1" id="not1" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonNRun'" onmouseover="this.className='ButtonNRun_hover'" onmouseout="this.className='ButtonNRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="NotRate1" id="notrate1" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="Yes1" id="yes1" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Yes')"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="YesRate1" id="yesrate1" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                            </tr>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="">
                                                    <input type="button" name="Session2" id="Session2" value="NONE" class="ButtonSess" onclick="ShowSession(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="Not2" id="not2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="NotRate2" id="notrate2" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="Yes2" id="yes2" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="AddSessionBitY(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="YesRate2" id="yesrate2" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                            </tr>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="">
                                                    <input type="button" name="Session2" id="Session3" value="NONE" class="ButtonSess" onclick="ShowSession(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="Not3" id="not3" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="NotRate3" id="notrate3" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yes3" id="yes3" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="AddSessionBitY(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yesrate3" id="yesrate3" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                            </tr>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="">
                                                    <input type="button" name="Session2" id="Session4" value="NONE" class="ButtonSess" onclick="ShowSession(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="not4" id="not4" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="notrate4" id="notrate4" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yes4" id="yes4" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="AddSessionBitY(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yesrate4" id="yesrate4" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="top">
                                    <table onload="countdown()" width="100%" border="0" cellpadding="0" cellspacing="0" id="PlaceBet">
                                        <tbody>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#2486B2" class="FontTextWhite" style="vertical-align: middle">AMOUNT</td>
                                                <td align="center" valign="middle" bgcolor="#2486B2" style="vertical-align: middle">

                                                    <input type="text" id="matchAmount" disabled="" style="width:100px"  />

                                                    <label id="timerLabel" style="margin-left: 50px; font-family: Verdana; font-weight: bold; color: black; visibility: hidden;"></label>

                                                    <input type="button" id="btnSubmit" onclick="doneClick()" style="margin-left: 50px; visibility: hidden;" class="FontTextBlue" value="Done" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top"></td>
                            </tr>
                        </tbody>
                    </table>
                </td>

            </tr>
        </tbody>
    </table>


    <div class="menu" id="menu" align="center">
        <ul class="nav">
            <% foreach (System.Data.DataRow row in MatchesDataTable1.Rows)
                { %>
            <li class="active"><a href="BetDetails.aspx?id=<%: row["apiID"] %>"><%: row["TeamA"] %> V <%: row["TeamB"] %> <%: row["Type"] %></a></li>
            <% } //foreach %>

            <li class="active"><a href="AllGamesList.aspx">BACK TO LIST</a></li>
        </ul>
    </div>

    <br />
    <table width="100%" border="0" cellspacing="2" cellpadding="0">
        <tbody>
            <tr>
                <td></td>
            </tr>
        </tbody>
    </table>
    <br />

    <table style="width:100%;" border="0" cellspacing="2" cellpadding="2">
        <tbody>
            <tr>
                <td style="height:25px;" align="right" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px">Rate</td>
                <td align="right" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px">Amount</td>
                <td align="right" bgcolor="#2DA5DA" style="text-align:center;" class="FontTextWhite10px">Mode</td>
                <td align="center" bgcolor="#2DA5DA" style="text-align:center;" class="FontTextWhite10px">Team</td>
            </tr>

            <% foreach (System.Data.DataRow row in MatchesDataTable3.Rows)
                { %>
            <tr>
               
                <td  align="left" style="background:#FFF;color:black; text-align:right; height:25px;" class="FontTextWhite10px "><%:row["Rate"] %></td>
                <td align="left"  style="background:#FFF;color:black; text-align:right;" class="FontTextWhite10px "><%:row["Amount"] %></td>
                <td align="left"  style="background:#FFF;color:black; text-align:center;" class="FontTextWhite10px "><%:row["Mode"] %></td>
                <td align="left"   style="background:#FFF;color:black; text-align:center;" class="FontTextWhite10px "><%:row["Team"] %></td>
            </tr>
            <% } //foreach %>
        </tbody>
    </table>
    <br />
    <br />
    <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tbody>
            <tr>


                <td height="25" align="left" bgcolor="#2DA5DA" class="FontTextWhite10px">Session</td>
                <td align="right" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px">Rate</td>
                <td align="right" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px">Amount</td>
                <td align="right" bgcolor="#2DA5DA" class="FontTextWhite10px">Runs</td>
                <td align="center" bgcolor="#2DA5DA" class="FontTextWhite10px">Mode</td>
                 <td align="center" bgcolor="#2DA5DA" class="FontTextWhite10px">Dec</td>
            </tr>

           
               
           
           
        </tbody>
    </table>

    <asp:HiddenField ID="apiID" runat="server" />
    <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
    <script src="js/Homejs/LiveMatch.js"></script>
</asp:Content>
