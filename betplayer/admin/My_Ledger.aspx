<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Dashboard.Master" CodeBehind="My_Ledger.aspx.cs" Inherits="betplayer.admin.My_Ledger" %>

<asp:Content ID ="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
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
		        <h3 class="page-title"> My Ledger
  <small> </small></h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li> Ledger <span class="divider">&nbsp;</span> </li>
		          <li>My Ledger<span class="divider">&nbsp;</span></li>
                  <li><a href="Ledger.aspx"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                   <div class="widget-title">
		            <h4><i class="icon-globe"></i>My Ledger</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form">
                  
                  <!-- BEGIN FORM-->
                    <form name="BetPlayer" id="BetPlayer" method="post" action="AgentDetails.php" autocomplete="off">
                    
		            <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
  <tbody><tr>
    <td width="4%" height="25"><strong>SNo.</strong></td>
    <td width="8%"><strong>Date</strong></td>
    <td width="15%"><strong>Collection Name</strong></td>
    <td width="9%" style="text-align:right;"><strong>Debit</strong></td>
    <td width="9%" style="text-align:right;"><strong>Credit</strong></td>
    <td width="9%" style="text-align:right;"><strong>Balance</strong></td>
    <td width="13%"><strong>Description</strong></td>
    <td width="13%"><strong>Remark</strong></td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">1</td>
    <td class="FontText">07-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">57,450.00</td>
    <td style="text-align:right;" class="FontText">57,450.00</td>
    <td class="FontText">SYDNY THUNDR VS ADLADE STRKR</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">2</td>
    <td class="FontText">08-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">15,425.00</td>
    <td style="text-align:right;" class="FontText">72,875.00</td>
    <td class="FontText">HOBRT HURYCAN V SYDNY SIXR</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">3</td>
    <td class="FontText">08-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">7,250.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">65,625.00</td>
    <td class="FontText">PERTH SCORCHR V MELBORN RENGAD</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">4</td>
    <td class="FontText">09-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">64,625.00</td>
    <td style="text-align:right;" class="FontText">130,250.00</td>
    <td class="FontText">ADLADE STRKR V MELBORN STAR</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">5</td>
    <td class="FontText">10-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">8,000.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">122,250.00</td>
    <td class="FontText">BRSBANE HEAT V HOBRT HURYCAN</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">6</td>
    <td class="FontText">11-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">29,075.00</td>
    <td style="text-align:right;" class="FontText">151,325.00</td>
    <td class="FontText">SYDNY THUNDR V PERTH SCORCHR</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">7</td>
    <td class="FontText">12-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">13,850.00</td>
    <td style="text-align:right;" class="FontText">165,175.00</td>
    <td class="FontText">MELBORN RENGAD V MELBORN STAR</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">8</td>
    <td class="FontText">13-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">10,000.00</td>
    <td style="text-align:right;" class="FontText">175,175.00</td>
    <td class="FontText">SYDNY SIXER V SYDNY THUNDR</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">9</td>
    <td class="FontText">14-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">14,500.00</td>
    <td style="text-align:right;" class="FontText">189,675.00</td>
    <td class="FontText">Australia v England (1st ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">10</td>
    <td class="FontText">15-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">26,822.00</td>
    <td style="text-align:right;" class="FontText">216,497.00</td>
    <td class="FontText">HOBRT HURYCAN V BRSBAN HEAT</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">11</td>
    <td class="FontText">15-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">2,450.00</td>
    <td style="text-align:right;" class="FontText">218,947.00</td>
    <td class="FontText">Bangladesh v Zimbabwe</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">12</td>
    <td class="FontText">16-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">26,461.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">192,486.00</td>
    <td class="FontText">New Zealand v Pakistan (4th ODI)</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">13</td>
    <td class="FontText">16-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">111,856.00</td>
    <td style="text-align:right;" class="FontText">304,342.00</td>
    <td class="FontText">MELBORN STAR V SYDNY SIXR</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">14</td>
    <td class="FontText">17-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">18,557.00</td>
    <td style="text-align:right;" class="FontText">322,899.00</td>
    <td class="FontText">ADLADE STRKR V HOBART HURYCAN</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">15</td>
    <td class="FontText">17-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">10,700.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">312,199.00</td>
    <td class="FontText">Sri Lanka v Zimbabwe</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">16</td>
    <td class="FontText">18-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">58,165.00</td>
    <td style="text-align:right;" class="FontText">370,364.00</td>
    <td class="FontText">SYDNY SIXER V BRSBAN HEAT</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">17</td>
    <td class="FontText">18-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">8,923.00</td>
    <td style="text-align:right;" class="FontText">379,287.00</td>
    <td class="FontText">Ireland v Scotland</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">18</td>
    <td class="FontText">19-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">2,452.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">376,835.00</td>
    <td class="FontText">New Zealand v Pakistan (5th ODI)</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">19</td>
    <td class="FontText">19-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">1,477.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">375,358.00</td>
    <td class="FontText">Australia v England (2nd ODI)</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">20</td>
    <td class="FontText">19-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">34,024.00</td>
    <td style="text-align:right;" class="FontText">409,382.00</td>
    <td class="FontText">Bangladesh v Sri Lanka</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">21</td>
    <td class="FontText">20-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">12,216.00</td>
    <td style="text-align:right;" class="FontText">421,598.00</td>
    <td class="FontText">Northern Districts v Central Districts</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">22</td>
    <td class="FontText">20-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">24,665.00</td>
    <td style="text-align:right;" class="FontText">446,263.00</td>
    <td class="FontText">MELBORN STAR V SYDNY THUNDR</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">23</td>
    <td class="FontText">20-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">61,252.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">385,011.00</td>
    <td class="FontText">PERTH SCORCHR V HOBART HURYCAN</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">24</td>
    <td class="FontText">21-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">13,748.00</td>
    <td style="text-align:right;" class="FontText">398,759.00</td>
    <td class="FontText">Australia v England (3rd ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">25</td>
    <td class="FontText">21-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">37.00</td>
    <td style="text-align:right;" class="FontText">398,796.00</td>
    <td class="FontText">Sri Lanka v Zimbabwe</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">26</td>
    <td class="FontText">22-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">10,423.00</td>
    <td style="text-align:right;" class="FontText">409,219.00</td>
    <td class="FontText">New Zealand v Pakistan (1st T20)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">27</td>
    <td class="FontText">22-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">40,700.00</td>
    <td style="text-align:right;" class="FontText">449,919.00</td>
    <td class="FontText">MELBORN RENGAD V ADLADE STRKR</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">28</td>
    <td class="FontText">23-01-2018</td>
    <td class="FontText">CASH</td>
     <td style="text-align:right;" class="FontText">450,000.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">-81.00</td>
    <td class="FontText">Payment Received</td>
    <td class="FontText">company me jama, Agent Paid</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">29</td>
    <td class="FontText">23-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">16,282.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">-16,363.00</td>
    <td class="FontText">SYDNY SIXR V MELBORN STAR</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">30</td>
    <td class="FontText">23-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">3,620.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">-19,983.00</td>
    <td class="FontText">Bangladesh v Zimbabwe</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">31</td>
    <td class="FontText">24-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">32,256.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">-52,239.00</td>
    <td class="FontText">SYDNY THNDR V MELBORN RENGAD</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">32</td>
    <td class="FontText">25-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">2,938.00</td>
    <td style="text-align:right;" class="FontText">-49,301.00</td>
    <td class="FontText">Bangladesh v Sri Lanka</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">33</td>
    <td class="FontText">25-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">63,432.00</td>
    <td style="text-align:right;" class="FontText">14,131.00</td>
    <td class="FontText">New Zealand v Pakistan (2nd T20)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">34</td>
    <td class="FontText">25-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">6,892.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">7,239.00</td>
    <td class="FontText">PERTH SCOCHR V ADLAD STRKR</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">35</td>
    <td class="FontText">26-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">54,452.00</td>
    <td style="text-align:right;" class="FontText">61,691.00</td>
    <td class="FontText">Australia v England (4th ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">36</td>
    <td class="FontText">26-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">4,653.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">57,038.00</td>
    <td class="FontText">Delhi v Rajasthan</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">37</td>
    <td class="FontText">27-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">35,713.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">21,325.00</td>
    <td class="FontText">MELBORN STAR V HOBART HURYCAN</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">38</td>
    <td class="FontText">27-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">50,071.00</td>
    <td style="text-align:right;" class="FontText">71,396.00</td>
    <td class="FontText">BRISBAN HEAT V MELBORN RENGAD</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">39</td>
    <td class="FontText">27-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">28,576.00</td>
    <td style="text-align:right;" class="FontText">99,972.00</td>
    <td class="FontText">Bangladesh v Sri Lanka</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">40</td>
    <td class="FontText">28-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">3,079.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">96,893.00</td>
    <td class="FontText">New Zealand v Pakistan (3rd T20)</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">41</td>
    <td class="FontText">28-01-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">41,361.00</td>
    <td style="text-align:right;" class="FontText">138,254.00</td>
    <td class="FontText">Australia v England (5th ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">42</td>
    <td class="FontText">01-02-2018</td>
    <td class="FontText">CASH</td>
     <td style="text-align:right;" class="FontText">138,000.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">254.00</td>
    <td class="FontText">Payment Received</td>
    <td class="FontText">company me jama, Agent Paid</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">43</td>
    <td class="FontText">01-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">61,530.00</td>
    <td style="text-align:right;" class="FontText">61,784.00</td>
    <td class="FontText">PERTH SCOCHR V HOBRT HURYCAN</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">44</td>
    <td class="FontText">01-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">31,847.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">29,937.00</td>
    <td class="FontText">South Africa v India - 1st ODI</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">45</td>
    <td class="FontText">02-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">215.00</td>
    <td style="text-align:right;" class="FontText">30,152.00</td>
    <td class="FontText">ADLAID STRKR V MELBORN RENGAD</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">46</td>
    <td class="FontText">03-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">6,539.00</td>
    <td style="text-align:right;" class="FontText">36,691.00</td>
    <td class="FontText">Australia U19 v India U19</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">47</td>
    <td class="FontText">03-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">112,759.00</td>
    <td style="text-align:right;" class="FontText">149,450.00</td>
    <td class="FontText">Australia v New Zealand</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">48</td>
    <td class="FontText">04-02-2018</td>
    <td class="FontText">CASH</td>
     <td style="text-align:right;" class="FontText">150,000.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">-550.00</td>
    <td class="FontText">Payment Received</td>
    <td class="FontText">company me jama, Agent Paid</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">49</td>
    <td class="FontText">04-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">55,030.00</td>
    <td style="text-align:right;" class="FontText">54,480.00</td>
    <td class="FontText">ADLADE STRKR V HOBRT HURYCAN</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">50</td>
    <td class="FontText">04-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">89,489.00</td>
    <td style="text-align:right;" class="FontText">143,969.00</td>
    <td class="FontText">South Africa v India - 2nd ODI</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">51</td>
    <td class="FontText">05-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">35,765.00</td>
    <td style="text-align:right;" class="FontText">179,734.00</td>
    <td class="FontText">Afghanistan v Zimbabwe (1st T20)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">52</td>
    <td class="FontText">06-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">84,391.00</td>
    <td style="text-align:right;" class="FontText">264,125.00</td>
    <td class="FontText">City Kaitak v Hung Hom Jaguars</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">53</td>
    <td class="FontText">06-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">28,447.00</td>
    <td style="text-align:right;" class="FontText">292,572.00</td>
    <td class="FontText">Afghanistan v Zimbabwe (2nd T20)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">54</td>
    <td class="FontText">07-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">1,870.00</td>
    <td style="text-align:right;" class="FontText">294,442.00</td>
    <td class="FontText">City Kaitak v HKI United</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">55</td>
    <td class="FontText">07-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">18,753.00</td>
    <td style="text-align:right;" class="FontText">313,195.00</td>
    <td class="FontText">Kowloon Cantons v Galaxy Gladiators Lantau</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">56</td>
    <td class="FontText">07-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">10,131.00</td>
    <td style="text-align:right;" class="FontText">323,326.00</td>
    <td class="FontText">Australia v England</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">57</td>
    <td class="FontText">07-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">594.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">322,732.00</td>
    <td class="FontText">South Africa v India (3rd ODI)</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">58</td>
    <td class="FontText">08-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">24,250.00</td>
    <td style="text-align:right;" class="FontText">346,982.00</td>
    <td class="FontText">Hung Hom JD Jaguars v Kowloon Cantons</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">59</td>
    <td class="FontText">08-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">3,113.00</td>
    <td style="text-align:right;" class="FontText">350,095.00</td>
    <td class="FontText">HKI United v Galaxy Gladiators Lantau</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">60</td>
    <td class="FontText">09-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">3,558.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">346,537.00</td>
    <td class="FontText">Galaxy Gladiators Lantau v Hung Hom JD Jaguars</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">61</td>
    <td class="FontText">09-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">13,733.00</td>
    <td style="text-align:right;" class="FontText">360,270.00</td>
    <td class="FontText">Kowloon Cantons v City Kaitak</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">62</td>
    <td class="FontText">09-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">85,865.00</td>
    <td style="text-align:right;" class="FontText">446,135.00</td>
    <td class="FontText">Afghanistan v Zimbabwe (1st ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">63</td>
    <td class="FontText">10-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">16,673.00</td>
    <td style="text-align:right;" class="FontText">462,808.00</td>
    <td class="FontText">Galaxy Gladiators Lantau v City Kai Tak</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">64</td>
    <td class="FontText">10-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">6,379.00</td>
    <td style="text-align:right;" class="FontText">469,187.00</td>
    <td class="FontText">Hung Hom JD Jaguars v Hong Kong Island United</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">65</td>
    <td class="FontText">10-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">66,498.00</td>
    <td style="text-align:right;" class="FontText">535,685.00</td>
    <td class="FontText">Australia v England (2nd T20)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">66</td>
    <td class="FontText">10-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">21,253.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">514,432.00</td>
    <td class="FontText">South Africa v India (4th ODI)</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">67</td>
    <td class="FontText">11-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">3,567.00</td>
    <td style="text-align:right;" class="FontText">517,999.00</td>
    <td class="FontText">Hong Kong Island United v Kowloon Cantons</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">68</td>
    <td class="FontText">11-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">13,045.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">504,954.00</td>
    <td class="FontText">Galaxy Gladiators Lantau v Hung Hom JD Jaguars</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">69</td>
    <td class="FontText">11-02-2018</td>
    <td class="FontText">CASH</td>
     <td style="text-align:right;" class="FontText">500,000.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">4,954.00</td>
    <td class="FontText">Payment Received</td>
    <td class="FontText">company me jama, Agent Paid</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">70</td>
    <td class="FontText">11-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">86,855.00</td>
    <td style="text-align:right;" class="FontText">91,809.00</td>
    <td class="FontText">Afghanistan v Zimbabwe</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">71</td>
    <td class="FontText">13-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">69,792.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">22,017.00</td>
    <td class="FontText">New Zealand v England</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">72</td>
    <td class="FontText">13-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">2,161.00</td>
    <td style="text-align:right;" class="FontText">24,178.00</td>
    <td class="FontText">Afghanistan v Zimbabwe (3rd ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">73</td>
    <td class="FontText">13-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">6,021.00</td>
    <td style="text-align:right;" class="FontText">30,199.00</td>
    <td class="FontText">South Africa v India (5th ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">74</td>
    <td class="FontText">15-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">49,711.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">-19,512.00</td>
    <td class="FontText">Bangladesh v Sri Lanka (1st T20)</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">75</td>
    <td class="FontText">16-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">26,572.00</td>
    <td style="text-align:right;" class="FontText">7,060.00</td>
    <td class="FontText">New Zealand v Australia</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">76</td>
    <td class="FontText">16-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">4,655.00</td>
    <td style="text-align:right;" class="FontText">11,715.00</td>
    <td class="FontText">Afghanistan v Zimbabwe (4th ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">77</td>
    <td class="FontText">16-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">17,697.00</td>
    <td style="text-align:right;" class="FontText">29,412.00</td>
    <td class="FontText">South Africa v India (6th ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">78</td>
    <td class="FontText">18-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">59,684.00</td>
    <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">-30,272.00</td>
    <td class="FontText">New Zealand v England</td>
    <td class="FontText">Agent Plus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">79</td>
    <td class="FontText">18-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">28,626.00</td>
    <td style="text-align:right;" class="FontText">-1,646.00</td>
    <td class="FontText">Bangladesh v Sri Lanka (2nd T20)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">80</td>
    <td class="FontText">18-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">68,220.00</td>
    <td style="text-align:right;" class="FontText">66,574.00</td>
    <td class="FontText">South Africa v India (1st T20)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td height="20" class="FontText">81</td>
    <td class="FontText">19-02-2018</td>
    <td class="FontText"> </td>
     <td style="text-align:right;" class="FontText">0.00</td>
    <td style="text-align:right;" class="FontText">9,409.00</td>
    <td style="text-align:right;" class="FontText">75,983.00</td>
    <td class="FontText">Afghanistan v Zimbabwe (5th ODI)</td>
    <td class="FontText">Agent Minus</td>
  </tr>
    <tr>
    <td height="25">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right"><strong>Total Amount</strong></td>
    <td style="text-align:right;"><strong>
      1,707,571.00      </strong></td>
    <td style="text-align:right;"><strong>
      1,783,554.00      </strong></td>
    <td style="text-align:right;"><strong>
      75,983.00      </strong></td>
    <td align="right">&nbsp;</td>
    <td align="right">&nbsp;</td>
  </tr>
</tbody></table>
<br>
<br><br>
<br>
<br>

		            <input name="DisplayChk" type="hidden" id="DisplayChk" value="">
     				<input name="MatchCode" type="hidden" id="MatchCode" value="243">
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
