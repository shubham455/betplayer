<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MatchSessionPlusMinusDisplay.aspx.cs" Inherits="betplayer.superagent.MatchSessionPlusMinusDisplay" %>

<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8">
    <title>Bet Player Dashboard</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="description">
    <meta content="" name="author">
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style_responsive.css" rel="stylesheet">
    <link href="css/style_default.css" rel="stylesheet" id="style_color">

    <link href="assets/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css">
    <link href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet">
    <link href="assets/jqvmap/jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css">
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="fixed-top" style="">
    <!-- BEGIN HEADER -->

    <div id="header" class="navbar navbar-inverse navbar-fixed-top">
        <!-- BEGIN TOP NAVIGATION BAR -->
        <div class="navbar-inner">
            <div class="container-fluid">
                <!-- BEGIN LOGO -->
                <a class="brand">
                    <img src="img/logo.png" alt="Admin Lab">
                </a>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a class="btn btn-navbar collapsed" id="main_menu_trigger" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="arrow"></span>
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <div id="top_menu" class="nav notify-row">
                    <!-- BEGIN NOTIFICATION -->
                </div>
                <!-- END  NOTIFICATION -->
                <div class="top-nav ">
                    <ul class="nav pull-right top-menu">
                        <!-- BEGIN SUPPORT -->
                        <!-- END SUPPORT -->
                        <!-- BEGIN USER LOGIN DROPDOWN -->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="img/avatar1_small.jpg" alt="">
                                <span class="username">one two gwalior</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="icon-user"></i>My Profile</a></li>
                                <li><a href="#"><i class="icon-tasks"></i>My Tasks</a></li>
                                <li><a href="#"><i class="icon-calendar"></i>Calendar</a></li>
                                <li class="divider"></li>
                                <li><a href="../Login.php?lg=1"><i class="icon-key"></i>Log Out</a></li>
                            </ul>
                        </li>
                        <!-- END USER LOGIN DROPDOWN -->
                    </ul>
                    <!-- END TOP NAVIGATION MENU -->
                </div>
            </div>
        </div>
        <!-- END TOP NAVIGATION BAR -->
    </div>
    <!-- END HEADER -->
    <!-- BEGIN CONTAINER -->
    <div id="container" class="row-fluid sidebar-closed">
        <!-- BEGIN SIDEBAR -->

        <div id="sidebar" class="nav-collapse collapse">
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            <div class="sidebar-toggler hidden-phone"></div>
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->

            <!-- BEGIN SIDEBAR MENU -->
            <ul class="sidebar-menu">
                <li>
                    <a href="index.php" class="">
                        <span class="icon-box"><i class="icon-dashboard"></i></span>Dashboard
                    </a>
                </li>

                <li class="has-sub">
                    <a href="javascript:;" class="">
                        <span class="icon-box"><i class="icon-book"></i></span>Master Details
                <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="AgentDetails.php">Agent Master</a></li>
                        <li><a class="" href="CollectionDetails.php">Collection Master</a></li>
                    </ul>
                </li>

                <li class="has-sub active">
                    <a href="javascript:;" class="">
                        <span class="icon-box"><i class="icon-tasks"></i></span>Sport's Betting
                <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li class="active"><a class="" href="SportDetails.php">Sport's Details</a></li>
                    </ul>
                </li>
                <li class="has-sub">
                    <a href="javascript:;" class="">
                        <span class="icon-box"><i class="icon-tasks"></i></span>Ledger
                <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="MyLedger.php">My Ledger</a></li>
                        <li><a class="" href="AllAgentLedger.php">All Agent Ledger</a></li>
                        <li><a class="" href="DebitCreditEntry.php">Debit/Credit Entry</a></li>
                        <!--<li><a class="" href="ClientPlusMinus.php">Client Plus/Minus</a></li>                <li><a class="" href="ClientLedger.php">Client Ledger</a></li>                <li><a class="" href="AllClientLedger.php">All Client Ledger</a></li>                <li><a class="" href="DebitCreditReportDateWise.php">Date Wise Report</a></li>-->
                    </ul>
                </li>

                <li class="has-sub">
                    <a href="javascript:;" class="">
                        <span class="icon-box"><i class="icon-tasks"></i></span>Collection Ledger
                <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="CollectionTransfer.php">Transfer Collection</a></li>
                        <li><a class="" href="CollectionLedger.php">All Collection</a></li>
                        <li><a class="" href="CollectionLedgerDateWise.php">Date Wise Report</a></li>
                    </ul>
                </li>

                <li class="has-sub">
                    <a href="javascript:;" class="">
                        <span class="icon-box"><i class="icon-cogs"></i></span>Reports
            <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="AgentLimitReport.php">Agent Limit Report</a></li>
                        <li><a class="" href="ClientLimitReport.php">Client Limit Report</a></li>
                        <li><a class="" href="LoginReport.php">Login Report</a></li>
                        <li><a class="" href="SecureCodeReport.php">Secure Code Report</a></li>
                    </ul>
                </li>

                <li class="has-sub">
                    <a href="javascript:;" class="">
                        <span class="icon-box"><i class="icon-cogs"></i></span>Settings
                <span class="arrow"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="ChangePassword.php">Change Password</a></li>
                    </ul>
                </li>
            </ul>
            <!-- END SIDEBAR MENU -->
        </div>
        <!-- END SIDEBAR -->
        <!-- BEGIN PAGE -->
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
                        <h3 class="page-title">Match &amp; Session Plus Minus Report Selection
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
                                <form name="BetPlayer" id="BetPlayer" method="post" action="AgentDetails.php" autocomplete="off">

                                    <div class="portlet-body">
                                        <div class="clearfix">
                                        </div>
                                        <div class="space15"></div>

                                    </div>
                                    <table class="table table-striped table-hover table-bordered">
                                        <tbody>
                                            <tr>
                                                <td height="37" width="70%" style="text-align: center; vertical-align: middle;" class="FontText">
                                                    <strong>ESSEX V YORKSHIRE 
                          	Dated 14-06-2018 06:30:00 PM                          </strong></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                    <br>
                                    <table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" class="table table-striped table-bordered">
                                        <tbody>
                                            <tr>
                                                <td width="11%" height="25" align="left" valign="middle"><strong>SUPER AGENT</strong></td>
                                                <td width="89%" align="left" valign="middle"><strong>ONE TWO GWALIOR                </strong></td>
                                            </tr>
                                            <tr>
                                                <td height="25" colspan="2" align="left" valign="middle">


                                                    <% foreach (System.Data.DataRow row1 in runTable1.Rows)
                                                        { %>
                                                    <table width="99%" border="0" align="left" cellpadding="0" cellspacing="0" class="table table-striped table-bordered" style="margin-bottom: 10px !important;">
                                                        <tbody>
                                                            <tr>
                                                                <td width="7%" height="25" align="left" valign="middle"><strong>AGENT</strong></td>
                                                                <td width="93%" align="left" valign="middle"><strong><%:row1["AgentName"] %>   </strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="25" colspan="2" align="left" valign="middle">

                                                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" class="table table-striped table-bordered" style="padding-bottom: 100px;">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td height="25" align="left" valign="middle">&nbsp;</td>
                                                                                <td colspan="10" align="right" valign="middle" style="text-align: center;"><strong>AGENT PLUS MINUS</strong></td>
                                                                                <td colspan="7" align="right" valign="middle" style="text-align: center;"><strong>SUPER AGENT PLUS MINUS</strong></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="180" height="25" align="left" valign="middle"><strong>CLIENT</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>M AMT</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>SESS.</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>TOT. AMT</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>M. COM</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>S. COM</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>TOL. COM</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>NET AMT</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>SHR AMT</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>MOB. APP</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>FINAL</strong></td>
                                                                                <td width="100" align="right" valign="middle" style="text-align: right;"><strong>M. COM</strong></td>
                                                                                <td width="100" align="right" valign="middle" style="text-align: right;"><strong>S. COM</strong></td>
                                                                                <td width="100" align="right" valign="middle" style="text-align: right;"><strong>TOL. COM</strong></td>
                                                                                <td width="100" align="right" valign="middle" style="text-align: right;"><strong>NET AMT</strong></td>
                                                                                <td width="100" align="right" valign="middle" style="text-align: right;"><strong>AGT SHR </strong></td>
                                                                                <td width="100" align="right" valign="middle" style="text-align: right;"><strong>SA SHR</strong></td>
                                                                                <td width="100" align="right" valign="middle" style="text-align: right;"><strong>TOT SHR</strong></td>
                                                                                <td width="100" align="right" valign="middle" style="text-align: right;"><strong>MOB. APP</strong></td>
                                                                                <td width="100" align="right" valign="middle" style="text-align: right;"><strong>FINAL</strong></td>
                                                                            </tr>
                                                                            <% foreach (System.Data.DataRow row in runTable.Rows)
                                                                                { %>
                                                                            <tr>
                                                                                <td height="25" align="left" valign="middle" class="FontText"><%:row["Name"] %></td>
                                                                                <td style="text-align: right;"><%:row["MatchAmount"] %></td>
                                                                                <td style="text-align: right;"><%:row["SessionAmount"] %></td>
                                                                                <td style="text-align: right;"><strong><%:row["TotalAmount"] %></strong></td>
                                                                                <td style="text-align: right;"><%:row["MatchCommision"] %></td>
                                                                                <td style="text-align: right;"><%:row["SessionCommision"] %></td>
                                                                                <td style="text-align: right;"><strong><%:row["TotalCommisionAmount"] %></strong></td>
                                                                                <td style="text-align: right;"><strong><%:row["TotalNetAmount"] %></strong></td>
                                                                                <td style="text-align: right;"><%:row["TotalHalfAmount"] %></td>
                                                                                <td style="text-align: right;"><%:row["MOBAppAmount"] %></td>
                                                                                <td style="text-align: right;"><strong><%:row["FinalAmount"] %></strong></td>
                                                                                <td style="text-align: right;"><%:row["MatchCommision"] %></td>
                                                                                <td style="text-align: right;"><%:row["SessionCommision"] %></td>
                                                                                <td style="text-align: right;"><strong><%:row["TotalCommisionAmount"] %></strong></td>
                                                                                <td style="text-align: right;"><strong><%:row["TotalNetAmount"] %></strong></td>
                                                                                <td style="text-align: right;"><%:row["TotalCommisionAmount"] %></td>
                                                                                <td style="text-align: right;"><%:row["TotalCommisionAmount"] %></td>
                                                                                <td style="text-align: right;"><%:row["TotalCommisionAmount"] %></td>
                                                                                <td style="text-align: right;"><%:row["TotalCommisionAmount"] %></td>
                                                                                <td style="text-align: right;"><strong><%:row["FinalAmount"] %></strong></td>
                                                                            </tr>
                                                                            <% } //foreach %>
                                                                            <tr>
                                                                                <td width="180" height="25" align="left" valign="middle"><strong>TOTAL</strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>-47,910.00          </strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>0.00          </strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>-47,910.00          </strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>40.40          </strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>0.00          </strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>40.40          </strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>-47,950.40          </strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>-35,962.80          </strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>200.00          </strong></td>
                                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>-11,788.00        </strong></td>
                                                                                <td align="right" valign="middle" style="text-align: right;"><strong>40.40        </strong></td>
                                                                                <td align="right" valign="middle" style="text-align: right;"><strong>0.00        </strong></td>
                                                                                <td align="right" valign="middle" style="text-align: right;"><strong>40.40        </strong></td>
                                                                                <td align="right" valign="middle" style="text-align: right;"><strong>-47,950.40        </strong></td>
                                                                                <td align="right" valign="middle" style="text-align: right;"><strong>-2,397.52        </strong></td>
                                                                                <td align="right" valign="middle" style="text-align: right;"><strong>-2,397.52        </strong></td>
                                                                                    <td align="right" valign="middle" style="text-align: right;"><strong>-2,397.52        </strong></td>
                                                                                <td align="right" valign="middle" style="text-align: right;"><strong>0.00        </strong></td>
                                                                                <td align="right" valign="middle" style="text-align: right;"><strong>-45,552.88        </strong></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <% } //foreach %>
                                                    <br>

                                                    <br>
                                                    <br>

                                                    <br>

                                                   
                                                    

                                                   

                                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" class="table table-striped table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <td width="125" height="25" align="left" valign="middle"><strong>SA TOTAL</strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>175,124.32          </strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>197,239.00          </strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>372,363.32          </strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>12,362.62          </strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>35,915.10          </strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>48,277.72          </strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>324,085.60          </strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>228,456.70          </strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>2,700.00          </strong></td>
                                                                <td width="80" align="right" style="text-align: right;" valign="middle"><strong>98,329.00        </strong></td>
                                                                <td width="80" align="right" valign="middle" style="text-align: right;"><strong>12,362.62        </strong></td>
                                                                <td width="80" align="right" valign="middle" style="text-align: right;"><strong>42,999.12        </strong></td>
                                                                <td width="80" align="right" valign="middle" style="text-align: right;"><strong>55,361.74        </strong></td>
                                                                <td width="80" align="right" valign="middle" style="text-align: right;"><strong>317,001.58        </strong></td>
                                                                <td width="80" align="right" valign="middle" style="text-align: right;"><strong>223,326.26        </strong></td>
                                                                <td width="80" align="right" valign="middle" style="text-align: right;"><strong>15,850.08        </strong></td>
                                                                <td width="80" align="right" valign="middle" style="text-align: right;"><strong>239,176.34        </strong></td>
                                                                <td width="80" align="right" valign="middle" style="text-align: right;"><strong>0.00        </strong></td>
                                                                <td width="80" align="right" valign="middle" style="text-align: right;"><strong>77,825.24        </strong></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                    &nbsp;
                    <!--//Close Super Agent-->




                                    <br>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-striped table-bordered">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" class="table table-striped table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <td width="180" height="25" align="left" valign="middle"><strong>GRAND TOTAL</strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>175,124.32                      </strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>197,239.00                      </strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>372,363.32                      </strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>12,362.62                      </strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>35,915.10                      </strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>48,277.72                      </strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>324,085.60                      </strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>228,456.70                      </strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>0.00                      </strong></td>
                                                                <td width="100" align="right" style="text-align: right;" valign="middle"><strong>98,329.00                    </strong></td>
                                                                <td align="right" valign="middle" style="text-align: right;"><strong>12,362.62                    </strong></td>
                                                                <td align="right" valign="middle" style="text-align: right;"><strong>42,999.12                    </strong></td>
                                                                <td align="right" valign="middle" style="text-align: right;"><strong>55,361.74                    </strong></td>
                                                                <td align="right" valign="middle" style="text-align: right;"><strong>317,001.58                    </strong></td>
                                                                <td align="right" valign="middle" style="text-align: right;"><strong>15,850.08                    </strong></td>
                                                                <td align="right" valign="middle" style="text-align: right;"><strong>0.00                    </strong></td>
                                                                <td align="right" valign="middle" style="text-align: right;"><strong>0.00                    </strong></td>
                                                                <td align="right" valign="middle" style="text-align: right;"><strong>0.00                    </strong></td>
                                                                <td align="right" valign="middle" style="text-align: right;"><strong>77,825.00                    </strong></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <input name="DisplayChk" type="hidden" id="DisplayChk" value="0">
                                    <input name="MatchCode" type="hidden" id="MatchCode" value="402">
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
        <!-- END PAGE -->
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <div id="footer">
        2013 © Admin Lab Dashboard.
		<div class="span pull-right">
            <span class="go-top"><i class="icon-arrow-up"></i></span>
        </div>
    </div>
    <!-- END FOOTER -->
    <!-- BEGIN JAVASCRIPTS -->
    <!-- Load javascripts at bottom, this will reduce page load time -->
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="assets/jquery-slimscroll/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/fullcalendar/fullcalendar/fullcalendar.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.blockui.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <!-- ie8 fixes -->
    <!--[if lt IE 9]>
	<script src="js/excanvas.js"></script>
	<script src="js/respond.js"></script>
	<![endif]-->
    <script src="assets/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
    <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
    <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
    <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
    <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
    <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
    <script src="assets/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
    <script src="assets/jquery-knob/js/jquery.knob.js"></script>

    <script src="js/jquery.peity.min.js"></script>
    <script type="text/javascript" src="assets/uniform/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>
    <script src="js/scripts.js"></script>
    <script>
        jQuery(document).ready(function () {
            // initiate layout and plugins
            App.setMainPage(true);
            App.init();
        });
    </script>

    <script type="text/javascript">

        function ShowReport() {
            //alert('next');
            if (document.BetPlayer.ReportType.value == "Match")
                document.BetPlayer.action = "MatchPlusMinusSelect.php";
            else if (document.BetPlayer.ReportType.value == "Session")
                document.BetPlayer.action = "SessionPlusMinusSelect.php";
            else if (document.BetPlayer.ReportType.value == "Both")
                document.BetPlayer.action = "MatchSessionPlusMinusSelect.php";

            document.getElementById("DisplayChk").value = 1;
            document.BetPlayer.submit();
        }

    </script>

    <!-- END JAVASCRIPTS -->

    <!-- END BODY -->
    <div class="jqvmap-label"></div>
    <div class="jqvmap-label"></div>
    <div class="jqvmap-label"></div>
    <div class="jqvmap-label"></div>
    <div class="jqvmap-label"></div>
</body>
</html>
