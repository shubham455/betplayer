<%@ Page Language="C#" MasterPageFile="~/superagent/DashBoard.Master" AutoEventWireup="true" CodeBehind="ModifyAgent.aspx.cs" Inherits="betplayer.Super_Agent.ModifyAgent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div id="main-content">
        <!-- BEGIN PAGE CONTAINER-->
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN THEME CUSTOMIZER-->
                    <div id="theme-change" class="hidden-phone"><i class="icon-cogs"></i><span class="settings"><span class="text">Theme:</span> <span class="colors"><span class="color-default" data-style="default"></span><span class="color-gray" data-style="gray"></span><span class="color-purple" data-style="purple"></span><span class="color-navy-blue" data-style="navy-blue"></span></span></span></div>
                    <!-- END THEME CUSTOMIZER-->
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">Modify Agent Details</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Master Details <span class="divider">&nbsp;</span> </li>
                        <li><a href="AgentDetails.php">Agent Details</a><span class="divider">&nbsp;</span></li>
                        <li>Modify Agent<span class="divider">&nbsp;</span></li>
                        <li><a href="AgentDetails.php"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Modify Agent</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <!-- BEGIN FORM-->

                            <div class="alert alert-error" id="Error" style="visibility: hidden">
                            </div>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                <tbody>
                                                    <tr>
                                                        <td width="2%" class="welcome">&nbsp;</td>
                                                        <td width="24%" height="30" align="left" valign="middle" class="welcome">Code</td>
                                                        <td width="24%" align="left" valign="middle">
                                                            <asp:TextBox  class="textbox" id="AgentCode" runat="server"  readonly="true"/>
                                                        </td>
                                                        <td width="24%" align="left">&nbsp;</td>
                                                        <td width="24%" align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Name</td>
                                                        <td align="left" valign="middle">
                                                           <asp:TextBox  class="textbox" id="AgentName" runat="server"  readonly="true"/></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Reference<span class="field-name">
                              
                                                        </span></td>
                                                        <td align="left" valign="middle">
                                                            <input name="Reference" type="text" class="textbox" id="Reference" value="RJ"></td>
                                                        <td align="left" valign="middle"><strong>My Limit</strong></td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Fix Limit</td>
                                                        <td align="left" valign="middle">
                                                            <input name="FixLimit" type="text" class="textbox" id="FixLimit" value="200000.00">
                                                        </td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Rem Limit</td>
                                                        <td align="left" valign="middle">
                                                            <input name="SAFixLimit" type="text" class="textbox" id="SAFixLimit" value="200000.00" readonly="" tabindex="-1"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Current Limit</td>
                                                        <td align="left" valign="middle">
                                                            <input name="CurrentLimit" type="text" class="textbox" id="CurrentLimit" value="182198" readonly=""></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Agent Current Limit</td>
                                                        <td align="left" valign="middle"><span style="font-size: 13px; color: #F00">
                                                            <input name="ALimit" type="text" class="textbox" id="ALimit" value="182198/-&nbsp;से ज्यादा नहीं भर सकते। " readonly="">
                                                        </span></td>
                                                        <td align="left">Client Limit</td>
                                                        <td align="left">
                                                            <input name="ClientLimit" type="text" class="textbox" id="ClientLimit" value="55110.00" readonly=""></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Contact No</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox  class="textbox" id="ContactNo" runat="server"  /></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Password</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox  class="textbox" id="Password" runat="server"  /></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle">Status</td>
                                                        <td align="left" valign="middle">
                                                            <select runat="server" name="Status" id="Status">
                                                                <option value="Active" selected="selected">Active</option>
                                                                <option value="Inactive">Inactive</option>
                                                            </select></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle">Dead </td>
                                                        <td align="left" valign="middle">
                                                            <select name="DeadStatus" id="DeadStatus">
                                                                <option value="YES">YES</option>
                                                                <option value="NO" selected="selected">NO</option>
                                                            </select></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle">Expenses </td>
                                                        <td align="left" valign="middle">
                                                            <select name="Expenses" id="Expenses">
                                                                <option value="YES">YES</option>
                                                                <option value="NO" selected="selected">NO</option>
                                                            </select></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" colspan="2" align="left" valign="middle" class="welcome"><strong>My  Share (Your Share and Agent Share Can't Greater than  )</strong></td>
                                                        <td height="30" align="left" class="welcome"><strong>My  Share Given By Admin</strong></td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share %</td>
                                                        <td align="left" valign="middle">
                                                            <input name="SASharePer" type="text" class="textbox" id="SASharePer" value="0.00"></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share %</td>
                                                        <td align="left" valign="middle">
                                                            <input name="SAMatchShare" type="text" class="textbox" id="SAMatchShare" value="50.00" readonly="" tabindex="-1"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mobile Share %</td>
                                                        <td align="left" valign="middle">
                                                            <input name="SAMobileShare" type="text" class="textbox" id="SAMobileShare" value="100.00"></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mobile&nbsp;Share %</td>
                                                        <td align="left" valign="middle">
                                                            <input name="SAMobileShare1" type="text" class="textbox" id="SAMobileShare1" value="100.00" readonly="" tabindex="-1"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" class="welcome"><strong>Agent Share </strong></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share %</td>
                                                        <td align="left">
                                                            <input runat="server" name="MatchShare" type="text" class="textbox" id="MatchShare" onblur="showCustomer(this.value)" value="50.00"></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mobile Share %</td>
                                                        <td align="left" valign="middle">
                                                            <input runat="server" name="MobileShare" type="text" class="textbox" id="MobileShare" onblur="showCustomer(this.value)" value="100.00"></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" class="welcome"><strong>Agent Commission On User</strong></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td height="30" colspan="2" align="left" class="welcome"><strong>My Commission On User</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission Type</td>
                                                        <td align="left" valign="middle">
                                                            <select name="SessionCommissionType" id="SessionCommissionType" onchange="MSCommission()">
                                                                <option value="Commission Type" selected="">Commission Type</option>
                                                                <option value="No Comm">No Comm</option>
                                                                <option value="Only On Minus">Only On Minus</option>
                                                                <option value="Bet By Bet" selected="">Bet By Bet</option>
                                                            </select></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission Type</td>
                                                        <td align="left" valign="middle">
                                                            <select name="SASessionCommissionType" id="SASessionCommissionType" onchange="MSCommission()" tabindex="-1">
                                                                <option value="Bet By Bet" selected="">Bet By Bet                              </option>
                                                            </select></td>
                                                    </tr>
                                                    <tr id="divMatchCommission" style="visibility: visible;">
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">
                                                            <span id="CommHeading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match Commission</span>
                                                        </td>
                                                        <td align="left">
                                                            <input name="MatchCommission" type="text" class="textbox" id="MatchCommission" value="2.00"></td>
                                                        <td height="30" align="left" valign="middle" class="welcome"><span id="CommHeading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match Commission</span></td>
                                                        <td align="left">
                                                            <input name="SAMatchCommission" type="text" class="textbox" id="SAMatchCommission" value="2.00" readonly="" tabindex="-1"></td>
                                                    </tr>
                                                    <tr id="divSessionCommission" style="visibility: visible;">
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                                                        <td align="left">
                                                            <input name="SessionCommission" type="text" class="textbox" id="SessionCommission" value="2.50"></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                                                        <td align="left">
                                                            <input name="SASessionCommission" type="text" class="textbox" id="SASessionCommission" value="2.50" readonly="" tabindex="-1"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" class="welcome"><strong>Agent Commission On Mobile</strong></td>
                                                        <td align="left">&nbsp;</td>
                                                        <td height="30" colspan="2" align="left" class="welcome"><strong>My Commission On Mobile</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match Commission</td>
                                                        <td align="left">
                                                            <input name="MatchCommission2" type="text" class="textbox" id="MatchCommission2" value="2.00"></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match Commission</td>
                                                        <td align="left">
                                                            <input name="SAMatchCommission2" type="text" class="textbox" id="SAMatchCommission2" value="2.00" readonly="" tabindex="-1"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                                                        <td align="left">
                                                            <input name="SessionCommission2" type="text" class="textbox" id="SessionCommission2" value="2.50"></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                                                        <td align="left">
                                                            <input name="SASessionCommission2" type="text" class="textbox" id="SASessionCommission2" value="2.50" readonly="" tabindex="-1"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <br>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="form-actions">
                                <button type="button" class="btn btn-success" onclick="Submit('Ok')">Update</button>
                                <button type="button" class="btn" onclick="Submit('Cancel')">Cancel</button>
                            </div>



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
