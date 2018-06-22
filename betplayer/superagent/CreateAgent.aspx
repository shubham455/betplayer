<%@ Page Language="C#" MasterPageFile="~/superagent/DashBoard.Master" AutoEventWireup="true" CodeBehind="CreateAgent.aspx.cs" Inherits="betplayer.Super_Agent.CreateAgent" %>

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
                                                            <asp:TextBox ID="txtcode" CssClass="textbox" runat="server" ReadOnly="true" />
                                                        </td>
                                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                                        <td width="2%" align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Name</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtname" CssClass="textbox" runat="server" /></td>
                                                        <td align="left" valign="middle"><strong>My Limit</strong></td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Agent Limit</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtagentlimit" CssClass="textbox" runat="server" /></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Rem Limit</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtRemlimit" CssClass="textbox" runat="server" value="-2100000" ReadOnly="true" TabIndex="-1" /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Contact No.</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtcontactno" CssClass="textbox" runat="server" /></td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">Password</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtpassword" CssClass="textbox" runat="server" /></td>
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
                                                            <asp:TextBox ID="txtmobAmount" CssClass="textbox" runat="server" /></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share %</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtmobAmount1" CssClass="textbox" runat="server" value="50.00" ReadOnly="true" TabIndex="-1" /></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>

                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mobile Share %</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtagentmobshare" CssClass="textbox" runat="server" Text="100.00" /></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mobile&nbsp;Share %</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtagentmobshare1" CssClass="textbox" runat="server" Text="100.00" ReadOnly="true" TabIndex="-1" /></td>
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
                                                            <asp:TextBox ID="txtmatchshare" CssClass="textbox" runat="server" /></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mobile Share %</td>
                                                        <td align="left" valign="middle">
                                                            <asp:TextBox ID="txtmobileshare" CssClass="textbox" runat="server" /></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;</td>
                                                        <td align="left" valign="middle">&nbsp;</td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="30" align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" colspan="2" align="left" class="welcome"><strong>Agent Commission On User</strong></td>
                                                        <td height="30" colspan="2" align="left" class="welcome"><strong>My Commission On User</strong></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission Type</td>
                                                        <td align="left" valign="middle">
                                                            <select runat="server"   name="SessionCommissionType" id="SessionCommissionType" onchange="MSCommission()">
                                                                <option value="Commission Type" selected="">Commission Type</option>
                                                                <option value="No Comm">No Comm</option>
                                                                <option value="Only On Minus">Only On Minus</option>
                                                                <option value="Bet By Bet">Bet By Bet</option>
                                                            </select></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission Type</td>
                                                        <td align="left" valign="middle">
                                                            <select name="SASessionCommissionType" id="SASessionCommissionType" onchange="MSCommission()" tabindex="-1">
                                                                <option value="Bet By Bet" selected="">Bet By Bet</option>
                                                            </select></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr id="divMatchCommission" style="visibility: ;">
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">
                                                            <span id="CommHeading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match Commission</span>
                                                        </td>
                                                        <td align="left">
                                                            <input runat="server" name="MatchCommission" type="text" class="textbox" id="MatchCommission" value=""></td>
                                                        <td height="30" align="left" valign="middle" class="welcome"><span id="CommHeading">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Match Commission</span></td>
                                                        <td align="left">
                                                            <input name="SAMatchCommission" type="text" class="textbox" id="SAMatchCommission" value="2.00" readonly="" tabindex="-1"></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>
                                                    <tr id="divSessionCommission" style="visibility: ;">
                                                        <td align="left" class="welcome">&nbsp;</td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                                                        <td align="left">
                                                            <input runat="server" name="SessionCommission" type="text" class="textbox" id="SessionCommission" value=""></td>
                                                        <td height="30" align="left" valign="middle" class="welcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Commission</td>
                                                        <td align="left">
                                                            <input name="SASessionCommission" type="text" class="textbox" id="SASessionCommission" value="2.50" readonly="" tabindex="-1"></td>
                                                        <td align="left">&nbsp;</td>
                                                    </tr>

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
