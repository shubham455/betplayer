<%@ Page Language="C#" MasterPageFile="~/Client/Menu.Master" AutoEventWireup="true" CodeBehind="BetDetails.aspx.cs" Inherits="betplayer.Client.BetDetails" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td valign="top">
                    <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td align="left" valign="top">

                                    <table style="width: 100%" border="0" cellspacing="2" cellpadding="2">
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
                                                    <div class="ScoreCard_rtmScore ScoreCard" style="color: #000; height: 100%;">
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

                                    <%if (!emptyLedgerTable)
                                        {
                                            foreach (System.Data.DataRow row in MatchesDataTable.Rows)
                                            { %>
                                    <table width="100%" border="0" border-color:#000; cellpadding="2" cellspacing="2">
                                        <tbody>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 30%;">RUNNER</td>
                                                <td align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 10%;">MIN/MAX BET</td>
                                                <td align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 20%;">POSITION</td>
                                                <td align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 20%;">LAGAI</td>
                                                <td align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 20%;">KHAI</td>

                                            </tr>

                                            <tr id="runnerrow1">
                                                <td height="35" id="TeamA" align="center" valign="middle" bgcolor="#FFF" style="vertical-align: middle; font-weight: bold;"><%: row["TeamA"] %></td>
                                                <td align="center" valign="middle" bgcolor="#000"  class="FontTextWhite" style="color: #000; bo vertical-align: middle">
                                                    <label id="matchMinBet" style="color: red;"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <asp:Label ID="PositionTeam1" runat="server"></asp:Label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" style="vertical-align: middle; position: relative;">
                                                    <div id="runnerfloat1" class="runnerfloat"></div>
                                                    <input type="button" name="ButtonL" id="LRate1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_1', 'Runner', 'Lagai')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="ButtonK" id="KRate1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Runner', 'Khai')"></td>

                                            </tr>

                                            <tr id="runnerrow2">
                                                <td height="35" id="TeamB" align="center" valign="middle" bgcolor="#FFF" style="vertical-align: middle; font-weight: bold;"><%: row["TeamB"] %></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <label id="matchMaxBet" style="color: red;"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <asp:Label ID="PositionTeam2" runat="server"></asp:Label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="vertical-align: middle; position: relative;">
                                                    <div id="runnerfloat2" class="runnerfloat"></div>
                                                    <input type="button" name="ButtonL" id="LRate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_2', 'Runner', 'Lagai')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="ButtonK" id="KRate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL _hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_2', 'Runner', 'Khai')"></td>
                                            </tr>




                                        </tbody>
                                    </table>
                                    <% } //foreach
                                      }
                                        else
                                        {
                                            foreach (System.Data.DataRow row in MatchesDataTable.Rows)
                                            { %>
                                    <table width="100%" border="0" border-color:#000; cellpadding="2" cellspacing="2">
                                        <tbody>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 30%;">RUNNER</td>
                                                <td align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 10%;">MIN/MAX BET</td>
                                                <td align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 20%;">POSITION</td>
                                                <td align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 20%;">LAGAI</td>
                                                <td align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle; width: 20%;">KHAI</td>

                                            </tr>

                                            <tr id="runnerrow1"; style="border-color:#000;">
                                                <td height="35" id="TeamA" align="center" valign="middle" bgcolor="#FFF" style="vertical-align: middle; font-weight: bold;"><%: row["TeamA"] %></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <label id="matchMinBet" style="color: red;"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" style="vertical-align: middle; position: relative;">
                                                    <div id="runnerfloat1" class="runnerfloat"></div>
                                                    <input type="button" name="ButtonL" id="LRate1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_1', 'Runner', 'Lagai')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="ButtonK" id="KRate1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Runner', 'Khai')"></td>

                                            </tr>

                                            <tr id="runnerrow2">
                                                <td height="35" id="TeamB" align="center" valign="middle" bgcolor="#FFF" style="vertical-align: middle; font-weight: bold;"><%: row["TeamB"] %></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <label id="matchMaxBet" style="color: red;"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <asp:Label ID="Label2" runat="server"></asp:Label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="vertical-align: middle; position: relative;">
                                                    <div id="runnerfloat2" class="runnerfloat"></div>
                                                    <input type="button" name="ButtonL" id="LRate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_2', 'Runner', 'Lagai')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="ButtonK" id="KRate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL _hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_2', 'Runner', 'Khai')"></td>
                                            </tr>
                                            <tr id="runnerrow3">
                                                <td height="35" id="TeamC" align="center" valign="middle" bgcolor="#FFF" style="vertical-align: middle; font-weight: bold;"><%: row["TeamC"] %></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <label id="matchMaxBet" style="color: red;"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="FontTextWhite" style="color: #000; vertical-align: middle">
                                                    <asp:Label ID="Label3" runat="server"></asp:Label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="vertical-align: middle; position: relative;">
                                                    <div id="runnerfloat3" class="runnerfloat"></div>
                                                    <input type="button" name="ButtonL" id="LRate3" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="enableBetting(event, 'team_2', 'Runner', 'Lagai')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="ButtonK" id="KRate3" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL _hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_2', 'Runner', 'Khai')"></td>
                                            </tr>



                                        </tbody>
                                    </table>
                                    <% }
                                     } //else %>
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
                                                            <asp:Label ID="lblAmount" runat="server" Font-Size="13pt" Font-Bold="true"></asp:Label></span>                 </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="top">
                                    <table style="width: 100%;" border="0" cellpadding="0" cellspacing="2">
                                        <tbody>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#838792" class="FontTextWhite10px" style="vertical-align: middle; width: 30%;">
                                                    <h3>SESSION</h3>
                                                </td>
                                                <td height="35" align="center" valign="middle" bgcolor="#838792" class="FontTextWhite10px" style="vertical-align: middle; width: 10%">MIN/MAX BET</td>
                                                <td height="35" align="center" valign="middle" bgcolor="#838792" class="FontTextWhite10px" style="vertical-align: middle; width: 10%">NRATE</td>
                                                <td height="35" align="center" valign="middle" bgcolor="#838792" class="FontTextWhite10px" style="vertical-align: middle; width: 10%">YRATE</td>
                                                <td height="35" align="center" valign="middle" bgcolor="#838792" class="FontTextWhite10px" style="vertical-align: middle; width: 20%">NOT</td>
                                                <td height="35" align="center" valign="middle" bgcolor="#838792" class="FontTextWhite10px" style="vertical-align: middle; width: 20%">YES</td>
                                            </tr>
                                            <tr id="row1">
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; text-align: center;">
                                                    <label style="width: 100%;" id="Session1" class="ButtonSess">None</label></td>
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #F00;">
                                                    <label id="maxmin1"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; position: relative;">
                                                    <div id="float1" class="float"></div>
                                                    <input type="button" name="NotRate1" id="notrate1" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="YesRate1" id="yesrate1" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="Not1" id="not1" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonNRun'" onmouseover="this.className='ButtonNRun_hover'" onmouseout="this.className='ButtonNRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="Yes1" id="yes1" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Yes')"></td>
                                            </tr>
                                            <tr id="row2">
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; text-align: center;">
                                                    <label style="width: 100%;" id="Session2" class="ButtonSess">None</label></td>
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #F00">
                                                    <label id="maxmin2"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; position: relative;">
                                                    <div id="float2" class="float"></div>
                                                    <input type="button" name="NotRate2" id="notrate2" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="YesRate2" id="yesrate2" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>

                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="Not2" id="not2" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="Yes2" id="yes2" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Yes')"></td>
                                            </tr>
                                            <tr id="row3">
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; text-align: center;">
                                                    <label style="width: 100%;" id="Session3" class="ButtonSess">None</label></td>
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #F00">
                                                    <label id="maxmin3"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; position: relative;">
                                                    <div id="float3" class="float"></div>
                                                    <input type="button" name="NotRate3" id="notrate3" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yesrate3" id="yesrate3" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="Not3" id="not3" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="Not2" id="yes3" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                            </tr>
                                            <tr id="row4">
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; text-align: center;">
                                                    <label style="width: 100%;" id="Session4" class="ButtonSess">None</label></td>
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #F00">
                                                    <label id="maxmin4"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; position: relative;">
                                                    <div id="float4" class="float"></div>
                                                    <input type="button" name="notrate4" id="notrate4" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yesrate4" id="yesrate4" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="not4" id="not4" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yes4" id="yes4" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Yes')"></td>
                                            </tr>
                                            <tr id="row5">
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; text-align: center;">
                                                    <label style="width: 100%;" id="Session5" class="ButtonSess">None</label></td>
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #F00">
                                                    <label id="maxmin5"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; position: relative;">
                                                    <div id="float5" class="float"></div>
                                                    <input type="button" name="notrate4" id="notrate5" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yesrate4" id="yesrate5" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="not4" id="not5" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yes4" id="yes5" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Yes')"></td>
                                            </tr>
                                            <tr id="row6">
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; text-align: center;">
                                                    <label style="width: 100%;" id="Session6" class="ButtonSess">None</label></td>
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #F00">
                                                    <label id="maxmin6"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; position: relative;">
                                                    <div id="float6" class="float"></div>
                                                    <input type="button" name="notrate4" id="notrate6" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yesrate4" id="yesrate6" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="not4" id="not6" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yes4" id="yes6" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Yes')"></td>
                                            </tr>
                                            <tr id="row7">
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; text-align: center;">
                                                    <label style="width: 100%;" id="Session7" class="ButtonSess">None</label></td>
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #F00">
                                                    <label id="maxmin7"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; position: relative;">
                                                    <div id="float7" class="float"></div>
                                                    <input type="button" name="notrate4" id="notrate7" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yesrate4" id="yesrate7" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="not4" id="not7" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yes4" id="yes7" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Yes')"></td>
                                            </tr>
                                            <tr id="row8">
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; text-align: center;">
                                                    <label style="width: 100%;" id="Session8" class="ButtonSess">None</label></td>
                                                <td height="35" align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #F00">
                                                    <label id="maxmin8"></label>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000; position: relative;">
                                                    <div id="float8" class="float"></div>
                                                    <input type="button" name="notrate4" id="notrate8" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#FFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yesrate4" id="yesrate8" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#79C1F8" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="not4" id="not8" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="enableBetting(event, 'team_1', 'Session', 'Not')"></td>
                                                <td align="center" valign="middle" bgcolor="#FFBAD3" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="yes4" id="yes8" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="enableBetting(event, 'team_1', 'Session', 'Yes')"></td>
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
                                                <td height="35" align="center" valign="middle" bgcolor="#838792" class="FontTextWhite" style="vertical-align: middle">AMOUNT</td>
                                                <td align="center" valign="middle" bgcolor="#838792" style="vertical-align: middle">

                                                    <input type="text" id="matchAmount" disabled="" style="width: 100px" />

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

    <table style="width: 100%;" border="0" cellspacing="2" cellpadding="2">
        <tbody>
            <tr>
                <td style="height: 25px;" align="right" valign="middle" bgcolor="#838792" class="FontTextWhite10px">Rate</td>
                <td align="right" valign="middle" bgcolor="#838792" class="FontTextWhite10px">Amount</td>
                <td align="right" bgcolor="#838792" style="text-align: center;" class="FontTextWhite10px">Mode</td>
                <td align="center" bgcolor="#838792" style="text-align: center;" class="FontTextWhite10px">Team</td>
            </tr>

            <% foreach (System.Data.DataRow row in MatchesDataTable3.Rows)
                { %>
            <tr>

                <td align="left" style="background: #FFF; color: black; text-align: right; height: 25px;" class="FontTextWhite10px "><%:row["Rate"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: right;" class="FontTextWhite10px "><%:row["Amount"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Mode"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Team"] %></td>
            </tr>
            <% } //foreach %>
        </tbody>
    </table>
    <br />
    <br />
    <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tbody>

            <tr>


                <td height="25" align="left" bgcolor="#838792" class="FontTextWhite10px">Session</td>
                <td align="right" valign="middle" bgcolor="#838792" class="FontTextWhite10px">Rate</td>
                <td align="right" valign="middle" bgcolor="#838792" class="FontTextWhite10px">Amount</td>
                <td align="right" bgcolor="#838792" class="FontTextWhite10px">Runs</td>
                <td align="center" bgcolor="#838792" class="FontTextWhite10px">Mode</td>
                <td align="center" bgcolor="#838792" class="FontTextWhite10px">Dec</td>
            </tr>


            <% foreach (System.Data.DataRow row in MatchesDataTable5.Rows)
                { %>
            <tr>

                <td align="left" style="background: #FFF; color: black; text-align: right; height: 25px; width: 250px" class="FontTextWhite10px "><%:row["Session"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: right;" class="FontTextWhite10px "><%:row["Rate"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Amount"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Runs"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["Mode"] %></td>
                <td align="left" style="background: #FFF; color: black; text-align: center;" class="FontTextWhite10px "><%:row["DEC"] %></td>
            </tr>
            <% } //foreach %>
        </tbody>
    </table>

    <asp:HiddenField ID="firebasekey" runat="server" />
    <asp:HiddenField ID="apiID" runat="server" />
    <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
    <script src="js/Homejs/BetDetailsCustom.js"></script>

</asp:Content>
