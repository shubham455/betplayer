<%@ Page Language="C#" MasterPageFile="~/Client/Menu.Master" AutoEventWireup="true" CodeBehind="Change_Password2.aspx.cs" Inherits="betplayer.Client.Change_Password2" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td height="45">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="50%" height="35" class="FontTextWhite10px">OLD PASSWORD</td>
                                <td>
                                    <asp:TextBox ID="txtOldPassword" runat="server" />
                                    <asp:RequiredFieldValidator ID="ValidationOLD" runat="server" ErrorMessage="**" ControlToValidate="txtOldPassword" Display="Dynamic"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td height="35" class="FontTextWhite10px">NEW PASSWORD</td>

                                <td>
                                    <asp:TextBox ID="txtNewPassword" runat="server" OnTextChanged="txtNewPassword_TextChanged" />
                                    <asp:RequiredFieldValidator ID="ValidationNew" runat="server" ErrorMessage="**" ControlToValidate="txtNewPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td height="35" class="FontTextWhite10px">CONFIRM PASSWORD</td>
                                <td>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" OnTextChanged="txtConfirmPassword_TextChanged" AutoPostBack="true" />
                                    <asp:RequiredFieldValidator ID="ValidationConfirmPass" runat="server" ErrorMessage="**" ControlToValidate="txtConfirmPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="FontTextWhite10px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center" class="FontTextWhite10px"></td>
                            </tr>


                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="25">&nbsp;
    
                </td>
            </tr>

            <tr>
                <td height="45">
                    <div class="menu" id="menu" align="center">
                        <ul class="nav">
                            <asp:Button ID="btnChangepass" runat="server" Text="CHANGE PASSWORD" CssClass="active" OnClick="btnChangepass_Click" />
                        </ul>
                    </div>
                </td>
            </tr>

            <tr>
                <td height="45">
                    <div class="menu" id="menu" align="center">
                        <ul class="nav">
                            <li class="active"><a href="MainMenu.aspx">BACK</a></li>
                        </ul>
                    </div>
                </td>
            </tr>

        </tbody>
    </table>
</asp:Content>
