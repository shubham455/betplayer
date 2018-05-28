// Initialize Firebase
var config = {
    apiKey: "AIzaSyDeJEW2OK0RnL0A4OjYF6oTj04xQhgpb40",
    authDomain: "betplayer-197014.firebaseapp.com",
    databaseURL: "https://betplayer-197014.firebaseio.com",
    projectId: "betplayer-197014",
    storageBucket: "betplayer-197014.appspot.com",
    messagingSenderId: "98790187004"
};
firebase.initializeApp(config);
var matchIdElement = document.getElementById("ContentPlaceHolder1_apiID");
var matchKey;
if (matchIdElement !== null) {
    firebase.database().ref('/currentMatches').once("value", // runs on page runder
        function (snapshot) {
            var match,
            matches = snapshot.val();
            for(var key of Object.keys(matches)) {
                if (matches[key]['match_id'].toString() === matchIdElement.value) {
                    match = matches[key];
                    matchKey = key;
                }
            }
            firebase.database().ref('/currentMatches/' + matchKey + "/team_1").on("value", // runs on change
                function (snapshot) {
                    var team_1 = snapshot.val();
                    var asterix = (team_1.Status === "Batting")?' *' : '';
                    console.log(team_1);
                    document.getElementById("LocalTeam").innerHTML = team_1.Name + ' ' + team_1.Runs
                        + '/' + team_1.Wickets + ' (' + team_1.Overs + ')' + asterix;
            });
            firebase.database().ref('/currentMatches/' + matchKey + "/team_2").on("value", // runs on change
                function (snapshot) {
                    var team_2 = snapshot.val();
                    var asterix = (team_2.Status === "Batting")?' *' : '';
                    console.log(team_2);
                    document.getElementById("VisitorTeam").innerHTML = team_2.Name + ' ' + team_2.Runs
                        + '/' + team_2.Wickets + ' (' + team_2.Overs + ')' + asterix;
            });
            firebase.database().ref('/currentMatches/' + matchKey + "/lastBall").on("value", // runs on change
                function (snapshot) {
                    var lastBall = snapshot.val();
                    console.log(lastBall);
                    document.getElementById("LastBall").innerHTML = lastBall.event;
            });
            firebase.database().ref('/currentMatches/' + matchKey + "/status").on("value", // runs on change
                function (snapshot) {
                    var status = snapshot.val();
                    document.getElementById("Status").innerHTML = status;
            });
            firebase.database().ref('/currentMatches/' + matchKey + "/message").on("value", // runs on change
                function (snapshot) {
                });
            firebase.database().ref('/currentMatches/' + matchKey + "/team_1/Runner").on("value", // runs on change
                function (snapshot) {
                    var runner = snapshot.val();
                    
                    document.getElementById('KRate1').value = runner.Khai;
                    document.getElementById('LRate1').value = runner.Lagai;
                    console.log(KRate1, LRate1);
                });
            firebase.database().ref('/currentMatches/' + matchKey + "/team_2/Runner").on("value", // runs on change
                function (snapshot) {
                    var runner = snapshot.val();
                    console.log("RUNNER tEAM");
                    document.getElementById('KRate2').value = runner.Khai;
                    document.getElementById('LRate2').value = runner.Lagai;
                });
        });

}
var timmerRunning = false, timer;
var team, runnerSession, betType, betValue;
var seconds = 10;
function enableBetting(event, teamValue, runnerSessionValue, betTypeValue) {
    if (event.srcElement.value === "0.00") {
        alert('No Rate Found.');
    } else if (!timmerRunning) {
        seconds = 10;
        team = teamValue; runnerSession = runnerSessionValue; betType = betTypeValue;
        betValue = event.srcElement.value;
        document.getElementById('matchAmount').disabled = false;
        document.getElementById('timerLabel').innerHTML = seconds;
        document.getElementById('timerLabel').style.visibility = "visible";
        document.getElementById('matchAmount').value = "";
        timer = setInterval(function () {
            timmerRunning = true;
            if (seconds === 0) clearTimer();
            if (seconds === 8) document.getElementById("btnSubmit").style.visibility = "visible";
            document.getElementById('timerLabel').innerHTML = seconds;
            seconds--;
        }, 1000);
    }
}

function doneClick() {
    console.log(team + " " + runnerSession + " " + betType);
    if (!matchKey) alert('No FireBase Match.');
    else {
        firebase.database().ref('/currentMatches/' + matchKey).once("value", // runs on change
            function (snapshot) {
                var match = snapshot.val();
                if (betValue !== match[team][runnerSession][betType]) {
                    alert('Bet Not Accepted Because Rate Not Found');
                    clearTimer();
                }
                else {
                    console.log(snapshot.val());

                    var TeamName = match[team]['Name'];
                    if (betType === 'Khai') { Mode= "K" }
                    else if (betType === 'Lagai') { Mode= "L" }
                    var params = {
                        Amount: document.getElementById('matchAmount').value,
                        Rate: betValue,
                        Mode: Mode,
                        Team: TeamName,
                        MatchID: matchIdElement.value,
                    };
                    

                    var formBody = [];
                    for (var property in params) {
                        var encodedKey = encodeURIComponent(property);
                        var encodedValue = encodeURIComponent(params[property]);
                        formBody.push(encodedKey + "=" + encodedValue);
                    }
                    formBody = formBody.join("&");

                    fetch('https://www.crick20.com/AddDataToLedger.ashx', {
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
                        if (data.status) alert("Bet Made Successfully");
                        else alert("Bet Rejected!!!");
                    }).then(function () {
                        clearTimer();
                    }).catch(function (err) {
                        console.log(err);
                    });
                }
            });
    }
}

function clearTimer() {
    timmerRunning = false;
    clearInterval(timer);
    document.getElementById("btnSubmit").style.visibility = "hidden";
    document.getElementById('matchAmount').disabled = true;
    document.getElementById('matchAmount').value = "0.00";
    document.getElementById('timerLabel').style.visibility = "hidden";
}