<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="DeleteClient.aspx.cs" Inherits="betplayer.Agent.DeleteClient" %>


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
		        <h3 class="page-title"> Delete Clients</h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li>Master Details <span class="divider">&nbsp;</span> </li>
		          <li><a href="ClientDetails.php">Client Details</a><span class="divider">&nbsp;</span></li>
                  <li>Delete Client<span class="divider">&nbsp;</span></li>
                  <li><a href="ClientDetails.php"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
		            <h4><i class="icon-globe"></i>Delete Client</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form"> 
                  <!-- BEGIN FORM-->
                    <form name="BetPlayer" id="BetPlayer" method="post" action="ClientDetails.php" autocomplete="off">
                    <div class="alert alert-error" id="Error" style="visibility:hidden">
                            
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody><tr>
                        <td width="550"><table width="600" border="0" cellpadding="0" cellspacing="0">
                                                    <tbody><tr>
                            <td width="33" class="welcome">&nbsp;</td>
                            <td width="204" height="30" align="left" valign="middle" class="welcome">Code</td>
                            <td width="313" align="left">
                              <input name="ClientCode" type="text" class="textbox" id="ClientCode" value="C220" readonly="readonly">
                            </td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Name</td>
                            <td align="left"><input name="ClientName" type="text" class="textbox" id="ClientName" value="220 Shivam" readonly="readonly"></td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Contact No</td>
                            <td align="left"><input name="ContactNo1" type="text" class="textbox" id="ContactNo1" value="8319058205" readonly="readonly"></td>
                          </tr>
                          <tr>
                            <td height="30" align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" class="welcome"><strong>Agent Commission</strong></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Agent</td>
                            <td align="left">
                                <select name="AgentName" id="AgentName" class="textbox">
                                  <option value="Lala Mau" selected="selected">Lala Mau</option>
                                </select>
                            </td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match Commission</td>
                            <td align="left"><input name="MatchCommission" type="text" class="textbox" id="MatchCommission" onblur="showCustomer(this.value)" value="2.00" readonly="readonly"></td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                            <td align="left"><input name="SessionCommission" type="text" class="textbox" id="SessionCommission" onblur="showCustomer(this.value)" value="2.50" readonly="readonly"></td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Meter Commission</td>
                            <td align="left"><input name="MeterCommission" type="text" class="textbox" id="MeterCommission" onblur="showCustomer(this.value)" value="0.00" readonly="readonly"></td>
                          </tr>
                                                    <tr>
                            <td height="30" align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" class="welcome"><strong>Agent Share Percentage</strong></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match</td>
                            <td align="left"><input name="MatchShare" type="text" class="textbox" id="MatchShare" onblur="showCustomer(this.value)" value="50.00" readonly="readonly"></td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session</td>
                            <td align="left"><input name="SessionShare" type="text" class="textbox" id="SessionShare" onblur="showCustomer(this.value)" value="0.00" readonly="readonly"></td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Meter</td>
                            <td align="left"><input name="MeterShare" type="text" class="textbox" id="MeterShare" onblur="showCustomer(this.value)" value="0.00" readonly="readonly"></td>
                          </tr>
                                                    <tr>
                            <td>&nbsp;</td>
                            <td height="30" align="left" valign="middle"><strong>Settings</strong></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td height="30" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password</td>
                            <td align="left"><input name="Password" type="text" class="textbox" id="Password" onblur="showCustomer(this.value)" value="123" readonly="readonly"></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td height="30" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Status</td>
                            <td align="left"><select name="Status" id="Status">
                                                            <option value="Active" selected="selected">Active</option>
                                                                                          <option value="Inactive">Inactive</option>
                                                          </select></td>
                          </tr>
                                                  </tbody></table></td>
                      </tr>
                    </tbody></table>
                    <div class="form-actions">
			      <!--<button type="button" class="btn btn-success" onClick="Submit('Ok')">Delete</button>-->
                  <button class="btn btn-danger" type="button" onclick="Submit('Ok')"><i class="icon-remove icon-white"></i> Delete</button>
                        <button type="button" class="btn" onclick="Submit('Cancel')">Cancel</button>
               	  </div>
                      
                    <input name="MatchShareOld" type="hidden" class="textbox" id="MatchShareOld" value="50.00">
                    <input name="SessionShareOld" type="hidden" class="textbox" id="SessionShareOld" value="0.00">
                    <input name="ShareModifyChk" type="hidden" class="textbox" id="ShareModifyChk" value="Yes">
                    
                    <input name="AutoNo" type="hidden" id="AutoNo" value="323230" readonly="readonly">
                    <input name="DeleteChk" type="hidden" id="DeleteChk" value="" readonly="readonly">
                    <input name="ClientName_Old" type="hidden" id="ClientName_Old" value="220 Shivam" readonly="readonly">
                    <input name="ClientName1" type="hidden" id="ClientName1" value="220 Shivam" readonly="readonly">
                    <input name="ShareModifyChk" type="hidden" class="textbox" id="ShareModifyChk" value="Yes">
                              
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