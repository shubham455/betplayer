<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="ClientDetails.aspx.cs" Inherits="betplayer.Agent.ClientDetails" %>



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
                    <h3 class="page-title">Client Details  <small>Display Client Details</small> </h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Master Details <span class="divider">&nbsp;</span> </li>
                        <li>Client Details<span class="divider">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Client Details</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <!-- BEGIN FORM-->
                           

                                <div class="portlet-body">
                                    <div class="clearfix">

                                        <a href="CreateClient.aspx">
                                            <button class="btn btn-warning" type="button"><i class="icon-plus icon-white"></i>Create</button></a>
                                        <div class="btn-group">
                                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Change Status <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a href="javascript:ChangeStatusMultiple('Active');">Active</a></li>
                                                <li><a href="javascript:ChangeStatusMultiple('Inactive');">Inactive</a></li>
                                            </ul>
                                        </div>
                                        <a href="ClientLimit.php">
                                            <button class="btn btn-success" type="button">Update Comm. &amp; Limit</button></a>

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
                                                    <asp:TextBox ID="txtsearch"  aria-controls="sample_1" CssClass="input-medium" runat="server" AutoPostBack="true" OnTextChanged="txtsearch_TextChanged"></asp:TextBox></label></div>
                                        </div>
                                    </div>
                                    <table width="100%" class="table table-striped table-hover table-bordered dataTable" id="sample_1" aria-describedby="sample_1_info" style="width: 100%;">
                                        <thead>
                                            <tr role="row">
                                                <th height="25" colspan="7" align="center" style="text-align: center; vertical-align: middle;" rowspan="1">Personal Details</th>
                                                <th colspan="3" align="center" valign="middle" style="text-align: center; vertical-align: middle;" rowspan="1">Agent Commission %</th>
                                                <th colspan="3" align="center" valign="middle" style="text-align: center; vertical-align: middle;" rowspan="1">Client Commission %</th>
                                                <th colspan="2" align="center" valign="middle" style="text-align: center; vertical-align: middle;" rowspan="1">Share %</th>
                                                <th colspan="2" align="center" style="text-align: center; vertical-align: middle;" rowspan="1">Other</th>
                                            </tr>

                                            <tr role="row">
                                                <th width="2%" align="center" class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label=" " style="width: 24px;">
                                                    <div class="checker" id="uniform-undefined"><span>
                                                        <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" style="opacity: 0;"></span></div>
                                                </th>
                                                <th width="5%" align="left" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="&amp;nbsp;: activate to sort column ascending" style="width: 36px;">&nbsp;</th>
                                                <th height="25" align="left" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="SNo.: activate to sort column ascending" style="width: 30px;">SNo.</th>
                                                <th align="left" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Code: activate to sort column ascending" style="width: 33px;">Code</th>
                                                <th align="left" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Name: activate to sort column ascending" style="width: 79px;">Name</th>
                                                <th width="60" align="left" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Contact: activate to sort column ascending" style="width: 73px;">Contact</th>
                                                <th width="60" align="left" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Password: activate to sort column ascending" style="width: 63px;">Password</th>
                                                <th align="right" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Type: activate to sort column ascending" style="width: 41px;">Type</th>
                                                <th align="right" style="text-align: right; width: 38px;" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Match: activate to sort column ascending">Match</th>
                                                <th align="right" style="text-align: right; width: 50px;" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Session: activate to sort column ascending">Session</th>
                                                <th align="right" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label=" Type: activate to sort column ascending" style="width: 40px;">Type</th>
                                                <th align="right" style="text-align: right; width: 38px;" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Match: activate to sort column ascending">Match</th>
                                                <th align="right" style="text-align: right; width: 50px;" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Session: activate to sort column ascending">Session</th>
                                                <th align="right" style="text-align: right; width: 37px;" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Agent: activate to sort column ascending">Agent</th>
                                                <th align="right" style="text-align: right; width: 37px;" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Client: activate to sort column ascending">Client</th>
                                                <th align="right" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Limit: activate to sort column ascending" style="width: 55px;">Limit</th>
                                                <th width="50" align="right" class="sorting" role="columnheader" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 50px;">Status</th>
                                            </tr><%=getStudentData()%>
                                        </thead>
                                        <tbody role="alert" aria-live="polite" aria-relevant="all">
                                          
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-2"><span>
                                                        <input type="checkbox" class="checkboxes" name="2" id="2" value="118" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=118"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=118"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('118','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('118');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">2</td>
                                                <td align="left" class="FontText ">C118</td>
                                                <td align="left" class="FontText ">118 Puran</td>
                                                <td align="left" class="FontText ">9628371118</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">30700.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-3"><span>
                                                        <input type="checkbox" class="checkboxes" name="3" id="3" value="130" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=130"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=130"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('130','Active');"><i class="icon-ban-circle"></i>
                                                                Active		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('130');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">3</td>
                                                <td align="left" class="FontText ">C130</td>
                                                <td align="left" class="FontText ">130 Ashad</td>
                                                <td align="left" class="FontText ">7317295256</td>
                                                <td align="left" class="FontText ">1122</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText ">Inactive</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-4"><span>
                                                        <input type="checkbox" class="checkboxes" name="4" id="4" value="131" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=131"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=131"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('131','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('131');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">4</td>
                                                <td align="left" class="FontText ">C131</td>
                                                <td align="left" class="FontText ">131 Sanjay</td>
                                                <td align="left" class="FontText ">9198660636</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-5"><span>
                                                        <input type="checkbox" class="checkboxes" name="5" id="5" value="132" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=132"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=132"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('132','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('132');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">5</td>
                                                <td align="left" class="FontText ">C132</td>
                                                <td align="left" class="FontText ">132 Satayam</td>
                                                <td align="left" class="FontText ">1</td>
                                                <td align="left" class="FontText ">122</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">90.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-6"><span>
                                                        <input type="checkbox" class="checkboxes" name="6" id="6" value="133" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=133"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=133"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('133','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('133');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">6</td>
                                                <td align="left" class="FontText ">C133</td>
                                                <td align="left" class="FontText ">133 Yash</td>
                                                <td align="left" class="FontText ">9889133578</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">7700.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-7"><span>
                                                        <input type="checkbox" class="checkboxes" name="7" id="7" value="134" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=134"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=134"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('134','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('134');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">7</td>
                                                <td align="left" class="FontText ">C134</td>
                                                <td align="left" class="FontText ">134 Tarik</td>
                                                <td align="left" class="FontText ">9554508331</td>
                                                <td align="left" class="FontText ">125</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">49100.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-8"><span>
                                                        <input type="checkbox" class="checkboxes" name="8" id="8" value="135" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=135"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=135"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('135','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('135');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">8</td>
                                                <td align="left" class="FontText ">C135</td>
                                                <td align="left" class="FontText ">135 Sanker</td>
                                                <td align="left" class="FontText ">8707454193</td>
                                                <td align="left" class="FontText ">1604</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50000.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-9"><span>
                                                        <input type="checkbox" class="checkboxes" name="9" id="9" value="136" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=136"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=136"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('136','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('136');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">9</td>
                                                <td align="left" class="FontText ">C136</td>
                                                <td align="left" class="FontText ">136 Rubi</td>
                                                <td align="left" class="FontText ">9415585806</td>
                                                <td align="left" class="FontText ">1234</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">20790.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-10"><span>
                                                        <input type="checkbox" class="checkboxes" name="10" id="10" value="137" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=137"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=137"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('137','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('137');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">10</td>
                                                <td align="left" class="FontText ">C137</td>
                                                <td align="left" class="FontText ">137 Dep</td>
                                                <td align="left" class="FontText ">8417055042</td>
                                                <td align="left" class="FontText ">150</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">16700.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-11"><span>
                                                        <input type="checkbox" class="checkboxes" name="11" id="11" value="138" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=138"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=138"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('138','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('138');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">11</td>
                                                <td align="left" class="FontText ">C138</td>
                                                <td align="left" class="FontText ">138 Shivam</td>
                                                <td align="left" class="FontText ">7052301397</td>
                                                <td align="left" class="FontText ">1112</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">3530.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-12"><span>
                                                        <input type="checkbox" class="checkboxes" name="12" id="12" value="139" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=139"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=139"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('139','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('139');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">12</td>
                                                <td align="left" class="FontText ">C139</td>
                                                <td align="left" class="FontText ">139 Sourabh</td>
                                                <td align="left" class="FontText ">8808106820</td>
                                                <td align="left" class="FontText ">2233</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">19900.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-13"><span>
                                                        <input type="checkbox" class="checkboxes" name="13" id="13" value="140" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=140"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=140"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('140','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('140');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">13</td>
                                                <td align="left" class="FontText ">C140</td>
                                                <td align="left" class="FontText ">140 Asif</td>
                                                <td align="left" class="FontText ">8707478308</td>
                                                <td align="left" class="FontText ">1133</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">25000.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-14"><span>
                                                        <input type="checkbox" class="checkboxes" name="14" id="14" value="141" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=141"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=141"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('141','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('141');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">14</td>
                                                <td align="left" class="FontText ">C141</td>
                                                <td align="left" class="FontText ">141 Vk</td>
                                                <td align="left" class="FontText ">9648835011</td>
                                                <td align="left" class="FontText ">haramkhor</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">1954.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-15"><span>
                                                        <input type="checkbox" class="checkboxes" name="15" id="15" value="142" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=142"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=142"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('142','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('142');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">15</td>
                                                <td align="left" class="FontText ">C142</td>
                                                <td align="left" class="FontText ">142 Nilesh</td>
                                                <td align="left" class="FontText ">9936209565</td>
                                                <td align="left" class="FontText ">1122</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">16500.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-16"><span>
                                                        <input type="checkbox" class="checkboxes" name="16" id="16" value="144" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=144"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=144"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('144','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('144');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">16</td>
                                                <td align="left" class="FontText ">C144</td>
                                                <td align="left" class="FontText ">144 Nafees</td>
                                                <td align="left" class="FontText ">7355963200</td>
                                                <td align="left" class="FontText ">7233</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">854.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-17"><span>
                                                        <input type="checkbox" class="checkboxes" name="17" id="17" value="145" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=145"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=145"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('145','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('145');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">17</td>
                                                <td align="left" class="FontText ">C145</td>
                                                <td align="left" class="FontText ">145 Nanna</td>
                                                <td align="left" class="FontText ">8577839280</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">400.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-18"><span>
                                                        <input type="checkbox" class="checkboxes" name="18" id="18" value="147" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=147"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=147"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('147','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('147');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">18</td>
                                                <td align="left" class="FontText ">C147</td>
                                                <td align="left" class="FontText ">147 Arif</td>
                                                <td align="left" class="FontText ">8726856269</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-19"><span>
                                                        <input type="checkbox" class="checkboxes" name="19" id="19" value="148" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=148"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=148"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('148','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('148');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">19</td>
                                                <td align="left" class="FontText ">C148</td>
                                                <td align="left" class="FontText ">148 Manja</td>
                                                <td align="left" class="FontText ">9311066704</td>
                                                <td align="left" class="FontText ">272911</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">39540.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-20"><span>
                                                        <input type="checkbox" class="checkboxes" name="20" id="20" value="149" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=149"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=149"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('149','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('149');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">20</td>
                                                <td align="left" class="FontText ">C149</td>
                                                <td align="left" class="FontText ">149 Sera</td>
                                                <td align="left" class="FontText ">8601917461</td>
                                                <td align="left" class="FontText ">1155</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">49900.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-21"><span>
                                                        <input type="checkbox" class="checkboxes" name="21" id="21" value="150" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=150"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=150"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('150','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('150');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">21</td>
                                                <td align="left" class="FontText ">C150</td>
                                                <td align="left" class="FontText ">150 Doctor</td>
                                                <td align="left" class="FontText ">9415949968</td>
                                                <td align="left" class="FontText ">5566</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">34550.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-22"><span>
                                                        <input type="checkbox" class="checkboxes" name="22" id="22" value="151" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=151"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=151"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('151','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('151');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">22</td>
                                                <td align="left" class="FontText ">C151</td>
                                                <td align="left" class="FontText ">151 Shiva Bpl</td>
                                                <td align="left" class="FontText ">7354849522</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">10800.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-23"><span>
                                                        <input type="checkbox" class="checkboxes" name="23" id="23" value="152" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=152"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=152"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('152','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('152');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">23</td>
                                                <td align="left" class="FontText ">C152</td>
                                                <td align="left" class="FontText ">152 Vijay</td>
                                                <td align="left" class="FontText ">9956388127</td>
                                                <td align="left" class="FontText ">5566</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">20360.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-24"><span>
                                                        <input type="checkbox" class="checkboxes" name="24" id="24" value="153" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=153"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=153"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('153','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('153');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">24</td>
                                                <td align="left" class="FontText ">C153</td>
                                                <td align="left" class="FontText ">153 Ram ji</td>
                                                <td align="left" class="FontText ">8115809865</td>
                                                <td align="left" class="FontText ">1166</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">25000.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-25"><span>
                                                        <input type="checkbox" class="checkboxes" name="25" id="25" value="158" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=158"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=158"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('158','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('158');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">25</td>
                                                <td align="left" class="FontText ">C158</td>
                                                <td align="left" class="FontText ">158 Anku</td>
                                                <td align="left" class="FontText ">9936874869</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">13000.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-26"><span>
                                                        <input type="checkbox" class="checkboxes" name="26" id="26" value="161" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=161"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=161"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('161','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('161');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">26</td>
                                                <td align="left" class="FontText ">C161</td>
                                                <td align="left" class="FontText ">161 Munna</td>
                                                <td align="left" class="FontText ">9140883625</td>
                                                <td align="left" class="FontText ">1244</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">250.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-27"><span>
                                                        <input type="checkbox" class="checkboxes" name="27" id="27" value="162" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=162"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=162"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('162','Active');"><i class="icon-ban-circle"></i>
                                                                Active		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('162');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">27</td>
                                                <td align="left" class="FontText ">C162</td>
                                                <td align="left" class="FontText ">162 Upendra</td>
                                                <td align="left" class="FontText ">7985460897</td>
                                                <td align="left" class="FontText ">1133</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText ">Inactive</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-28"><span>
                                                        <input type="checkbox" class="checkboxes" name="28" id="28" value="171" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=171"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=171"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('171','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('171');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">28</td>
                                                <td align="left" class="FontText ">C171</td>
                                                <td align="left" class="FontText ">171 14 G</td>
                                                <td align="left" class="FontText ">6394515032</td>
                                                <td align="left" class="FontText ">0822</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">33120.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-29"><span>
                                                        <input type="checkbox" class="checkboxes" name="29" id="29" value="172" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=172"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=172"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('172','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('172');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">29</td>
                                                <td align="left" class="FontText ">C172</td>
                                                <td align="left" class="FontText ">172 Appi</td>
                                                <td align="left" class="FontText ">7985460897</td>
                                                <td align="left" class="FontText ">1234</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">18200.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-30"><span>
                                                        <input type="checkbox" class="checkboxes" name="30" id="30" value="173" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=173"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=173"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('173','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('173');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">30</td>
                                                <td align="left" class="FontText ">C173</td>
                                                <td align="left" class="FontText ">173 Yasin</td>
                                                <td align="left" class="FontText ">9889133281</td>
                                                <td align="left" class="FontText ">1144</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">80.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-31"><span>
                                                        <input type="checkbox" class="checkboxes" name="31" id="31" value="174" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=174"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=174"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('174','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('174');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">31</td>
                                                <td align="left" class="FontText ">C174</td>
                                                <td align="left" class="FontText ">174 Jk</td>
                                                <td align="left" class="FontText ">9794381594</td>
                                                <td align="left" class="FontText ">0786</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50000.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-32"><span>
                                                        <input type="checkbox" class="checkboxes" name="32" id="32" value="175" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=175"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=175"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('175','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('175');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">32</td>
                                                <td align="left" class="FontText ">C175</td>
                                                <td align="left" class="FontText ">175 Endra Sahu</td>
                                                <td align="left" class="FontText ">9889133281</td>
                                                <td align="left" class="FontText ">2025</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">29400.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-33"><span>
                                                        <input type="checkbox" class="checkboxes" name="33" id="33" value="177" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=177"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=177"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('177','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('177');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">33</td>
                                                <td align="left" class="FontText ">C177</td>
                                                <td align="left" class="FontText ">177 Anil</td>
                                                <td align="left" class="FontText ">8577839280 </td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-34"><span>
                                                        <input type="checkbox" class="checkboxes" name="34" id="34" value="187" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=187"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=187"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('187','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('187');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">34</td>
                                                <td align="left" class="FontText ">C187</td>
                                                <td align="left" class="FontText ">187 Manish chatarpur</td>
                                                <td align="left" class="FontText ">9131168865</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">9900.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-35"><span>
                                                        <input type="checkbox" class="checkboxes" name="35" id="35" value="188" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=188"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=188"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('188','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('188');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">35</td>
                                                <td align="left" class="FontText ">C188</td>
                                                <td align="left" class="FontText ">188 Radhe Radhe</td>
                                                <td align="left" class="FontText ">9838880181</td>
                                                <td align="left" class="FontText ">imkrishna</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">400.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-36"><span>
                                                        <input type="checkbox" class="checkboxes" name="36" id="36" value="191" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=191"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=191"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('191','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('191');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">36</td>
                                                <td align="left" class="FontText ">C191</td>
                                                <td align="left" class="FontText ">191 Sultan</td>
                                                <td align="left" class="FontText ">7000746480</td>
                                                <td align="left" class="FontText ">825292</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">100.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-37"><span>
                                                        <input type="checkbox" class="checkboxes" name="37" id="37" value="193" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=193"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=193"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('193','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('193');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">37</td>
                                                <td align="left" class="FontText ">C193</td>
                                                <td align="left" class="FontText ">193 Kissu</td>
                                                <td align="left" class="FontText ">9616367433</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">120.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-38"><span>
                                                        <input type="checkbox" class="checkboxes" name="38" id="38" value="197" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=197"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=197"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('197','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('197');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">38</td>
                                                <td align="left" class="FontText ">C197</td>
                                                <td align="left" class="FontText ">197 Manoj mc</td>
                                                <td align="left" class="FontText ">9993614204</td>
                                                <td align="left" class="FontText ">000</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">300.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-39"><span>
                                                        <input type="checkbox" class="checkboxes" name="39" id="39" value="199" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=199"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=199"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('199','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('199');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">39</td>
                                                <td align="left" class="FontText ">C199</td>
                                                <td align="left" class="FontText ">199 Mradul</td>
                                                <td align="left" class="FontText ">7887021230</td>
                                                <td align="left" class="FontText ">2233</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-40"><span>
                                                        <input type="checkbox" class="checkboxes" name="40" id="40" value="201" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=201"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=201"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('201','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('201');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">40</td>
                                                <td align="left" class="FontText ">C201</td>
                                                <td align="left" class="FontText ">201 kalas</td>
                                                <td align="left" class="FontText ">9598515342</td>
                                                <td align="left" class="FontText ">1313</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">6350.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-41"><span>
                                                        <input type="checkbox" class="checkboxes" name="41" id="41" value="204" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=204"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=204"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('204','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('204');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">41</td>
                                                <td align="left" class="FontText ">C204</td>
                                                <td align="left" class="FontText ">204 Bhasker</td>
                                                <td align="left" class="FontText ">8279980498</td>
                                                <td align="left" class="FontText ">9001</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2470.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-42"><span>
                                                        <input type="checkbox" class="checkboxes" name="42" id="42" value="207" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=207"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=207"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('207','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('207');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">42</td>
                                                <td align="left" class="FontText ">C207</td>
                                                <td align="left" class="FontText ">207 Jay</td>
                                                <td align="left" class="FontText ">9229225222</td>
                                                <td align="left" class="FontText ">098</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">1000.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-43"><span>
                                                        <input type="checkbox" class="checkboxes" name="43" id="43" value="215" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=215"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=215"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('215','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('215');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">43</td>
                                                <td align="left" class="FontText ">C215</td>
                                                <td align="left" class="FontText ">215 Dau</td>
                                                <td align="left" class="FontText ">9795034525</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">16280.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-44"><span>
                                                        <input type="checkbox" class="checkboxes" name="44" id="44" value="218" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=218"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=218"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('218','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('218');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">44</td>
                                                <td align="left" class="FontText ">C218</td>
                                                <td align="left" class="FontText ">218 Baba</td>
                                                <td align="left" class="FontText ">7309968539</td>
                                                <td align="left" class="FontText ">0786</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">9900.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-45"><span>
                                                        <input type="checkbox" class="checkboxes" name="45" id="45" value="219" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=219"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=219"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('219','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('219');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">45</td>
                                                <td align="left" class="FontText ">C219</td>
                                                <td align="left" class="FontText ">219 Jackpot</td>
                                                <td align="left" class="FontText ">9598788208</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">30000.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-46"><span>
                                                        <input type="checkbox" class="checkboxes" name="46" id="46" value="220" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=220"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=220"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('220','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('220');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">46</td>
                                                <td align="left" class="FontText ">C220</td>
                                                <td align="left" class="FontText ">220 Shivam</td>
                                                <td align="left" class="FontText ">8319058205</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">9600.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-47"><span>
                                                        <input type="checkbox" class="checkboxes" name="47" id="47" value="221" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=221"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=221"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('221','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('221');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">47</td>
                                                <td align="left" class="FontText ">C221</td>
                                                <td align="left" class="FontText ">221 Sumit</td>
                                                <td align="left" class="FontText ">8418994032</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">65750.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-48"><span>
                                                        <input type="checkbox" class="checkboxes" name="48" id="48" value="222" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=222"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=222"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('222','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('222');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">48</td>
                                                <td align="left" class="FontText ">C222</td>
                                                <td align="left" class="FontText ">222 Lal singh</td>
                                                <td align="left" class="FontText ">9794746339</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">30000.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="odd">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-49"><span>
                                                        <input type="checkbox" class="checkboxes" name="49" id="49" value="223" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=223"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=223"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('223','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('223');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">49</td>
                                                <td align="left" class="FontText ">C223</td>
                                                <td align="left" class="FontText ">223 Devendra</td>
                                                <td align="left" class="FontText ">7084569776</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50000.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                            <tr bgcolor="#FFFFFF" class="even">
                                                <td align="center" class="  sorting_1">
                                                    <div class="checker" id="uniform-50"><span>
                                                        <input type="checkbox" class="checkboxes" name="50" id="50" value="234" style="opacity: 0;"></span></div>
                                                </td>
                                                <td align="left" class=" ">
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="ClientDetailsModify.php?id=234"><i class="icon-pencil"></i>Edit</a></li>
                                                            <li><a href="ClientDetailsDelete.php?id=234"><i class="icon-trash"></i>Delete</a></li>
                                                            <li><a href="javascript:ChangeStatus('234','Inactive');"><i class="icon-ban-circle"></i>
                                                                Inactive		                      </a></li>
                                                            <li><a href="javascript:SendLoginDetails('234');"><i class="icon-film"></i>Send Mobile Login Details</a></li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td height="20" align="left" class="FontText ">50</td>
                                                <td align="left" class="FontText ">C234</td>
                                                <td align="left" class="FontText ">234 Mahakal</td>
                                                <td align="left" class="FontText ">7839909949</td>
                                                <td align="left" class="FontText ">123</td>
                                                <td align="right" class="FontText ">Bet By Bet</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">2.50</td>
                                                <td align="right" class="FontText ">No Comm</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">50.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText " style="text-align: right;">0.00</td>
                                                <td align="right" class="FontText ">Active</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="row-fluid">
                                        <div class="span6">
                                            <div class="dataTables_info" id="sample_1_info">Showing 1 to 50 of 50 entries</div>
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
                                <input name="ID" type="hidden" id="ID" readonly="">
                                <input name="Status" type="hidden" id="Status" readonly="">
                                <input name="StatusMultiple" type="hidden" id="StatusMultiple" readonly="">
                                <input name="ModifyStatusChk" type="hidden" id="ModifyStatusChk" readonly="">
                                <input name="ModifyStatusMultipleChk" type="hidden" id="ModifyStatusMultipleChk" readonly="">
                                <input name="TotalRecords" type="hidden" id="TotalRecords" value="">
                                <input name="AutoNo" type="hidden" id="AutoNo" value="">
                                <input name="GaddiChk" type="hidden" id="GaddiChk" value="">
                                <input name="LoginChk" type="hidden" id="LoginChk" value="">
                          
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
                                                </label>
</asp:Content>

