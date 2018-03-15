<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="ViewMatchReport.aspx.cs" Inherits="betplayer.Agent.ViewMatchReport" %>

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
		        <h3 class="page-title"> Match Bet Details
  <small> </small></h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li> Sport's Betting <span class="divider">&nbsp;</span> </li>
		          <li>Match &amp; Session Plus Minus Selection<span class="divider">&nbsp;</span></li>
                  <li><a href="SportsDetails.aspx"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                    <form name="BetPlayer" id="BetPlayer" method="post" action="ViewMatchReport.php" autocomplete="off">
                    
		            <div class="portlet-body">
		              <div class="clearfix">
		                
	                  </div>
		              <div class="space15"></div>
		            
                    </div>
		            
                    <table width="100%" border="0" cellspacing="3" cellpadding="0" class="table table-striped table-hover table-bordered">
            <tbody><tr class="MainHeading">
              <td width="181" height="35" align="left" valign="middle" class="MainHeading1 textTeamHead"><strong>
                South Africa              </strong></td>
              <td width="193" style="text-align:right;color:#000" valign="middle" class="MainHeading1 textTeamHead"><strong>
                0.00              </strong></td>
              <td width="118" align="center" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
              <td width="199" height="35" align="center" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
              <td width="398" align="center" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
              <td width="189" align="left" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
              </tr>
            <tr class="MainHeading">
              <td height="35" align="left" valign="middle" class="MainHeading1 textTeamHead"><strong>
                India              </strong></td>
              <td style="text-align:right;color:#000" valign="middle" class="MainHeading1 textTeamHead"><strong>
                0.00              </strong></td>
              <td align="center" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
              <td align="center" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
              <td align="center" valign="middle" class="MainHeading">&nbsp;</td>
              <td align="left" valign="middle" class="MainHeading"></td>
            </tr>
                        <tr class="MainHeading">
              <td height="35" align="center" valign="middle" style="vertical-align:middle;"><strong>CLIENT</strong></td>
              <td align="center" valign="middle" class="MainHeading1 textTeamHead">
                <select name="ClientName" id="ClientName" onchange="DisplayClientBets()">
                  <option value="ALL">All Clients</option>
                                    <option value="100 JAI">
                    100 JAI                    </option>
                                    <option value="118 PURAN">
                    118 PURAN                    </option>
                                    <option value="130 ASHAD">
                    130 ASHAD                    </option>
                                    <option value="131 SANJAY">
                    131 SANJAY                    </option>
                                    <option value="132 SATAYAM">
                    132 SATAYAM                    </option>
                                    <option value="133 YASH">
                    133 YASH                    </option>
                                    <option value="134 TARIK">
                    134 TARIK                    </option>
                                    <option value="135 SANKER">
                    135 SANKER                    </option>
                                    <option value="136 RUBI">
                    136 RUBI                    </option>
                                    <option value="137 DEP">
                    137 DEP                    </option>
                                    <option value="138 SHIVAM">
                    138 SHIVAM                    </option>
                                    <option value="139 SOURABH">
                    139 SOURABH                    </option>
                                    <option value="140 ASIF">
                    140 ASIF                    </option>
                                    <option value="141 VK">
                    141 VK                    </option>
                                    <option value="142 NILESH">
                    142 NILESH                    </option>
                                    <option value="144 NAFEES">
                    144 NAFEES                    </option>
                                    <option value="145 NANNA">
                    145 NANNA                    </option>
                                    <option value="147 ARIF">
                    147 ARIF                    </option>
                                    <option value="148 MANJA">
                    148 MANJA                    </option>
                                    <option value="149 SERA">
                    149 SERA                    </option>
                                    <option value="150 DOCTOR">
                    150 DOCTOR                    </option>
                                    <option value="151 SHIVA BPL">
                    151 SHIVA BPL                    </option>
                                    <option value="152 VIJAY">
                    152 VIJAY                    </option>
                                    <option value="153 RAM JI">
                    153 RAM JI                    </option>
                                    <option value="158 ANKU">
                    158 ANKU                    </option>
                                    <option value="161 MUNNA">
                    161 MUNNA                    </option>
                                    <option value="162 UPENDRA">
                    162 UPENDRA                    </option>
                                    <option value="171 14 G">
                    171 14 G                    </option>
                                    <option value="172 APPI">
                    172 APPI                    </option>
                                    <option value="173 YASIN">
                    173 YASIN                    </option>
                                    <option value="174 JK">
                    174 JK                    </option>
                                    <option value="175 ENDRA SAHU">
                    175 ENDRA SAHU                    </option>
                                    <option value="177 ANIL">
                    177 ANIL                    </option>
                                    <option value="187 MANISH CHATARPUR">
                    187 MANISH CHATARPUR                    </option>
                                    <option value="188 RADHE RADHE">
                    188 RADHE RADHE                    </option>
                                    <option value="191 SULTAN">
                    191 SULTAN                    </option>
                                    <option value="193 KISSU">
                    193 KISSU                    </option>
                                    <option value="197 MANOJ MC">
                    197 MANOJ MC                    </option>
                                    <option value="199 MRADUL">
                    199 MRADUL                    </option>
                                    <option value="201 KALAS">
                    201 KALAS                    </option>
                                    <option value="204 BHASKER">
                    204 BHASKER                    </option>
                                    <option value="207 JAY">
                    207 JAY                    </option>
                                    <option value="215 DAU">
                    215 DAU                    </option>
                                    <option value="218 BABA">
                    218 BABA                    </option>
                                    <option value="219 JACKPOT">
                    219 JACKPOT                    </option>
                                    <option value="220 SHIVAM">
                    220 SHIVAM                    </option>
                                    <option value="221 SUMIT">
                    221 SUMIT                    </option>
                                    <option value="222 LAL SINGH">
                    222 LAL SINGH                    </option>
                                    <option value="223 DEVENDRA">
                    223 DEVENDRA                    </option>
                                    <option value="234 MAHAKAL">
                    234 MAHAKAL                    </option>
                                    <option value="251 LOKESH">
                    251 LOKESH                    </option>
                                  </select></td>
              <td align="center" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
              <td align="center" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
              <td align="center" valign="middle" class="MainHeading">&nbsp;</td>
              <td align="left" valign="middle" class="MainHeading"></td>
            </tr>
            </tbody></table>
          <br>
          <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
            <tbody><tr>
              <td height="25" align="left" class="TableHeading"><strong>Sr.</strong></td>
              <td style="text-align:right;" class="TableHeading"><strong> Rate</strong></td>
              <td style="text-align:right;" class="TableHeading"><strong>Amount</strong></td>
              <td align="left" class="TableHeading"><strong> Mode</strong></td>
              <td width="60" align="left" class="TableHeading"><strong>Team </strong></td>
              <td align="left" class="TableHeading"><strong>Client</strong></td>
              <td align="left" class="TableHeading"><strong>Date &amp; Time</strong></td>
              <td width="90" style="text-align:right;" class="TableHeading"><strong>
                South Africa              </strong></td>
              <td width="90" style="text-align:right;" class="TableHeading"><strong>
                India              </strong></td>
                                                                                                                                                        </tr>
                        <tr>
              <td height="25" colspan="6" style="text-align:right;" class="TableHeading">&nbsp;</td>
              <td style="text-align:right;" class="TableHeading"><strong>TOTAL AMOUNT</strong></td>
              <td style="text-align:right;" class="TableHeading"><strong>
                0              </strong></td>
              <td style="text-align:right;" class="TableHeading"><strong>
                0              </strong></td>
                                                                                                                                                        </tr>
          </tbody></table>
          <input name="ClientChk" type="hidden" id="NameChk" value="">
          <input name="MatchCode" type="hidden" id="MatchCode" value="246">
                    
		            <input name="DisplayChk" type="hidden" id="DisplayChk" value="Yes">
     				<input name="MatchCode" type="hidden" id="MatchCode" value="246">
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
</asp:Content>
