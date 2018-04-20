<%@ Page Language="C#"  MasterPageFile="~/Agent/DashBoard.Master"  AutoEventWireup="true" CodeBehind="ModifyClient.aspx.cs" Inherits="betplayer.Agent.ModifyClient" %>

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
		        <h3 class="page-title"> Modify Client</h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li>Master Details <span class="divider">&nbsp;</span> </li>
		          <li><a href="ClientDetails.php">Client Details</a><span class="divider">&nbsp;</span></li>
                  <li>Modify Client<span class="divider">&nbsp;</span></li>
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
		            <h4><i class="icon-globe"></i>Modify Client</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form"> 
                  <!-- BEGIN FORM-->
                    <form name="BetPlayer" id="BetPlayer" method="post" action="ClientDetails.php" autocomplete="off">
                    <div class="alert alert-error" id="Error" style="visibility:hidden">
                            
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody><tr>
                        <td width="550"><table width="900" border="0" cellpadding="0" cellspacing="0">
                                                    <tbody><tr>
                            <td width="33" class="welcome">&nbsp;</td>
                            <td width="204" height="30" align="left" valign="middle" class="welcome">Code</td>
                            <td width="313" align="left">
                              <input name="ClientCode" type="text" class="textbox" id="ClientCode" value="C220" readonly="">
                            </td>
                            <td width="313" align="left">&nbsp;</td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Name</td>
                            <td align="left"><input name="ClientName" type="text" class="textbox" id="ClientName" value="220 Shivam" readonly=""></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                          <tr>
                            <td class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Contact No</td>
                            <td align="left"><input name="ContactNo1" type="text" class="textbox" id="ContactNo1" value="8319058205"></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                                                        
                          
                          <tr>
                            <td height="30" align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Fix Limit</td>
                            <td align="left" valign="middle"><input name="FixLimit" type="text" class="textbox" id="FixLimit" value="10000.00"></td>
                            <td align="left" valign="middle">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="30" align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left">Mobile App</td>
                            <td align="left"><select name="MobApp" id="MobApp">
                                                            <option value="NO">NO</option>
                                                                                          <option value="YES" selected="selected">YES</option>
                                                          </select></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                          
                          <tr>
                            <td>&nbsp;</td>
                            <td height="30" align="left" valign="middle"><strong>Settings</strong></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td height="30" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password</td>
                            <td align="left"><input name="Password" type="text" class="textbox" id="Password" value="123"></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td height="30" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Status</td>
                            <td align="left"><select name="Status" id="Status">
                                                            <option value="Active" selected="selected">Active</option>
                                                                                          <option value="Inactive">Inactive</option>
                                                          </select></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome"><strong>Commission &amp; Share </strong></td>
                            <td align="left">&nbsp;</td>
                            <td align="left" valign="middle" style="font-size:13px;color:#F00"><strong>My Share %</strong></td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Agent Share %</td>
                            <td align="left"><input name="MatchShare" type="text" class="textbox" id="MatchShare" value="50.00"></td>
                            <td align="left" valign="middle"><input name="MatchShare2" type="text" class="textbox" id="MatchShare2" onblur="showCustomer(this.value)" value="50.00" readonly=""></td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">Client Share %</td>
                            <td align="left"><input name="SharePerClient" type="text" class="textbox" id="SharePerClient" value="0.00"></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome"><p>&nbsp;</p></td>
                            <td height="30" align="left" valign="middle" class="welcome"><strong>Client Commission Percentage</strong></td>
                            <td align="left">&nbsp;</td>
                            <td align="left">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission Type</td>
                            <td align="left" valign="middle"><select name="SessionCommissionTypeClient" id="SessionCommissionTypeClient" onchange="MSCommission()">
                              <option value="Commission Type" selected="">Commission Type</option>
                                                            <option value="No Comm" selected="">No Comm</option>
                                                                                          <option value="Only On Minus">Only On Minus</option>
                                                                                          <option value="Bet By Bet">Bet By Bet</option>
                                                          </select></td>
                            <td align="left" valign="middle">&nbsp;</td>
                          </tr>
                          <tr id="divMatchCommission" style="visibility: visible;">
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">
                            <span id="CommHeading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match Commission</span>
                            </td>
                            <td align="left"><input name="MatchCommissionClient" type="text" class="textbox" id="MatchCommissionClient" value="0.00"></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                          <tr id="divSessionCommission" style="visibility: visible;">
                            <td align="left" class="welcome">&nbsp;</td>
                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                            <td align="left"><input name="SessionCommissionClient" type="text" class="textbox" id="SessionCommissionClient" value="0.00"></td>
                            <td align="left">&nbsp;</td>
                          </tr>
                                                  </tbody></table></td>
                      </tr>
                    </tbody></table>
                    <div class="form-actions">
			      <button type="button" class="btn btn-success" onclick="Submit('Ok')">Update</button>
                        <button type="button" class="btn" onclick="Submit('Cancel')">Cancel</button>
               	  </div>
                      
                    <input name="MatchShareOld" type="hidden" class="textbox" id="MatchShareOld" value="50.00">
                    <input name="SessionShareOld" type="hidden" class="textbox" id="SessionShareOld" value="0.00">
                    <input name="ShareModifyChk" type="hidden" class="textbox" id="ShareModifyChk" value="Yes">
                    <input name="MatchLimit" type="hidden" class="textbox" id="MatchLimit" value="0" readonly="">
                    
                    <input name="AutoNo" type="hidden" id="AutoNo" value="323230" readonly="">
                    <input name="ModifyChk" type="hidden" id="ModifyChk" value="" readonly="">
                    <input name="ClientName_Old" type="hidden" id="ClientName_Old" value="220 Shivam" readonly="">
                    <input name="ClientName1" type="hidden" id="ClientName1" value="220 Shivam" readonly="">
                    <input name="SessionCommissionTypeClientOld" type="hidden" id="SessionCommissionTypeClientOld" value="No Comm" readonly="">
                    
                    
                        
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
    
</asp:content>