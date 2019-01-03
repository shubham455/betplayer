<%@ Page Language="C#" MasterPageFile="~/Client/Menu.Master" AutoEventWireup="true" CodeBehind="MyLedger.aspx.cs" Inherits="betplayer.Client.MyLedger" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <td align="left" valign="top" bgcolor="#336600">


                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tbody>
                                            <tr>
                                                <td height="35" align="center" bgcolor="#f694aa" class="TeamCombo">
                                                    <p class="price-btn price-btn-blue popup-with-zoom-anim">MY LEDGER</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="top">

                                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                                        <tbody>
                                            <tr>
                                                <td widt="30%" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle; text-align: left; padding-right: 5px;">Date</td>
                                                <td width="30%" height="35" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle; text-align: left; padding-right: 5px;">MATCH</td>
                                                <td width="10%" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle; text-align: right;">DEBIT</td>
                                                <td width="10%" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle; text-align: right;">CREDIT</td>
                                                <td width="10%" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle; text-align: right;">BALANCE</td>
                                                <td width="10%" align="center" valign="middle" bgcolor="#2DA5DA" class="FontTextWhite" style="vertical-align: middle; text-align: right;">Remark</td>
                                            </tr>
                                            <%if (!emptyLedgerTable)
                                                {
                                                    foreach (System.Data.DataRow row in LedgerTableOrdered.Rows)
                                                    { %>

                                            <tr>
                                                <td height="35" align="left" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: left; padding-right: 5px;"><%: row["Date"] %></td>
                                                <td height="35" align="left" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: left; padding-right: 5px;"><%: row["CollectionName"] %>  </td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"><%: row["Dabit"] %></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"><%: row["credit"] %></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"><%: row["Balance"] %></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"><%: row["Remark"] %></td>
                                            </tr>
                                            <% } //foreach
                                                }
                                                else
                                                { %>
                                            <tr>
                                                <td height="35" align="left" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: left; padding-right: 5px;">NO</td>
                                                <td height="35" align="left" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: left; padding-right: 5px;">DATA  </td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;">FOUND</td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"></td>
                                            </tr>
                                            <% } //else %>


                                            <%if (!emptyLedgerTable)
                                                {
                                                    foreach (System.Data.DataRow row in runTable1.Rows)
                                                    { %>

                                            <tr>
                                                <td height="35" align="left" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: left; padding-right: 5px;"></td>
                                                <td height="35" align="left" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: left; padding-right: 5px;">Total</td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"><%: row["TotalDabitAmount"] %></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"><%: row["TotalcreditAmount"] %></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"><%:LedgerTableOrdered.Rows[LedgerTableOrdered.Rows.Count-1]["Balance"] %></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"></td>
                                            </tr>
                                            <% } //foreach 
                                                }
                                                else
                                                { %>
                                            <tr>
                                                <td height="35" align="left" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: left; padding-right: 5px;"></td>
                                                <td height="35" align="left" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: left; padding-right: 5px;"> </td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"></td>
                                                <td align="right" bgcolor="#CCFFFF" class="FontText" style="vertical-align: middle; text-align: right; padding-right: 5px;"></td>
                                            </tr>
                                            <% } //else %>
                                        </tbody>
                                    </table>

                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="bottom" bgcolor="#FFFFFF"></td>
                            </tr>
                            <tr>
                                <td align="left" valign="top">&nbsp;</td>
                            </tr>
                            <tr>
                                <td valign="top"></td>
                            </tr>
                        </tbody>
                    </table>
                </td>

            </tr>
        </tbody>
    </table>

</asp:Content>

