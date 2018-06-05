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
var matchIdElement = document.getElementById("ContentPlaceHolder_apiid");
console.log("firebase connecting to match: " + matchIdElement.value.toString());
var matchKey;
var timer = setTimeout(function () { }, 0);
if (matchIdElement !== null) {
    firebase.database().ref('/currentMatches').once("value", // runs on page runder
        function (snapshot) {
            var match,
                matches = snapshot.val();
            for (var key of Object.keys(matches)) {
                if (matches[key]['match_id'].toString() === matchIdElement.value) {
                    match = matches[key];
                    matchKey = key;
                    document.getElementById('team1_name').text = matches[key]['team_1']['Name'];
                    document.getElementById('team2_name').text = matches[key]['team_2']['Name'];
                    document.getElementById('team1_name1').text = matches[key]['team_1']['Name'];
                    document.getElementById('team2_name2').text = matches[key]['team_2']['Name'];

                }
            }
        }).then(() => {
            document.getElementById('btnteamupdate').addEventListener("click", (event) => {
                var team = document.getElementById('team_selector').value
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
                        });
                    clearTimeout(timer);
                    timer = setTimeout(function () {
                        firebase.database().ref('/currentMatches/' + matchKey + '/' + team.toString()).update({
                            Runner: {
                                Khai: "0.00",
                                Lagai: "0.00"
                            }
                        })
                    },10000)
                } else alert("Lagai is greater than Khai.");
            });
            document.getElementById('btnLock').addEventListener("click", (event) => {
                var emptysession = {
                    Runner: {
                        Khai: "0.00",
                        Lagai: "0.00"
                    },
                    Session: {
                        Not: "0",
                        NotRate: "0",
                        Yes: "0",
                        YesRate: "0"
                    }
                };
                firebase.database().ref('/currentMatches/' + matchKey + '/team_1').update(emptysession);
                firebase.database().ref('/currentMatches/' + matchKey + '/team_2').update(emptysession);
            });
            document.getElementById('ball_start').addEventListener("click", updateScore);
            document.getElementById('1run').addEventListener("click", updateScore);
            document.getElementById('2run').addEventListener("click", updateScore);
            document.getElementById('3run').addEventListener("click", updateScore);
            document.getElementById('four').addEventListener("click", updateScore);
            document.getElementById('six').addEventListener("click", updateScore);
            document.getElementById('wide').addEventListener("click", updateScore);
            document.getElementById('noball').addEventListener("click", updateScore);
            document.getElementById('freehit').addEventListener("click", updateScore);
            document.getElementById('wideplus4').addEventListener("click", updateScore);
            document.getElementById('timeout').addEventListener("click", updateScore);
            document.getElementById('thirdumpire').addEventListener("click", updateScore);


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
        document.getElementById('team_Khai').focus();
    }
}
function khaiKeyPress(event) {
    if (event.keyCode === 13) {
        document.getElementById('btnteamupdate').focus();
    }
}