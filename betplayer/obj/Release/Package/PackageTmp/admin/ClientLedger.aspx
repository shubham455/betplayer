<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Dashboard.Master" CodeBehind="ClientLedger.aspx.cs" Inherits="betplayer.admin.ClientLedger" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="content1" runat="server">
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
		        <h3 class="page-title"> Client Ledger
  <small> </small></h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li> Ledger <span class="divider">&nbsp;</span> </li>
		          <li>Client Ledger<span class="divider">&nbsp;</span></li>
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
		            <h4><i class="icon-globe"></i>Client Ledger</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form">
                  
                  <!-- BEGIN FORM-->
                    <form name="BetPlayer" id="BetPlayer" method="post" action="ClientLedger.php" autocomplete="off">
                    
		            <div class="portlet-body">
		              <div class="clearfix">
		                
	                  </div>
		              <div class="space15"></div>
		            
                    </div>
                    
                    <table width="100%" border="0" align="left" cellpadding="0" cellspacing="2">
            <tbody><tr>
              <td width="25%" height="35"><strong>Client</strong></td>
              <td width="25%"><strong>Collection </strong></td>
              <td width="25%"><strong> Date</strong></td>
              <td width="25%" rowspan="4" style="vertical-align:middle;text-align:left;"><div>
                <button name="btnSave" id="btnSave" type="button" class="btn btn-success" onclick="Submit();">Save</button>
                
                <!--<button type="button" class="btn" onClick="SendSMS();">Send SMS</button>-->
              </div></td>
              </tr>
            <tr>
              <td height="30"><select name="ClientName" id="ClientName" onchange="ShowLedgerAgent()">
                <option value="Select It...">Select It...</option>
         					<option value="100 JAI">
					  100 JAI					  </option>
										<option value="118 PURAN">
					  118 PURAN					  </option>
										<option value="130 ASHAD">
					  130 ASHAD					  </option>
										<option value="131 SANJAY">
					  131 SANJAY					  </option>
										<option value="132 SATAYAM">
					  132 SATAYAM					  </option>
										<option value="133 YASH">
					  133 YASH					  </option>
										<option value="134 TARIK">
					  134 TARIK					  </option>
										<option value="135 SANKER">
					  135 SANKER					  </option>
										<option value="136 RUBI">
					  136 RUBI					  </option>
										<option value="137 DEP">
					  137 DEP					  </option>
										<option value="138 SHIVAM">
					  138 SHIVAM					  </option>
										<option value="139 SOURABH">
					  139 SOURABH					  </option>
										<option value="140 ASIF">
					  140 ASIF					  </option>
										<option value="141 VK">
					  141 VK					  </option>
										<option value="142 NILESH">
					  142 NILESH					  </option>
										<option value="144 NAFEES">
					  144 NAFEES					  </option>
										<option value="145 NANNA">
					  145 NANNA					  </option>
										<option value="147 ARIF">
					  147 ARIF					  </option>
										<option value="148 MANJA">
					  148 MANJA					  </option>
										<option value="149 SERA">
					  149 SERA					  </option>
										<option value="150 DOCTOR">
					  150 DOCTOR					  </option>
										<option value="151 SHIVA BPL">
					  151 SHIVA BPL					  </option>
										<option value="152 VIJAY">
					  152 VIJAY					  </option>
										<option value="153 RAM JI">
					  153 RAM JI					  </option>
										<option value="158 ANKU">
					  158 ANKU					  </option>
										<option value="161 MUNNA">
					  161 MUNNA					  </option>
										<option value="162 UPENDRA">
					  162 UPENDRA					  </option>
										<option value="171 14 G">
					  171 14 G					  </option>
										<option value="172 APPI">
					  172 APPI					  </option>
										<option value="173 YASIN">
					  173 YASIN					  </option>
										<option value="174 JK">
					  174 JK					  </option>
										<option value="175 ENDRA SAHU">
					  175 ENDRA SAHU					  </option>
										<option value="177 ANIL">
					  177 ANIL					  </option>
										<option value="187 MANISH CHATARPUR">
					  187 MANISH CHATARPUR					  </option>
										<option value="188 RADHE RADHE">
					  188 RADHE RADHE					  </option>
										<option value="191 SULTAN">
					  191 SULTAN					  </option>
										<option value="193 KISSU">
					  193 KISSU					  </option>
										<option value="197 MANOJ MC">
					  197 MANOJ MC					  </option>
										<option value="199 MRADUL">
					  199 MRADUL					  </option>
										<option value="201 KALAS">
					  201 KALAS					  </option>
										<option value="204 BHASKER">
					  204 BHASKER					  </option>
										<option value="207 JAY">
					  207 JAY					  </option>
										<option value="215 DAU">
					  215 DAU					  </option>
										<option value="218 BABA">
					  218 BABA					  </option>
										<option value="219 JACKPOT">
					  219 JACKPOT					  </option>
										<option value="220 SHIVAM">
					  220 SHIVAM					  </option>
										<option value="221 SUMIT">
					  221 SUMIT					  </option>
										<option value="222 LAL SINGH">
					  222 LAL SINGH					  </option>
										<option value="223 DEVENDRA">
					  223 DEVENDRA					  </option>
										<option value="234 MAHAKAL">
					  234 MAHAKAL					  </option>
					              </select></td>
              <td><select name="Collection" id="Collection" onchange="ShowLedgerCollection()">
                <option value="CASH A/C" selected="">CASH A/C</option>
                                </select></td>
              <td>
                <div class="controls" style="vertical-align:middle;text-align:left;padding-top:0px;">
                  <input class=" m-ctrl-medium date-picker" size="16" name="BillDate" type="text" id="BillDate" value="2018-02-20">
                  </div>
              </td>
              </tr>
            <tr>
              <td width="25%" height="35"><strong>Amount</strong></td>
              <td width="130"><strong>Payment Type</strong></td>
              <td><strong>Remark</strong></td>
              </tr>
            <tr>
              <td><input name="Amount" type="text" id="Amount"></td>
              <td><select name="PaymentType" id="PaymentType">
                <option value="Payment Type" selected="">Payment Type</option>
                <option value="Payment Paid">PAYMENT - DENA</option>
                <option value="Payment Received">RECEIPT - LENA</option>
              </select></td>
              <td><input name="Remark" type="text" id="Remark" size="120"></td>
              </tr>
          </tbody></table>
          <br>
<br>
          <br>
          <br><br><br><br>
		            <br>
<br><br>
<br>
<br>

		            <input name="From" type="hidden" id="From" value="0">
      <input name="To" type="hidden" id="To" value="">
      <input name="FromID" type="hidden" id="FromID" value="">
      <input name="DeleteChk" type="hidden" id="DeleteChk" value="">
      <input name="AddInvoiceChk" type="hidden" id="AddInvoiceChk" value="">
      <input name="InvNo" type="hidden" id="InvNo" value="">
      <input name="SaveChk" type="hidden" id="SaveChk" value="">
      <input name="AgentShowChk" type="hidden" id="AgentShowChk" value="">
      <input name="CollectionShowChk" type="hidden" id="CollectionShowChk" value="">
      <input name="TotalAmount" type="hidden" id="TotalAmount" value="">
      <input name="DiscChk" type="hidden" id="DiscChk" value="">
      <input name="Discount" type="hidden" id="Discount" value="">
      <input name="SMSChk" type="hidden" id="SMSChk" value="">
      <input name="SMSId" type="hidden" id="SMSId" value="">
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