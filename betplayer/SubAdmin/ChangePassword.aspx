<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SubAdmin/Dashboard.Master" CodeBehind="ChangePassword.aspx.cs" Inherits="betplayer.SubAdmin.ChangePassword" %>

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
		        <h3 class="page-title"> Change Password</h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li>Settings <span class="divider">&nbsp;</span> </li>
		          <li><a href="ClientDetails.aspx">Change Password</a><span class="divider">&nbsp;</span></li>
                  <li><a href="Settings.aspx"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
		            <h4><i class="icon-globe"></i>Change Password</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form"> 
                  <!-- BEGIN FORM-->
                   
                    <div class="alert alert-error" id="Error" style="visibility:hidden">
                            
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody><tr>
                        <td width="550"><table width="550" border="0" cellspacing="0" cellpadding="0">
                          <tbody><tr>
                            <td width="33" class="welcome">&nbsp;</td>
                            <td width="204" height="30" align="left" valign="middle" class="welcome">Old Password</td>
                            <td width="313" align="left"><asp:TextBox cssclass="textbox" id="txtOldPassword" runat="server"></asp:TextBox></td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">New Password</td>
                            <td align="left"><asp:TextBox runat="server" cssclass="textbox" id="txtpass"></asp:TextBox></td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Confirm Password</td>
                            <td align="left"><asp:TextBox runat="server"  cssclass="textbox" id="txtpass1"></asp:TextBox></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td height="30">&nbsp;</td>
                            <td></td>
                          </tr>
                        </tbody></table></td>
                      </tr>
                    </tbody></table>
                      <div class="form-actions">
                          <button type="button" class="btn btn-success" onclick="Submit('Ok')">Change Password</button>
                          <button type="button" class="btn" onclick="Submit('Cancel')">Cancel</button>
                      </div>
                      
                    <input name="PasswordModifyChk" type="hidden" id="txtPasswordModifyChk" value="" readonly="readonly">
                    
                  
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
