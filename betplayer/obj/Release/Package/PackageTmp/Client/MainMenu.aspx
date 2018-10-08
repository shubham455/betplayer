<%@ Page Language="C#" MasterPageFile="~/Client/Menu.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="betplayer.Client.MainMenu" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!----- Content ------------->
    <div class="content_top-grid3"></div>
    <div class="clear"></div>


    <div class="col-sm-4 col-lg-3 gritter-demo gritter-item-wrapper" style="width: 100%; margin-top: 50px; text-align: left;">
        <a href="inplay.aspx">
            <div role="alert" style="background-color: #0000FF; height: 70px;">
                <div style="margin-top: -35px;">
                    <div>
                        <br/>
                        <div style="float: left">
                            <img src="images/MainMenuImg/play.png" height="50px;" style="margin-left: 10px; margin-top: -5px;">
                        </div>

                        <div style="margin-left: 100px !important" >
                            <span class="gritter-title" style="color:white;">In Play</span>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
            
            <br>
            <div style="float: left">
                <img src="images/MainMenuImg/game.png" height="50px;" style="margin-top: 14px; margin-left: 10px;">
            </div>
        </a>
        </div>
        <a href="AllGamesList.aspx"></a>
        <div role="alert" style="background-color:#FF99FF; height: 70px;">
            <a href="AllGamesList.aspx">
                <div>
                    <div>
                        <br />
                        <div style="margin-left: 100px !important">
                            <span class="gritter-title">All Games</span>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                </div>
            </a>
        </div>
        <br />
        <div style="float: left">
            <img src="images/MainMenuImg/ledger.png" height="50px;" style="margin-top: 14px; margin-left: 10px;">
        </div>

        <a href="MyLedger.aspx">
            <div role="alert" style="background-color: yellow; height: 70px;">
                <div>
                    <div>
                        <br>
                        <div style="margin-left: 100px !important">
                            <span class="gritter-title">My Ledger</span>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
        </a>
        <br>
        <div style="float: left">
            <img src="images/MainMenuImg/password.png" height="50px;" style="margin-top: 14px; margin-left: 10px;">
        </div>

        <a href="Change_Password.aspx">
            <div role="alert" style="background-color: #00FF00; height: 70px;">
                <div>
                    <div>
                        <br>
                        <div style="margin-left: 100px !important">
                            <span class="gritter-title">Change Password</span>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
        </a>
        <br>
        <div style="float: left">
            <img src="images/MainMenuImg/terms.png" height="50px;" style="margin-top: 14px; margin-left: 10px;">
        </div>

        <a href="Terms_Condition.aspx">
            <div role="alert" style="background-color: #CC33FF; height: 70px;">
                <div>
                    <div>
                        <br>
                        <div style="margin-left: 100px !important">
                            <span class="gritter-title">Terms And Condition</span>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
        </a>
        <br>
        <div style="float: left">
            <img src="images/MainMenuImg/logout.png" height="50px;" style="margin-top: 14px; margin-left: 10px;">
        </div>

        <a href="Login.aspx">
            <div role="alert" style="background-color: #0000FF; height: 70px;">
                <div>
                    <div>
                        <br>
                        <div style="margin-left: 100px !important">
                            <span class="gritter-title" style="color:white;">Logout</span>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
        </a>
  





</asp:Content>
