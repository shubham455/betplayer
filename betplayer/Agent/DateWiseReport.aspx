<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="DateWiseReport.aspx.cs" Inherits="betplayer.Agent.DataBaseReport" %>

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
		        <h3 class="page-title"> Agent Ledger <small>Agent Ledger Details</small> </h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li> Agent Ledger<span class="divider">&nbsp;</span> </li>
		          <li>Date Wise Report<span class="divider">&nbsp;</span></li>
                  <li><a href="Ledger.aspx"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
		          <div class="widget-body">
                    
		            <div class="portlet-body">
		              <form name="BetPlayer" method="post" action="DebitCreditReportDateWise.php" autocomplete="off">
		              
		              <table width="100%" border="0" align="left" cellpadding="0" cellspacing="2" class="table table-striped table-hover table-bordered">
		                    <tbody><tr>
		                      <td width="10%"><span style="vertical-align:middle;"><strong>Date From</strong></span></td>
		                      <td width="25%" height="30">
                              <div class="controls" style="vertical-align:middle;text-align:left;padding-top:0px;">
                                    <input class=" m-ctrl-medium date-picker" size="16" name="DateFrom" type="text" id="DateFrom" value="2018-02-20">
                                </div>
                              </td>
		                      <td><span style="vertical-align:middle;"><strong>Date To</strong></span></td>
		                      <td height="30"><div class="controls" style="vertical-align:middle;text-align:left;padding-top:0px;">
		                        <input class=" m-ctrl-medium date-picker" size="16" name="DateTo" type="text" id="DateTo" value="2018-02-20">
		                        </div></td>
		                      <td align="left" class="TableHeading"><div>
		                        <button name="btnSave" id="btnSave" type="button" class="btn btn-success" onclick="Submit();">Show</button>
		                        <button type="button" class="btn" onclick="Submit('Cancel');">Cancel</button>
		                        <!--<button type="button" class="btn" onClick="SendSMS();">Send SMS</button>-->
		                        </div></td>
	                        </tr>
	                      </tbody></table>


                      <br>
<br>

                      
                      <input name="DisplayChk" type="hidden" id="DisplayChk" value="">
      
                      </form>
		            </div>
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