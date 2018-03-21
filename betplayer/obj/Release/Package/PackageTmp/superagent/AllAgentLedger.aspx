<%@ Page Language="C#" MasterPageFile="~/Super_Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="AllAgentLedger.aspx.cs" Inherits="betplayer.Super_Agent.AllAgentLedger" %>
<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

 <div id="main-content">
		  <!-- BEGIN PAGE CONTAINER-->
		  <div class="container-fluid">
		    <!-- BEGIN PAGE HEADER-->
		    <div class="row-fluid">
		      <div class="span12">
		        <!-- BEGIN THEME CUSTOMIZER-->
		        <div id="theme-change" class="hidden-phone"> <i class="icon-cogs"></i> <span class="settings"> <span class="text">Theme:</span> <span class="colors"> <span class="color-default" data-style="default"></span> <span class="color-gray" data-style="gray"></span> <span class="color-purple" data-style="purple"></span> <span class="color-navy-blue" data-style="navy-blue"></span> </span> </span> </div>
		        <!-- END THEME CUSTOMIZER-->
		        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
		        <h3 class="page-title"> All Client Ledger</h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li>Ledger <span class="divider">&nbsp;</span> </li>
		          <li>All Client Ledger<span class="divider">&nbsp;</span></li>
                  <li><a href="Ledger.aspx"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
	            </ul>
		        <!-- END PAGE TITLE & BREADCRUMB-->
	          </div>
	        </div>
		    <!-- END PAGE HEADER-->
		    <!-- BEGIN PAGE CONTENT-->
		    <div class="row-fluid">
		      <div class="span12">
		        <div class="widget">
		          <div class="widget-title">
		            <h4><i class="icon-globe"></i>All Client Ledger</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form"> 
                  <!-- BEGIN FORM-->
                    <form name="BetPlayer" id="BetPlayer" method="post" action="ClientDetails.php" autocomplete="off">
                    
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody><tr>
                        <td width="550"><table width="100%" border="0" cellspacing="2" cellpadding="0">
                          <tbody><tr>
                            <td width="49%" valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                              <tbody><tr>
                                <td height="25" colspan="5" align="center" valign="middle" style="text-align:center;"><strong>PAYMENT RECEIVING FROM (Lena He)</strong></td>
                              </tr>
                              <tr>
                                <td width="20%" height="25" align="left" valign="middle"><strong>Client Name</strong></td>
                                <td width="20%" align="right" valign="middle"><strong>Contact </strong></td>
                                <td width="20%" align="right" valign="middle" style="text-align:right;"><strong>Open. Bal. </strong></td>
                                <td width="20%" align="right" valign="middle" style="text-align:right;"><strong>Curr. Bal.</strong></td>
                                <td width="20%" align="right" valign="middle" style="text-align:right;"><strong>Cls. Bal.</strong></td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">100 JAI</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7905954928</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">932,448.90</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">932,448.90</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">118 PURAN</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9628371118</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">128,090.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">128,090.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">130 ASHAD</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7317295256</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">29,700.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">29,700.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">131 SANJAY</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9198660636</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">123,980.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">123,980.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">132 SATAYAM</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">1</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">10,465.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">10,465.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">133 YASH</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9889133578</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">122,580.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">122,580.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">135 SANKER</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8707454193</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">163,810.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">163,810.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">137 DEP</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8417055042</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">104,385.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">104,385.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">138 SHIVAM</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7052301397</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">67,215.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">67,215.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">139 SOURABH</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8808106820</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">1,020.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">1,020.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">140 ASIF</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8707478308</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">15,555.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">15,555.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">141 VK</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9648835011</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">137,616.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">137,616.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">142 NILESH</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9936209565</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">37,370.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">37,370.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">144 NAFEES</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7355963200</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">6,440.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">6,440.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">145 NANNA</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8577839280</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">19,400.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">19,400.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">147 ARIF</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8726856269</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">29,246.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">29,246.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">148 MANJA</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9311066704</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">9,260.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">9,260.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">149 SERA</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8601917461</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">100.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">100.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">150 DOCTOR</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9415949968</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">15,550.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">15,550.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">151 SHIVA BPL</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7354849522</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">35,120.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">35,120.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">152 VIJAY</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9956388127</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">25,758.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">25,758.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">153 RAM JI</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8115809865</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">4,850.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">4,850.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">158 ANKU</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9936874869</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">55,550.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">55,550.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">161 MUNNA</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9140883625</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">33,210.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">33,210.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">162 UPENDRA</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7985460897</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">17,490.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">17,490.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">171 14 G</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">6394515032</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">31,760.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">31,760.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">172 APPI</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7985460897</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">37,860.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">37,860.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">173 YASIN</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9889133281</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">27,400.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">27,400.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">174 JK</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9794381594</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">78,280.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">78,280.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">175 ENDRA SAHU</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9889133281</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">6,820.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">6,820.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">177 ANIL</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8577839280 </td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">15,890.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">15,890.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">187 MANISH CHATARPUR</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9131168865</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">100.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">100.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">188 RADHE RADHE</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9838880181</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">174,250.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">174,250.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">191 SULTAN</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7000746480</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">180,600.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">180,600.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">193 KISSU</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9616367433</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">6,030.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">6,030.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">197 MANOJ MC</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9993614204</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">5,100.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">5,100.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">201 KALAS</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9598515342</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">855.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">855.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">204 BHASKER</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8279980498</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">57,945.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">57,945.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">207 JAY</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9229225222</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">219,500.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">219,500.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">215 DAU</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9795034525</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">12,860.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">12,860.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">218 BABA</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7309968539</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">100.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">100.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">219 JACKPOT</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9598788208</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">21,130.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">21,130.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">220 SHIVAM</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8319058205</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">300.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">300.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">221 SUMIT</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">8418994032</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">12,050.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">12,050.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">222 LAL SINGH</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9794746339</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">15,930.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">15,930.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">223 DEVENDRA</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7084569776</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">57,200.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">57,200.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">234 MAHAKAL</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7839909949</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">17,058.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">17,058.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><strong>Total</strong></td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF">&nbsp;</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" style="text-align:right;"><strong>
                                  3,105,226.90                                </strong></td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" style="text-align:right;"><strong>
                                  0.00                                </strong></td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" style="text-align:right;"><strong>
                                  3,105,226.90                                </strong></td>
                              </tr>
                            </tbody></table></td>
                            <td width="2%" valign="top">&nbsp;</td>
                            <td width="49%" valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                              <tbody><tr>
                                <td height="25" colspan="5" align="center" valign="middle" style="text-align:center;"><strong>PAYMENT PAID  TO (Dena He)</strong></td>
                              </tr>
                              <tr>
                                <td width="20%" height="25" align="left" valign="middle"><strong>Client Name</strong></td>
                                <td width="20%" align="right" valign="middle"><strong>Contact </strong></td>
                                <td width="20%" align="right" valign="middle" style="text-align:right;"><strong>Open. Bal. </strong></td>
                                <td width="20%" align="right" valign="middle" style="text-align:right;"><strong>Curr. Bal.</strong></td>
                                <td width="20%" align="right" valign="middle" style="text-align:right;"><strong>Cls. Bal.</strong></td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">134 TARIK</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9554508331</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">44,660.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">44,660.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">136 RUBI</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">9415585806</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">38,628.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">38,628.00</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF" class="FontText">199 MRADUL</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText">7887021230</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">2,921.50</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">0.00</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" class="FontText" style="text-align:right;">2,921.50</td>
                              </tr>
                                                            <tr bgcolor="#E9F3FD">
                                <td height="25" align="left" valign="middle" bgcolor="#FFFFFF"><strong>Total</strong></td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF">&nbsp;</td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" style="text-align:right;"><strong>
                                  86,209.50                                </strong></td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" style="text-align:right;"><strong>
                                  0.00                                </strong></td>
                                <td align="right" valign="middle" bgcolor="#FFFFFF" style="text-align:right;"><strong>
                                  86,209.50                                </strong></td>
                              </tr>
                            </tbody></table></td>
                          </tr>
                        </tbody></table></td>
                      </tr>
                    </tbody></table>
                    
                    
                    
                    </form>
                    <!-- END FORM-->
                  </div>
	            </div>
	          </div>
	        </div>
		    <!-- END PAGE CONTENT-->
	      </div>
		  <!-- END PAGE CONTAINER-->
	  </div>
</asp:Content>
