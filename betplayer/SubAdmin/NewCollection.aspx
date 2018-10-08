<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SubAdmin/Dashboard.Master" CodeBehind="NewCollection.aspx.cs" Inherits="betplayer.SubAdmin.NewCollection" %>

<asp:Content ID ="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    
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
		        <h3 class="page-title"> Create New Collection</h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li>Master Details <span class="divider">&nbsp;</span> </li>
		          <li><a href="ClientDetails.php">Collection Details</a><span class="divider">&nbsp;</span></li>
                  <li>Create New Collection<span class="divider-last">&nbsp;</span></li>
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
		            <h4><i class="icon-globe"></i>Create New Collection</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form"> 
                  <!-- BEGIN FORM-->
                    <form name="BetPlayer" id="BetPlayer" method="post" action="CollectionDetails.php" autocomplete="off">
                    <div class="alert alert-error" id="Error" style="visibility:hidden">
                            
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody><tr>
                        <td width="550"><table width="550" border="0" cellspacing="0" cellpadding="0">
                          <tbody><tr>
                            <td width="33" class="welcome">&nbsp;</td>
                            <td width="204" height="30" align="left" valign="middle" class="welcome"> Code</td>
                            <td width="313" align="left"><label for="CCode">
                              <asp:TextBox id="txtCCode" runat="server" ReadOnly="true" ></asp:TextBox>
                            </label></td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Name *</td>
                            <td align="left"><asp:TextBox  id="txtCollection" runat="server"></asp:TextBox></td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Account No</td>
                            <td align="left"><asp:TextBox id="txtAccountNo" runat="server"></asp:TextBox></td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Address</td>
                            <td align="left"><asp:TextBox  id="txtAddress" runat="server"/> </td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Contact No</td>
                            <td align="left"><asp:TextBox id="txtContactNo" runat="server"></asp:TextBox></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td height="30" align="left">Group Name</td>
                            <td align="left"><label for="GroupName"></label>
                              <select name="GroupName" id="GroupName">
                                <option value="BANK" selected="selected">BANK</option>
                                <option value="COLLECTION">COLLECTION</option>
                              </select></td>
                          </tr>
                        </tbody></table></td>
                      </tr>
                    </tbody></table>
                      <div class="form-actions">
                          <button type="button" class="btn btn-success" onclick="Submit('Ok')">Save</button>
                          <button type="button" class="btn" onclick="Submit('Cancel')">Cancel</button>
                      </div>
                      
                    <input name="SubmitChk" type="hidden" id="SubmitChk" value="" readonly="readonly">
                    
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

