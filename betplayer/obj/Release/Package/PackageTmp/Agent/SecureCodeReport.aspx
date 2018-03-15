<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="SecureCodeReport.aspx.cs" Inherits="betplayer.Agent.SecureCodeReport" %>

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
		        <h3 class="page-title"><span class="welcome">Login Report</span></h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li>Reports <span class="divider">&nbsp;</span> </li>
                  <li><span class="welcome">Login Report</span><span class="divider">&nbsp;</span></li>
                  <li><a href="Reports.php"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
	            </ul>
		        <!-- END PAGE TITLE & BREADCRUMB-->
	          </div>
	        </div>
		    <!-- END PAGE HEADER-->
		    <!-- BEGIN PAGE CONTENT-->
		    <div class="row-fluid">
		      <div class="span12">
		        <div class="widget">
		          <div class="widget-title">
		            <h4><i class="icon-globe"></i>Login Report</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form"> 
                  <!-- BEGIN FORM-->
                    <form name="BetPlayer" id="BetPlayer" method="post" action="SecureCodeReport.php" autocomplete="off">
                    <div class="alert alert-error" id="Error" style="visibility:hidden">
                            
                    </div>
                    
                    <table width="100%" border="0" align="left" cellpadding="0" cellspacing="2" class="table table-striped table-hover table-bordered">
            <tbody><tr>
              <td width="100" height="25" class="TableHeading">Code</td>
              <td width="150" height="30"><input name="Code" type="text" id="Code" value=""></td>
              <td style="text-align:left;">
                <button id="btnSave" type="button" class="btn btn-success" onclick="ShowLoginDetails()">Show</button>
                </td>
            </tr>
            </tbody></table>
          
          <br>
<br>
          
          <br>
          <br>
          
          
           
      
		<input name="ShowChk" type="hidden" id="ShowChk" value="">
		<input name="LoginName" type="hidden" id="LoginName">
                    
                    </form>
                    <!-- END FORM-->
                  </div>
	            </div>
	          </div>
	        </div>
		    <!-- END PAGE CONTENT-->
	      </div>
		  <!-- END PAGE CONTAINER-->
	  </div>
</asp:Content>