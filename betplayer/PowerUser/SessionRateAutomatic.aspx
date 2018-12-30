﻿<%@ Page Language="C#" MasterPageFile="~/PowerUser/Dashboard.Master" AutoEventWireup="true" CodeBehind="SessionRateAutomatic.aspx.cs" Inherits="betplayer.poweruser.SessionRateAutomatic" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="main-content">
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget" style="margin: 0px; padding: 0px;">
                       
                        <div class="widget-body form">
                            <table style="margin: 0px; border-collapse: collapse; padding: 0px;">
                                <tbody>
                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session1" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 240px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not1" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <input id="yes1" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <input id="yesrate1" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <input id="notrate1" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <button id="UpdateButton1" customdata="" onclick="updateSession(this, 1)" type="button" class="btn btn-success" style="height: 40px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td>
                                            <button id="btnlocksession" type="button" class="btn btn-success" style="height: 50px; width: 100px; font-size: large; font-weight: bold; color: black; background-color: #ff6347">Lock</button>
                                        </td>
                                        <td>
                                            <button id="btnUnlocksession" type="button" class="btn btn-success" style="height: 50px; width: 100px; font-size: large; font-weight: bold; color: black;">UnLock</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>
                                    <br />
                                    <br />
                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session2" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 240px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not2" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <input id="yes2" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <input id="yesrate2" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <input id="notrate2" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <button id="UpdateButton2" customdata="" onclick="updateSession(this, 2)" type="button" class="btn btn-success" style="height: 40px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td>
                                            <button id="btnclearrate" type="button" class="btn btn-success" style="height: 50px; width: 100px; font-size: large; font-weight: bold; color: black; background-color: #ff6347;">Lock All</button>
                                        </td>
                                        <td>
                                            <button id="btnUnclearrate" type="button" class="btn btn-success" style="height: 50px; width: 100px; font-size: large; font-weight: bold; color: black;">UnLock All</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session3" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 240px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not3" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <input id="yes3" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <input id="yesrate3" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold;" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <input id="notrate3" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold;" name="team1khai" value="">
                                        </td>
                                        <td>
                                            <button id="UpdateButton3" customdata="" onclick="updateSession(this, 3)" type="button" class="btn btn-success" style="height: 40px; width: 120px; font-size: x-large; font-weight: bold; color: black;">Update</button>
                                        </td>
                                        <td width="24% " align="left " valign="middle ">&nbsp;</td>
                                        <td width="24% " align="left " valign="middle ">&nbsp;</td>
                                        <td width="2% " align="left ">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session4" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 240px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not4" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value=""></td>
                                        <td>
                                            <input id="yes4" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>

                                        <td>
                                            <input id="yesrate4" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td>
                                            <input id="notrate4" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td>
                                            <button id="UpdateButton4" customdata="" onclick="updateSession(this, 4)" type="button" class="btn btn-success" style="height: 40px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session5" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 240px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not5" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td>
                                            <input id="yes5" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>

                                        <td>
                                            <input id="yesrate5" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td>
                                            <input id="notrate5" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td>
                                            <button id="UpdateButton5" customdata="" onclick="updateSession(this, 4)" type="button" class="btn btn-success" style="height: 40px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session6" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 240px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not6" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td>
                                            <input id="yes6" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>

                                        <td>
                                            <input id="yesrate6" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td>
                                            <input id="notrate6" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" ></td>
                                        <td>
                                            <button id="UpdateButton6" customdata="" onclick="updateSession(this, 4)" type="button" class="btn btn-success" style="height: 40px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="main-container">
                                <div class="match-container">
                                    <div class="lastball-container">
                                        <button id="ball_start" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black;">Ball Start</button>
                                        <button id="bet_open" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">Bet Open</button>
                                        <button id="bet_closed" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">Bet Closed</button>
                                        <button id="NoRun" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">No Run</button>
                                        <button id="1run" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">1 Run</button>
                                        <button id="2run" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">2 Run</button>
                                        <button id="3run" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">3 Run</button>
                                        <button id="four" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">FOUR</button>
                                        <button id="six" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">SIX</button>
                                        <button id="out" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">OUT</button>
                                        <button id="wide" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">WIDE</button>
                                        <button id="noball" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">NO BALL</button>
                                        <button id="freehit" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">FREE HIT</button>
                                        <button id="wideplus4" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">Wide4</button>
                                        <button id="timeout" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">Timeout</button>
                                        <button id="thirdumpire" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">Third Umpire</button>
                                        <button id="Review" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">Review</button>
                                        <button id="Inningsbreak" type="button" class="btn btn-success" style="font-size: x-large; font-weight: bold; color: black">InningsBreak</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table>
                            <tr>
                                <td>
                                    <select name="ctl00$ContentPlaceHolder$DropStatus" id="team_selector" class="btn btn-primary dropdown-toggle" style="width: 180px; height: 40px; font-size: large" onchange="sessionTeamChanged()">
                                        <option id="team1_name" style="font-size: large" value="team_1">Team1</option>
                                        <option id="team2_name" style="font-size: large" value="team_2">Team2</option>
                                        <option id="teamc_name" style="font-size: large" value="team_c">Teamc</option>
                                    </select>

                                </td>

                                <td style="margin-left: 20px;">
                                    <input id="Over" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value=""></td>
                                <td>
                                <td style="margin-left: 30px;"></td>
                                <td>
                                    <button id="btnAdd" type="button" class="btn btn-success" style="height: 40px; width: 140px; font-size: x-large; font-weight: bold; color: black">Add</button>
                                </td>

                                <br />
                                <td style="margin-left: 30px;"></td>
                                <td>
                                    <select name="ctl00$ContentPlaceHolder$DropStatus" id="session_selector" class="btn btn-primary dropdown-toggle" style="width: 180px; height: 40px; font-size: large">
                                    </select>

                                </td>
                                <td style="margin-left: 30px;"></td>
                                <td>
                                    <input id="Declear" onkeydown="focusDeclareElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value=""></td>
                                <td style="margin-left: 30px;"></td>
                                <td>
                                    <button id="btnDeclear" type="button" class="btn btn-success" onclick="declareSession()" style="height: 40px; width: 140px; font-size: x-large; font-weight: bold; color: black">Declare</button>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <select name="ctl00$ContentPlaceHolder$DropStatus" id="session_selectordelete" class="btn btn-primary dropdown-toggle" style="width: 180px; height: 40px; font-size: large">
                                    </select>
                                </td>
                                <td>
                                    <button id="btnDelete" type="button" class="btn btn-success" onclick="deleteSession()" style="height: 40px; width: 140px; font-size: x-large; font-weight: bold; color: black">Delete</button>

                                </td>
                            </tr>
                        </table>
                        <div id="sessionsDiv" style="margin-top: 10vh; font-size: 1em;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="firebasekey" runat="server" />
    <asp:HiddenField ID="apiID" runat="server" />
    <asp:HiddenField ID="Type" runat="server" />
    <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
    <script src="js/SessionUpdateAutomatic_v4.2.1.js"></script>
    <script type="text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to save data?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</asp:Content>
