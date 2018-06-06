<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Agent/DashBoard.Master" CodeBehind="CreateClient.aspx.cs" Inherits="Panchayat_System.Admin.BirthCertificate" %>

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
                    <h3 class="page-title">Create New Client</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Master Details <span class="divider">&nbsp;</span> </li>
                        <li><a href="ClientDetails.aspx">Client Details</a><span class="divider">&nbsp;</span></li>
                        <li>Create New Client<span class="divider">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Create New Client</h4>
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
                                                <div></div>
                                                <table width="850" border="0" cellspacing="0" cellpadding="0">
                                                    <tbody>

                                                        <tr>
                                                            <td class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Name</td>
                                                            <td align="left">
                                                                <asp:TextBox CssClass="textbox" ID="txtname" runat="server" /></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Contact No</td>
                                                            <td align="left">
                                                                <asp:TextBox runat="server" CssClass="textbox" MaxLength="10" ID="txtContactno" /></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Client Limit</td>
                                                            <td align="left" valign="middle">
                                                                <asp:TextBox CssClass="textbox" ID="txtClientlimit" runat="server" OnTextChanged="txtClientlimit_TextChanged" AutoPostBack="true" /></td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Agent Current Limit</td>
                                                            <td height="30" align="left" valign="middle" style="font-size: 13px; color: #F00">
                                                                <asp:TextBox CssClass="textbox" ID="txtAgentlimit" runat="server" Text="305653" PlaceHolder="305653&nbsp;&nbsp; से ज्यादा नहीं भर सकते। " ReadOnly="true" />
                                                            </td>
                                                            <td align="left" valign="middle" style="font-size: 13px; color: #F00"><strong>My Share %</strong></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Agent Share %</td>
                                                            <td align="left" valign="middle">
                                                                <asp:TextBox CssClass="textbox" ID="txtAgentShare" runat="server" OnTextChanged="txtAgentShare_TextChanged" AutoPostBack="true"  Text="50.00"/></td>
                                                            <td align="left" valign="middle">
                                                                <asp:TextBox CssClass="textbox" ID="txtAgentShare2" runat="server" Text="50" PlaceHolder="50.00" ReadOnly="true" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Client Share %</td>
                                                            <td align="left">
                                                                <asp:TextBox CssClass="textbox" ID="txtClientShare" runat="server"  Text="0" /></td>
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
                                                                <asp:DropDownList ID="SessionDropDown" runat="server" class="form-control" AppendDataBoundItems="False" DataTextField="UserName" DataValueField="UserID">
                                                                    <asp:ListItem Text="Please Select" Value="0">Commission Type</asp:ListItem>
                                                                    <asp:ListItem Text="No Commission" Value="1">No Commission</asp:ListItem>
                                                                    <asp:ListItem Text=">Only On Minus" Value="2">Only On Minus</asp:ListItem>
                                                                    <asp:ListItem Text="Bet By Bet" Value="3">Bet By Bet</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="SessionDropDown"
                                                                    ErrorMessage="Value Required!" InitialValue="0"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                        </tr>
                                                        <tr id="divMatchCommission" style="visibility: hidden;">
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">
                                                                <span id="CommHeading">Match Commission</span>
                                                            </td>
                                                            <td align="left">
                                                                <input name="MatchCommissionClient" type="text" class="textbox" id="MatchCommissionClient" onblur="showCustomer(this.value)" value="0"></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr id="divSessionCommission" style="visibility: hidden;">
                                                            <td align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                                                            <td align="left">
                                                                <input name="SessionCommissionClient" type="text" class="textbox" id="SessionCommissionClient" onblur="showCustomer(this.value)" value="0"></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="form-actions">
                                    <asp:Button ID="btnSave" CssClass ="btn btn-success" runat="server"  onclick="Submit_Click" Text="Save" />
                                     <asp:Button ID="btnCancel" ValidationGroup="vg1" CssClass ="btn btn-success" runat="server"  onclick="btnCancel_Click" Text="Cancel" />
                                </div>

                                <input name="textfield10" type="hidden" class="FontText" id="textfield10" readonly="readonly">
                                <input name="SubmitChk" type="hidden" id="SubmitChk" value="" readonly="readonly">
                                <input name="textfield2" type="hidden" class="FontText" id="textfield2" readonly="readonly">
                                <input type="hidden" name="ContactNo_ALL" id="ContactNo_ALL" value="">
                                <input name="SubmitChk2" type="hidden" id="SubmitChk2" value="" readonly="readonly">
                                <input name="textfield" type="hidden" class="FontText" id="textfield" readonly="readonly">

                                <input name="MatchLimit" type="hidden" class="textbox" id="MatchLimit" value="0" readonly="readonly">
                                <input name="MobApp" type="hidden" class="textbox" id="MobApp" value="YES" readonly="readonly">
                                <input name="UsedLimit" type="hidden" class="textbox" id="UsedLimit" value="305653" readonly="readonly">
                     
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
