<%@ Page Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="MatchRates.aspx.cs" Inherits="betplayer.admin.MatchRates" %>

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
                    <h3 class="page-title">Add Match</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>

                        <li><a href="#">Add Match</a><span class="divider">&nbsp;</span></li>

                        <li><a href="CreateMatch.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Add Match</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td style="font-size: large; font: 100" width="10%" height="30" align="left" valign="middle" class="welcome">
                                            <asp:Label ID="lblTeamA" runat="server"></asp:Label></td>
                                        <td width="14%" align="left" valign="middle">
                                            <asp:TextBox ID="txtcode" CssClass="textbox" runat="server" />
                                        </td>
                                        <td width="14%" align="left" valign="middle">
                                            <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server" />
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="14%" align="left" valign="middle">
                                            <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Update" />
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>
                                


                           
                               
                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td style="font-size: large; font: 100" width="10%" height="30" align="left" valign="middle" class="welcome">
                                            <asp:Label ID="lblTeamB" runat="server"></asp:Label></td>
                                        <td width="14%" align="left" valign="middle">
                                            <asp:TextBox ID="TextBox2" CssClass="textbox" runat="server" />
                                        </td>
                                        <td width="14%" align="left" valign="middle">
                                            <asp:TextBox ID="TextBox3" CssClass="textbox" runat="server" />
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="14%" align="left" valign="middle">
                                            <asp:Button ID="Button2" runat="server" class="btn btn-success" Text="Update" />
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>


                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
