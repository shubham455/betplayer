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
                                                            <asp:TextBox runat="server" CssClass="textbox" MaxLength="10" ID="txtContactno" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContactno" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Password</td>
                                                        <td align="left">
                                                            <asp:TextBox runat="server" CssClass="textbox" MaxLength="10" ID="txtPassword" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                        </td>

                                                        <td align="left">&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Client Limit</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox CssClass="textbox" ID="txtClientlimit" runat="server" OnTextChanged="txtClientlimit_TextChanged" AutoPostBack="true" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtClientlimit" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                        </td>

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
                                                            <asp:TextBox CssClass="textbox" ID="txtAgentShare" runat="server" Text="0" OnTextChanged="txtAgentShare_TextChanged" AutoPostBack="true" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAgentShare" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox CssClass="textbox" ID="txtAgentShare2" runat="server" ReadOnly="true" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Mobile App</td>
                                                        <td align="left">
                                                            <asp:TextBox CssClass="textbox" ID="txtMobapp" runat="server" Text="0" MaxLength="3" />
                                                            <asp:RegularExpressionValidator ID="regmob" runat="server" ErrorMessage="Mobile App Amount Should Be less Than 100 Or Equal To 100" ControlToValidate="txtMobapp" ValidationExpression="^([0-9]|[1-9][0-9]|100)$"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtMobapp" ErrorMessage="**"></asp:RequiredFieldValidator>


                                                        </td>
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
                                                        <td height="30" align="left" valign="middle" class="welcome">Session Commission Type</td>
                                                        <td align="left" valign="middle">
                                                            <asp:DropDownList ID="SessionDropDown" runat="server" class="form-control" AutoPostBack="true" AppendDataBoundItems="False" DataTextField="UserName" DataValueField="UserID" OnSelectedIndexChanged="SessionDropDown_SelectedIndexChanged">
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
                                                    <br />
                                                    <br />

                                                    <tr id="divMatchCommission">
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">
                                                            <asp:Label ID="lblMatchCommision" runat="server" Text="MatchCommision" Visible="false"></asp:Label>
                                                            <asp:Label ID="lblonlyminus" runat="server" Text="Only Minus" Visible="false"></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox class="textbox" ID="MatchCommissionClient" runat="server" Visible="false" Text="0" /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr id="divSessionCommission">
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">
                                                            <asp:Label ID="lblsessioncommision" runat="server" Text="SessionCommision" Visible="false"></asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox class="textbox" ID="SessionCommissionClient" runat="server" Visible="false" Text="0" /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="form-actions">
                                <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" OnClick="Submit_Click" Text="Save" />
                                <asp:Button ID="btnCancel" ValidationGroup="vg1" CssClass="btn btn-success" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
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
    <script type="text/javascript">

        function show() {
            document.getElementById('text1').style.visibility = 'visible';
        }

    </script>
</asp:Content>

