﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SubAdmin/Dashboard.Master" CodeBehind="SuperstockistLedger.aspx.cs" Inherits="betplayer.Subadmin.AgentLedger" %>

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
                    <h3 class="page-title">Superstockist Ledger
  <small></small></h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Ledger <span class="divider">&nbsp;</span> </li>
                        <li>Superstockist Ledger<span class="divider">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Superstockist Ledger</h4>
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
                                        <td width="25%" height="35"><strong>Superstockist</strong></td>
                                        <td width="25%"><strong>Collection </strong></td>
                                        <td width="25%"><strong>Date</strong></td>
                                        <td width="25%" rowspan="4" style="vertical-align: middle; text-align: left;">
                                            <div>
                                                <button name="btnSave" runat="server" id="btnSave" type="button" class="btn btn-success" onserverclick="btnSave_ServerClick">Save</button>

                                                <!--<button type="button" class="btn" onClick="SendSMS();">Send SMS</button>-->
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30">
                                            <asp:DropDownList ID="dropdownsuperstockist" runat="server" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="dropdownsuperstockist_SelectedIndexChanged">
                                                <asp:ListItem Text="Select It.." Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0"  ControlToValidate="dropdownsuperstockist" ErrorMessage="**"></asp:RequiredFieldValidator>
                                       
                                        <td>
                                            <asp:DropDownList ID="dropdowncollection" runat="server" AppendDataBoundItems="true" AutoPostBack="false">
                                                <asp:ListItem Text="Cash/ac" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="0" ControlToValidate="dropdowncollection" ErrorMessage="**"></asp:RequiredFieldValidator>
                                       
                                        <td>
                                            <div class="controls" style="vertical-align: middle; text-align: left; padding-top: 0px;">
                                                <asp:TextBox runat="server" TextMode="Date" class=" m-ctrl-medium date-picker" size="16" name="BillDate" type="text" ID="BillDate"  />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="BillDate" ErrorMessage="**"></asp:RequiredFieldValidator>
                                       
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="25%" height="35"><strong>Amount</strong></td>
                                        <td width="130"><strong>Payment Type</strong></td>
                                        <td><strong>Remark</strong></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server"  id="Amount"/>
                                            <asp:RequiredFieldValidator ID="reqAmount" runat="server" ControlToValidate="Amount" ErrorMessage="**" ></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="PaymentType1" runat="server" AppendDataBoundItems="true" AutoPostBack="false">
                                                <asp:ListItem Text="Payment Type" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="PAYMENT - DENA/ac" Value="Payment Paid"></asp:ListItem>
                                                <asp:ListItem Text="RECEIPT - LENA/ac" Value="Payment Received"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredPaynmenttype" runat="server" InitialValue="0" ControlToValidate="PaymentType1" ErrorMessage="**"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server"  id="Remark" size="120"/></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                                <tbody>
                                    <tr>
                                        <td width="4%" height="25"><strong>SNo.</strong></td>
                                        <td width="8%"><strong>Date</strong></td>
                                        <td width="25%"><strong>Collection Name</strong></td>
                                        <td width="9%" align="right"><strong>Debit</strong></td>
                                        <td width="9%" align="right"><strong>Credit</strong></td>
                                        <td width="9%" align="right"><strong>Balance</strong></td>
                                        <td align="right"><strong>Payment Description</strong></td>
                                        <td align="right"><strong>Remark</strong></td>
                                       
                                    </tr>
                                    <%if (!emptyLedgerTable)
                                        {%>
                                            <%int i = 1;
                                            foreach (System.Data.DataRow row in LedgerTableOrdered.Rows)
                                            { %>
                                    <tr>
                                        <td height="20" class="FontText"><%=i %></td>
                                        <td class="FontText"><%: row["Date"] %></td>
                                        <td class="FontText"><%: row["CollectionName"] %></td>
                                        <td align="right" class="FontText" style="text-align: right;"><%: row["Dabit"] %></td>
                                        <td align="right" class="FontText" style="text-align: right;"><%:row["Credit"] %></td>
                                        <td align="right" class="FontText" style="text-align: right;"><strong><%: row["Balance"] %> </strong></td>
                                        <td align="right" class="FontText"><%:row["PaynmentDescription"] %></td>
                                        <td align="right" class="FontText"><%:row["Remark"] %></td>
                                    </tr>
                                    <%i++; %>
                                    <% } //foreach 
                                        }
                                        else
                                        { %>

                                    <tr>
                                        <td height="20" class="FontText">1</td>
                                        <td class="FontText">NO</td>
                                        <td class="FontText">DATA</td>
                                        <td align="right" class="FontText" style="text-align: right;">FOUND</td>
                                        <td align="right" class="FontText" style="text-align: right;"></td>
                                        <td align="right" class="FontText" style="text-align: right;"><strong></strong></td>
                                        <td align="right" class="FontText"></td>
                                        <td align="right" class="FontText"></td>
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
                                        <td align="right" style="text-align: right;"><strong><%:row["TotalDabitAmount"] %>  </strong></td>
                                        <td align="right" style="text-align: right;"><strong><%:row["TotalCreditAmount"] %> </strong></td>
                                        <td align="right" style="text-align: right;"><%:LedgerTableOrdered.Rows[LedgerTableOrdered.Rows.Count-1]["Balance"] %><strong>
                                            <asp:Label ID="lblAmount" runat="server"></asp:Label>
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
                                        <td align="right" style="text-align: right;"><strong></strong></td>
                                        <td align="right" style="text-align: right;"><strong></strong></td>
                                        <td align="right" style="text-align: right;"><strong>
                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                        </strong></td>
                                        <td align="right">&nbsp;</td>
                                        <td align="right">&nbsp;</td>
                                    </tr>
                                    <% } //else %>
                                </tbody>
                            </table>
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>


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

