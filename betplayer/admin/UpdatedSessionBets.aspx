<%@ Page Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="UpdatedSessionBets.aspx.cs" Inherits="betplayer.admin.UpdatedSessionBets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="main-content">
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN THEME CUSTOMIZER-->
                    <div id="theme-change" class="hidden-phone"><i class="icon-cogs"></i><span class="settings"><span class="text">Theme:</span> <span class="colors"><span class="color-default" data-style="default"></span><span class="color-gray" data-style="gray"></span><span class="color-purple" data-style="purple"></span><span class="color-navy-blue" data-style="navy-blue"></span></span></span></div>
                    <!-- END THEME CUSTOMIZER-->
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">Agent Details  <small>Create, Modify, Delete and Display Agent Details</small> </h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Master Details <span class="divider">&nbsp;</span> </li>
                        <li>Agent Details<span class="divider">&nbsp;</span></li>
                        <li><a href="MasterDetails.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Agent Details</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <!-- BEGIN FORM-->

                            

                            <div id="sample_1_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row-fluid">
                                    <div class="span6">
                                        <div id="sample_1_length" class="dataTables_length">
                                            <label>
                                                <select size="1" name="sample_1_length" aria-controls="sample_1" class="input-mini">
                                                    <option value="100" selected="selected">100</option>
                                                    <option value="500">500</option>
                                                    <option value="1000">1000</option>
                                                    <option value="All">All</option>
                                                </select>
                                                records per page</label>
                                        </div>
                                    </div>
                                    <div class="span6">
                                        <div class="dataTables_filter" id="sample_1_filter">
                                            <label>
                                                Search:
                                                <asp:TextBox ID="txtsearch" runat="server" aria-controls="sample_1" class="input-medium" AutoPostBack="true" /></label>
                                        </div>
                                    </div>
                                </div>
                               <table width="100%" class="table table-striped table-hover table-bordered" id="MatchBet">
                                <tbody>
                                    <tr>
                                        
                                        <td height="25" align="left" class="TableHeading"><strong>Sr.</strong></td>
                                        <td height="25" align="left" class="TableHeading"><strong>Session</strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong>Rate</strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong>Amount</strong></td>
                                        <td align="left" class="TableHeading"><strong>Mode</strong></td>
                                        <td align="left" class="TableHeading"><strong>Team </strong></td>
                                        <td align="left" class="TableHeading"><strong>Date &amp; Time</strong></td>
                                        <td align="left" class="TableHeading"><strong>Remark</strong></td>
                                    </tr>
                                    <% foreach (System.Data.DataRow row in MatchDataTable.Rows)
                                        { %>
                                    <tr>
                                       
                                        
                                        <td height="25" align="left" class="TableHeading"><strong><%: row["UpdateSessionBetsID"] %></strong></td>
                                        <td height="25" align="left" class="TableHeading"><strong><%: row["Session"] %></strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong><%: row["rate"] %></strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong><%: row["Amount"] %></strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["Mode"] %></strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["Team"] %> </strong></td>

                                        <td align="left" class="TableHeading"><strong><%: row["Datetime"] %></strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["Remark"] %></strong></td>
                                    </tr>
                                    <% } //foreach %>
                                </tbody>
                                
                            </table>
                             <div class="row-fluid">
                                    <div class="span6">
                                        <div class="dataTables_info" id="sample_1_info">Showing 1 to 6 of 6 entries</div>
                                    </div>
                                    <div class="span6">
                                        <div class="dataTables_paginate paging_bootstrap pagination">
                                            <ul>
                                                <li class="prev disabled"><a href="#">← Prev</a></li>
                                                <li class="active"><a href="#">1</a></li>
                                                <li class="next disabled"><a href="#">Next → </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE widget-->
                </div>
            </div>
            <!-- END ADVANCED TABLE widget-->
            <!-- END PAGE CONTENT-->
        </div>
    </div>
    
</asp:Content>
