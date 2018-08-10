var config = {
    apiKey: "AIzaSyDeJEW2OK0RnL0A4OjYF6oTj04xQhgpb40",
    authDomain: "betplayer-197014.firebaseapp.com",
    databaseURL: "https://betplayer-197014.firebaseio.com",
    projectId: "betplayer-197014",
    storageBucket: "betplayer-197014.appspot.com",
    messagingSenderId: "98790187004"
};
var matchKey, activeSessionsLength;
var timer = setTimeout(function () { }, 0);
var sessionsDiv = document.getElementById('sessionsDiv');
var sessionsTable = sessionsDiv.appendChild(document.createElement("table")),
    thead = sessionsTable.createTHead(), // thead element
    thRow = thead.insertRow(), // trow element
    tbody = sessionsTable.createTBody(); // tbody element
    thRow.insertCell(0).innerText = "Name";
    thRow.insertCell(1).innerText = "Active";
thRow.insertCell(2).innerText = "Suspended";
sessionsTable.classList.add("table")
document.addEventListener("DOMContentLoaded", function (event) {
    firebase.database().ref('/currentMatches/' + matchKey + "/sessions").on("value", // runs on page runder
        function (snapshot) {
            updateSessionTable(snapshot.val());
            UpdateSessionsTable(snapshot.val());

        });
});
(function () {
    firebase.initializeApp(config);
    var matchIdElement = document.getElementById("ContentPlaceHolder_firebasekey");
    console.log("firebase connecting to match: " + matchIdElement.value.toString());
    matchKey = matchIdElement.value;
    var timer = setTimeout(function () { }, 0);
    if (matchIdElement !== null) {
        firebase.database().ref('/currentMatches/' + matchKey).once("value", // runs on page runder
            function (snapshot) {
                var match = snapshot.val();
                document.getElementById('team1_name').text = match['team_1']['Name'];
                document.getElementById('team2_name').text = match['team_2']['Name'];
                var team = document.getElementById('team_selector').value;
                return match;
            }).then((match) => {
                document.getElementById('btnAdd').addEventListener("click", (event) => {
                    var team = document.getElementById('team_selector').value
                    var teamName = (document.getElementById('team1_name').value === team) ?
                        document.getElementById('team1_name').innerHTML :
                        document.getElementById('team2_name').innerHTML;
                    var Over = document.getElementById('Over').value;
                    console.log(Over);
                    firebase.database().ref('/currentMatches/' + matchKey + '/sessions').push({
                        "id": "manual",
                        "name": Over + " " + teamName,
                        "yes": "",
                        "not": "",
                        "yesRate": "",
                        "notRate": "",
                        "suspended": true,
                        "active": false
                    }, function (error) {
                        if (error) alert("Session failed to be added to database");
                        else updateSessionTable(match['session']);
                    });
                });
            });
        
    }
})()

function focusNextElementOnEnterKeyPress(event) {
    if (event.keyCode === 13) {
        var sessionKey = event.srcElement.id.charAt(event.srcElement.id.length - 1);
        var elementType = event.srcElement.id.substring(0, event.srcElement.id.length - 1);
        if (elementType === "not") document.getElementById("yes" + sessionKey).focus();
        if (elementType === "yes" &&
            parseInt(document.getElementById('not' + sessionKey).value) <
            parseInt(document.getElementById('yes' + sessionKey).value)) {
            document.getElementById('notrate' + sessionKey).value = "100";
            document.getElementById('yesrate' + sessionKey).value = "100";
            document.getElementById("UpdateButton" + sessionKey).focus();
        }
        else if (elementType === "yes" &&
            document.getElementById('not' + sessionKey).value === document.getElementById('yes' + sessionKey).value) {
            document.getElementById('notrate' + sessionKey).readOnly = false;
            document.getElementById('yesrate' + sessionKey).readOnly = false;
            document.getElementById('notrate' + sessionKey).value = "110";
            document.getElementById('yesrate' + sessionKey).value = "90";
            document.getElementById("yesrate" + sessionKey).focus();
        }
        else if (elementType === "yes") document.getElementById("yesrate" + sessionKey).focus();
        if (elementType === "yesrate") document.getElementById("notrate" + sessionKey).focus();
        if (elementType === "notrate") document.getElementById("UpdateButton" + sessionKey).focus();
    }
}

function focusDeclareElementOnEnterKeyPress(event) {
    if (event.keyCode === 13) {
        document.getElementById('btnDeclear').focus();
    }
}

function UpdateSessionsTable(sessions, dataTable) {
    if (sessions) {
        console.log(sessions);
        if (typeof (sessions) === "object") {
            sessions = Object.keys(sessions).map(function (key) {
                Object.assign(sessions[key], { key: key });
                return [sessions[key]["key"], sessions[key]["name"], sessions[key]["active"], sessions[key]["suspended"]];
            });
        } else if (typeof (sessions) === "Array") {
            sessions.map(function (session) {
                return [session["id"],session["name"], session["active"], session["suspended"]]
            })
        }
        console.log(sessions);
        clearSessionsTable();
        for (i = 0; i < sessions.length; i++) {
            var row = tbody.insertRow();
            var nameCell = row.insertCell(0);
            var activeCell = row.insertCell(1)
            var suspendedCell = row.insertCell(2)
            var activeButton = activeCell.appendChild(document.createElement("a"));
            activeButton.style = (sessions[i][2]) ? "background-color:red;width:100%;height:100%;color:white;" : "background-color:green;width:100%;height:100%;color:white;";
            activeButton.innerText = (sessions[i][2]) ? "Active" : "Inactive";
            activeButton.setAttribute("sessionID", sessions[i][0]);
            activeButton.setAttribute("sessionValue", sessions[i][2]);
            activeButton.addEventListener("click", function (event) {
                console.log(activeSessionsLength);
                if (parseInt(activeSessionsLength) < 4 || (event.srcElement.getAttribute("sessionValue").toString() === "true"))
                firebase.database().ref('/currentMatches/' + matchKey + '/sessions/' + event.srcElement.getAttribute("sessionID").toString()).update({
                    active: (event.srcElement.getAttribute("sessionValue").toString() === "true") ? false : true
                    });
                else alert("Active Sessions cannot be More than 7!!")
            });
            var suspendedButton = suspendedCell.appendChild(document.createElement("a"));
            suspendedButton.style = (sessions[i][3]) ? "background-color:red;width:100%;height:100%;color:white;" : "background-color:green;width:100%;height:100%;color:white;";
            suspendedButton.innerText = (sessions[i][3]) ? "Suspended" : "Not Suspended";
            suspendedButton.setAttribute("sessionID", sessions[i][0]);
            suspendedButton.setAttribute("sessionValue", sessions[i][3]);
            suspendedButton.addEventListener("click", function (event) {
                console.log(event.srcElement.getAttribute("sessionValue").toString());
                firebase.database().ref('/currentMatches/' + matchKey + '/sessions/' + event.srcElement.getAttribute("sessionID").toString()).update({
                    suspended: (event.srcElement.getAttribute("sessionValue").toString() === "true") ? false : true
                });
            });
            nameCell.innerHTML = sessions[i][1];
        }

    }
}

function updateSessionTable(sessions) {
    if (sessions) {
        if (typeof (sessions) === "object") {
            sessions = Object.keys(sessions).map(function (key) {
                Object.assign(sessions[key], { key: key });
                return sessions[key];
            });
        }
        console.log(sessions);
        var displayableSessions = sessions.filter(function (session) { return session['active'] });
        activeSessionsLength = displayableSessions.length;
        clearSessionTable();
        for (var i = 1; i <= displayableSessions.length; i++) {
            var session = displayableSessions[i - 1];
            console.log(session);
            document.getElementById("Session" + i).value = session['name'];
            document.getElementById("UpdateButton" + i).setAttribute("customData", session['key']);
            if (session['suspended'] === false) {
                document.getElementById("not" + i).value =
                    session["not"] !== "" ? session["not"] : "0.00";
                document.getElementById("yes" + i).value =
                    session["yes"] !== "" ? session["yes"] : "0.00";
                document.getElementById("notrate" + i).value =
                    session["notRate"] !== "" ? session["notRate"] : "0.00";
                document.getElementById("yesrate" + i).value =
                    session["yesRate"] !== "" ? session["yesRate"] : "0.00";
            } else {
                document.getElementById("not" + i).value = "0.00";
                document.getElementById("yes" + i).value = "0.00";
                document.getElementById("notrate" + i).value = "0.00";
                document.getElementById("yesrate" + i).value = "0.00";
            }
        }
    }
}

function appendToSessionSelector(sessionValue) {
    var option = document.createElement("option");
    option.text = sessionValue;
    option.value = sessionValue;
    option.style = "font-size: large;";
    var select = document.getElementById("session_selector");
    select.appendChild(option);
}

function clearSessionTable() {
    for (var i = 1; i <= 4; i++) {
        document.getElementById('Session' + i).value = "";
        document.getElementById('not' + i).value = "";
        document.getElementById('yes' + i).value = "";
        document.getElementById('notrate' + i).value = "";
        document.getElementById('yesrate' + i).value = "";
    }
}

function clearSessionsTable() {
    console.log(tbody.rows.length)
    tbody.innerHTML = "";
}

function sessionTeamChanged() {
    var selector = document.getElementById('team_selector');
    // updateSessionTable(selector.value);
}

function updateSession(srcElement, sessionId) {
    var sessionKey = srcElement.getAttribute("customData");
    console.log(sessionKey);
    var Team = document.getElementById('team_selector').value;
    if (sessionKey !== "") {
        if (parseInt(document.getElementById('not' + sessionId).value) <=
            parseInt(document.getElementById('yes' + sessionId).value)) {
            firebase.database().ref('/currentMatches/' + matchKey + '/sessions/' + sessionKey).update({
                "not": document.getElementById('not' + sessionId).value,
                "yes": document.getElementById('yes' + sessionId).value,
                "notRate": toCorrectFormat(document.getElementById('notrate' + sessionId).value),
                "yesRate": toCorrectFormat(document.getElementById('yesrate' + sessionId).value)
            }).then(function () {
                document.getElementById('notrate' + sessionId).readOnly = true;
                document.getElementById('yesrate' + sessionId).readOnly = true;
                document.getElementById('not' + sessionId).focus();
                clearTimeout(timer);
                timer = setTimeout(function () {
                    console.log("Running timer");
                    firebase.database().ref('/currentMatches/' + matchKey + '/sessions/' + sessionKey).update({
                        "not": "0.00",
                        "yes": "0.00",
                        "notRate": "0.00",
                        "yesRate": "0.00"
                    })
                }, 10000)
            }).catch(function (err) {
                console.log(err);
                alert("Session Not Updated.");
            });
        } else alert("Not is greater than Yes.");
    } else {
        alert('No session key present.');
        document.getElementById('not' + sessionId).value = "";
        document.getElementById('yes' + sessionId).value = "";
        document.getElementById('notrate' + sessionId).value = "";
        document.getElementById('yesrate' + sessionId).value = "";
    }
}

function toCorrectFormat(value) {
    if (parseInt(value) === 100) return "1.00";
    var floatValue = parseFloat(value);
    floatValue /= 100;
    floatValue = (parseInt(value) % 10 === 0) ? floatValue.toString().concat('0') : floatValue.toString();
    return floatValue;
}

function declareSession() {
    var matchId = document.getElementById("ContentPlaceHolder_apiid");
    var sessionkey = document.getElementById('session_selector').value;
    var team = document.getElementById('team_selector').value;

    var params = {
        sessionKey: sessionkey,
        declareValue: document.getElementById('Declear').value,
        team: team,
        MatchID: matchId.value

    };

    var formBody = [];
    for (var property in params) {
        var encodedKey = encodeURIComponent(property);
        var encodedValue = encodeURIComponent(params[property]);
        formBody.push(encodedKey + "=" + encodedValue);
    }
    formBody = formBody.join("&");

    fetch('/PowerUser/Session.ashx', {
        credentials: 'same-origin',
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
        },
        body: formBody
    }).then(function (responce) {
        return responce.json();
    }).then(function (data) {
        console.log(data);
        if (data.status) {
            firebase.database().ref('/currentMatches/' + matchKey + '/' + team.toString() + '/Session/' + sessionkey).remove().then(function () {
                updateSessionTable(team);
            });
            alert("Declared Successfully");
        }
        else alert("Declare Rejected By server!!!");
    }).then(function () {

    }).catch(function (err) {
        console.log(err);
    });
}
function deleteSession() {

    var sessionkey = document.getElementById('session_selector1').value;
    var team = document.getElementById('team_selector').value;

    firebase.database().ref('/currentMatches/' + matchKey + '/' + team.toString() + '/Session/' + sessionkey).remove().then(function () {
        updateSessionTable(team);
    });
}
