<%@ Page Language="C#" MasterPageFile="~/PowerUser/Dashboard.Master" AutoEventWireup="true" CodeBehind="AddMatchManually.aspx.cs" Inherits="betplayer.poweruser.AddMatchManually" %>

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

                        <li><a href="#"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                                                            <asp:TextBox ID="txtcode" CssClass="textbox" ReadOnly="true" runat="server" />
                                                        </td>
                                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                                        <td width="2%" align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">TeamA</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtTeamA" CssClass="textbox" runat="server" /></td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">TeamB</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtTeamB" CssClass="textbox" runat="server" /></td>


                                                    </tr>
                                                    
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Time</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtTime" CssClass="textbox" placeholder="HH:MM" runat="server" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vg" runat="server" ControlToValidate="txtTime" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTime" ErrorMessage="Please Give Time HH:MM Format" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$"></asp:RegularExpressionValidator>
                                                        </td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Date</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtdate1" CssClass="textbox" placeholder="yyyy-MM-dd" runat="server" />
                                                            <asp:RequiredFieldValidator ID="required1" runat="server" ValidationGroup="vg" ControlToValidate="txtdate1" ErrorMessage="**"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="regularexpression1"  runat="server" ControlToValidate="txtdate1" ErrorMessage="Please Give Date yyyy-MM-dd Format" ValidationExpression="((([0-9][0-9][0-9][1-9])|([1-9][0-9][0-9][0-9])|([0-9][1-9][0-9][0-9])|([0-9][0-9][1-9][0-9]))-((0[13578])|(1[02]))-((0[1-9])|([12][0-9])|(3[01])))|((([0-9][0-9][0-9][1-9])|([1-9][0-9][0-9][0-9])|([0-9][1-9][0-9][0-9])|([0-9][0-9][1-9][0-9]))-((0[469])|11)-((0[1-9])|([12][0-9])|(30)))|(((000[48])|([0-9]0-9)|([0-9][1-9][02468][048])|([1-9][0-9][02468][048]))-02-((0[1-9])|([12][0-9])))|((([0-9][0-9][0-9][1-9])|([1-9][0-9][0-9][0-9])|([0-9][1-9][0-9][0-9])|([0-9][0-9][1-9][0-9]))-02-((0[1-9])|([1][0-9])|([2][0-8])))"></asp:RegularExpressionValidator>
                                                        </td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">MatchType</td>
                                                        <td align="left" valign="middle">
                                                            <asp:DropDownList ID="DropdownMatchesType" runat="server" AppendDataBoundItems="true">
                                                                <asp:ListItem Text="Select Match Type" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="ODI" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Test" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="T20" Value="3"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="required2" ValidationGroup="vg" runat="server" ErrorMessage="**" ControlToValidate="DropdownMatchesType" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </td>
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
                                <asp:Button ID="btnsave" runat="server" ValidationGroup="vg" class="btn btn-success" Text="Add" OnClick="btnsave_Click" />
                                <asp:Button ID="btncancel" runat="server" class="btn btn-success" Text="Cancel" OnClick="btncancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
