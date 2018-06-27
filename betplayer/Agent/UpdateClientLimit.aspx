<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="UpdateClientLimit.aspx.cs" Inherits="betplayer.Agent.UpdateClientLimit" %>

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
                    <h3 class="page-title">Client Limit</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Master Details <span class="divider">&nbsp;</span> </li>
                        <li>Client Limit<span class="divider">&nbsp;</span></li>
                        <li><a href="ClientDetails.php"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Client Limit</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <!-- BEGIN FORM-->

                            <div class="alert alert-error" id="Error" style="visibility: hidden">
                            </div>
                            <table width="100%" class="table table-striped table-hover table-bordered">
                                <tbody>
                                    <tr>
                                        <td height="25" align="left" class="TableHeading">&nbsp;</td>
                                        <td align="left" class="TableHeading">&nbsp;</td>
                                        <td colspan="3" align="left" class="TableHeading">Client Limit</td>
                                    </tr>
                                    <tr>
                                        <td height="25" align="left" class="TableHeading">SNo.</td>
                                        <td align="left" class="TableHeading">Client  Name</td>
                                        <td align="left" class="TableHeading">Fix Limit</td>
                                        <td align="left" class="TableHeading">Current Limit</td>
                                        <td align="left" class="TableHeading">Used Limit</td>
                                    </tr>
                                    <% foreach (System.Data.DataRow row in UpdateDataTable.Rows)
                                            { %>
                                    <tr bgcolor="#FFFFFF">
                                        <td height="25" align="left" class="FontText">1</td>
                                        <td align="left" class="FontText">
                                            <input name="ClientName1" type="text" class="TextBoxTransparent" id="ClientName1" style="text-align: right; text-align: left;" onblur="CheckTotalLimit('1')" value="<%: row["ClientID"] %><%: row["Name"] %>" readonly="">
                                        </td>
                                        <td align="left" class="TextBox100">
                                            <input name="FixLimit1" id="FixLimit1" style="text-align: right" type="text" value="<%: row["FixLimit"] %>" class="TextBox100"></td>
                                        <td align="left" class="TextBox100">
                                            <input name="Limit1" id="Limit1" style="text-align: right" type="text" value="<%: row["Client_Limit"] %>" onblur="CheckTotalLimit('1')" class="TextBox100"></td>
                                        <td align="left" class="FontText">
                                            <input name="ULimit1" type="text" id="ULimit1" style="text-align: right" value="<%: row["ClientID"] %>" class="TextBox100" readonly="" disabled=""></td>
                                    </tr>

                                     <% } //foreach %>
                                   


                                   
                                    <tr bgcolor="#E9F3FD" class="TableHeading">
                                        <td height="25" colspan="5" align="center" bgcolor="#FFFFFF" class="ButtonL" style="background: #FFF;">नोट : लिमिट को अपडेट करने के लिए अपडेट बटन को दो बार क्लिक करे।</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="form-actions">
                                <button type="button" class="btn btn-success" onclick="SaveLimit()">Update</button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="ClientDetails.aspx">
                        <button type="button" class="btn">Cancel</button></a>
                            </div>


                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->
    </div>
</asp:Content>
