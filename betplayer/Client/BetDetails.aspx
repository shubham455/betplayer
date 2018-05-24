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
                                                    <input type="button" name="KRate1" id="KRate1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddMatchBitK(1)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="LRate1" id="LRate1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddMatchBitL(1)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="FontTextWhite" style="color: #000; vertical-align: middle">0.00</td>
                                            </tr>

                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="FontTextBlue" style="vertical-align: middle"><%: row["TeamB"] %></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="vertical-align: middle">
                                                    <input type="button" name="KRate2" id="KRate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddMatchBitK(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="LRate2" id="LRate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddMatchBitL(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="FontTextWhite" style="color: #000; vertical-align: middle">0.00</td>
                                            </tr>
                                            
                                               
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="FontTextBlue" style="vertical-align: middle"><%: row["TeamC"] %></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="vertical-align: middle">
                                                    <input type="button" name="KRate2" id="KRate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddMatchBitK(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="vertical-align: middle; color: #000">
                                                    <input type="button" name="LRate2" id="LRate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddMatchBitL(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="FontTextWhite" style="color: #000; vertical-align: middle">0.00</td>
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
                                                    <input type="button" name="NRun1" id="NRun1" value="0.00" class="ButtonNRun" onfocus="this.className='ButtonNRun_hover'" onblur="this.className='ButtonNRun'" onmouseover="this.className='ButtonNRun_hover'" onmouseout="this.className='ButtonNRun'" onclick="AddSessionBitN(1)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="NRate1" id="NRate1" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="YRun1" id="YRun1" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="AddSessionBitY(1)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000;">
                                                    <input type="button" name="YRate1" id="YRate1" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                            </tr>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="">
                                                    <input type="button" name="Session2" id="Session2" value="NONE" class="ButtonSess" onclick="ShowSession(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="NRun2" id="NRun2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="NRate2" id="NRate2" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="YRun2" id="YRun2" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="AddSessionBitY(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="YRate2" id="YRate2" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                            </tr>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="">
                                                    <input type="button" name="Session2" id="Session2" value="NONE" class="ButtonSess" onclick="ShowSession(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="NRun2" id="NRun2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="NRate2" id="NRate2" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="YRun2" id="YRun2" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="AddSessionBitY(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="YRate2" id="YRate2" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                            </tr>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="">
                                                    <input type="button" name="Session2" id="Session2" value="NONE" class="ButtonSess" onclick="ShowSession(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="NRun2" id="NRun2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="NRate2" id="NRate2" value="0.00" class="ButtonNRate" onfocus="this.className='ButtonNRate_hover'" onblur="this.className='ButtonNRate'" onmouseover="this.className='ButtonNRate_hover'" onmouseout="this.className='ButtonNRate'" disabled="disabled"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="YRun2" id="YRun2" value="0.00" class="ButtonYRun" onfocus="this.className='ButtonYRun_hover'" onblur="this.className='ButtonYRun'" onmouseover="this.className='ButtonYRun_hover'" onmouseout="this.className='ButtonYRun'" onclick="AddSessionBitY(2)"></td>
                                                <td align="center" valign="middle" bgcolor="#CCFFFF" class="textTeamHead" style="color: #000">
                                                    <input type="button" name="YRate2" id="YRate2" value="0.00" class="ButtonYRate" onfocus="this.className='ButtonYRate_hover'" onblur="this.className='ButtonYRate'" onmouseover="this.className='ButtonYRate_hover'" onmouseout="this.className='ButtonYRate'" disabled="disabled"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="top">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" id="PlaceBet">
                                        <tbody>
                                            <tr>
                                                <td height="35" align="center" valign="middle" bgcolor="#2486B2" class="FontTextWhite" style="vertical-align: middle">AMOUNT</td>
                                                <td align="center" valign="middle" bgcolor="#2486B2" style="vertical-align: middle">
                                                    <input name="MatchAmount" list="AmountList" class="ClientText" id="MatchAmount" onkeypress="" size="10" maxlength="7" readonly="" autocomplete="OFF">
                                                    <datalist id="AmountList">
                                                        <option value="500"></option>
                                                        <option value="1000"></option>
                                                        <option value="1500"></option>
                                                        <option value="2000"></option>
                                                        <option value="2500"></option>
                                                        <option value="3000"></option>
                                                        <option value="3500"></option>
                                                        <option value="4000"></option>
                                                        <option value="4500"></option>
                                                        <option value="5000"></option>
                                                        <option value="10000"></option>
                                                        <option value="15000"></option>
                                                        <option value="20000"></option>
                                                        <option value="25000"></option>
                                                        <option value="30000"></option>
                                                        <option value="35000"></option>
                                                        <option value="40000"></option>
                                                        <option value="45000"></option>
                                                        <option value="50000"></option>
                                                        <option value="100000"></option>
                                                        <option value="150000"></option>
                                                        <option value="200000"></option>
                                                        <option value="250000"></option>
                                                        <option value="300000"></option>
                                                        <option value="350000"></option>
                                                        <option value="400000"></option>
                                                        <option value="450000"></option>
                                                        <option value="500000"></option>
                                                    </datalist>
                                                </td>
                                                <td align="center" valign="middle" bgcolor="#2486B2" style="vertical-align: middle">
                                                    <input name="AmountTime" type="text" class="AmountTime" id="AmountTime" size="4" maxlength="3" readonly=""></td>
                                                <td align="center" valign="middle" bgcolor="#2486B2" style="vertical-align: middle">
                                                    <input name="cmdDone" type="button" class="FontTextBlue" id="cmdDone" onclick="SubmitBit()" value="Done" ></td>
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
    <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tbody>
            <tr>
                <td height="25" align="left" bgcolor="#2DA5DA" class="FontTextWhite10px">Session </td>
                <td align="right" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px">Rate</td>
                <td align="right" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite10px">Amount</td>
                <td align="right" bgcolor="#2DA5DA" class="FontTextWhite10px">Runs</td>
                <td align="center" bgcolor="#2DA5DA" class="FontTextWhite10px">Mode</td>
            </tr>
        </tbody>
    </table>
    <asp:HiddenField ID="apiID" runat="server" />


</asp:Content>
