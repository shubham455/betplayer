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
var matchIdElement = document.getElementById("ContentPlaceHolder_firebasekey");
console.log("firebase connecting to match: " + matchIdElement.value.toString());
var matchKey = matchIdElement.value;
var timer = setTimeout(function () { }, 0);
if (matchIdElement !== null) {
    firebase.database().ref('/currentMatches/'+matchKey).once("value", // runs on page runder
        function (snapshot) {
            var match = snapshot.val();
                    document.getElementById('team1_name').text = match['team_1']['Name'];
                    document.getElementById('team2_name').text = match['team_2']['Name'];
                    document.getElementById('team1_name1').text = match['team_1']['Name'];
                    document.getElementById('team2_name2').text = match['team_2']['Name'];
        }).then(() => {
            firebase.database().ref('/currentMatches/' + matchKey).on("value", // runs on page runder
                function (snapshot) {
                    var match = snapshot.val();
                    document.getElementById('minBet').value = match['minBet'];
                    document.getElementById('maxBet').value = match['maxBet'];
                    document.getElementById('sessionMinBet').value = match['sessionMinBet'];
                    document.getElementById('sessionMaxBet').value = match['sessionMaxBet'];
                })
            document.getElementById('btnteamupdate').addEventListener("click", (event) => {
                var team = document.getElementById('team_selector').value;
                var KhaiElement = document.getElementById('team_Khai');
                var LagaiElement = document.getElementById('team_Lagai');
                var Khai = parseFloat(KhaiElement.value);
                var Lagai = parseFloat(LagaiElement.value);
                console.log(Lagai < Khai);
                if (Lagai < Khai) {
                    Khai /= 100;
                    Lagai /= 100;
                    if (parseInt(KhaiElement.value) % 10 === 0) Khai = Khai.toString().concat("0");
                    if (parseInt(LagaiElement.value) % 10 === 0) Lagai = Lagai.toString().concat("0");

                    console.log(team, Khai, Lagai);
                    firebase.database().ref('/currentMatches/' + matchKey + '/' + team.toString()).update({
                        Runner: {
                            Khai: Khai.toString(),
                            Lagai: Lagai.toString()
                        }
                    }).then(function () {
                        document.getElementById('team_Lagai').value = "";
                        document.getElementById('team_Khai').value = "";
                        document.getElementById('team_Lagai').focus();
                        clearTimeout(timer);
                        timer = setTimeout(function () {
                            firebase.database().ref('/currentMatches/' + matchKey + '/' + team.toString()).update({
                                Runner: {
                                    Khai: "0.00",
                                    Lagai: "0.00"
                                }
                            })
                        }, 10000)
                    });
                    
                } else alert("Lagai is greater than Khai.");
            });
            document.getElementById('btnLock').addEventListener("click", (event) => {

                var team = document.getElementById('team_selector').value;
                firebase.database().ref('/currentMatches/' + matchKey + '/' + team).update({
                        RunnerUnLocked: false
                }).then(function () {
                    console.log("In Lock.");
                });
            });
            document.getElementById('btnUnLock').addEventListener("click", (event) => {

                var team = document.getElementById('team_selector').value;
                firebase.database().ref('/currentMatches/' + matchKey + '/' + team).update({
                    RunnerUnLocked: true
                }).then(function () {
                        console.log("In UnLock.");
                    });
            });
            document.getElementById('btnminmaxUpdate').addEventListener("click", (event) => {

                var minBet = document.getElementById('minBet').value;
                var maxBet = document.getElementById('maxBet').value;
                firebase.database().ref('/currentMatches/' + matchKey).update({
                    minBet: minBet,
                    maxBet: maxBet
                }).then(function () {
                    console.log("In UnLock.");
                });
            });
            document.getElementById('btnsessionMinMaxUpdate').addEventListener("click", (event) => {

                var minBet = document.getElementById('sessionMinBet').value;
                var maxBet = document.getElementById('sessionMaxBet').value;
                firebase.database().ref('/currentMatches/' + matchKey).update({
                    sessionMinBet: minBet,
                    sessionMaxBet: maxBet
                }).then(function () {
                    console.log("Updating Session Rate.");
                });
            });
            
        });
}
function updateScore(event) {
    var team = document.getElementById('team_selector').value
    console.log(event.srcElement.value);
    firebase.database().ref('/currentMatches/' + matchKey + '/lastBall').update(
        {
            event: event.srcElement.innerHTML
        });

}
function lagaiKeyPress(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById('team_Khai').focus();
    }
}
function khaiKeyPress(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById('btnteamupdate').focus();
    }
}
function minBetKeyPress(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById('maxBet').focus();
    }
}
function maxBetKeyPress(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById('btnminmaxUpdate').focus();
    }
}

function sessionMinBetKeyPress(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById('sessionMaxBet').focus();
    }
}
function sessionMaxBetKeyPress(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById('btnsessionMinMaxUpdate').focus();
    }
}