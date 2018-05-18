<%@ Page Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="ScoreBoard.aspx.cs" Inherits="betplayer.admin.ScoreBoard" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="main-content">
        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span12">

                    <div id="theme-change" class="hidden-phone"><i class="icon-cogs"></i><span class="settings"><span class="text">Theme:</span> <span class="colors"><span class="color-default" data-style="default"></span><span class="color-gray" data-style="gray"></span><span class="color-purple" data-style="purple"></span><span class="color-navy-blue" data-style="navy-blue"></span></span></span></div>

                    <h3 class="page-title">Add Match</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>

                        <li><a href="#">Add Match</a><span class="divider">&nbsp;</span></li>

                        <li><a href="CreateMatch.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <div class="widget">
                        <div class="widget-title">
                            <h4><i class="icon-globe"></i>Add Match</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">

                            <table>
                                <tbody>
                                    <tr>
                                       
                                        <td>
                                            <asp:CheckBox ID="CheckAutomatic"  AutoPostBack="true" runat="server" Text="Automatic" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckManual"   AutoPostBack="true" runat="server" Text="Manual" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <br />
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="font-size: large; font: 100">ScoreBoard</td>
                                        <td>
                                            <asp:TextBox ID="txtrun" runat="server" placeholer="Run" OnTextChanged="txtrun_TextChanged" AutoPostBack="true" /></td>
                                        <td>
                                            <asp:TextBox ID="txtwicket" runat="server" placeholer="Wicket" OnTextChanged="txtwicket_TextChanged" AutoPostBack="true" /></td>
                                        <td>
                                            <asp:TextBox ID="txtover" CssClass="textbox" runat="server" placeholer="over" OnTextChanged="txtover_TextChanged" AutoPostBack="true" /></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table>
                                <tbody>
                                    <tr>


                                        <td style="font-size: large; font: 100" width="10%" height="30" align="left" valign="middle" class="welcome">Message</td>
                                        <td>
                                            <asp:TextBox ID="txtmessage" Width="620px" TextMode="MultiLine" CssClass="textbox" runat="server" />
                                        </td>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="btnmessage" runat="server" class="btn btn-success" Text="Update" />

                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="form-actions">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnballstart" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="Ball Start" Font-Size="Large" OnClick="btnballstart_Click" /></td>
                                        <td>
                                            <asp:Button ID="btn1" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="1" Font-Size="XX-Large" OnClick="btn1_Click" /></td>
                                        <td>
                                            <asp:Button ID="btn2" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="2" Font-Size="XX-Large" /></td>
                                        <td>
                                            <asp:Button ID="btn3" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="3" Font-Size="XX-Large" /></td>

                                        <td>
                                            <asp:Button ID="btn4" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="4" Font-Size="XX-Large" /></td>
                                        <td>
                                            <asp:Button ID="btn6" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="6" Font-Size="XX-Large" /></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="form-actions">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnwide" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="Wide" Font-Size="Large" /></td>
                                        <td>
                                            <asp:Button ID="btnnoball" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="NoBall" Font-Size="Large" /></td>
                                        <td>
                                            <asp:Button ID="btnfreehit" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="FreeHit" Font-Size="Large" /></td>
                                        <td>
                                            <asp:Button ID="btnwide4" runat="server" class="btn btn-success" Width="100px" Height="50px" Text="wide+4" Font-Size="Large" /></td>
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
