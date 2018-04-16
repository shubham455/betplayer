<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Dashboard.Master" CodeBehind="CreateSuperAgent.aspx.cs" Inherits="betplayer.admin.CreateAgent" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="main-content">
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN THEME CUSTOMIZER-->
                    <div id="theme-change" class="hidden-phone"><i class="icon-cogs"></i><span class="settings"><span class="text">Theme:</span> <span class="colors"><span class="color-default" data-style="default"></span><span class="color-gray" data-style="gray"></span><span class="color-purple" data-style="purple"></span><span class="color-navy-blue" data-style="navy-blue"></span></span></span></div>
                    <!-- END THEME CUSTOMIZER-->
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">Create New Agent</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Master Details <span class="divider">&nbsp;</span> </li>
                        <li><a href="AgentDetails.php">Agent Details</a><span class="divider">&nbsp;</span></li>
                        <li>Create New Agent<span class="divider">&nbsp;</span></li>
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
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td width="2%" class="welcome">&nbsp;</td>
                                                            <td width="24%" height="30" align="left" valign="middle" class="welcome">Code</td>
                                                            <td width="24%" align="left" valign="middle">
                                                                <asp:TextBox id="txtcode" CssClass ="textbox" runat="server" ReadOnly="true"/>
                                                            </td>
                                                            <td width="24%" align="left" valign="middle">&nbsp;</td>
                                                            <td width="24%" align="left" valign="middle">&nbsp;</td>
                                                            <td width="2%" align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Name</td>
                                                            <td align="left" valign="middle">
                                                                 <asp:TextBox id="txtname" CssClass ="textbox" runat="server"/></td>
                                                            <td align="left" valign="middle"><strong>My Limit</strong></td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Agent Limit</td>
                                                            <td align="left" valign="middle">
                                                                 <asp:TextBox id="txtagentlimit" CssClass ="textbox" runat="server"/></td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Rem Limit</td>
                                                            <td align="left" valign="middle">
                                                               <asp:TextBox id="txtRemlimit" CssClass ="textbox" runat="server" value="-2100000" readonly="true" tabindex="-1"/></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Contact No.</td>
                                                            <td align="left" valign="middle">
                                                                <asp:TextBox id="txtcontactno" CssClass ="textbox" runat="server"/></td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">Password</td>
                                                            <td align="left" valign="middle">
                                                               <asp:TextBox id="txtpassword" CssClass ="textbox" runat="server"/></td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                            <td height="30" colspan="2" align="left" valign="middle" class="welcome"><strong>My  Share (Your Share and Agent Share Can't Greater than
                                                          )</strong></td>
                                                            <td height="30" align="left" class="welcome"><strong>My  Share Given By Admin</strong></td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share %</td>
                                                            <td align="left" valign="middle">
                                                                <asp:TextBox id="txtmyshare" CssClass ="textbox" runat="server"/></td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share %</td>
                                                            <td align="left" valign="middle">
                                                                <asp:TextBox id="txtagentshare" CssClass ="textbox" runat="server" value="50.00" readonly="true" tabindex="-1"/></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td height="30" align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mobile Share %</td>
                                                            <td align="left" valign="middle">
                                                                <asp:TextBox id="txtmymobshare" CssClass ="textbox" runat="server" Text="100.00"/></td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mobile&nbsp;Share %</td>
                                                            <td align="left" valign="middle">
                                                               <asp:TextBox id="txtagentmobshare" CssClass ="textbox" runat="server" Text="100.00" readonly="true" tabindex="-1"/></td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" class="welcome"><strong>Agent Share </strong></td>
                                                            <td align="left">&nbsp;</td>
                                                            <td height="30" align="left" class="welcome">&nbsp;</td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share %</td>
                                                            <td align="left">
                                                                <asp:TextBox id="txtmatchshare" CssClass ="textbox" runat="server"/></td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;</td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" align="left" class="welcome">&nbsp;</td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mobile Share %</td>
                                                            <td align="left" valign="middle">
                                                               <asp:TextBox id="txtmobileshare" CssClass ="textbox" runat="server"/></td>
                                                            <td height="30" align="left" valign="middle" class="welcome">&nbsp;</td>
                                                            <td align="left" valign="middle">&nbsp;</td>
                                                            <td align="left">&nbsp;</td>
                                                        </tr>
                                                       
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="form-actions">
                                    <asp:Button ID="btnsave" runat="server" class="btn btn-success" Text="Save"  />
                                   <asp:Button ID="btncancel" runat="server" class="btn btn-success" Text="Cancel"/>
                                </div>

                               
                            </>
                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
    </div>
</asp:Content>
