<%@ Page Language="C#" MasterPageFile="~/PowerUser/Dashboard.Master" AutoEventWireup="true" CodeBehind="LiveTV.aspx.cs" Inherits="betplayer.PowerUser.LiveTV" %>


<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="main-content">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div id="theme-change" class="hidden-phone"><i class="icon-cogs"></i><span class="settings"><span class="text">Theme:</span> <span class="colors"><span class="color-default" data-style="default"></span><span class="color-gray" data-style="gray"></span><span class="color-purple" data-style="purple"></span><span class="color-navy-blue" data-style="navy-blue"></span></span></span></div>
                    <h3 class="page-title">Scoreboard</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li><a href="#">Modify Matches</a><span class="divider">&nbsp;</span></li>
                        <li><a href="ModifyMatches.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
                    </ul>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget">
                        <div class="widget-title">
                            <h4><i class="icon-globe"></i>Live TV</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">
                            <table>
                                <tr>
                                    <td>
                                        <label>Select Channel</label>
                                    </td>
                                    <td>
                                        <select id="channelSelector">
                                            <option value="Disabled" selected>Disabled</option>
                                            <option value="HDMI1">Channel 1</option>
                                            <option value="HDMI2">Channel 2</option>
                                            <option value="HDMI3">Channel 3</option>
                                            <option value="HDMI4">Channel 4</option>
                                        </select>
                                    </td>
                                    <td>
                                        <a onclick="SaveLiveTvTofirebase()" class="btn btn-primary">OK</a>
                                    </td>
                                </tr>
                            </table>
                            <link rel="stylesheet" href="css/mss_v1.css" />
                            <table>
                                <tr>
                                    <td>
                                        <label>Channel 1</label>
                                        <div align="center" class="tv-container" style="margin: 15px 0">
                                            <ul id="p1"></ul>
                                        </div>
                                    </td>
                                    <td>
                                        <label>Channel 2</label>
                                        <div align="center" class="tv-container" style="margin: 15px 0">
                                            <ul id="p2"></ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Channel 3</label>
                                        <div align="center" class="tv-container" style="margin: 15px 0">
                                            <ul id="p3"></ul>
                                        </div>
                                    </td>
                                    <td>
                                        <label>Channel 4</label>
                                        <div align="center" class="tv-container" style="margin: 15px 0">
                                            <ul id="p4"></ul>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="firebasekey" runat="server" />
    <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
    <!-- player !-->
    <script src="js/mss_v1.js" type="text/javascript"></script>
    <script type="text/javascript">        var config = {
            apiKey: "AIzaSyDeJEW2OK0RnL0A4OjYF6oTj04xQhgpb40",
            authDomain: "betplayer-197014.firebaseapp.com",
            databaseURL: "https://betplayer-197014.firebaseio.com",
            projectId: "betplayer-197014",
            storageBucket: "betplayer-197014.appspot.com",
            messagingSenderId: "98790187004"
        };
        firebase.initializeApp(config);        var fk = "<%=firebasekey.Value %>";        function SaveLiveTvTofirebase() {            var selectValue = document.getElementById("channelSelector").value;            firebase                .database()                .ref("/currentMatches/" + fk + "/livetv").update({
                    enabled: (selectValue !== "Disabled") ? true : false,
                    channel: (selectValue !== "Disabled") ? selectValue : ""
                }).then(function () {
                    alert("Live Tv for match updated.")
                })
        }        var sw = 344, sh = 200;        if ("MediaSource" in window && "WebSocket" in window) {            RunPlayer("p1", sw, sh, '93.115.28.85', '5119', false, 'HDMI1', "", true, true, 0.01, "", false);            RunPlayer("p2", sw, sh, '93.115.28.85', '5119', false, 'HDMI2', "", true, true, 0.01, "", false);            RunPlayer("p3", sw, sh, '93.115.28.85', '5119', false, 'HDMI3', "", true, true, 0.01, "", false);            RunPlayer("p4", sw, sh, '93.115.28.85', '5119', false, 'HDMI4', "", true, true, 0.01, "", false);        } else {            document.getElementById("p1").innerHTML = "Websockets are not supported in your browser.";            document.getElementById("p2").innerHTML = "Websockets are not supported in your browser.";            document.getElementById("p3").innerHTML = "Websockets are not supported in your browser.";            document.getElementById("p4").innerHTML = "Websockets are not supported in your browser.";        }    </script>
</asp:Content>
