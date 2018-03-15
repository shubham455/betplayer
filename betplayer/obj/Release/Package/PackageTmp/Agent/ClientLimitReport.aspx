<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="ClientLimitReport.aspx.cs" Inherits="betplayer.Agent.ClientLimitReport" %>

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
		        <h3 class="page-title">Client Current Limit Update Details<small> </small></h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li> Client Details <span class="divider">&nbsp;</span> </li>
		          <li>Client Current Limit Update Details<span class="divider">&nbsp;</span></li>
                  <li><a href="ClientDetails.php"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                    <form name="BetPlayer" id="BetPlayer" method="post" action="ClientLimitReport.php" autocomplete="off">
                    
		            <div class="portlet-body">
		              <div class="clearfix">
		                
	                  </div>
		              <div class="space15"></div>
		            
                    </div>
		            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-striped table-hover table-bordered">
		              <tbody><tr class="MainHeading">
		                <td width="100" height="35" align="left" valign="middle"><strong> Agent                Name</strong></td>
		                <td width="260" align="left" valign="middle"><select name="AgentName" id="AgentName">
		                  <option value="Select It...">Select It...</option>
		                  		                  <option value="LALA MAU">
		                    LALA MAU		                    -
		                    9628371118	                      </option>
		                  		                  </select></td>
		                <td width="64" align="left" valign="middle"><strong>Date</strong></td>
		                <td width="138" align="left" valign="middle"><input name="Date" type="text" id="date-pick" class=" m-ctrl-medium date-picker" value="2018-02-20"></td>
		                <td align="left">
                        	<button class="btn btn-success" type="button" onclick="ShowRecord();">Show Report</button>
                        </td>
	                  </tr>
		              </tbody></table>
		            <br>
                                        <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                      <tbody><tr>
                        <td width="40" height="25" align="left" class="TableHeading"><strong>SNo.</strong></td>
                        <td width="150" align="left" class="TableHeading"><strong>Client Name</strong></td>
                        <td width="70" align="right" class="TableHeading"><strong>Old Limit</strong></td>
                        <td width="70" align="right" class="TableHeading"><strong>New Limit</strong></td>
                        <td width="150" align="left" class="TableHeading"><strong>Date Time</strong></td>
                        <td width="80" align="left" class="TableHeading"><strong>User Name</strong></td>
                        <td width="150" align="left" class="TableHeading"><strong>Operator</strong></td>
                        <td align="left" class="TableHeading"><strong>IP</strong></td>
                        <td align="left" class="TableHeading"><strong>Remark</strong></td>
                      </tr>
                                          </tbody></table>
                    <br>
<br>

		            <input name="DisplayChk" type="hidden" id="DisplayChk" value="">
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
