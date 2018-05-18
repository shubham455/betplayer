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
            for(var key of Object.keys(matches)) {
                if (matches[key]['match_id'].toString() === matchIdElement.value) {
                    match = matches[key];
                    matchKey = key;
                }
            }
            /*var team1_ast = (match.team_1.Status === "Batting") ? ' *' : '';
            var team2_ast = (match.team_2.Status === "Batting") ? ' *' : '';
            document.getElementById("LocalTeam").innerHTML = match.team_1.Name + ' ' + match.team_1.Runs
                         + '/' + match.team_1.Wickets + ' (' + match.team_1.Overs + ')' + team1_ast;
            document.getElementById("VisitorTeam").innerHTML = match.team_2.Name + ' ' + match.team_2.Runs
                         + '/' + match.team_2.Wickets + ' (' + match.team_2.Overs + ')' + team2_ast;
            document.getElementById("LastBall").innerHTML = match.lastBall.event;
            document.getElementById("Status").innerHTML = match.status;*/
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
        });

}