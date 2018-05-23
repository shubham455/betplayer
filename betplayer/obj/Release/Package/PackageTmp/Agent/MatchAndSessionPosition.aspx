<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="MatchAndSessionPosition.aspx.cs" Inherits="betplayer.Agent.Match_SessionPosition" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
   <div id="main-content">
		  <!-- BEGIN PAGE CONTAINER-->
		  <div class="container-fluid">
		    <!-- BEGIN PAGE HEADER-->
		    <div class="row-fluid">
		      <div class="span12">
		        <!-- BEGIN THEME CUSTOMIZER-->
		        <div id="theme-change" class="hidden-phone"> <i class="icon-cogs"></i> <span class="settings"> <span class="text">Theme:</span> <span class="colors"> <span class="color-default" data-style="default"></span> <span class="color-gray" data-style="gray"></span> <span class="color-purple" data-style="purple"></span> <span class="color-navy-blue" data-style="navy-blue"></span> </span> </span> </div>
		        <!-- END THEME CUSTOMIZER-->
		        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li> Sport's Betting<span class="divider">&nbsp;</span> </li>
		          <li>Match &amp; Session Position<span class="divider">&nbsp;</span></li>
                  <li><a href="SportsDetails.php"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                    <form name="BetPlayer" id="BetPlayer" method="post" action="AgentDetails.php" autocomplete="off">
                    
		            <table width="100%" border="0" cellspacing="0" cellpadding="0">
		              <tbody><tr>
		                <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
		                  <tbody><tr>
		                    <td width="4" height="250" bgcolor="#FFFFFF">&nbsp;</td>
		                    <td width="321" colspan="3" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		                      <tbody><tr>
		                        <td valign="top">
                                    
                                    <table width="100%" class="table table-striped table-hover table-bordered">
                                      <tbody><tr>
                                        <td height="35" colspan="2" class="ButtonK" style="text-align:center;">
                                        	<span id="ScoreMsg" style="text-decoration:blink !important;"></span>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="80%" height="70" class="ButtonK" style="text-align:center;">
                                        	<div class="ScoreCard_rtmScore " style="color: #fff;">
                                                        <p>
                                                            <span id="LocalTeam" style="color:black"></span>
                                                            <br>
                                                            <span id="VisitorTeam" style="color:black"></span>
                                                            <br>
                                                            <span id="Status" style="color:black"></span>
                                                            <br>
                                                        </p>
                                                    </div>
                                        </td>
                                        <td width="20%" style="text-align:center;vertical-align:middle;">
                                        	<span id="LastBall"</span>
                                        </td>
                                      </tr>
                                    </tbody></table>
                                    
                                </td>
	                          </tr>
		                      <tr>
		                        <td valign="top">
                                
                                <div id="divMatchBhav" style="float:left;padding-top:10px;" width="400">
                                  <table width="400" class="table table-striped table-hover table-bordered">
                                    <tbody><tr>
                                      <td class="ButtonK" style="text-align:center;vertical-align:middle;line-height:35px;width:120px;">TEAM</td>
                                      <td class="ButtonL" style="text-align:center;vertical-align:middle;line-height:35px;width:70px;">KHAI</td>
                                      <td class="ButtonK" style="text-align:center;vertical-align:middle;line-height:35px;width:70px;">LAGAI</td>
                                      <td style="text-align:center;vertical-align:middle;line-height:35px;width:140px;"><span class="ButtonK">PLUS</span>/<span class="ButtonL">MINUS</span></td>
                                    </tr>
                                    <tr>
                                      <td height="35" align="center" valign="middle" style="color:;text-align:center;vertical-align:middle;"><input type="button" name="Team1" id="Team1" value="Sunrisers Hyderabad" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="ShowMatch()" style="width:120px;"></td>
                                      <td align="center" valign="middle" style="color:;text-align:center;vertical-align:middle;"><input type="button" name="KRate1" id="KRate1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddMatchBitK(1)"></td>
                                      <td align="center" valign="middle" style="color:;text-align:center;vertical-align:middle;"><span style="color:">
                                        <input type="button" name="LRate1" id="LRate1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddMatchBitL(1)">
                                      </span></td>
                                      <td align="center" valign="middle" style="text-align:center;vertical-align:middle;">                                        <span class="ButtonL" id="Team1Amt"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                      <td height="35" align="center" valign="middle" style="color:;text-align:center;vertical-align:middle;"><span>
                                        <input type="button" name="Team2" id="Team2" value="Delhi Daredevils" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="ShowMatch()" style="width:120px;">
                                      </span></td>
                                      <td align="center" valign="middle" style="color:;text-align:center;vertical-align:middle;"><input type="button" name="KRate2" id="KRate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddMatchBitK(2)"></td>
                                      <td align="center" valign="middle" style="color:;text-align:center;vertical-align:middle;"><span style="color:">
                                        <input type="button" name="LRate2" id="LRate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddMatchBitL(2)">
                                      </span></td>
                                      <td align="center" valign="middle" style="text-align:center;vertical-align:middle;">                                        <span class="ButtonL" id="Team2Amt"></span>
                                        </td>
                                    </tr>
                                  </tbody></table>
                                </div>
		                          <div id="divSessionBhav" style="float:right;padding-top:10px;" width="470">
		                          <table width="470" class="table table-striped table-hover table-bordered">
		                            	<tbody><tr>
                                          <td class="ButtonK" style="text-align:center;vertical-align:middle;line-height:35px;width:150px;">SESSION</td>
                                          <td class="ButtonL" style="text-align:center;vertical-align:middle;line-height:35px;width:80px;">NO RUN</td>
                                          <td class="ButtonL" style="text-align:center;vertical-align:middle;line-height:35px;width:80px;">NO RATE</td>
                                          <td class="ButtonK" style="text-align:center;vertical-align:middle;line-height:35px;width:80px;">YES RUN</td>
                                          <td class="ButtonK" style="text-align:center;vertical-align:middle;line-height:35px;width:80px;">YES RATE</td>
                                        </tr>
		                            <tr>
		                              <td height="35" style="text-align:center;vertical-align:middle;">
                                      <input type="button" name="Session1" id="Session1" value="NONE" class="ButtonUserSession" style="width:150px;" onclick="ShowSession(1)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="NRun1" id="NRun1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(1)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="NRate1" id="NRate1" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="YRun1" id="YRun1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddSessionBitY(1)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="YRate1" id="YRate1" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'"></td>
	                                </tr>
		                            <tr>
		                              <td height="35" style="text-align:center;vertical-align:middle;">
		                                <input type="button" name="Session2" id="Session2" value="NONE" class="ButtonUserSession" style="width:150px;" onclick="ShowSession(2)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="NRun2" id="NRun2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(2)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="NRate2" id="NRate2" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="YRun2" id="YRun2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddSessionBitY(2)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="YRate2" id="YRate2" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'"></td>
		                              </tr>
		                            <tr>
		                              <td height="35" style="text-align:center;vertical-align:middle;"><input type="button" name="Session3" id="Session3" value="NONE" class="ButtonUserSession" style="width:150px;" onclick="ShowSession(3)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="NRun3" id="NRun3" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(3)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="NRate3" id="NRate3" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="YRun3" id="YRun3" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddSessionBitY(3)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="YRate3" id="YRate3" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'"></td>
		                              </tr>
		                            <tr>
		                              <td height="35" style="text-align:center;vertical-align:middle;"><input type="button" name="Session4" id="Session4" value="NONE" class="ButtonUserSession" style="width:150px;" onclick="ShowSession(4)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="NRun4" id="NRun4" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'" onclick="AddSessionBitN(4)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="NRate4" id="NRate4" value="0.00" class="ButtonL" onfocus="this.className='ButtonL_hover'" onblur="this.className='ButtonL'" onmouseover="this.className='ButtonL_hover'" onmouseout="this.className='ButtonL'"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="YRun4" id="YRun4" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'" onclick="AddSessionBitY(4)"></td>
		                              <td style="text-align:center;vertical-align:middle;"><input type="button" name="YRate4" id="YRate4" value="0.00" class="ButtonK" onfocus="this.className='ButtonK_hover'" onblur="this.className='ButtonK'" onmouseover="this.className='ButtonK_hover'" onmouseout="this.className='ButtonK'"></td>
		                              </tr>
                                  </tbody></table>
                                
                                </div>
                                
                                </td>
	                          </tr>
		                      
		                      
		                      </tbody></table></td>
	                      </tr>
		                  </tbody></table></td>
	                  </tr>
		              </tbody></table>
                      <br>
                      <div class="alert alert-error" id="Error" style="visibility:hidden;font-weight:bold;">
                        
                      </div>
		            
                    <table width="100%" class="table table-striped table-hover table-bordered" id="MatchBet">
                      <tbody><tr>
                        <td align="left" class="TableHeading">&nbsp;</td>
                        <td height="25" align="left" class="TableHeading"><strong>Sr.</strong></td>
                        <td style="text-align:right;" class="TableHeading"><strong> Rate</strong></td>
                        <td style="text-align:right;" class="TableHeading"><strong>Amount</strong></td>
                        <td align="left" class="TableHeading"><strong> Mode</strong></td>
                        <td align="left" class="TableHeading"><strong>Team </strong></td>
                        <td align="left" class="TableHeading"><strong>Client</strong></td>
                        <td style="text-align:right;" class="TableHeading"><strong>
                          Sunrisers Hyderabad                        </strong></td>
                        <td style="text-align:right;" class="TableHeading"><strong>
                          Delhi Daredevils                        </strong></td>
                        <td align="left" class="TableHeading"><strong>Date &amp; Time</strong></td>
                      </tr>
                      
                    </tbody></table>
		            <input name="ID" type="hidden" id="ID" readonly="">
                     
                    <input name="NameChk" type="hidden" id="NameChk" value="">
          <input name="MatchCode" type="hidden" id="MatchCode" value="196">
          <input name="MatchRate" type="hidden" id="MatchRate">
          <input name="MatchTeam" type="hidden" id="MatchTeam">
          <input name="LockManual" type="hidden" id="LockManual" value="No">
          <input name="SessionYN" type="hidden" id="SessionYN">
          <input name="SessionName" type="hidden" id="SessionName">
          <input name="MatchStatus" type="hidden" id="MatchStatus" value="">
          <input name="MatchLockStatus" type="hidden" id="MatchLockStatus" value="">
          <input name="SessionLockStatus" type="hidden" id="SessionLockStatus" value="">
          <input name="AmountTimeChk" type="hidden" id="AmountTimeChk" value="">
          
          <input name="SessionRate" type="hidden" id="SessionRate">
          <input name="MatchBitChk" type="hidden" id="MatchBitChk" value="">
          <input name="MatchBitChk_Manualy" type="hidden" id="MatchBitChk_Manualy" value="">
          
          <input name="SessionBitChk" type="hidden" id="SessionBitChk" value="">
          <input name="SessionBitChk_Manualy" type="hidden" id="SessionBitChk_Manualy" value="">
          
          <input name="ExtraSessionName" type="hidden" id="ExtraSessionName" value="">
          <input name="ExtraSessionBitChk" type="hidden" id="ExtraSessionBitChk" value="">
          <input name="ExtraSessionBitChk_Manualy" type="hidden" id="ExtraSessionBitChk_Manualy" value="">
          
          <input name="AddSessionChk" type="hidden" id="AddSessionChk" value="">
          <input name="DeleteChkMultiple" type="hidden" id="DeleteChkMultiple" value="0.00#0.00###########0.00###No#NONE#0.00#0.00#0.00#0.00#NONE#0.00#0.00#0.00#0.00#NONE#0.00#0.00#0.00#0.00#NONE#0.00#0.00#0.00#0.00#0.00#0.00########Sunrisers Hyderabad# # #Delhi Daredevils# # # # # #<br><br>MatchBitDateTime1=, MatchBitDateTime1_05=1970-01-01 05:30:00, CurrTime=2018-05-04 13:34:33,MatchLockStatus=Yes<br><br><br>SessionBitDateTime1=, SessionBitDateTime1_05=1970-01-01 05:30:00, CurrTime=2018-05-04 13:34:33<br><br><br>SessionBitDateTime2=, SessionBitDateTime2_05=1970-01-01 05:30:00, CurrTime=2018-05-04 13:34:33<br>, ">
		  <input name="ClientName" type="hidden" id="ClientName" value="">
          <input name="SessBitMultiChk" type="hidden" id="SessBitMultiChk" value="1">
          <input name="MatchBitMultiChk" type="hidden" id="MatchBitMultiChk" value="1">
          <input name="ClientBitMultiChk" type="hidden" id="ClientBitMultiChk" value="1">
          
          <input name="BetType" type="hidden" id="BetType" value="">
          
          <input name="SessionRun" type="hidden" id="SessionRun" size="7" onkeypress="return SetFocusSession(event,this.name)">
          
          <input name="LastRecord" type="hidden" id="LastRecord" value="0">
          
                    </form>
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
</asp:Content>