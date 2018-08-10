<%@ Page Language="C#"  MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="ModifyBets.aspx.cs" Inherits="betplayer.admin.ModifyBets" %>

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
                            <h4><i class="icon-globe"></i>Create New Agent</h4>
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
                                                        <td height="30" align="left" valign="middle" class="welcome">BetID</td>
                                                        <td align="left">
                                                            <asp:TextBox CssClass="textbox" ID="txtcode" runat="server" ReadOnly="true" /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Rate</td>
                                                        <td align="left">
                                                            <asp:TextBox CssClass="textbox" ID="txtRate" runat="server" /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Amount</td>
                                                        <td align="left">
                                                            <asp:TextBox runat="server" CssClass="textbox"  ID="txtAmount" /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Mode</td>
                                                        <td align="left">
                                                            <asp:TextBox runat="server" CssClass="textbox" ID="txtMode" /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Team</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox CssClass="textbox" ID="txtTeam" runat="server" /></td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Client</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox CssClass="textbox" ID="txtClient" runat="server" /></td>
                                                    </tr>

                                                    <tr>
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Position1</td>
                                                        <td align="left">
                                                            <asp:TextBox CssClass="textbox" ID="txtPosition1" runat="server"  /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Position2</td>
                                                        <td align="left">
                                                            <asp:TextBox CssClass="textbox" ID="txtposition2" runat="server"  /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">DateTime</td>
                                                        <td align="left">
                                                            <asp:TextBox CssClass="textbox" ID="txtDate" runat="server"  /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="form-actions">
                                <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" OnClick="btnUpdate_Click" Text="Save" />
                                <asp:Button ID="btnCancel" ValidationGroup="vg1" CssClass="btn btn-success" runat="server" OnClick="Button1_Click" Text="Cancel" />
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->
    </div>

</asp:Content>
