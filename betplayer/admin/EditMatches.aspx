<%@ Page Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="EditMatches.aspx.cs" Inherits="betplayer.admin.EditMatches" %>

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
                    <h3 class="page-title">Edit Matches</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        
                        <li><a href="ModifyMatches.aspx">Modify Matches</a><span class="divider">&nbsp;</span></li>
                       
                        <li><a href="ModifyMatches.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Edit Matches </h4>
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
                                                            <asp:TextBox ID="txtcode" CssClass="textbox" runat="server" ReadOnly="true"  />
                                                        </td>
                                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                                        <td width="2%" align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">TeamA</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtTeamA" CssClass="textbox"  runat="server" /></td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">TeamB</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtTeamB"  CssClass="textbox" runat="server" /></td>


                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Time</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtTime" CssClass="textbox" runat="server" /></td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">MatchType</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtMatchType" CssClass="textbox"  runat="server" /></td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="form-actions">
                                <asp:Button ID="btnsave" runat="server" class="btn btn-success" Text="Save" OnClick="submit_Click" />
                                <asp:Button ID="btncancel" runat="server" class="btn btn-success" Text="Cancel" OnClick="btncancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
