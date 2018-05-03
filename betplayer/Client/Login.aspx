<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="betplayer.Client.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Crick20.com</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/login/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/login/clndr.css" rel="stylesheet" type="text/css" media="all" />
    <!--<link rel="stylesheet" type="text/css" href="captcha.css">-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>



</head>
<body>
    <br />
    <br />
    <br />
    <br />

    <!---start-wrap---->
    <div class="wrap">
        <!---  End Header ----->

        <!----- Content ------------->
        <div class="content_top">
            <div class="content_top-grid3"></div>
            <div class="clear"></div>
        </div>

        <div class="sign-in">
            <div class="sign_in">
                <h3>Login</h3>
                <form id="Form1" runat="server">
                    <span><i class="user"></i>
                        <asp:TextBox ID="txtusername" runat="server" placeHode="Username"></asp:TextBox>
                    </span><span><i class="lock"></i>
                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" placeholder="*********"></asp:TextBox>
                    </span>
                    <table style="width: 100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>

                            <tr>

                                <asp:ScriptManager ID="SM1" runat="server">
                                </asp:ScriptManager>
                                <td>
                                    <asp:UpdatePanel ID="UP1" runat="server">

                                        <ContentTemplate>

                                            <table>

                                                <tr>

                                                    <td style="height: 50px; width: 100px;">

                                                        <asp:Image ID="imgCaptcha" runat="server" />

                                                    </td>

                                                    <td style="align-content: center">

                                                        <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />

                                                    </td>

                                                </tr>

                                            </table>

                                        </ContentTemplate>

                                    </asp:UpdatePanel>
                                </td>


                                <td>Enter above captcha code :

                                </td>

                                <td>

                                    <asp:TextBox ID="txtCaptcha" runat="server" placeholder="Text Captcha"></asp:TextBox>

                                </td>

                            </tr>

                            <tr>
                                <td>

                                    <asp:Button ID="btnHOME" CssClass="HomeButton" runat="server" Text="Home" class="HomeButton" OnClick="btnHOME_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnSubmit" CssClass="LoginButton" runat="server" Text="Login" class="LoginButton" OnClick="Submitbtn_Click" />
                                </td>

                            </tr>
                        </tbody>
                    </table>



                </form>
            </div>
        </div>
        <br />
        <br />


    </div>
    <br />

    <br />


    <h4 align="center" style="color: #FFF; font-family: Verdana, Geneva, sans-serif; font-size: 12px;">Copy Right @ Khai Lagai</h4>


</body>

</html>
