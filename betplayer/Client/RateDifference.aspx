<%@ Page Language="C#" MasterPageFile="~/Client/Menu.Master" AutoEventWireup="true" CodeBehind="RateDifference.aspx.cs" Inherits="betplayer.Client.RateDifference" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td height="35" colspan="2" class="TeamName" style="background-color: #75c2fd; color: #000;">Rate Difference</td>
            </tr>
            <tr>
                <td width="13%" class="FontTextMenu" style="font-size: 16px; color: #000">&nbsp;</td>
                <td width="87%" class="FontTextMenu" style="font-size: 16px; color: #000; font-weight: bold;">&nbsp;</td>
            </tr>
            <tr>
                <td class="FontTextMenu" style="font-size: 16px; color: #000">&nbsp;</td>
                <td height="35" class="FontTextMenu" style="font-size: 16px; color: #000; font-weight: bold;">&nbsp;&nbsp;
                            <asp:RadioButton runat="server" id="RateDifference0" value="0" GroupName="v1" AutoPostBack="true" OnCheckedChanged="RateDifference0_CheckedChanged" />
                    <label for="RateDifference">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zero</label>
                </td>
            </tr>
            <tr>
                <td class="FontTextMenu" style="font-size: 16px; color: #000">&nbsp;</td>
                <td height="35" class="FontTextMenu" style="font-size: 16px; color: #000; font-weight: bold;">&nbsp;&nbsp;
                            <asp:RadioButton runat="server" id="RateDifference1" value="1"  GroupName="v1" AutoPostBack="true" OnCheckedChanged="RateDifference1_CheckedChanged" />
                    <label for="RateDifference">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;One</label></td>
            </tr>
            <tr>
                <td class="FontTextMenu" style="font-size: 16px; color: #000">&nbsp;</td>
                <td height="35" class="FontTextMenu" style="font-size: 16px; color: #000; font-weight: bold;">&nbsp;&nbsp;
                            <asp:RadioButton runat="server" id="RateDifference2" value="2" GroupName="v1" AutoPostBack="true" OnCheckedChanged="RateDifference2_CheckedChanged" />
                    <label for="RateDifference">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Two</label></td>
            </tr>
            <tr>
                <td class="FontTextMenu" style="font-size: 16px; color: #000">&nbsp;</td>
                <td height="35" class="FontTextMenu" style="font-size: 16px; color: #000; font-weight: bold;">&nbsp;&nbsp;
                            <asp:RadioButton runat="server" id="RateDifference3" value="3" GroupName="v1" AutoPostBack="true" OnCheckedChanged="RateDifference3_CheckedChanged" />
                    <label for="RateDifference">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Three</label></td>
            </tr>
            <tr>
                <td class="FontTextMenu" style="font-size: 16px; color: #000">&nbsp;</td>
                <td height="35" class="FontTextMenu" style="font-size: 16px; color: #000; font-weight: bold;">&nbsp;&nbsp;
                            <asp:RadioButton runat="server" id="RateDifference4" value="4" GroupName="v1" AutoPostBack="true" OnCheckedChanged="CheckBox3_CheckedChanged" />
                    <label for="RateDifference">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Four</label></td>
            </tr>
            <tr>
                <td class="FontTextMenu" style="font-size: 16px; color: #000">&nbsp;</td>
                <td height="35" class="FontTextMenu" style="font-size: 16px; color: #000; font-weight: bold;">&nbsp;&nbsp;
                           <asp:RadioButton runat="server" id="RateDifference5" value="5" GroupName="v1" AutoPostBack="true" OnCheckedChanged="RateDifference5_CheckedChanged" />
                    <label for="RateDifference">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Five</label></td>
            </tr>
            <tr>
                <td height="35" colspan="2" class="FontTextMenu" style="font-size: 16px; color: #000" align="center"></td>
            </tr>
           
        </tbody>
    </table>
</asp:Content>
