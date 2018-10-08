<%@ Page Language="C#" MasterPageFile="~/PowerUser/Dashboard.Master" AutoEventWireup="true" CodeBehind="SessionRate.aspx.cs" Inherits="betplayer.poweruser.SessionRate" %>

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
                    <h3 class="page-title">Session</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>

                        <li><a href="#">Modify Matches</a><span class="divider">&nbsp;</span></li>

                        <li><a href="ModifyMatches.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                            <h4><i class="icon-globe"></i>Session</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <table>
                                <tbody>
                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session1" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 250px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Session"></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not1" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Not"></td>
                                        <td>
                                            <input id="yes1" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Yes"></td>

                                        <td>
                                            <input id="yesrate1" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="YesRate"></td>
                                        <td>
                                            <input id="notrate1" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="NotRate"></td>
                                        <td>
                                            <button id="UpdateButton1" customdata="" onclick="updateSession(this, 1)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>

                                    <br />
                                    <br />

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session2" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 250px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Session"></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not2" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Not"></td>
                                        <td>
                                            <input id="yes2" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Yes"></td>

                                        <td>
                                            <input id="yesrate2" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="YesRate"></td>
                                        <td>
                                            <input id="notrate2" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="NotRate"></td>
                                        <td>
                                            <button id="UpdateButton2" customdata="" onclick="updateSession(this, 2)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>
                                    <br />
                                    <br />

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session3" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 250px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Session"></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not3" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Not"></td>
                                        <td>
                                            <input id="yes3" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Yes"></td>

                                        <td>
                                            <input id="yesrate3" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="YesRate"></td>
                                        <td>
                                            <input id="notrate3" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="NotRate"></td>
                                        <td>
                                            <button id="UpdateButton3" customdata="" onclick="updateSession(this, 3)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>
                                    <br />
                                    <br />

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session4" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 250px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Session"></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not4" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Not"></td>
                                        <td>
                                            <input id="yes4" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Yes"></td>

                                        <td>
                                            <input id="yesrate4" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="YesRate"></td>
                                        <td>
                                            <input id="notrate4" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="NotRate"></td>
                                        <td>
                                            <button id="UpdateButton4" customdata="" onclick="updateSession(this, 4)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session5" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 250px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Session"></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not5" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Not"></td>
                                        <td>
                                            <input id="yes5" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Yes"></td>

                                        <td>
                                            <input id="yesrate5" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="YesRate"></td>
                                        <td>
                                            <input id="notrate5" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="NotRate"></td>
                                        <td>
                                            <button id="UpdateButton5" customdata="" onclick="updateSession(this, 4)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session6 " onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 250px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Session"></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not6" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Not"></td>
                                        <td>
                                            <input id="yes6" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Yes"></td>

                                        <td>
                                            <input id="yesrate6" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="YesRate"></td>
                                        <td>
                                            <input id="notrate6" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="NotRate"></td>
                                        <td>
                                            <button id="UpdateButton6" customdata="" onclick="updateSession(this, 4)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session7" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 250px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Session"></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not7" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Not"></td>
                                        <td>
                                            <input id="yes7" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Yes"></td>

                                        <td>
                                            <input id="yesrate7" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="YesRate"></td>
                                        <td>
                                            <input id="notrate7" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="NotRate"></td>
                                        <td>
                                            <button id="UpdateButton7" customdata="" onclick="updateSession(this, 4)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td width="2%" class="welcome">&nbsp;</td>
                                        <td>
                                            <input id="Session8" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" readonly="" style="width: 250px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Session"></td>
                                        <td width="5%" align="left" valign="middle"></td>
                                        <td>
                                            <input id="not8" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Not"></td>
                                        <td>
                                            <input id="yes8" onfocus="this.setSelectionRange(0, this.value.length)" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Yes"></td>

                                        <td>
                                            <input id="yesrate8" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="YesRate"></td>
                                        <td>
                                            <input id="notrate8" onfocus="this.setSelectionRange(0, this.value.length)" readonly="" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="NotRate"></td>
                                        <td>
                                            <button id="UpdateButton8" customdata="" onclick="updateSession(this, 4)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>



                                </tbody>
                            </table>

                            <table>
                                <tr>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder$DropStatus" id="team_selector" class="btn btn-primary dropdown-toggle" style="width: 180px; height: 50px; font-size: large" onchange="sessionTeamChanged()">
                                            <option id="team1_name" style="font-size: large" value="team_1">Team1</option>
                                            <option id="team2_name" style="font-size: large" value="team_2">Team2</option>
                                        </select>

                                    </td>
                                    <td style="margin-left: 20px;"></td>
                                    <td>
                                        <input id="Over" onkeydown="focusNextElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 50px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Session"></td>
                                    <td>
                                    <td style="margin-left: 30px;"></td>
                                    <td>
                                        <button id="btnAdd" type="button" class="btn btn-success" style="height: 50px; width: 140px; font-size: x-large; font-weight: bold; color: black">Add</button>
                                    </td>

                                    <br />
                                    <td style="margin-left: 30px;"></td>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder$DropStatus" id="session_selector" class="btn btn-primary dropdown-toggle" style="width: 180px; height: 50px; font-size: large">
                                        </select>

                                    </td>
                                    <td style="margin-left: 30px;"></td>
                                    <td>
                                        <input id="Declear" onkeydown="focusDeclareElementOnEnterKeyPress(event)" type="text" style="width: 120px; height: 40px; font-size: xx-large; font-weight: bold" name="team1khai" value="" placeholder="Declare"></td>
                                    <td style="margin-left: 30px;"></td>
                                    <td>
                                        <button id="btnDeclear" type="button" class="btn btn-success" onclick="declareSession()" style="height: 50px; width: 140px; font-size: x-large; font-weight: bold; color: black">Declare</button>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <select name="ctl00$ContentPlaceHolder$DropStatus" id="session_selector1" class="btn btn-primary dropdown-toggle" style="width: 180px; height: 50px; font-size: large">
                                        </select>
                                    </td>
                                    <td>
                                        <button id="btnDelete" type="button" class="btn btn-success" onclick="deleteSession()" style="height: 50px; width: 140px; font-size: x-large; font-weight: bold; color: black">Declare</button>

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
    </div>
    <asp:HiddenField ID="firebasekey" runat="server" />
    <asp:HiddenField ID="apiID" runat="server" />
    <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
    <script src="js/SessionUpdate_v2.js"></script>
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
