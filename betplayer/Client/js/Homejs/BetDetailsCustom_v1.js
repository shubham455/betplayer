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
var matchIdElement = document.getElementById("ContentPlaceHolder1_firebasekey");
var matchKey = matchIdElement.value;
var sessions, lastBall;
if (matchIdElement !== null) {
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/team_1")
        .on(
            "value", // runs on change
            function (snapshot) {
                var team_1 = snapshot.val();
                var asterix = team_1.Status === "Batting" ? " *" : "";
                console.log(team_1);
                document.getElementById("LocalTeam").innerHTML =
                    team_1.Name +
                    " " +
                    team_1.Runs +
                    "/" +
                    team_1.Wickets +
                    " (" +
                    team_1.Overs +
                    ")" +
                    asterix;
                var runner = team_1.Runner;
                if (document.getElementById("KRate1").value !== runner.Khai.toString()) {
                    document.getElementById("KRate1").parentElement.className = "flash"
                    setTimeout(function () {
                        document.getElementById("KRate1").parentElement.className = ""
                    }, 500)
                }
                if (document.getElementById("LRate1").value !== runner.Lagai.toString()) {
                    document.getElementById("LRate1").parentElement.className = "flash"
                    setTimeout(function () {
                        document.getElementById("LRate1").parentElement.className = ""
                    }, 500)
                }
                document.getElementById("KRate1").value = (team_1.RunnerUnLocked || !team_1.hasOwnProperty("RunnerUnLocked")) ? runner.Khai.toString() : "0.00";
                document.getElementById("LRate1").value = (team_1.RunnerUnLocked || !team_1.hasOwnProperty("RunnerUnLocked")) ? runner.Lagai.toString() : "0.00";
                if (team_1.RunnerUnLocked || !team_1.hasOwnProperty("RunnerUnLocked")) {
                    document.getElementById("runnerfloat1").style = "display:none;";
                    document.getElementById("runnerfloat1").innerHTML = "";
                } else {
                    document.getElementById("runnerfloat1").style = "display:block;";
                    document.getElementById("runnerfloat1").innerHTML = "Suspended";
                }
            }
        );
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/team_2")
        .on(
            "value", // runs on change
            function (snapshot) {
                var team_2 = snapshot.val();
                var asterix = team_2.Status === "Batting" ? " *" : "";
                console.log(team_2);
                document.getElementById("VisitorTeam").innerHTML =
                    team_2.Name +
                    " " +
                    team_2.Runs +
                    "/" +
                    team_2.Wickets +
                    " (" +
                    team_2.Overs +
                    ")" +
                    asterix;
                var runner = team_2.Runner;
                if (document.getElementById("KRate2").value !== runner.Khai.toString()) {
                    document.getElementById("KRate2").parentElement.className = "flash"
                    setTimeout(function () {
                        document.getElementById("KRate2").parentElement.className = ""
                    }, 500)
                }
                if (document.getElementById("LRate2").value !== runner.Lagai.toString()) {
                    document.getElementById("LRate2").parentElement.className = "flash"
                    setTimeout(function () {
                        document.getElementById("LRate2").parentElement.className = ""
                    }, 500)
                }
                document.getElementById("KRate2").value = (team_2.RunnerUnLocked || !team_2.hasOwnProperty("RunnerUnLocked")) ? runner.Khai.toString() : "0.00";
                document.getElementById("LRate2").value = (team_2.RunnerUnLocked || !team_2.hasOwnProperty("RunnerUnLocked")) ? runner.Lagai.toString() : "0.00";
                if (team_2.RunnerUnLocked || !team_2.hasOwnProperty("RunnerUnLocked")) {
                    document.getElementById("runnerfloat2").style = "display:none;";
                    document.getElementById("runnerfloat2").innerHTML = "";
                } else {
                    document.getElementById("runnerfloat2").style = "display:block;";
                    document.getElementById("runnerfloat2").innerHTML = "Suspended";
                }
              
        });
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/team_c")
        .on(
            "value", // runs on change
            function (snapshot) {
                var team_c = snapshot.val();
                var runner = team_c.Runner;
                if (document.getElementById("KRate3").value !== runner.Khai.toString()) {
                    document.getElementById("KRate3").parentElement.className = "flash"
                    setTimeout(function () {
                        document.getElementById("KRate3").parentElement.className = ""
                    }, 500)
                }
                if (document.getElementById("LRate3").value !== runner.Lagai.toString()) {
                    document.getElementById("LRate3").parentElement.className = "flash"
                    setTimeout(function () {
                        document.getElementById("LRate3").parentElement.className = ""
                    }, 500)
                }
                document.getElementById("KRate3").value = (team_c.RunnerUnLocked || !team_c.hasOwnProperty("RunnerUnLocked")) ? runner.Khai.toString() : "0.00";
                document.getElementById("LRate3").value = (team_c.RunnerUnLocked || !team_c.hasOwnProperty("RunnerUnLocked")) ? runner.Lagai.toString() : "0.00";
                if (team_c.RunnerUnLocked || !team_c.hasOwnProperty("RunnerUnLocked")) {
                    document.getElementById("runnerfloat2").style = "display:none;";
                    document.getElementById("runnerfloat2").innerHTML = "";
                } else {
                    document.getElementById("runnerfloat2").style = "display:block;";
                    document.getElementById("runnerfloat2").innerHTML = "Suspended";
                }

            });
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/message")
        .on(
            "value", // runs on change
            function (snapshot) {
                message = snapshot.val();
                console.log(ScoreMsg);
                document.getElementById("ScoreMsg").innerHTML = message;
                
            }
    );
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/lastBall")
        .on(
            "value", // runs on change
            function (snapshot) {
                lastBall = snapshot.val();
                console.log(lastBall);
                document.getElementById("LastBall").src = "/client/images/LastBall/"+lastBall.event.replace(" ","_")+".jpg";
                ballRunning();
                if (!(lastBall.event === "Ball Start" || lastBall.event === "3 Run" || lastBall.event === "FOUR" || lastBall.event === "SIX" || lastBall.event === "Review" || lastBall.event === "Third Umpire" || lastBall.event === "OUT" || lastBall.event === "FREE HIT" || lastBall.event === "NO BALL"))
                    for (var i = 1; i <= 8; i++) {
                    document.getElementById("runnerfloat1").style = "display:none;";
                    document.getElementById("float" + i).innerHTML = ""
                }
                updateSessionTable(sessions);
            }
        );
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/status")
        .on(
            "value", // runs on change
            function (snapshot) {
                var status = snapshot.val();
                document.getElementById("Status").innerHTML = status;
            }
        );
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/message")
        .on(
            "value", // runs on change
            function (snapshot) { }
        );
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/minBet")
        .on(
            "value", // runs on change
            function (snapshot) {
                var min = snapshot.val();
                firebase
                    .database()
                    .ref("/currentMatches/" + matchKey + "/maxBet")
                    .on(
                        "value", // runs on change
                    function (snapshot) {
                            document.getElementById("matchMaxBet").innerHTML = min + " / " + snapshot.val();
                            document.getElementById("matchMinBet").innerHTML = min + " / " + snapshot.val();
                            
                        });
            });
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/sessionMinBet")
        .on(
            "value", // runs on change
            function (snapshot) {
                var min = snapshot.val();
                firebase
                    .database()
                    .ref("/currentMatches/" + matchKey + "/sessionMaxBet")
                    .on(
                        "value", // runs on change
                    function (snapshot) {
                        for (var j = 1; j <= 8; j++) {
                            document.getElementById("maxmin" + j).innerHTML = min + " / " + snapshot.val();
                            document.getElementById("maxmin" + j).innerHTML = min + " / " + snapshot.val();
                            }
                        });
            });
    firebase
        .database()
        .ref("/currentMatches/" + matchKey + "/sessions")
        .on(
            "value", // runs on change
        function (snapshot) {
                sessions = snapshot.val();
                updateSessionTable(snapshot.val());
            }
        );
}
var timmerRunning = false,
    doneClicked = false,
    timer;
var team, runnerSession, betType, betValue, betRate, betAmount, Session;
var seconds = 10;
function enableBetting(event, teamValue, runnerSessionValue, betTypeValue) {
    if (event.srcElement.value === "0.00") {
        alert("No Rate Found.");
    } else if (!timmerRunning) {
        seconds = 10;
        team = teamValue;
        runnerSession = runnerSessionValue;
        betType = betTypeValue;
        betValue = event.srcElement.value;
        var elementId = event.srcElement.id;
        if (runnerSessionValue === "Session") {
            betRate = document.getElementById(
                elementId.substring(0, event.srcElement.id.length - 1) +
                "rate" +
                elementId.charAt(event.srcElement.id.length - 1)
            ).value;
            Session = document.getElementById(
                "Session" + elementId.charAt(event.srcElement.id.length - 1)
            ).innerHTML;
        }
        document.getElementById("matchAmount").disabled = false;
        document.getElementById("timerLabel").innerHTML = seconds;
        document.getElementById("timerLabel").style.visibility = "visible";
        matchAmountInput = document.getElementById("matchAmount");
        matchAmountInput.value = "";
        matchAmountInput.focus();
        timer = setInterval(function () {
            timmerRunning = true;
            if (seconds === 0) clearTimer();
            if (seconds === 8)
                document.getElementById("btnSubmit").style.visibility = "visible";
            document.getElementById("timerLabel").innerHTML = seconds;
            seconds--;
        }, 1000);
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
        clearSessionTable();
        for (var i = 1; i <= displayableSessions.length; i++) {
            var session = displayableSessions[i - 1];
            console.log(session);
            document.getElementById("Session" + i).innerHTML = session['name'];
            if (session['manualLocked'] === true) {
                document.getElementById("float" + i).innerHTML = "Ball Running.";
                document.getElementById("float" + i).style = "display:block;";
                document.getElementById("not" + i).value = "0.00";
                document.getElementById("yes" + i).value = "0.00";
                document.getElementById("notrate" + i).value = "0.00";
                document.getElementById("yesrate" + i).value = "0.00";
            } else {
                if (session['suspended'] === false) {
                    document.getElementById("float" + i).style = "";
                    document.getElementById("not" + i).value =
                        session["not"] !== "" ? session["not"] : "0.00";
                    document.getElementById("yes" + i).value =
                        session["yes"] !== "" ? session["yes"] : "0.00";
                    document.getElementById("notrate" + i).value =
                        session["notRate"] !== "" ? session["notRate"] : "0.00";
                    document.getElementById("yesrate" + i).value =
                        session["yesRate"] !== "" ? session["yesRate"] : "0.00";
                } else {
                    document.getElementById("float" + i).innerHTML = "Suspended.";
                    document.getElementById("float" + i).style = "display:block;";
                    document.getElementById("not" + i).value = "0.00";
                    document.getElementById("yes" + i).value = "0.00";
                    document.getElementById("notrate" + i).value = "0.00";
                    document.getElementById("yesrate" + i).value = "0.00";
                }
            }
        }
        ballRunning();
    }
}

function ballRunning() {
    // var displayableSessions = sessions.filter(function (session) { return session['active'] });
    if (lastBall.event === "Ball Start" || lastBall.event === "3 Run" || lastBall.event === "FOUR" || lastBall.event === "SIX" || lastBall.event === "Review" || lastBall.event === "Third Umpire" || lastBall.event === "OUT" || lastBall.event === "FREE HIT" || lastBall.event === "NO BALL")
        for (var i = 1; i <= 8; i++) {
            document.getElementById("float" + i).style = "display:block;";
            document.getElementById("float" + i).innerHTML = "Ball Running."
        }
    // for (var i = 1; i <= displayableSessions.length; i++)
    // if (displayableSessions[i - 1]['manualLocked'] === true)
}

function clearSessionTable() {
    for (var i = 1; i <= 4; i++) {
        document.getElementById("Session" + i).value = "NONE";
        document.getElementById("not" + i).value = "0.00";
        document.getElementById("yes" + i).value = "0.00";
        document.getElementById("notrate" + i).value = "0.00";
        document.getElementById("yesrate" + i).value = "0.00";
    }
}

function doneClick() {
    var isballstart = (document.getElementById("LastBall").innerHTML === "Ball Start") ? true : false;
    if (isballstart) {
        alert("Can not place bet during the ball start");
    }
    if (!doneClicked && !isballstart) {
        console.log(team + " " + runnerSession + " " + betType);
        if (runnerSession === "Runner") {
            if (!matchKey) alert("No FireBase Match.");
            else {
                doneClicked = true;
                betAmount = parseInt(
                    document.getElementById("matchAmount").value
                );
                firebase
                    .database()
                    .ref("/currentMatches/" + matchKey)
                    .once(
                        "value", // runs on change
                        function (snapshot) {
                            var match = snapshot.val();
                            console.log(betValue);
                            if (betValue !== match[team][runnerSession][betType]) {
                                alert("Bet Not Accepted Because Rate Not Found");
                                clearTimer();
                            } else if (parseInt(match['minBet']) > betAmount || betAmount > parseInt(match['maxBet'])) {
                                alert(
                                    "The Amount Should not be less than " + match['minBet'] + " or greater than " + match['maxBet']+"."
                                );
                                clearTimer();
                            } else {
                                console.log(snapshot.val());
                                updatePosition(betValue, betAmount, team, betType);
                                var TeamName = match[team]["Name"];
                                if (betType === "Khai") {
                                    Mode = "K";
                                } else if (betType === "Lagai") {
                                    Mode = "L";
                                }
                                var apiid = document.getElementById("ContentPlaceHolder1_apiID");
                                var params = {
                                    Amount: betAmount,
                                    Rate: betValue,
                                    Mode: Mode,
                                    Team: TeamName,
                                    MatchID: apiid.value,

                                    Team1Position: document.getElementById(
                                        "ContentPlaceHolder1_PositionTeam1"
                                    ).innerHTML,
                                    Team2Position: document.getElementById(
                                        "ContentPlaceHolder1_PositionTeam2"
                                    ).innerHTML,
                                    TeamcPosition: document.getElementById(
                                        "ContentPlaceHolder1_PositionTeam3"
                                    ).innerHTML
                                };
                                var formBody = [];
                                for (var property in params) {
                                    var encodedKey = encodeURIComponent(property);
                                    var encodedValue = encodeURIComponent(params[property]);
                                    formBody.push(encodedKey + "=" + encodedValue);
                                }
                                formBody = formBody.join("&");

                                fetch("/Client/AddDataToRunner.ashx", {
                                    credentials: "same-origin",
                                    method: "POST",
                                    headers: {
                                        "Content-Type":
                                            "application/x-www-form-urlencoded;charset=UTF-8"
                                    },
                                    body: formBody
                                })
                                    .then(function (responce) {
                                        return responce.json();
                                    })
                                    .then(function (data) {
                                        console.log(data);
                                        if (data.status === "success") {
                                            console.log(betValue, betAmount, team, betType);
                                            alert("Bet Made Successfully");
                                            location.reload();
                                        } else if (data.status === "unsuccess") {
                                            alert("You Do not have Coins For this Bet");
                                            location.reload();
                                        } else alert("Bet Rejected!!!");
                                    })
                                    .then(function () {
                                        clearTimer();
                                    })
                                    .catch(function (err) {
                                        console.log(err);
                                    });
                            }
                        }
                    );
            }
        } else if (runnerSession === "Session" && !isballstart) {
            if (!matchKey) alert("No FireBase Match.");
            else {
                doneClicked = true;
                firebase
                    .database()
                    .ref("/currentMatches/" + matchKey)
                    .once(
                        "value", // runs on change
                        function (snapshot) {
                            var match = snapshot.val();
                            console.log(betValue);
                            betAmount = parseInt(
                                document.getElementById("matchAmount").value
                            );
                            if (parseInt(match['sessionMinBet']) > betAmount || betAmount > parseInt(match['sessionMaxBet'])) {
                                alert(
                                    "The Amount Should not be less than " + match['sessionMinBet'] + " or greater than " + match['sessionMaxBet']+"."
                                );
                                clearTimer();
                            } else {
                                console.log(snapshot.val());
                                updatePosition(betValue, betAmount, team, betType);
                                var TeamName = match[team]["Name"];
                                if (betType === "Not") {
                                    Mode = "N";
                                } else if (betType === "Yes") {
                                    Mode = "Y";
                                }
                                var apiid = document.getElementById("ContentPlaceHolder1_apiID");
                                var params = {
                                    Session: Session,
                                    Amount: betAmount,
                                    Run: betValue,
                                    Rate: betRate,
                                    Mode: Mode,
                                    Team: TeamName,
                                    MatchID: apiid.value
                                };
                                var formBody = [];
                                for (var property in params) {
                                    var encodedKey = encodeURIComponent(property);
                                    var encodedValue = encodeURIComponent(params[property]);
                                    formBody.push(encodedKey + "=" + encodedValue);
                                }
                                formBody = formBody.join("&");

                                fetch("/Client/AddDataToSession.ashx", {
                                    credentials: "same-origin",
                                    method: "POST",
                                    headers: {
                                        "Content-Type":
                                            "application/x-www-form-urlencoded;charset=UTF-8"
                                    },
                                    body: formBody
                                })
                                    .then(function (responce) {
                                        return responce.json();
                                    })
                                    .then(function (data) {
                                        console.log(data);
                                        if (data.status === "success") {
                                            console.log(betValue, betAmount, team, betType);
                                            alert("Bet Made Successfully");
                                            location.reload();
                                        } else if (data.status === "unsuccess") {
                                            alert("You Do not have Coins For this Bet");
                                        } else alert("Bet Rejected!!!");
                                    })
                                    .then(function () {
                                        clearTimer();
                                    })
                                    .catch(function (err) {
                                        console.log(err);
                                    });
                            }
                        }
                    );
            }
        }
    }
}

function clearTimer() {
    timmerRunning = false;
    doneClicked = false;
    clearInterval(timer);
    document.getElementById("btnSubmit").style.visibility = "hidden";
    document.getElementById("matchAmount").disabled = true;
    document.getElementById("matchAmount").value = "0.00";
    document.getElementById("timerLabel").style.visibility = "hidden";
}

function updatePosition(Bet, Amount, Team, Type) {
    var urlParams = new URLSearchParams(window.location.search);
    var matchtype = urlParams.get('Type');
    if (matchtype === "Test" || matchtype === "test" ) {
        var bet = parseFloat(Bet);
        var amount = parseInt(Amount);
        Team1Position = document.getElementById("ContentPlaceHolder1_PositionTeam1");
        Team2Position = document.getElementById("ContentPlaceHolder1_PositionTeam2");
        TeamcPosition = document.getElementById("ContentPlaceHolder1_PositionTeam3");

        Team1PositionValue =
            Team1Position.innerHTML === "" ? 0 : parseInt(Team1Position.innerHTML);
        Team2PositionValue =
            Team2Position.innerHTML === "" ? 0 : parseInt(Team2Position.innerHTML);
        TeamcPositionValue =
            TeamcPosition.innerHTML === "" ? 0 : parseInt(TeamcPosition.innerHTML);
        console.log(Team1PositionValue, Team2PositionValue, bet, amount);
        if (Team === "team_1" && Type === "Lagai") {
            Team1Position.innerHTML = Team1PositionValue + bet * amount;
            Team2Position.innerHTML = Team2PositionValue + -1 * amount;
            TeamcPosition.innerHTML = TeamcPositionValue + -1 * amount;
        } else if (Team === "team_1" && Type === "Khai") {
            Team1Position.innerHTML = Team1PositionValue - bet * amount;
            Team2Position.innerHTML = Team2PositionValue - -1 * amount;
            TeamcPosition.innerHTML = TeamcPositionValue - -1 * amount;
        } else if (Team === "team_2" && Type === "Lagai") {
            Team1Position.innerHTML = Team1PositionValue + -1 * amount;
            Team2Position.innerHTML = Team2PositionValue + bet * amount;
            TeamcPosition.innerHTML = TeamcPositionValue + bet * amount;
        } else if (Team === "team_2" && Type === "Khai") {
            Team1Position.innerHTML = Team1PositionValue - -1 * amount;
            Team2Position.innerHTML = Team2PositionValue - bet * amount;
            TeamcPosition.innerHTML = TeamcPositionValue - bet * amount;
        } else if (Team === "team_c" && Type === "Lagai") {
            TeamcPosition.innerHTML = TeamcPositionValue + -1 * amount;
            Team1Position.innerHTML = Team1PositionValue + bet * amount;
            Team2Position.innerHTML = Team2PositionValue + bet * amount;
        } else if (Team === "team_c" && Type === "Khai") {
            TeamcPosition.innerHTML = TeamcPositionValue - -1 * amount;
            Team1Position.innerHTML = Team1PositionValue - bet * amount;
            Team2Position.innerHTML = Team2PositionValue - bet * amount;
        }
    }
    else {
        var bet = parseFloat(Bet);
        var amount = parseInt(Amount);
        Team1Position = document.getElementById("ContentPlaceHolder1_PositionTeam1");
        Team2Position = document.getElementById("ContentPlaceHolder1_PositionTeam2");


        Team1PositionValue =
            Team1Position.innerHTML === "" ? 0 : parseInt(Team1Position.innerHTML);
        Team2PositionValue =
            Team2Position.innerHTML === "" ? 0 : parseInt(Team2Position.innerHTML);
        console.log(Team1PositionValue, Team2PositionValue, bet, amount);
        if (Team === "team_1" && Type === "Lagai") {
            Team1Position.innerHTML = Team1PositionValue + bet * amount;
            Team2Position.innerHTML = Team2PositionValue + -1 * amount;
        } else if (Team === "team_1" && Type === "Khai") {
            Team1Position.innerHTML = Team1PositionValue - bet * amount;
            Team2Position.innerHTML = Team2PositionValue - -1 * amount;
        } else if (Team === "team_2" && Type === "Lagai") {
            Team1Position.innerHTML = Team1PositionValue + -1 * amount;
            Team2Position.innerHTML = Team2PositionValue + bet * amount;
        } else if (Team === "team_2" && Type === "Khai") {
            Team1Position.innerHTML = Team1PositionValue - -1 * amount;
            Team2Position.innerHTML = Team2PositionValue - bet * amount;
        }
    }
}
