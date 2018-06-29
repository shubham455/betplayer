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
var matchIdElement = document.getElementById("ContentPlaceHolder_apiID");
if (matchIdElement !== null) {
    firebase.database().ref('/currentMatches').once("value", // runs on page runder
        function (snapshot) {
            var match, matchKey,
                matches = snapshot.val();
            for (var key of Object.keys(matches)) {
                if (matches[key]['match_id'].toString() === matchIdElement.value) {
                    match = matches[key];
                    matchKey = key;
                }
            }

            firebase.database().ref('/currentMatches/' + matchKey + "/team_1").on("value", // runs on change
                function (snapshot) {
                    var team_1 = snapshot.val();
                    var asterix = (team_1.Status === "Batting") ? ' *' : '';
                    console.log(team_1);
                    console.log(team_1.Name);
                    document.getElementById("Team1").value = team_1.sName;
                    document.getElementById("LocalTeam").innerHTML = team_1.Name + ' ' + team_1.Runs
                        + '/' + team_1.Wickets + ' (' + team_1.Overs + ')' + asterix;
                });
            firebase.database().ref('/currentMatches/' + matchKey + "/team_2").on("value", // runs on change
                function (snapshot) {
                    var team_2 = snapshot.val();
                    var asterix = (team_2.Status === "Batting") ? ' *' : '';
                    console.log(team_2);
                    document.getElementById("Team2").value = team_2.sName;
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

                });
            firebase.database().ref('/currentMatches/' + matchKey + "/team_2/Runner").on("value", // runs on change
                function (snapshot) {
                    var runner = snapshot.val();
                    console.log("RUNNER tEAM");
                    document.getElementById('KRate2').value = runner.Khai;
                    document.getElementById('LRate2').value = runner.Lagai;
                });
            firebase.database().ref('/currentMatches/' + matchKey + "/team_2/Session").on("value", // runs on change
                function (snapshot) {
                    updateSessionTable(snapshot.val());
                });
            firebase.database().ref('/currentMatches/' + matchKey + "/team_1/Session").on("value", // runs on change
                function (snapshot) {
                    updateSessionTable(snapshot.val());
                });
        });

}
function updateSessionTable(sessions) {
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
        clearSessionTable();
        for (var i = 1; i <= sessionKeys.length; i++) {
            var session = sessions[sessionKeys[i - 1]];
            console.log(sessionKeys[i - 1], session);
            document.getElementById('Session' + i).value = sessionKeys[i - 1];
            document.getElementById('not' + i).value = (session['not'] !== "") ? session['not'] : "0.00";
            document.getElementById('yes' + i).value = (session['yes'] !== "") ? session['yes'] : "0.00";
            document.getElementById('notrate' + i).value = (session['notRate'] !== "") ? session['notRate'] : "0.00";
            document.getElementById('yesrate' + i).value = (session['yesRate'] !== "") ? session['yesRate'] : "0.00";
        }
    }
}

function clearSessionTable() {
    for (var i = 1; i <= 4; i++) {
        document.getElementById('Session' + i).value = "NONE";
        document.getElementById('not' + i).value = "0.00";
        document.getElementById('yes' + i).value = "0.00";
        document.getElementById('notrate' + i).value = "0.00";
        document.getElementById('yesrate' + i).value = "0.00";
    }
}
