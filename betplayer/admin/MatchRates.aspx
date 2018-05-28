<%@ Page Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="MatchRates.aspx.cs" Inherits="betplayer.admin.MatchRates" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="main-content">
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN THEME CUSTOMIZER-->
                    <div id="theme-change" class="hidden-phone"><i class="icon-cogs"></i><span class="settings"><span class="text">Theme:</span> <span class="colors"><span class="color-default" data-style="default"></span><span class="color-gray" data-style="gray"></span><span class="color-purple" data-style="purple"></span><span class="color-navy-blue" data-style="navy-blue"></span></span></span></div>
                    <!-- END THEME CUSTOMIZER-->
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">Add Match</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>

                        <li><a href="#">Add Match</a><span class="divider">&nbsp;</span></li>

                        <li><a href="CreateMatch.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Add Match</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <table>
                                <tbody>
                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td style="font-size: large; font: 100" width="10%" height="30" align="left" valign="middle" class="welcome">
                                            <select name="ctl00$ContentPlaceHolder$DropStatus" id="team_selector" class="btn btn-primary dropdown-toggle" style="width: 180px; height:50px;font-size:large">
                                                <option id="team1_name" style="font-size:large" value="team_1">Team1</option>
                                                <option id="team2_name" style="font-size:large" value="team_2">Team2</option>
                                            </select>
                                             <td width="5%" align="left" valign="middle"></td>
                                        <td width="14%" align="left" valign="middle">
                                            <input id="team1_Khai" type="text" style="width:100px; height:50px; font-size:xx-large;font-weight:bold"   name="team1khai" value="" placeholder="Khai">
                                        </td>
                                        <td width="14%" align="left" valign="middle">
                                            <input id="team1_Lagai" type="text" name="team1lagai" style="width:100px; height:50px;font-size:xx-large;font-weight:bold"value="" placeholder="Lagai">
                                        </td>
                                       
                                        <td width="14%" align="left" valign="middle">
                                          <button id="btnteam1update" type="button" class="btn btn-success" style="height: 50px; width: 100px; font-size: large;">Update</button>
                                        </td>
                                        <td width="14%" align="left" valign="middle">
                                          <button id="btnLock" type="button" class="btn btn-success" style="height: 50px; width: 100px; font-size: large;">Lock</button>
                                        </td>
                                        <td width="14%" align="left" valign="middle">
                                          <button id="btnUnLock" type="button" class="btn btn-success" style="height: 50px; width: 100px; font-size: large;">UnLock</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>

                                    <br />
                                    <br />



                                  
                                </tbody>
                            </table>
                             <div class="widget-body form">
                                <table>
                                    <tr>
                                        <td>
                                            <button id="ball_start" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">Ball Start</button>
                                        </td>
                                        <td>
                                            <button id="1run" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">1 Run</button>
                                        </td>
                                        <td>
                                            <button id="2run" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">2 Run</button>
                                        </td>
                                        <td>
                                            <button id="3run" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">3 Run</button>
                                        </td>
                                        <td>
                                            <button id="four" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">4 Run</button>
                                        </td>
                                        <td>
                                            <button id="six" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">6 Run</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="widget-body form">
                                <table>
                                    <tr>
                                        <td>
                                            <button id="wide" type="button" class="btn btn-success"style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">WIDE</button>
                                        </td>
                                        <td>
                                            <button id="noball" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">NO BALL</button>
                                        </td>
                                        <td>
                                            <button id="freehit" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">FREE HIT</button>
                                        </td>
                                        <td>
                                            <button id="wideplus4" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">WIDE+ 4</button>
                                        </td>
                                         <td>
                                            <button id="timeout" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">Time out</button>
                                        </td>
                                        <td>
                                            <button id="thirdumpire" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">Third Umpire</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <asp:HiddenField ID="apiid" runat="server" />  
    <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
    <script src="js/RunnerUpdate.js"></script>
</asp:Content>
