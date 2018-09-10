<%@ Page Language="C#" MasterPageFile="~/superagent/DashBoard.Master" AutoEventWireup="true" CodeBehind="My_Ledger.aspx.cs" Inherits="betplayer.Super_Agent.My_Ledger" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
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
                    <h3 class="page-title">My Ledger
  <small></small></h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Ledger <span class="divider">&nbsp;</span> </li>
                        <li>My Ledger<span class="divider">&nbsp;</span></li>
                        <li><a href="Ledger.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN ADVANCED TABLE widget-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE widget-->
                    <div class="widget">
                        <div class="widget-title">
                            <h4><i class="icon-globe"></i>My Ledger</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">

                            <!-- BEGIN FORM-->
                            <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                                <tbody>
                                    <tr>
                                        <td width="4%" height="25"><strong>SNo.</strong></td>
                                        <td width="8%"><strong>Date</strong></td>
                                        <td width="15%"><strong>Collection Name</strong></td>
                                        <td width="9%" style="text-align: right;"><strong>Debit</strong></td>
                                        <td width="9%" style="text-align: right;"><strong>Credit</strong></td>
                                        <td width="9%" style="text-align: right;"><strong>Balance</strong></td>
                                        <td width="13%"><strong>Description</strong></td>
                                        <td width="13%"><strong>Remark</strong></td>
                                    </tr>
                                    <%if (!emptyLedgerTable)
                                        {
                                            int i = 1;
                                            foreach (System.Data.DataRow row in LedgerTableOrdered.Rows)
                                            { %>
                                    <tr bgcolor="#FFFFFF">
                                        <td height="20" class="FontText"><%= i %></td>
                                        <td class="FontText"><%: row["Date"] %></td>
                                        <td class="FontText"></td>
                                        <td style="text-align: right;" class="FontText"><%:row["Dabit"] %></td>
                                        <td style="text-align: right;" class="FontText"><%:row["Credit"] %></td>
                                        <td style="text-align: right;" class="FontText"><%:row["Balance"] %></td>
                                        <td class="FontText"><%:row["CollectionName"] %></td>
                                        <td class="FontText"><%:row["Remark"] %></td>
                                    </tr>
                                    <%i++; %>
                                    <% } //foreach 
                                        }
                                        else
                                        { %>
                                    <tr bgcolor="#FFFFFF">
                                        <td height="20" class="FontText"></td>
                                        <td class="FontText">NO</td>
                                        <td class="FontText">DATA</td>
                                        <td style="text-align: right;" class="FontText">FOUND</td>
                                        <td style="text-align: right;" class="FontText"></td>
                                        <td style="text-align: right;" class="FontText"></td>
                                        <td class="FontText"></td>
                                        <td class="FontText"></td>
                                    </tr>
                                    <% } //else %>
                                    <%if (!emptyLedgerTable)
                                        {
                                            foreach (System.Data.DataRow row in runTable1.Rows)
                                            { %>
                                    <tr>
                                        <td height="25">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td align="right"><strong>Total Amount</strong></td>
                                        <td align="right" style="text-align: right;"><strong><%: row["TotalDabitAmount"] %> </strong></td>
                                        <td align="right" style="text-align: right;"><strong><%: row["TotalcreditAmount"] %></strong></td>
                                        <td align="right" style="text-align: right;"><strong>
                                            <%:LedgerTableOrdered.Rows[LedgerTableOrdered.Rows.Count-1]["Balance"] %>
                                        </strong></td>
                                        <td align="right">&nbsp;</td>
                                        <td align="right">&nbsp;</td>
                                    </tr>
                                    <% } //foreach 
                                        }
                                        else
                                        { %>
                                    <tr>
                                        <td height="25">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td align="right"><strong>Total Amount</strong></td>
                                        <td align="right" style="text-align: right;"><strong>NO</strong></td>
                                        <td align="right" style="text-align: right;"><strong>DATA</strong></td>
                                        <td align="right" style="text-align: right;"><strong>FOUND</strong></td>
                                        <td align="right">&nbsp;</td>
                                        <td align="right">&nbsp;</td>
                                    </tr>
                                    <% } //else %>
                                </tbody>
                            </table>


                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE widget-->
                </div>
            </div>
            <!-- END ADVANCED TABLE widget-->
            <!-- END PAGE CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->
    </div>
</asp:Content>
