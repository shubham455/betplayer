<%@ Page Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="ScoreBoard.aspx.cs" Inherits="betplayer.admin.ScoreBoard" %>

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

                            <table>
                                <tr>
                                    <td style="font-size: large; font: 100" class="welcome">ScoreBoard</td>
                                    <td>
                                        <asp:TextBox ID="txtRun" CssClass="textbox" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtwicket" CssClass="textbox" runat="server" /></td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server" /></td>
                                </tr>
                            </table>

                            <table>
                                <tr>

                                    <td style="font-size: large; font: 100" class="welcome">Message</td>
                                    <td>
                                        <asp:TextBox ID="txtMessage" TextMode="MultiLine" Width="680px" CssClass="textbox" runat="server" /></td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Update" />

                                    </td>
                                </tr>
                            </table>
                            <div class="form-actions">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button2" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="Ball Start" Font-Size="Large" /></td>
                                        <td>
                                            <asp:Button ID="Button3" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="1" Font-Size="XX-Large" /></td>
                                        <td>
                                            <asp:Button ID="Button4" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="2" Font-Size="XX-Large" /></td>
                                        <td>
                                            <asp:Button ID="Button5" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="3" Font-Size="XX-Large" /></td>

                                        <td>
                                            <asp:Button ID="Button6" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="4" Font-Size="XX-Large" /></td>
                                        <td>
                                            <asp:Button ID="Button7" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="6" Font-Size="XX-Large" /></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="form-actions">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button8" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="Wide" Font-Size="Large" /></td>
                                        <td>
                                            <asp:Button ID="Button9" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="NoBall" Font-Size="Large" /></td>
                                        <td>
                                            <asp:Button ID="Button10" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="FreeHit" Font-Size="Large" /></td>
                                        <td>
                                            <asp:Button ID="Button11" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="wide+4" Font-Size="Large" /></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="form-actions">
                                <asp:Button ID="btnsave" runat="server" class="btn btn-success" Text="Add" />
                                <asp:Button ID="btncancel" runat="server" class="btn btn-success" Text="Cancel" OnClick="btncancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
