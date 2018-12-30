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
                                    <a id="enableDisableLiveTv" onclick="EnableDisableLiveTv()" class="btn btn-success">Enable</a>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Select IP</label>
                                    </td>
                                    <td>
                                        <input id="ipInputString" placeholder="Enter IP" style="width: 20vw;" onchange="document.getElementById('channelSelector').selectedIndex = 0" />
                                    </td>
                                    <td>
                                        <select id="ipSelector" onchange="document.getElementById('ipInputString').value= '';">
                                            <option value="Disabled" selected>Disabled</option>
                                            <%foreach (System.Data.DataRow row in DTIP.Rows)
                                                {%>
                                            <option value="<%= row["value"] %>" selected><%= row["value"] %></option>
                                            <% }%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Select Port</label>
                                    </td>
                                    <td>
                                        <input id="portInputString" placeholder="Enter Port" style="width: 20vw;" onchange="document.getElementById('channelSelector').selectedIndex = 0" />
                                    </td>
                                    <td>
                                        <select id="portSelector" onchange="document.getElementById('portInputString').value= '';">
                                            <option value="Disabled" selected>Disabled</option>
                                            <%foreach (System.Data.DataRow row in DTPort.Rows)
                                                {%>
                                            <option value="<%= row["value"] %>" selected><%= row["value"] %></option>
                                            <% }%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Select Channel</label>
                                    </td>
                                    <td>
                                        <input id="channelInputString" placeholder="Enter Channel" style="width: 20vw;" onchange="document.getElementById('channelSelector').selectedIndex = 0" />
                                    </td>
                                    <td>
                                        <select id="channelSelector" onchange="document.getElementById('channelInputString').value= '';">
                                            <option value="Disabled" selected>Disabled</option>
                                            <%foreach (System.Data.DataRow row in DTChannel.Rows)
                                                {%>
                                            <option value="<%= row["value"] %>" selected><%= row["value"] %></option>
                                            <% }%>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <link rel="stylesheet" href="css/mss_v1.css" />
                            <table>
                                <tr>
                                    <td>
                                        <a onclick="TestLiveTv()" class="btn btn-primary">Test IP</a>
                                    </td>
                                    <td>
                                        <a onclick="SaveLiveTvTofirebase()" class="btn btn-primary">Set IP on Client</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Test Preview :</label>
                                        <div align="center" class="tv-container" style="margin: 15px 0">
                                            <ul id="p1"></ul>
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
    <script src="https://www.gstatic.com/firebasejs/5.5.0/firebase.js"></script>
    <!-- Player -->
    <script src="js/mss_v1.js" type="text/javascript"></script>
    <script type="text/javascript">
        // Initialize Firebase
        var config = {
            apiKey: "AIzaSyC--iibJ_u5LOgf-TPVrQxpYJl-OEqVX7o",
            authDomain: "cricfun1.firebaseapp.com",
            databaseURL: "https://cricfun1.firebaseio.com",
            projectId: "cricfun1",
            storageBucket: "cricfun1.appspot.com",
            messagingSenderId: "17574502370"
        };
        firebase.initializeApp(config);
        var fk = "<%= firebasekey.Value %>";
        var enabledisablebutton = document.getElementById('enableDisableLiveTv');
        var ipInputString = document.getElementById("ipInputString");
        var portInputString = document.getElementById("portInputString");
        var channelInputString = document.getElementById("channelInputString");
        var ipSelector = document.getElementById("ipSelector");
        var portSelector = document.getElementById("portSelector");
        var channelSelector = document.getElementById("channelSelector");
        function EnableDisableLiveTv() {
            var action = enabledisablebutton.innerHTML;
            if (action === "Enable") {
                firebase
                    .database()
                    .ref("/currentMatches/" + fk + "/livetv").update({
                        enabled: true
                    }).then(function () {
                        enabledisablebutton.innerHTML = "Disable";
                        enabledisablebutton.classList.remove("btn-success");
                        enabledisablebutton.classList.add("btn-error");
                        alert("Live Tv Enabled for match.")
                    })
            }
            else if (action === "Disable") {
                firebase
                    .database()
                    .ref("/currentMatches/" + fk + "/livetv").update({
                        enabled: false
                    }).then(function () {
                        enabledisablebutton.innerHTML = "Disable";
                        enabledisablebutton.classList.remove("btn-error");
                        enabledisablebutton.classList.add("btn-success");
                        alert("Live Tv Disabled match.");
                    })
            }
        }
        function SaveLiveTvTofirebase() {
            var ip = getcleanIp(),
                port = getcleanPort(),
                channel = getcleanChannel();
            if (ip === "" || port === "" || channel === "") {
                alert("Please Select  or input Value in all three IP, Port and Channel.")
            } else {
                firebase
                    .database()
                    .ref("/currentMatches/" + fk + "/livetv").update({
                        enabled: true,
                        ip: ip,
                        port: port,
                        channel: channel
                    }).then(function () {
                        alert("Live Tv for match updated.")
                    });
                if (!(ipInputString.value.toString().trim() === "" &&
                    portInputString.value.toString().trim() === "" &&
                    channelInputString.value.toString().trim() === "")) {
                    postNewValuesToServer();
                }
            }
        }
        function TestLiveTv() {
            var ip = getcleanIp(),
                port = getcleanPort(),
                channel = getcleanChannel();
            if (ip === "" || port === "" || channel === "") {
                alert("Please Select  or input Value in all three IP, Port and Channel.")
            } else {
                var sw = 344, sh = 200;
                if ("MediaSource" in window && "WebSocket" in window) {
                    RunPlayer("p1", sw, sh, ip, port, false, channel, "", true, true, 0.01, "", false);
                } else {
                    document.getElementById("p1").innerHTML = "Websockets are not supported in your browser.";
                }
            }
        }
        function postNewValuesToServer() {
            var params = {
                ip: ipInputString.value.toString().trim(),
                port: portInputString.value.toString().trim(),
                channel: channelInputString.value.toString().trim()

            };
            var formBody = [];
            for (var property in params) {
                var encodedKey = encodeURIComponent(property);
                var encodedValue = encodeURIComponent(params[property]);
                formBody.push(encodedKey + "=" + encodedValue);
            }
            formBody = formBody.join("&");

            fetch("/PowerUser/LiveTvInputData.ashx", {
                credentials: "same-origin",
                method: "POST",
                headers: {
                    "Content-Type":
                        "application/x-www-form-urlencoded;charset=UTF-8"
                },
                body: formBody
            }).then(function (responce) {
                return responce.json();
            }).then(function (data) {
                console.log(data);
            });
        }
        function getcleanIp() {
            return (ipSelector.value !== "Disabled") ? ipSelector.value : ipInputString.value.toString().trim();
        }
        function getcleanPort() {
            return (portSelector.value !== "Disabled") ? portSelector.value : portInputString.value.toString().trim();
        }
        function getcleanChannel() {
            return (channelSelector.value !== "Disabled") ? channelSelector.value : channelInputString.value.toString().trim();
        }
    </script>

</asp:Content>
