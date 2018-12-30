<%@ Page Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="UpdatedClientLimits.aspx.cs" Inherits="betplayer.admin.UpdatedClientLimits" %>

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
                    <h3 class="page-title">Updated Client Limits Details  </h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Master Details <span class="divider">&nbsp;</span> </li>
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
                            <h4><i class="icon-globe"></i>Updated Client Limits Details </h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">

                            <!-- BEGIN FORM-->

                            <div class="portlet-body">
                                <div class="clearfix">
                                </div>
                                <div class="space15"></div>

                            </div>

                            <table width="100%" border="0" align="left" cellpadding="0" cellspacing="2">
                                <tbody>
                                    <tr>
                                        <td width="25%" height="35"><strong>Clients</strong></td>
                                        <td width="25%"><strong>Date</strong></td>
                                        <td width="25%" rowspan="4" style="vertical-align: middle; text-align: left;">
                                            <div>
                                                <button name="btnShow" runat="server" id="btnShow" type="button" class="btn btn-success" onserverclick="btnShow_ServerClick">Show</button>

                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:DropDownList ID="dropdownclient" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Text="All Client" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>

                                        <td>
                                            <div class="controls" style="vertical-align: middle; text-align: left; padding-top: 0px;">
                                                <asp:TextBox runat="server" TextMode="Date" class=" m-ctrl-medium date-picker" size="16" name="BillDate" type="text" ID="BillDate" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BillDate" ErrorMessage="**"></asp:RequiredFieldValidator>

                                            </div>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>

                            <table width="100%" class="table table-striped table-hover table-bordered" id="MatchBet">
                                <tbody>
                                    <tr>

                                        <td height="25" align="left" class="TableHeading"><strong>Sr.</strong></td>
                                        <td height="25" align="left" class="TableHeading"><strong>Name</strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong>UpdatedBy</strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong>LastFixLimit</strong></td>
                                        <td align="left" class="TableHeading"><strong>LastCurrentLimit</strong></td>
                                        <td align="left" class="TableHeading"><strong>NewFixtLimi </strong></td>
                                        <td align="left" class="TableHeading"><strong>NewCurrentLimit</strong></td>
                                        <td align="left" class="TableHeading"><strong>Date Time</strong></td>
                                    </tr>
                                    <% int i = 1; %>
                                    <% foreach (System.Data.DataRow row in MatchDataTable.Rows)
                                        { %>
                                    <tr>


                                        <td height="25" align="left" class="TableHeading"><strong><%= i %></strong></td>
                                        <td height="25" align="left" class="TableHeading"><strong><%:row["Name"] %></strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong><%: row["UpdatedBy"] %></strong></td>
                                        <td style="text-align: right;" class="TableHeading"><strong><%: row["LastFixLimit"] %></strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["LastCurrentLimit"] %></strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["NewFixLimit"] %> </strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["NewCurrentLimit"] %></strong></td>
                                        <td align="left" class="TableHeading"><strong><%: row["DateTime"] %></strong></td>
                                    </tr>
                                    <%i++; %>
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
