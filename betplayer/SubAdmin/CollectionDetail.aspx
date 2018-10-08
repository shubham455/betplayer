﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Dashboard.Master" CodeBehind="CollectionDetail.aspx.cs" Inherits="betplayer.admin.CollectionDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
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
                    <h3 class="page-title">Collection Details  <small>Display Collection Details</small> </h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Master Details <span class="divider">&nbsp;</span> </li>
                        <li>Collection Details<span class="divider">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Collection Details</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <!-- BEGIN FORM-->
                            <form name="BetPlayer" id="BetPlayer" method="post" autocomplete="off">

                                <div class="portlet-body">
                                    <div class="clearfix">

                                        <a href="NewCollection.aspx">
                                            <button class="btn btn-warning" type="button"><i class="icon-plus icon-white"></i>Create</button></a>
                                        <div class="btn-group">
                                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Change Status <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a href="javascript:ChangeStatusMultiple('Active');">Active</a></li>
                                                <li><a href="javascript:ChangeStatusMultiple('Inactive');">Inactive</a></li>
                                            </ul>
                                        </div>

                                    </div>
                                    <div class="space15"></div>

                                </div>
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
                                                    records per page</label></div>
                                        </div>
                                        <div class="span6">
                                            <div class="dataTables_filter" id="sample_1_filter">
                                                <label>Search:
                                                    <input type="text" aria-controls="sample_1" class="input-medium"></label></div>
                                        </div>
                                    </div>
                                    <table width="100%" class="table table-striped table-hover table-bordered dataTable" id="sample_1" aria-describedby="sample_1_info" style="width: 100%;">
                                        <thead>
                                            <tr role="row">
                                                <th width="2%" align="center" class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label=" " style="width: 24px;">
                                                    <div class="checker" id="uniform-undefined"><span>
                                                        <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" style="opacity: 0;"></span></div>
                                                </th>
                                                <th width="5%" align="left" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="&amp;nbsp;: activate to sort column ascending" style="width: 36px;">&nbsp;</th>
                                                <td height="25" align="left" class="TableHeading sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="SNo.: activate to sort column ascending" style="width: 63px;">SNo.</td>
                                                <td align="left" class="TableHeading sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Code: activate to sort column ascending" style="width: 68px;">Code</td>
                                                <td align="left" class="TableHeading sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Collection Name: activate to sort column ascending" style="width: 180px;">Collection Name</td>
                                                <td align="left" class="TableHeading sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Address : activate to sort column ascending" style="width: 96px;">Address </td>
                                                <td align="right" class="TableHeading sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Account No.: activate to sort column ascending" style="width: 137px;">Account No.</td>
                                                <td align="right" class="TableHeading sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Contact No.: activate to sort column ascending" style="width: 133px;">Contact No.</td>
                                                <td align="left" class="TableHeading sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Group : activate to sort column ascending" style="width: 78px;">Group </td>
                                                <td align="left" class="TableHeading sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 78px;">Status</td>
                                            </tr>
                                        </thead>
                                        <tbody role="alert" aria-live="polite" aria-relevant="all">
                                            <tr class="odd">
                                                <td valign="top" colspan="10" class="dataTables_empty">No data available in table</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="row-fluid">
                                        <div class="span6">
                                            <div class="dataTables_info" id="sample_1_info">Showing 0 to 0 of 0 entries</div>
                                        </div>
                                        <div class="span6">
                                            <div class="dataTables_paginate paging_bootstrap pagination">
                                                <ul>
                                                    <li class="prev disabled"><a href="#">← Prev</a></li>
                                                    <li class="next disabled"><a href="#">Next → </a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input name="From" type="hidden" id="From" value="0">
                                <input name="To" type="hidden" id="To" value="0">
                                <input name="FromID" type="hidden" id="FromID" value="">
                                <input name="DeleteChkMultiple" type="hidden" id="DeleteChkMultiple" value="">
                                <input name="NextChk" type="hidden" id="NextChk" value="">
                            </form>
                            <!-- END FORM-->

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


