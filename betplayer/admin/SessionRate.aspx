<%@ Page Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="SessionRate.aspx.cs" Inherits="betplayer.admin.SessionRate" %>

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
                                            <button id="UpdateButton1" onclick="updateSession(1)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
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
                                            <button id="UpdateButton2" onclick="updateSession(2)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
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
                                            <button id="UpdateButton3" onclick="updateSession(3)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
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
                                            <button id="UpdateButton4" onclick="updateSession(4)" type="button" class="btn btn-success" style="height: 60px; width: 120px; font-size: x-large; font-weight: bold; color: black">Update</button>
                                        </td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="24%" align="left" valign="middle">&nbsp;</td>
                                        <td width="2%" align="left">&nbsp;</td>
                                    </tr>



                                </tbody>
                            </table>

                            <div class="widget-body form">
                                <table>
                                    <tr>
                                        <td>
                                            <select name="ctl00$ContentPlaceHolder$DropStatus" id="team_selector" class="btn btn-primary dropdown-toggle" style="width: 180px; height: 50px; font-size: large" onchange="sessionTeamChanged()">
                                                <option id="team1_name" style="font-size: large" value="team1" >Team1</option>
                                                <option id="team2_name" style="font-size: large" value="team2" >Team2</option>
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

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="apiid" runat="server" />
    <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
    <script src="js/SessionUpdate.js"></script>
</asp:Content>
