<%@ Page Language="C#" MasterPageFile="~/Client/Menu.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="betplayer.Client.MainMenu" %>
<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
        <!----- Content ------------->
        <div class="content_top">
            <div class="content_top-grid3"></div>
            <div class="clear"></div>
        </div>
        <div class="metro_icons">
            <ul>
                <li>
                    <a href="inplay.aspx">
                        <div class="games-icon">
                            <img src="images/MainMenuImg/games.png" alt="">
                            <p align="center">In Play</p>
                        </div>
                    </a>
                    <a href="AllGamesList.aspx">
                        <div class="Privacy-icon">
                            <img src="images/MainMenuImg/AllGame.png" alt="">
                            <p align="center">All Games</p>
                        </div>
                    </a>
                    <a href="Change_Password.aspx">
                        <div class="login-icon" style="padding-bottom: 10px;">
                            <img src="images/MainMenuImg/Settings.png" alt="">
                            <p align="center" style="padding-top: 10px;">Password</p>
                        </div>
                    </a>
                    <a href="MyLedger.aspx">
                        <div class="contact-icon">
                            <img src="images/MainMenuImg/Ledger.png" alt="">
                            <p align="center">Ledger </p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="games-icon">
                            <img src="images/MainMenuImg/Rules.png" alt="">
                            <p align="center">Rules</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="Privacy-icon">
                            <img src="images/MainMenuImg/HowTo.png" alt="">
                            <p align="center">How To Play</p>
                        </div>
                    </a>
                    <a href="Terms_Condition.aspx">
                        <div class="login-icon" style="padding-bottom: 10px;">
                            <img src="images/MainMenuImg/TC.png" alt="">
                            <p align="center" style="padding-top: 10px;">Terms &amp;
                                <br>
                                Conditions</p>
                        </div>
                    </a>
                    <a href="Login.aspx">
                        <div class="contact-icon" style="padding-bottom: 10px;">
                            <img src="images/MainMenuImg/Logout.png" alt="">
                            <p align="center" style="padding-bottom: 5px;">
                                <br>
                                Logout</p>
                        </div>
                    </a>


                    <div class="clear"></div>
                </li>
                <!--<li> <a href="#">
		                <div class="portfolio-icon"><img src="images/MainMenuImg/portfolio-icon.png" alt="" />
		                  <p>Portfolio</p>
	                  </div>
		                </a> </li>-->
            </ul>
        </div>
        <div class="content_bottom">
            <div class="clear"></div>
        </div>
 
   
  


</asp:Content>