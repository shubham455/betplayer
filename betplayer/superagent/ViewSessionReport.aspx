<%@ Page Language="C#" MasterPageFile="~/superagent/DashBoard.Master" AutoEventWireup="true" CodeBehind="ViewSessionReport.aspx.cs" Inherits="betplayer.superagent.ViewSessionReport" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div id="main-content">
        <!-- BEGIN PAGE CONTAINER-->
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN THEME CUSTOMIZER-->
                    <div id="theme-change" class="hidden-phone"><i class="icon-cogs"></i><span class="settings"><span class="text">Theme:</span> <span class="colors"><span class="color-default" data-style="default"></span><span class="color-gray" data-style="gray"></span><span class="color-purple" data-style="purple"></span><span class="color-navy-blue" data-style="navy-blue"></span></span></span></div>
                    <!-- END THEME CUSTOMIZER-->
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">Match Bet Details
  <small></small></h3>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
                        <li>Sport's Betting <span class="divider">&nbsp;</span> </li>
                        <li>Match &amp; Session Plus Minus Selection<span class="divider">&nbsp;</span></li>
                        <li><a href="SportDetails.php"><span style="color: #00F;"><strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN ADVANCED TABLE widget-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN EXAMPLE TABLE widget-->
                    <div class="widget">
                        <div class="widget-body form">

                            <!-- BEGIN FORM-->
                            <form name="BetPlayer" id="BetPlayer" method="post" action="ViewSessionReport.php" autocomplete="off">

                                <div class="portlet-body">
                                    <div class="clearfix">
                                    </div>
                                    <div class="space15"></div>

                                </div>
                                <table width="100%" border="0" cellspacing="2" cellpadding="2" class="table table-striped table-hover table-bordered">
                                    <tbody>
                                        <tr class="MainHeading">
                                            <td width="103" height="35" align="left" valign="middle" class="MainHeading1 textTeamHead">CLIENT</td>
                                            <td width="220" align="left" valign="middle" class="MainHeading1 textTeamHead">
                                                <select name="ClientName" id="ClientName">
                                                    <option value="ALL">All Clients</option>
                                                    <option value="2864 TK JI">2864 TK JI	                        </option>
                                                    <option value="3052 SLEEP BABU">3052 SLEEP BABU	                        </option>
                                                    <option value="3053 RAMESH BABU">3053 RAMESH BABU	                        </option>
                                                    <option value="3832 T K 2">3832 T K 2	                        </option>
                                                    <option value="3864 THAKUR SD">3864 THAKUR SD	                        </option>
                                                    <option value="4421 BHOLA">4421 BHOLA	                        </option>
                                                    <option value="4495 DC 2">4495 DC 2	                        </option>
                                                    <option value="4613 SHISHANK">4613 SHISHANK	                        </option>
                                                    <option value="5522 RINKU">5522 RINKU	                        </option>
                                                    <option value="5878 BANTI DISK">5878 BANTI DISK	                        </option>
                                                    <option value="600 SULTAN">600 SULTAN	                        </option>
                                                    <option value="6180 GULSHAN">6180 GULSHAN	                        </option>
                                                    <option value="6461 ASHOK BINA PATT">6461 ASHOK BINA PATT	                        </option>
                                                    <option value="707 NITIN">707 NITIN	                        </option>
                                                    <option value="7651 RAJAU RAJA U">7651 RAJAU RAJA U	                        </option>
                                                    <option value="8755 CHINU">8755 CHINU	                        </option>
                                                    <option value="8757 RAVI C">8757 RAVI C	                        </option>
                                                    <option value="8760 LALU">8760 LALU	                        </option>
                                                    <option value="8770 LUCKY">8770 LUCKY	                        </option>
                                                    <option value="8846 ANNU">8846 ANNU	                        </option>
                                                    <option value="8973 DADA">8973 DADA	                        </option>
                                                    <option value="9005 PYAREJI">9005 PYAREJI	                        </option>
                                                    <option value="9007 KRISHNAJI">9007 KRISHNAJI	                        </option>
                                                    <option value="9013 LUCCKY">9013 LUCCKY	                        </option>
                                                    <option value="9014 POWER">9014 POWER	                        </option>
                                                    <option value="9018 ANGUTHI">9018 ANGUTHI	                        </option>
                                                    <option value="9029 PTKJI">9029 PTKJI	                        </option>
                                                    <option value="9041 HARIOMJI">9041 HARIOMJI	                        </option>
                                                    <option value="9062 PRAMOD">9062 PRAMOD	                        </option>
                                                    <option value="9074 RADHEY">9074 RADHEY	                        </option>
                                                    <option value="9106 VICKY">9106 VICKY	                        </option>
                                                    <option value="9113 SHARAD ">9113 SHARAD 	                        </option>
                                                    <option value="946 RAVI NITIN">946 RAVI NITIN	                        </option>
                                                    <option value="9551 TOMAR">9551 TOMAR	                        </option>
                                                    <option value="9594 RAJ R">9594 RAJ R	                        </option>
                                                    <option value="9599 RINKU">9599 RINKU	                        </option>
                                                    <option value="9611 CC">9611 CC	                        </option>
                                                    <option value="9622 LAKHAN">9622 LAKHAN	                        </option>
                                                    <option value="9676 BHOLEY">9676 BHOLEY	                        </option>
                                                    <option value="9688 SHIVAMS">9688 SHIVAMS	                        </option>
                                                    <option value="9729 KAPOOR">9729 KAPOOR	                        </option>
                                                </select></td>
                                            <td width="100" height="35" align="left" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
                                            <td width="121" height="35" align="center" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
                                            <td width="174" align="left" valign="middle" class="MainHeading1 textTeamHead">&nbsp;</td>
                                        </tr>
                                        <tr class="MainHeading">
                                            <td height="35" align="left" valign="middle" class="MainHeading1 textTeamHead">SESSION</td>
                                            <td align="left" valign="middle" class="MainHeading1">
                                                <select name="SessionName" id="SessionName" onkeypress="return SetFocusSession(event,this.name)">
                                                    <option value="15 over-Essex 14-06">15 over-Essex 14-06	                      </option>
                                                    <option value="10  over-Essex 14-06" selected="selected">10  over-Essex 14-06	                      </option>
                                                    <option value="50 over lambi-Yorkshire 14-06">50 over lambi-Yorkshire 14-06	                      </option>
                                                    <option value="40 OVER-Yorkshire 14-06">40 OVER-Yorkshire 14-06	                      </option>
                                                    <option value="35 OVER-Yorkshire 14-06">35 OVER-Yorkshire 14-06	                      </option>
                                                    <option value="30 OVER-Yorkshire 14-06">30 OVER-Yorkshire 14-06	                      </option>
                                                    <option value="20 OVER-Yorkshire 14-06">20 OVER-Yorkshire 14-06	                      </option>
                                                    <option value="10 over-Yorkshire 14-06">10 over-Yorkshire 14-06	                      </option>
                                                </select></td>
                                            <td align="center" valign="middle" style="text-align: center">
                                                <button type="button" class="btn btn-success" onclick="ViewSession()">View</button>
                                            </td>
                                            <td width="17" align="center" valign="middle" class="MainHeading1 textTeamHead" style="color: #F00"><strong>0.00</strong></td>
                                            <td width="13" align="left" valign="middle" class="MainHeading"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>

                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td valign="top">
                                                <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td width="2%" align="center" class="TableHeadingCheckBox">&nbsp;</td>
                                                            <td height="25" align="left" class="TableHeading">Sr.</td>
                                                            <td align="left" class="TableHeading">Session </td>
                                                            <td align="left" class="TableHeading">Client</td>
                                                            <td align="right" class="TableHeading">Rate</td>
                                                            <td align="right" class="TableHeading">Amount</td>
                                                            <td align="right" class="TableHeading">Runs</td>
                                                            <td align="center" class="TableHeading">Mode</td>
                                                            <td align="right" class="TableHeading">No</td>
                                                            <td align="right" class="TableHeading">Yes</td>
                                                            <td align="left" class="TableHeading">Date &amp; Time</td>
                                                            <td align="left" class="TableHeading">User Name</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3467&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3467&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3467</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">4421 BHOLA</td>
                                                            <td align="right" class="FontText">0.7500</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">32</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-750.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:08:42</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3461&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3461&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3461</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">3053 RAMESH BABU</td>
                                                            <td align="right" class="FontText">1.2500</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">32</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">1250.00</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:08:37</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3451&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3451&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3451</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9014 POWER</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">3000.00</td>
                                                            <td align="right" class="FontText">35</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-3000.00</td>
                                                            <td align="right" class="FontText">3000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:06:59</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3448&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3448&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3448</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8846 ANNU</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">3500.00</td>
                                                            <td align="right" class="FontText">35</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-3500.00</td>
                                                            <td align="right" class="FontText">3500.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:06:56</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3438&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3438&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3438</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9106 VICKY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">4000.00</td>
                                                            <td align="right" class="FontText">32</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-4000.00</td>
                                                            <td align="right" class="FontText">4000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:06:21</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3436&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3436&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3436</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9041 HARIOMJI</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">32</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:06:20</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3434&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3434&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3434</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">4613 SHISHANK</td>
                                                            <td align="right" class="FontText">0.8500</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">32</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-850.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:05:58</td>
                                                            <td align="left" class="FontText">A285                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3427&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3427&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3427</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8755 CHINU</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">32</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:05:36</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3420&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3420&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3420</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">3864 THAKUR SD</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="right" class="FontText">33</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1500.00</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:05:00</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3412&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3412&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3412</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">3864 THAKUR SD</td>
                                                            <td align="right" class="FontText">0.8500</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="right" class="FontText">34</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1275.00</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:04:10</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3393&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3393&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3393</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9041 HARIOMJI</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">36</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:02:23</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3379&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3379&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3379</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9013 LUCCKY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">35</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:01:19</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3376&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3376&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3376</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">5878 BANTI DISK</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="right" class="FontText">36</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-2000.00</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:01:06</td>
                                                            <td align="left" class="FontText">A285                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3356&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3356&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3356</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9676 BHOLEY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">36</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:00:21</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3355&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3355&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3355</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9551 TOMAR</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">36</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:00:20</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3352&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3352&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3352</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9106 VICKY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">36</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-10000.00</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:00:15</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3351&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3351&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3351</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9622 LAKHAN</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="right" class="FontText">36</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-2000.00</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 23:00:11</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3342&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3342&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3342</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9729 KAPOOR</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">42</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">-10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:58:26</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3307&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3307&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3307</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9062 PRAMOD</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">39</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:55:22</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3300&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3300&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3300</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9106 VICKY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="right" class="FontText">39</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-5000.00</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:55:17</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3292&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3292&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3292</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9113 SHARAD </td>
                                                            <td align="right" class="FontText">1.1500</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">41</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">11500.00</td>
                                                            <td align="right" class="FontText">-10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:54:15</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3283&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3283&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3283</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9007 KRISHNAJI</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">42</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-10000.00</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:53:39</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3277&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3277&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3277</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9676 BHOLEY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">42</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:53:26</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3257&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3257&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3257</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9729 KAPOOR</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">41</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-10000.00</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:51:52</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3251&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3251&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3251</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9041 HARIOMJI</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">42</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:51:23</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3249&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3249&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3249</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9062 PRAMOD</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">41</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:51:22</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3248&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3248&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3248</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8755 CHINU</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">41</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:51:21</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3225&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3225&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3225</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9611 CC</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="right" class="FontText">43</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-5000.00</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:50:29</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3216&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3216&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3216</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9106 VICKY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="right" class="FontText">43</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-5000.00</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:50:05</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3212&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3212&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3212</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">3052 SLEEP BABU</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="right" class="FontText">42</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="right" class="FontText">-1500.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:50:03</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3192&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3192&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3192</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">3864 THAKUR SD</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">44</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:48:26</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3167&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3167&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3167</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9729 KAPOOR</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">20000.00</td>
                                                            <td align="right" class="FontText">45</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">20000.00</td>
                                                            <td align="right" class="FontText">-20000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:46:45</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3160&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3160&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3160</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9676 BHOLEY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">45</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:46:03</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3157&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3157&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3157</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9729 KAPOOR</td>
                                                            <td align="right" class="FontText">0.8500</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">42</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-8500.00</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:45:13</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3148&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3148&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3148</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9551 TOMAR</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">43</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:44:45</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3147&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3147&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3147</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">5878 BANTI DISK</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">43</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:44:45</td>
                                                            <td align="left" class="FontText">A285                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3146&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3146&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3146</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9729 KAPOOR</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">43</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-10000.00</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:44:44</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3145&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3145&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3145</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">600 SULTAN</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">4000.00</td>
                                                            <td align="right" class="FontText">43</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-4000.00</td>
                                                            <td align="right" class="FontText">4000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:44:44</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3140&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3140&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3140</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9041 HARIOMJI</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="right" class="FontText">44</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1500.00</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:44:19</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3134&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3134&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3134</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9729 KAPOOR</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">44</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-10000.00</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:44:14</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3131&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3131&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3131</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9014 POWER</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">2500.00</td>
                                                            <td align="right" class="FontText">44</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-2500.00</td>
                                                            <td align="right" class="FontText">2500.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:44:12</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3122&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3122&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3122</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9014 POWER</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="right" class="FontText">46</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-5000.00</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:42:56</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3115&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3115&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3115</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">5878 BANTI DISK</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">46</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:42:52</td>
                                                            <td align="left" class="FontText">A285                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3104&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3104&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3104</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">3864 THAKUR SD</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">46</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:42:46</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3102&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3102&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3102</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8757 RAVI C</td>
                                                            <td align="right" class="FontText">0.8500</td>
                                                            <td align="right" class="FontText">3000.00</td>
                                                            <td align="right" class="FontText">46</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-2550.00</td>
                                                            <td align="right" class="FontText">3000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:41:53</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3089&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3089&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3089</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">5878 BANTI DISK</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">48</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:40:48</td>
                                                            <td align="left" class="FontText">A285                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3088&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3088&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3088</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9041 HARIOMJI</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="right" class="FontText">48</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1500.00</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:40:46</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3083&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3083&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3083</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8755 CHINU</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">48</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:40:14</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3069&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3069&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3069</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9622 LAKHAN</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="right" class="FontText">49</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="right" class="FontText">-2000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:39:16</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3068&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3068&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3068</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8757 RAVI C</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">50</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:39:14</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3054&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3054&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3054</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">600 SULTAN</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">4000.00</td>
                                                            <td align="right" class="FontText">50</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">4000.00</td>
                                                            <td align="right" class="FontText">-4000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:37:49</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3047&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3047&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3047</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9029 PTKJI</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="right" class="FontText">50</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="right" class="FontText">-2000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:37:33</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3036&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3036&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3036</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8973 DADA</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="right" class="FontText">50</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="right" class="FontText">-5000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:37:01</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3027&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3027&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3027</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8770 LUCKY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="right" class="FontText">50</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">1500.00</td>
                                                            <td align="right" class="FontText">-1500.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:36:05</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3022&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3022&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3022</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8757 RAVI C</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">51</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:35:49</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3011&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3011&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3011</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9014 POWER</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">52</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-10000.00</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:34:32</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=3006&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=3006&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">3006</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">8757 RAVI C</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="right" class="FontText">52</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-2000.00</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:34:23</td>
                                                            <td align="left" class="FontText">A256                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=2986&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=2986&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">2986</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9013 LUCCKY</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="right" class="FontText">50</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">2000.00</td>
                                                            <td align="right" class="FontText">-2000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:32:46</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=2982&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=2982&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">2982</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">5878 BANTI DISK</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="right" class="FontText">52</td>
                                                            <td align="center" class="FontText">YES</td>
                                                            <td align="right" class="FontText">-1000.00</td>
                                                            <td align="right" class="FontText">1000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:32:19</td>
                                                            <td align="left" class="FontText">A285                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=2967&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=2967&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">2967</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9611 CC</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="right" class="FontText">50</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">5000.00</td>
                                                            <td align="right" class="FontText">-5000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:27:00</td>
                                                            <td align="left" class="FontText">A38                              -
                              Client</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td align="center">
                                                                <div class="btn-group">
                                                                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-caret-down"></span></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="ModifySessionBet.php?id=2955&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Modify</a></li>
                                                                        <li><a href="DeleteSessionBet.php?id=2955&amp;MT=402" target="_blank"><i class="icon-pencil"></i>Delete</a></li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td align="left" class="FontText">2955</td>
                                                            <td align="left" class="FontText">10  over-Essex 14-06</td>
                                                            <td align="left" class="FontText">9007 KRISHNAJI</td>
                                                            <td align="right" class="FontText">1.0000</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">50</td>
                                                            <td align="center" class="FontText">NO</td>
                                                            <td align="right" class="FontText">10000.00</td>
                                                            <td align="right" class="FontText">-10000.00</td>
                                                            <td align="left" class="FontText">2018-06-14 22:24:22</td>
                                                            <td align="left" class="FontText">A424                              -
                              Client</td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </td>
                                            <td width="10" valign="top">&nbsp;</td>
                                            <td width="200" valign="top">
                                                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="2" class="table table-striped table-hover table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td width="33%" height="25" align="left" class="TableHeading">RUNS</td>
                                                            <td width="67%" align="right" class="TableHeading">AMOUNT</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">18</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">19</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">20</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">21</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">22</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">23</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">24</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">25</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">26</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">27</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">28</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">29</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">30</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">31</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">62,000.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">32</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">52,650.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">33</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">49,650.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">34</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">46,875.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">35</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">35,875.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">36</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">1,875.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">37</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">1,875.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">38</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #00F; text-align: right">1,875.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">39</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-10,125.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">40</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-10,125.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">41</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-4,625.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">42</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-25,375.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">43</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-84,625.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">44</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-118,975.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">45</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-80,275.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">46</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-91,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">47</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-91,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">48</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-94,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">49</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-90,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">50</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-33,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">51</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-36,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">52</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">53</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">54</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">55</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">56</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">57</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">58</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">59</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">60</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">61</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">62</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">63</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">64</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">65</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">66</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">67</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#FFFFFF">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">68</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                        <tr bgcolor="#E9F3FD">
                                                            <td height="20" bgcolor="#FFFFFF" class="TextRun" style="color: #930; text-align: right">69</td>
                                                            <td align="right" bgcolor="#FFFFFF" class="TextRun" style="color: #F00; text-align: right">-60,075.00</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>

                                <input name="SessionReportChk" type="hidden" id="SessionReportChk" size="7" value="0">
                                <input name="ExtraSessionReportChk" type="hidden" id="ExtraSessionReportChk" size="7" value="">
                                <input name="MatchCode" type="hidden" id="MatchCode" size="7" value="402">
                            </form>
                            <!-- END FORM-->

                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE widget-->
                </div>
            </div>
            <!-- END ADVANCED TABLE widget-->
            <!-- END PAGE CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->
    </div>
</asp:Content>
