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
if (matchIdElement !== null) {
    firebase.database().ref('/currentMatches/' + matchKey).once("value", // runs on page runder
        function (snapshot) {
            var match = snapshot.val();
            document.getElementById('team1_name').text = match['team_1']['Name'];
            document.getElementById('team2_name').text = match['team_2']['Name'];
        }).then(() => {

            //Attching EventListener on Input Element   
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

            document.getElementById('btnmessage').addEventListener("click", (event) => {
                var team = document.getElementById('team_selector').value
                var message = document.getElementById('InputMessage').value
                console.log(message);
                firebase.database().ref('/currentMatches/' + matchKey).update(
                    {
                        message: message
                    });
            });
            document.getElementById('btnclearrate').addEventListener("click", (event) => {
                var emptysession = {
                    Runner: {
                        Khai: "0.00",
                        Lagai: "0.00"
                    }
                };
                firebase.database().ref('/currentMatches/' + matchKey + '/team_1').update(emptysession);
                firebase.database().ref('/currentMatches/' + matchKey + '/team_2').update(emptysession);
                firebase.database().ref('/currentMatches/' + matchKey + '/sessions').once("value", function (snapshot) {
                    var currentsessions = snapshot.val();
                    currentsessions.forEach(function (session) {
                        session['suspended'] = true;
                    });
                    firebase.database().ref('/currentMatches/' + matchKey).update({ sessions: currentsessions });
                })
            });
            firebase.database().ref('/currentMatches/' + matchKey).on("value", // runs on page runder
                function (snapshot) {
                    var match = snapshot.val();
                    var team = document.getElementById('team_selector').value;
                    document.getElementById('InputRun').value = match[team]["Runs"];
                    document.getElementById('InputWicket').value = match[team]["Wickets"];
                    document.getElementById('InputOver').value = match[team]["Overs"];
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
function updatetextvalue(event) {
    var toUpdate;
    var team = document.getElementById('team_selector').value
    console.log(event.srcElement.value);
    console.log(event.srcElement.name);
    if (event.srcElement.name === "Runs") toUpdate = { Runs: event.srcElement.value };
    else if (event.srcElement.name === "Wickets") toUpdate = { Wickets: event.srcElement.value };
    else if (event.srcElement.name === "Overs") toUpdate = { Overs: event.srcElement.value };
    firebase.database().ref('/currentMatches/' + matchKey + '/' + team.toString()).update(toUpdate);
}

function focusNextElementOnEnterKeyPress(event) {
    if (event.keyCode === 13) {
        var toUpdate;
        var team = document.getElementById('team_selector').value
        console.log(event.srcElement.value);
        console.log(event.srcElement.name);
        if (event.srcElement.name === "Runs") {
            toUpdate = { Runs: event.srcElement.value };
            document.getElementById('InputWicket').focus(); 
        }
        else if (event.srcElement.name === "Wickets") {
            toUpdate = { Wickets: event.srcElement.value };
            document.getElementById('InputOver').focus(); 
        }
        else if (event.srcElement.name === "Overs") {
            toUpdate = { Overs: event.srcElement.value };
            document.getElementById('InputRun').focus();    
        }
        firebase.database().ref('/currentMatches/' + matchKey + '/' + team.toString()).update(toUpdate);
    }
}