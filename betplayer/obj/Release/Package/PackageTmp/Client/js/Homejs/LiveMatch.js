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
            document.getElementsByClassName("ScoreCard_rtmScore")[0].innerHTML
                = '<p><span id="LocalTeam">' + match.team_1.Name + ' ' + match.team_1.Runs
                + '/' + match.team_1.Wickets + ' (' + match.team_1.Overs + ') * </span><br>' +

            '<span id="VisitorTeam">' + match.team_2.Name + ' ' + match.team_2.Runs +
                '/' + match.team_2.Wickets + ' (' + match.team_2.Overs + ') </span><br>'
                + '<span id="Status"></span><br></p>';
            firebase.database().ref('/currentMatches/' + matchKey).on("child_changed", // runs on change
                function (snapshot) {
                    console.log(snapshot.val());
                    match = snapshot.val();
                    document.getElementsByClassName("ScoreCard_rtmScore")[0].innerHTML
                        = '<p><span id="LocalTeam">' + match.team_1.Name + ' ' + match.team_1.Runs
                        + '/' + match.team_1.Wickets + ' (' + match.team_1.Overs + ') * </span><br>' +

                    '<span id="VisitorTeam">' + match.team_2.Name + ' ' + match.team_2.Runs +
                        '/' + match.team_2.Wickets + ' (' + match.team_2.Overs + ') </span><br>'
                        + '<span id="Status"></span><br></p>'
                });
        });

}