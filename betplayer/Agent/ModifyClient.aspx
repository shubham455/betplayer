<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="ModifyClient.aspx.cs"   Inherits="betplayer.Agent.ModifyClient" %>

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
                    <h3 class="page-title">Modify Client</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Master Details <span class="divider">&nbsp;</span> </li>
                        <li><a href="ClientDetails.aspx">Client Details</a><span class="divider">&nbsp;</span></li>
                        <li>Modify Client<span class="divider">&nbsp;</span></li>
                        <li><a href="ClientDetails.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <!-- BEGIN FORM-->
                           
                                <div class="alert alert-error" id="Error" style="visibility: hidden">
                                </div>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td width="550">
                                                <table width="900" border="0" cellpadding="0" cellspacing="0">
                                                    <tbody>
                                                        <tr>
                                                            <td width="33" class="welcome">&nbsp;</td>
                                                            <td width="204" height="30" align="left" valign="middle" class="welcome">Code</td>
                                                            <td width="313" align="left">
                                                                <asp:TextBox CssClass="textbox" ID="txtCode" ReadOnly="true" runat="server" />
                                                            </td>
                                                            <td width="313" align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Name</td>
                                                            <td align="left">
                                                                <asp:TextBox CssClass="textbox" ID="txtName" ReadOnly="true" runat="server" /></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Contact No</td>
                                                            <td align="left">
                                                                <asp:TextBox CssClass="textbox" ID="txtContactNo" runat="server" /></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>


                                                        <tr>
                                                            <td height="30" align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Client Limit</td>
                                                            <td align="left" valign="middle">
                                                                <asp:TextBox CssClass="textbox" ID="txtclientLimit" runat="server" /></td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left">Mobile App</td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="DropDownMobileApp" runat="server" CssClass="btn btn-primary dropdown-toggle" Width="150px" >
                                                                    <asp:ListItem Enabled ="true" Text="Please Select" Value="0">Commission Type</asp:ListItem>
                                                                    <asp:ListItem   Text="Yes" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                </asp:DropDownList></td>
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
                                                            <td align="left">
                                                                <asp:TextBox CssClass="textbox" ID="txtPassword" runat="server" /></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                            <td height="30" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Status</td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="DropDownstatus" runat="server" CssClass="btn btn-primary dropdown-toggle" Width="150px" >
                                                                    <asp:ListItem Text="Please Select" Value="0">Commission Type</asp:ListItem>
                                                                    <asp:ListItem Text="Active" Value="Active">Active</asp:ListItem>
                                                                    <asp:ListItem Text="Inactive" Value="Inactive">Inactive</asp:ListItem>
                                                                </asp:DropDownList></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome"><strong>Commission &amp; Share </strong></td>
                                                            <td align="left">&nbsp;</td>
                                                            <td align="left" valign="middle" style="font-size: 13px; color: #F00"><strong>My Share %</strong></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Agent Share %</td>
                                                            <td align="left">
                                                                <asp:TextBox CssClass="textbox" ID="txtAgentshare" runat="server" /></td>
                                                            <td align="left" valign="middle">
                                                                <input name="MatchShare2" type="text" class="textbox" id="MatchShare2" onblur="showCustomer(this.value)" value="50.00" readonly=""></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Client Share %</td>
                                                            <td align="left">
                                                                <asp:TextBox CssClass="textbox" ID="txtClientshare" runat="server" /></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="welcome">
                                                                <p>&nbsp;</p>
                                                            </td>
                                                            <td height="30" align="left" valign="middle" class="welcome"><strong>Client Commission Percentage</strong></td>
                                                            <td align="left">&nbsp;</td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission Type</td>
                                                            <td align="left" valign="middle">
                                                                <asp:DropDownList ID="SessionDropDown" runat="server" class="btn btn-primary dropdown-toggle" AppendDataBoundItems="True">
                                                                    <asp:ListItem Text="Please Select" Value="0">Commission Type</asp:ListItem>
                                                                    <asp:ListItem Text="No Commission" Value="1">No Commission</asp:ListItem>
                                                                    <asp:ListItem Text=">Only On Minus" Value="2">Only On Minus</asp:ListItem>
                                                                    <asp:ListItem Text="Bet By Bet" Value="3">Bet By Bet</asp:ListItem>
                                                                </asp:DropDownList>
                                                                </td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                        </tr>
                                                        <tr id="divMatchCommission" style="visibility: visible;">
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">
                                                                <span id="CommHeading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match Commission</span>
                                                            </td>
                                                            <td align="left">
                                                                <input name="MatchCommissionClient" type="text" class="textbox" id="MatchCommissionClient" value="0.00"></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr id="divSessionCommission" style="visibility: visible;">
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                                                            <td align="left">
                                                                <input name="SessionCommissionClient" type="text" class="textbox" id="SessionCommissionClient" value="0.00"></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="form-actions">
                                    <asp:Button ID="btnUpdate" class="btn btn-success" Text="Update" OnClick="btnUpdate_Click" runat="server"/>
                                    <asp:button ID="btnCancel" class="btn btn-success" Text="Cancel" OnClick="Button1_Click" runat="server"/>
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
