
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/superagent/DashBoard.Master" CodeBehind="MatchAndSessionPosition.aspx.cs" Inherits="betplayer.superagent.Match_SessionPosition" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
   <div id="main-content">
        <!-- BEGIN PAGE CONTAINER-->
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN THEME CUSTOMIZER-->
                    <div id="theme-change" class="hidden-phone"><i class="icon-cogs"></i><span class="settings"><span class="text">Theme:</span> <span class="colors"><span class="color-default" data-style="default"></span><span class="color-gray" data-style="gray"></span><span class="color-purple" data-style="purple"></span><span class="color-navy-blue" data-style="navy-blue"></span></span></span></div>
                    <!-- END THEME CUSTOMIZER-->
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Sport's Betting<span class="divider">&nbsp;</span> </li>
                        <li>Match &amp; Session Position<span class="divider">&nbsp;</span></li>
                        <li><a href="SportsDetails.php"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN ADVANCED TABLE widget-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE widget-->
                    <div class="widget">

                        <div class="widget-body form">
                            <!-- BEGIN FORM-->


                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td valign="top">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td width="4" height="250" bgcolor="#FFFFFF">&nbsp;</td>
                                                        <td width="321" colspan="3" align="left" valign="top">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td valign="top">

                                                                            <table width="100%" class="table table-striped table-hover table-bordered">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td height="35" colspan="2" class="ButtonK" style="text-align: center;">
                                                                                            <span id="ScoreMsg" style="text-decoration: blink !important;"></span>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="80%" height="70" class="ButtonK" style="text-align: center;">
                                                                                            <div class="ScoreCard_rtmScore " style="color: #fff;">
                                                                                                <p>
                                                                                                    <span id="LocalTeam" style="color: black"></span>
                                                                                                    <br>
                                                                                                    <span id="VisitorTeam" style="color: black"></span>
                                                                                                    <br>
                                                                                                    <span id="Status" style="color: black"></span>
                                                                                                    <br>
                                                                                                </p>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td width="20%" style="text-align: center; vertical-align: middle;">
                                                                                            <span id="LastBall" style="color: black; font-weight: bold; font-size: large"></span>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td valign="top">

                                                                            <div id="divMatchBhav" style="float: left; padding-top: 10px;" width="400">
                                                                                <table style="width: 500px;" class="table table-striped table-hover table-bordered">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td class="ButtonK" style="text-align: center; vertical-align: middle; line-height: 35px; width: 120px;">TEAM</td>
                                                                                            <td class="ButtonL" style="text-align: center; vertical-align: middle; line-height: 35px; width: 70px;">KHAI</td>
                                                                                            <td class="ButtonK" style="text-align: center; vertical-align: middle; line-height: 35px; width: 70px;">LAGAI</td>
                                                                                            <td style="text-align: center; vertical-align: middle; line-height: 35px; width: 140px;"><span class="ButtonK">PLUS</span>/<span class="ButtonL">MINUS</span></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="35" align="center" valign="middle" style="color: ; text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="Team1" id="Team1" value="" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="ShowMatch()" style="width: 120px;"></td>
                                                                                            <td align="center" valign="middle" style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="KRate1" id="KRate1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddMatchBitK(1)"></td>
                                                                                            <td align="center" valign="middle" style="text-align: center; vertical-align: middle;"><span style="color: ">
                                                                                                <input type="button" name="LRate1" id="LRate1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddMatchBitL(1)">
                                                                                            </span></td>
                                                                                            <td align="center" valign="middle" style="text-align: center; vertical-align: middle;"><asp:label id="Team1Amt" runat="server" style="font-size:13px; font-weight:bold"></asp:label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="35" align="center" valign="middle" style="color: ; text-align: center; vertical-align: middle;"><span>
                                                                                                <input type="button" name="Team2" id="Team2" value="" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="ShowMatch()" style="width: 120px;">
                                                                                            </span></td>
                                                                                            <td align="center" valign="middle" style="color: ; text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="KRate2" id="KRate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddMatchBitK(2)"></td>
                                                                                            <td align="center" valign="middle" style="color: ; text-align: center; vertical-align: middle;"><span style="color: ">
                                                                                                <input type="button" name="LRate2" id="LRate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddMatchBitL(2)">
                                                                                            </span></td>
                                                                                            <td align="center" valign="middle" style="text-align: center; vertical-align: middle;"><asp:label id="Team2Amt" runat="server" style="font-size:13px;font-weight:bold"></asp:label>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                            <div id="divSessionBhav" style="float: right; padding-top: 10px;" width="470">
                                                                                <table style="width: 670px" class="table table-striped table-hover table-bordered">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td class="ButtonK" style="text-align: center; vertical-align: middle; line-height: 35px; width: 150px;">SESSION</td>
                                                                                            <td class="ButtonL" style="text-align: center; vertical-align: middle; line-height: 35px; width: 80px;">NO RUN</td>
                                                                                            <td class="ButtonL" style="text-align: center; vertical-align: middle; line-height: 35px; width: 80px;">NO RATE</td>
                                                                                            <td class="ButtonK" style="text-align: center; vertical-align: middle; line-height: 35px; width: 80px;">YES RUN</td>
                                                                                            <td class="ButtonK" style="text-align: center; vertical-align: middle; line-height: 35px; width: 80px;">YES RATE</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="35" style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="Session1" id="Session1" value="NONE" onclick="Redirect(this.value);"  class="ButtonUserSession" style="width: 150px;"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="not1" id="not1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(1)"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="notrate1" id="notrate1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="yes1" id="yes1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddSessionBitY(1)"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="yesrate1" id="yesrate1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="35" style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="Session2" id="Session2" value="NONE" onclick="Redirect(this.value);" class="ButtonUserSession" style="width: 150px;" ></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="not2" id="not2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(2)"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="notrate2" id="notrate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="yes2" id="yes2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddSessionBitY(2)"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="yesrate2" id="yesrate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="35" style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="Session3" id="Session3" value="NONE" class="ButtonUserSession" style="width: 150px;" /></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="not3" id="not3" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(3)"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="notrate3" id="notrate3" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="yes3" id="yes3" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddSessionBitY(3)"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="yesrate3" id="yesrate3" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="35" style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="Session4" id="Session4" value="NONE" class="ButtonUserSession" style="width: 150px;" /> </td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="not4" id="not4" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(4)"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="notrate4" id="notrate4" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="yes4" id="yes4" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddSessionBitY(4)"></td>
                                                                                            <td style="text-align: center; vertical-align: middle;">
                                                                                                <input type="button" name="yesrate4" id="yesrate4" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'"></td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>

                                                                            </div>

                                                                        </td>
                                                                    </tr>


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
                            <br>
                            <div class="alert alert-error" id="Error" style="visibility: hidden; font-weight: bold;">
                            </div>

                            <table width="100%" class="table table-striped table-hover table-bordered" id="MatchBet">
                                <tbody>
                                    <tr>
                                        <td align="left" class="TableHeading">&nbsp;</td>
                                        <td height="25" align="left" class="TableHeading"><strong>Sr.</strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong>Rate</strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong>Amount</strong></td>
                                        <td align="left" class="TableHeading"><strong>Mode</strong></td>
                                        <td align="left" class="TableHeading"><strong>Team </strong></td>
                                        <td align="left" class="TableHeading"><strong>Client</strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong>
                                            <asp:Label ID="lblTeamA" runat="server"></asp:Label>
                                        </strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong>
                                            <asp:Label ID="lblTeamB" runat="server"></asp:Label>
                                        </strong></td>
                                        <td align="left" class="TableHeading"><strong>Date &amp; Time</strong></td>
                                    </tr>
                                    <% foreach (System.Data.DataRow row in MatchesDataTable1.Rows)
                                        { %>
                                    <tr>
                                        <td align="left" class="TableHeading">&nbsp;</td>
                                        <td height="25" align="left" class="TableHeading"><strong>Sr.</strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong><%: row["rate"] %></strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong><%: row["Amount"] %></strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["Mode"] %></strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["Team"] %> </strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["ClientID"] %>  <%: row["Name"] %></strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong><%: row["Position1"] %>  </strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong><%: row["Position2"] %>  </strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["Datetime"] %></strong></td>
                                    </tr>
                                    <% } //foreach %>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <input type="text" class="grdtot" value="" id="total" name="" /></td>
                                    </tr>
                                </tfoot>
                            </table>
                            
                           
                            <!-- END FORM-->

                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE widget-->
                </div>
            </div>
            <!-- END ADVANCED TABLE widget-->
            <!-- END PAGE CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->
    </div>
    <asp:HiddenField ID="apiID" runat="server" />
    <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
    <script src="js/LiveMatch.js"></script>
    <script type="text/javascript">
         <!--
        function Redirect(value) {

            window.location = "MatchAndSessionSPosition.aspx?MatchID=1136620&&Session=" + value;
            }
         //-->
      </script>
</asp:Content>
