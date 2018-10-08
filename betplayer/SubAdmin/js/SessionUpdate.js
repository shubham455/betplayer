var config = {
    apiKey: "AIzaSyDeJEW2OK0RnL0A4OjYF6oTj04xQhgpb40",
    authDomain: "betplayer-197014.firebaseapp.com",
    databaseURL: "https://betplayer-197014.firebaseio.com",
    projectId: "betplayer-197014",
    storageBucket: "betplayer-197014.appspot.com",
    messagingSenderId: "98790187004"
};
var matchKey;
(function () {
    firebase.initializeApp(config);
    var matchIdElement = document.getElementById("ContentPlaceHolder_apiid");
    console.log("firebase connecting to match: " + matchIdElement.value.toString());
    var timer = setTimeout(function () { }, 0);
    
    if (matchIdElement !== null) {
        firebase.database().ref('/currentMatches').once("value", // runs on page runder
            function (snapshot) {
                var match,
                    matches = snapshot.val();
                
                for (var key of Object.keys(matches)) {
                    if (matches[key]['match_id'].toString() === matchIdElement.value) {
                        
                        console.log("match found with id: " + matches[key]['match_id'].toString());
                        match = matches[key];
                        matchKey = key;
                        document.getElementById('team1_name').text = matches[key]['team_1']['Name'];
                        document.getElementById('team2_name').text = matches[key]['team_2']['Name'];
                        var team = document.getElementById('team_selector').value;
                        updateSessionTable(team);
                    }
                }
            }).then(() => {
                document.getElementById('btnAdd').addEventListener("click", (event) => {
                    var team = document.getElementById('team_selector').value
                    var teamName = (document.getElementById('team1_name').value === team) ?
                        document.getElementById('team1_name').innerHTML :
                        document.getElementById('team2_name').innerHTML;
                    var Over = document.getElementById('Over').value;
                    console.log(Over);
                    firebase.database().ref('/currentMatches/' + matchKey + '/' + team.toString() + '/Session').once("value", function (snapshot) {
                        sessions = snapshot.val();
                        if (sessions === null || Object.keys(sessions).length <= 4)
                            firebase.database().ref('/currentMatches/' + matchKey + '/' + team.toString() + '/Session').child(Over + " " + teamName).set({
                                "not": "",
                                "yes": "",
                                "notRate": "",
                                "yesRate": "",
                                "created_at": new Date().getTime()
                            }, function (error) {
                                if (error) alert("Session failed to be added to database");
                                else updateSessionTable(team);
                            });
                        else alert("Session cannot be more than 4");
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
        else if (elementType === "yes")document.getElementById("yesrate" + sessionKey).focus();
        if (elementType === "yesrate") document.getElementById("notrate" + sessionKey).focus();
        if (elementType === "notrate") document.getElementById("UpdateButton" + sessionKey).focus();
    }
}

function focusDeclareElementOnEnterKeyPress(event) {
    if (event.keyCode === 13) {
        document.getElementById('btnDeclear').focus();
    }
}

function updateSessionTable(Team) {
    firebase.database().ref('/currentMatches/' + matchKey + '/' + Team.toString() + '/Session').orderByChild('created_at').once("value", function (snapshot) {
        var sessions = snapshot.val();
        if (sessions) {
            console.log(sessions);
            sessionKeys = Object.keys(sessions);
            sessionKeys.sort(function (a, b) {
                aCreatedAt = parseInt(sessions[a]['created_at']);
                bCreatedAt = parseInt(sessions[b]['created_at']);
                if (aCreatedAt < bCreatedAt) return -1;
                if (aCreatedAt > bCreatedAt) return 1;
                return 0;
            });
           
            document.getElementById("session_selector").innerHTML = "";
            clearSessionTable();
            for (var i = 1; i <= sessionKeys.length; i++) {
                var session = sessions[sessionKeys[i - 1]];
                console.log(sessionKeys[i - 1], session);
                appendToSessionSelector(sessionKeys[i - 1]);
                document.getElementById('Session' + i).value = sessionKeys[i - 1];
                document.getElementById('not' + i).value = session['not'];
                document.getElementById('yes' + i).value = session['yes'];
                document.getElementById('notrate' + i).value = session['notRate'];
                document.getElementById('yesrate' + i).value = session['yesRate'];
            }
        }
    })
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
function sessionTeamChanged() {
    var selector = document.getElementById('team_selector');
    updateSessionTable(selector.value);
}

function updateSession(sessionId) {
    var sessionKey = document.getElementById('Session' + sessionId).value;
    var Team = document.getElementById('team_selector').value;
    if (sessionKey !== "") {
        if (parseInt(document.getElementById('not' + sessionId).value) <=
            parseInt(document.getElementById('yes' + sessionId).value)) {
            firebase.database().ref('/currentMatches/' + matchKey + '/' + Team.toString() + '/Session/' + sessionKey).update({
                "not": document.getElementById('not' + sessionId).value,
                "yes": document.getElementById('yes' + sessionId).value,
                "notRate": toCorrectFormat(document.getElementById('notrate' + sessionId).value),
                "yesRate": toCorrectFormat(document.getElementById('yesrate' + sessionId).value),
            }).then(function () {
                document.getElementById('notrate' + sessionId).readOnly = true;
                document.getElementById('yesrate' + sessionId).readOnly = true;
                document.getElementById('not' + sessionId).focus();
            }).catch(function (err) {
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

