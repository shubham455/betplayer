<%@ Page Language="C#" MasterPageFile="~/admin/DashBoard.Master" AutoEventWireup="true" CodeBehind="AllClientLedger.aspx.cs" Inherits="betplayer.admin.AllClientLedger" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
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
                    <h3 class="page-title">All Client Ledger</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Ledger <span class="divider">&nbsp;</span> </li>
                        <li>All Client Ledger<span class="divider">&nbsp;</span></li>
                        <li><a href="Ledger.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>All Client Ledger</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <!-- BEGIN FORM-->
                            
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td width="550">
                                                <table width="100%" border="0" cellspacing="2" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td width="49%" valign="top">
                                                                <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td height="25" colspan="5" align="center" valign="middle" style="text-align: center;"><strong>PAYMENT RECEIVING FROM (Lena He)</strong></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="20%" height="25" align="left" valign="middle"><strong>Client Name</strong></td>
                                                                            <td width="20%" align="right" valign="middle"><strong>Contact </strong></td>
                                                                            <td width="20%" align="right" valign="middle" style="text-align: right;"><strong>Open. Bal. </strong></td>
                                                                            <td width="20%" align="right" valign="middle" style="text-align: right;"><strong>Curr. Bal.</strong></td>
                                                                            <td width="20%" align="right" valign="middle" style="text-align: right;"><strong>Cls. Bal.</strong></td>
                                                                        </tr>
                                                                        <% foreach (System.Data.DataRow row in PaynmentReceiveTable.Rows)
                                                                                            { %>
                                                                        <tr bgcolor="#E9F3FD">
                                                                            <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText"><%:row["ClientName"] %></td>
                                                                            <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText"><%:row["ContactNo"] %></td>
                                                                            <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align: right;"><%:row["OpenBalance"] %></td>
                                                                            <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align: right;"><%:row["CurrentBalance"] %></td>
                                                                            <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align: right;"><%:row["CloseBalance"] %></td>
                                                                        </tr>
                                                                         <% } //foreach %>
                                                                       
                                                                      
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td width="2%" valign="top">&nbsp;</td>
                                                            <td width="49%" valign="top">
                                                                <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td height="25" colspan="5" align="center" valign="middle" style="text-align: center;"><strong>PAYMENT PAID  TO (Dena He)</strong></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="20%" height="25" align="left" valign="middle"><strong>Client Name</strong></td>
                                                                            <td width="20%" align="right" valign="middle"><strong>Contact </strong></td>
                                                                            <td width="20%" align="right" valign="middle" style="text-align: right;"><strong>Open. Bal. </strong></td>
                                                                            <td width="20%" align="right" valign="middle" style="text-align: right;"><strong>Curr. Bal.</strong></td>
                                                                            <td width="20%" align="right" valign="middle" style="text-align: right;"><strong>Cls. Bal.</strong></td>
                                                                        </tr>
                                                                         <% foreach (System.Data.DataRow row in PaynmentGiveTable.Rows)
                                                                                            { %>
                                                                        <tr bgcolor="#E9F3FD">
                                                                            <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText"><%:row["ClientName"] %></td>
                                                                            <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText"><%:row["ContactNo"] %></td>
                                                                            <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align: right;"><%:row["OpenBalance"] %></td>
                                                                            <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align: right;"><%:row["CurrentBalance"] %></td>
                                                                            <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align: right;"><%:row["CloseBalance"] %></td>
                                                                        </tr>
                                                                         <% } //foreach %>
                                                                        
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->
    </div>
</asp:Content>
