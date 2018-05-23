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
if (matchIdElement !== null) {
    firebase.database().ref('/currentMatches').once("value", // runs on page runder
        function (snapshot) {
            var match,
                matches = snapshot.val();
            for (var key of Object.keys(matches)) {
                if (matches[key]['match_id'].toString() === matchIdElement.value) {
                    match = matches[key];
                    matchKey = key;
                    document.getElementById('team_1').innerHTML = matches[key]['team_1']['Name'];
                    document.getElementById('team_2').innerHTML = matches[key]['team_2']['Name'];
                }
            }
        }).then(() => {
            document.getElementById('btnteam1update').addEventListener("click", (event) => {
                var Khai = document.getElementById('team1_Khai').value
                var Lagai = document.getElementById('team1_Lagai').value
                console.log(Khai, Lagai);
                firebase.database().ref('/currentMatches/' + matchKey + '/team_1/Runner').update({
                    Khai: Khai,
                    Lagai: Lagai
                });
            });
            document.getElementById('btnteam2update').addEventListener("click", (event) => {
                var Khai = document.getElementById('team2_Khai').value
                var Lagai = document.getElementById('team2_Lagai').value
                console.log(Khai, Lagai);
                firebase.database().ref('/currentMatches/' + matchKey + '/team_2/Runner').update({
                    Khai: Khai,
                    Lagai: Lagai
                });
            });


        });


}
