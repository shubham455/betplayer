<%@ Page Language="C#" MasterPageFile="~/superagent/DashBoard.Master" AutoEventWireup="true" CodeBehind="SessionPlusMinusSelect.aspx.cs" Inherits="betplayer.Super_Agent.SessionPlusMinus" %>

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
		        <h3 class="page-title">  Session Plus Minus Report Selection
  <small> </small></h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li> Sport's Betting <span class="divider">&nbsp;</span> </li>
		          <li> Session Plus Minus Selection<span class="divider">&nbsp;</span></li>
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
                    <form name="BetPlayer" id="BetPlayer" method="post" action="SessionPlusMinusDisplay.php" autocomplete="off">
                    
		            <div class="portlet-body">
		              <div class="clearfix">
		                
	                  </div>
		              <div class="space15"></div>
		            
                    </div>
		            
          		
			                  <table width="1000" border="0" align="left" cellpadding="0" cellspacing="0" class="table table-striped table-hover table-bordered">
        <tbody><tr class="MainHeading">
          <td height="35" align="left" valign="middle" class="MainHeading1 textTeamHead">DECLARED SEESION NOT FOUND </td>
          </tr>
      </tbody></table>
      
        <table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tbody><tr>
    <td>&nbsp;</td>
  </tr>
</tbody></table>
       
                    
                    <br>
<br>
<br>

		          <input name="From" type="hidden" id="From" value="">
                  <input name="To" type="hidden" id="To" value="0">
                  <input name="FromID" type="hidden" id="FromID" value="">
                  <input name="BackPage" type="hidden" id="BackPage" value="SessionPlusMinusSelect.php?MT=246">
                  <input name="DisplayChk" type="hidden" id="DisplayChk" value="Yes">
                  <input name="MatchCount" type="hidden" id="MatchCount" value="1">
                  <input name="MatchCode" type="hidden" id="MatchCode" value="246">
                  <input type="hidden" name="Match1" id="Match1" value="246">
                  
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
