<%@ Page Language="C#" MasterPageFile="~/SubAdmin/Dashboard.Master" AutoEventWireup="true" CodeBehind="MatchSessionplusminusDisplay.aspx.cs" Inherits="betplayer.SubAdmin.MatchSessionplusminusDisplay" %>

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
                    <h3 class="page-title">Match &amp; Session Plus Minus Report<small></small></h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Sport's Betting <span class="divider">&nbsp;</span> </li>
                        <li>Match &amp; Session Plus Minus Report<span class="divider">&nbsp;</span></li>
                        <li><a href="MatchSessionPlusMinusSelect.php?MT=381"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                        <div class="widget-body form">

                            <!-- BEGIN FORM-->

                            <div class="portlet-body">
                                <div class="clearfix">
                                </div>
                                <table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
                                    <tbody>
                                        <tr>
                                            <td width="11%" height="25" align="left" valign="middle"><strong>ADMIN</strong></td>
                                            <td width="89%" align="left" valign="middle"><strong><%: admin.name %></strong></td>
                                        </tr>

                                        <tr>
                                            <td height="25" colspan="2" align="left" valign="middle">
                                                <%foreach (betplayer.SubAdmin.Superstockist SuperStockist in admin.SuperstockistsData)
                                                    { %>
                                                <table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" class="table table-striped table-bordered" style="margin-bottom: 10px !important;">
                                                    <tbody>
                                                        <tr>
                                                            <td width="7%" height="25" align="left" valign="middle"><strong>SUPERSTOCKIST</strong></td>
                                                            <td width="93%" align="left" valign="middle"><strong><%:SuperStockist.name %> </strong></td>
                                                        </tr>

                                                        <tr>
                                                            <td height="25" colspan="2" align="left" valign="middle">


                                                                <%foreach (betplayer.SubAdmin.Superagent SuperAgent in SuperStockist.SuperAgentsData)
                                                                    { %>
                                                                <table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" class="table table-striped table-bordered" style="margin-bottom: 10px !important;">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td width="7%" height="25" align="left" valign="middle"><strong>SUPERAGENT</strong></td>
                                                                            <td width="93%" align="left" valign="middle"><strong><%:SuperAgent.name %>   </strong></td>
                                                                        </tr>

                                                                        <%foreach (betplayer.SubAdmin.Agent agent in SuperAgent.AgentsData)
                                                                            { %>
                                                                        <tr>
                                                                            <td height="25" colspan="2" align="left" valign="middle">
                                                                                <table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" class="table table-striped table-bordered" style="margin-bottom: 10px !important;">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td width="7%" height="25" align="left" valign="middle"><strong>AGENT</strong></td>
                                                                                            <td width="93%" align="left" valign="middle"><strong><%:agent.name %>   </strong></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="25" colspan="2" align="left" valign="middle">

                                                                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" class="table table-striped table-bordered" style="padding-bottom: 100px;">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td height="25" align="left" valign="middle">&nbsp;</td>
                                                                                                            <td colspan="10" align="right" valign="middle" style="text-align: center;"><strong>AGENT PLUS MINUS</strong></td>

                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td width="180" height="25" align="left" valign="middle"><strong>CLIENT</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>M AMT</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>SESS.</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>TOT. AMT</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>M. COM</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>S. COM</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>TOL. COM</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>NET AMT</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>SS %</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>SS Share</strong></td>
                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>MOB. APP</strong></td>

                                                                                                            <td width="100" align="right" style="text-align: right;" valign="middle"><strong>FINAL</strong></td>

                                                                                                        </tr>

                                                                                                        <% for (int i = 0; i < agent.ClientDataTable.Rows.Count; i++)
                                                                                                            {
                                                                                                                System.Data.DataRow row = agent.ClientDataTable.Rows[i]; %>
                                                                                                        <tr>
                                                                                                            <% if (i == agent.ClientDataTable.Rows.Count - 1)
                                                                                                                { %>
                                                                                                            <td height="25" align="left" valign="middle"><strong>TOTAL</strong></td>
                                                                                                            <% }
                                                                                                                else
                                                                                                                {  %>
                                                                                                            <td height="25" align="left" valign="middle" class="FontText"><%:row["Name"] %></td>
                                                                                                            <% } //else %>
                                                                                                            <td style="text-align: right;"><%:row["MatchAmount"] %></td>
                                                                                                            <td style="text-align: right;"><%:row["SessionAmount"] %></td>
                                                                                                            <td style="text-align: right;"><strong><%:row["TotalAmount"] %></strong></td>
                                                                                                            <td style="text-align: right;"><%:row["MatchCommision"] %></td>
                                                                                                            <td style="text-align: right;"><%:row["SessionCommision"] %></td>
                                                                                                            <td style="text-align: right;"><strong><%:row["TotalCommisionAmount"] %></strong></td>
                                                                                                            <td style="text-align: right;"><strong><%:row["TotalNetAmount"] %></strong></td>
                                                                                                            <td style="text-align: right;"><%:row["SHR"] %></td>
                                                                                                            <td style="text-align: right;"><%:row["SAAgentShare"] %></td>
                                                                                                            <td style="text-align: right;"><%:row["MOBAppAmount"] %></td>
                                                                                                            <td style="text-align: right;"><strong><%:row["FinalAmount"] %></strong></td>

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
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" class="table table-striped table-bordered">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td width="125" height="25" align="left" valign="middle"><strong>SA TOTAL</strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.TotalMatchAmount%>
                                                                                            </strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.TotalSessionAmount%></strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.TotalPlusMinusAmount%></strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.Match1Amount%></strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.Session1Amount%></strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.TotalCommisionAmount%></strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.TotalNetAmount%></strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.TotalHalfAmount%></strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.TotalSAAmount%></strong></td>
                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.TotalAppAmount%></strong></td>

                                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                                <%: SuperAgent.total.TotalFinalAmount%></strong></td>

                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <% } //foreach %>
                                                                    </tbody>
                                                                </table>


                                                                <%  } //foreach %>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" class="table table-striped table-bordered">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td width="125" height="25" align="left" valign="middle"><strong>SS TOTAL</strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.TotalMatchAmount%>
                                                                            </strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.TotalSessionAmount%></strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.TotalPlusMinusAmount%></strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.Match1Amount%></strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.Session1Amount%></strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.TotalCommisionAmount%></strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.TotalNetAmount%></strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.TotalHalfAmount%></strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.TotalSAAmount%></strong></td>
                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.TotalAppAmount%></strong></td>

                                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                                <%: SuperStockist.total.TotalFinalAmount%></strong></td>

                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <% } //foreach %>
                                                <br>

                                                <br>
                                                <br>

                                                <br>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                &nbsp;
                    <!--//Close Super Agent-->




                                <br>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-striped table-bordered">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" class="table table-striped table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td width="125" height="25" align="left" valign="middle"><strong>GRAND TOTAL</strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.TotalMatchAmount%>
                                                            </strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.TotalSessionAmount%></strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.TotalPlusMinusAmount%></strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.Match1Amount%></strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.Session1Amount%></strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.TotalCommisionAmount%></strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.TotalNetAmount%></strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.TotalHalfAmount%></strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.TotalSAAmount%></strong></td>
                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.TotalAppAmount%></strong></td>

                                                            <td width="80" align="right" style="text-align: right;" valign="middle"><strong>
                                                                <%: admin.total.TotalFinalAmount%></strong></td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
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
    </div>
</asp:Content>



