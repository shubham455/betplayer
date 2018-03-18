s<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="betplayer.Client.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>login</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="css/login/style.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/login/clndr.css" rel="stylesheet" type="text/css" media="all">
    <!--<link rel="stylesheet" type="text/css" href="captcha.css">-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="captcha.js"></script>
    <script language="javascript" type="text/javascript">

        function CheckFields() {
            if (document.getElementById("username").value == "Username")
                document.getElementById("Msg").innerHTML = "Please Enter User Name";
            else if (document.getElementById("password").value == "**********")
                document.getElementById("Msg").innerHTML = "Please Enter Password";
            else if (document.getElementById("captcha1").value == "Enter Image Text")
                document.getElementById("Msg").innerHTML = "Please Enter Image Text";
            else {
                //alert("true");
                document.getElementById("SubmitChk").value = "1";
                document.Login.submit();
            }
        }

    </script>

</head>
<body>
    <br>
    <br>
    <br>
    <br>

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
                        <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                    </span><span><i class="lock"></i>
                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                    </span>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
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

                                                    <td align="middle">

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

                                        <asp:TextBox ID="txtCaptcha" runat="server" placeholder ="text captcha"></asp:TextBox>

                                    </td>

                                </tr>

                          
                            <tr>
                                <td>
                                    <asp:Button ID="btnHOME" runat="server" Text="Home" class="HomeButton" OnClick="btnHOME_Click"/>
                                <td>
                                    <asp:Button ID="btnSubmit" runat="server"  Text="Login" class="LoginButton" OnClick="Submitbtn_Click"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    &nbsp;&nbsp;
		               
                    <input type="text" name="SubmitChk" id="SubmitChk">
                    <div class="clear"></div>
                </form>
            </div>
        </div>
        <br>
        <br>

        <div class="content_bottom">
            <div class="clear"></div>
        </div>
    </div>
    <br>

    <br>


    <h4 align="center" style="color: #FFF; font-family: Verdana, Geneva, sans-serif; font-size: 12px;">Copy Right @ Khai Lagai</h4>
    <br>
    <br>



    <!----- End Content ------------->

    <!---//End-wrap---->



</body>

</html>
