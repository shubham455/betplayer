<%@ Page Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="ScoreBoard.aspx.cs" Inherits="betplayer.admin.ScoreBoard" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="main-content">
        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span12">

                    <div id="theme-change" class="hidden-phone"><i class="icon-cogs"></i><span class="settings"><span class="text">Theme:</span> <span class="colors"><span class="color-default" data-style="default"></span><span class="color-gray" data-style="gray"></span><span class="color-purple" data-style="purple"></span><span class="color-navy-blue" data-style="navy-blue"></span></span></span></div>

                    <h3 class="page-title">Add Match</h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>

                        <li><a href="#">Add Match</a><span class="divider">&nbsp;</span></li>

                        <li><a href="CreateMatch.aspx"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
                    </ul>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <div class="widget">
                        <div class="widget-title">
                            <h4><i class="icon-globe"></i>Add Match</h4>
                            <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;" class="icon-remove"></a></span>
                        </div>
                        <div class="widget-body form">

                            <table>
                                <tbody>
                                    <tr>

                                        <td>

                                            <asp:CheckBox ID="ChkAutomatic" AutoPostBack="true" Width="150px" runat="server" Text="Automatic" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="ChkManual" AutoPostBack="true" Width="150px" runat="server" Text="Manual" />
                                        </td>
                                        <td>
                                            <select name="ctl00$ContentPlaceHolder$DropStatus" id="team_selector" class="btn btn-primary dropdown-toggle" style="width: 200px;">
                                                <option id="team1_name" value="team_1">Team1</option>
                                                <option id="team2_name" value="team_2">Team2</option>
                                            </select>
                                        </td>
                                        <td>
                                            <button id="btnclearrate" type="button" class="btn btn-success" style="height: 50px; width: 100px; font-size: large;">Clear Rates</button>

                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <br />
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <p style="font-size: large; font: 100">Score Board</p>
                                        </td>
                                        <td>
                                            <input id="InputRun" type="text" name="Runs" value="" onkeydown="return focusOnNext(event, 'jsTxt2')" placeholder="Run">
                                        </td>
                                        <td>
                                            <input id="InputWicket" type="text" name="Wickets" value="" onkeydown="return focusOnNext(event, 'jsTxt3')" placeholder="Wicket">
                                        </td>
                                        <td>
                                            <input id="InputOver" type="text" name="Overs" value="" placeholder="Over">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <p style="font-size: large; font: 100; margin-right: 25px;" class="welcome">Message</p>
                                        </td>
                                        <td>
                                            <textarea id="InputMessage" name="Message" style="width: 620px;"></textarea>
                                        </td>
                                        <td></td>
                                        <td>
                                            <button id="btnmessage" type="button" class="btn btn-success" style="height: 50px; width: 100px; font-size: large;">Update</button>

                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                             <div class="widget-body form">
                                <table>
                                    <tr>
                                        <td>
                                            <button id="ball_start" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">Ball Start</button>
                                        </td>
                                        <td>
                                            <button id="1run" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">1 Run</button>
                                        </td>
                                        <td>
                                            <button id="2run" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">2 Run</button>
                                        </td>
                                        <td>
                                            <button id="3run" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">3 Run</button>
                                        </td>
                                        <td>
                                            <button id="four" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">FOUR</button>
                                        </td>
                                        <td>
                                            <button id="six" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">SIX</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="widget-body form">
                                <table>
                                    <tr>
                                        <td>
                                            <button id="wide" type="button" class="btn btn-success"style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">WIDE</button>
                                        </td>
                                        <td>
                                            <button id="noball" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">NO BALL</button>
                                        </td>
                                        <td>
                                            <button id="freehit" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">FREE HIT</button>
                                        </td>
                                        <td>
                                            <button id="wideplus4" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">WIDE+4</button>
                                        </td>
                                         <td>
                                            <button id="timeout" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">Timeout</button>
                                        </td>
                                        <td>
                                            <button id="thirdumpire" type="button" class="btn btn-success" style="height: 70px; width: 120px; font-size: x-large;font-weight:bold; color:black">Third Umpire</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div class="form-actions">
                                <asp:Button ID="btnsave" runat="server" class="btn btn-success" Text="Add" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="apiid" runat="server" />
    <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
    <script src="js/ManualMatch.js"></script>
    <script lang="javascript">
function Tab()
{
    var tb1=document.getElementById(InputWicket);
        tb1.focus();
}

</script>
    <script src="jquery.js" type="text/javascript"></script>
 

    <script type="text/javascript"  lang="js">

        $(function()

        {

               $("input[type=text]").keypress(function(){

                  alert("Wow; Its Work!.")

               

           });

                    });

    </script>
    function focusOnNext(e, nextControl) {
            alert(e.keyCode);
            if (e.keyCode == 13) {
                $("." + nextControl).focus();
                return false;
            }
            
        }


</asp:Content>
