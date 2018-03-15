<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="TC.aspx.cs" Inherits="betplayer.Agent.TC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

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
		        <h3 class="page-title"> Terms &amp; Conditions</h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li>Terms &amp; Conditions <span class="divider">&nbsp;</span> </li>
		          <li><a href="../Login.php?alg=1"> <span style="color:#00F;"> <strong>Log Out</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
		            <h4><i class="icon-globe"></i>Terms &amp; Conditions</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form"> 
                  <!-- BEGIN FORM-->
                    <form name="BetPlayer" id="BetPlayer" method="post" action="ClientDetails.php" autocomplete="off">
                    <div class="alert alert-error" id="Error" style="visibility:hidden">
                            
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody><tr>
                        <td width="550"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tbody><tr>
                            <td height="30" class="typeahead"><strong>1. लोगिन करने के बाद अपना पासवर्ड बदल लें।
                            <br><br>
                            2. प्रत्येक गेम के लिए 100/- Coins चार्ज रहेगा।<br><br>
                            3. टेस्ट गेम में प्रतिदिन 100/- coins  चार्ज रहेगा। 
                            <br><br>
                            4. वनडे और टी-20 के एडवांस सौदे मैच शुरू होने के आधे घंटे पहले से ही लिए जायेंगे। 
                            <br><br>
                            5. टेस्ट मैच के एडवांस सौदे मैच शुरू होने के 45 मिनिट पहले से ही लिए जायेंगे। 
                            <br><br>
                            5. गेम रद्द या टाई होने पर मैच के सभी सौदे रद्द माने जायेंगे और जो सेशन पुरे हो चुके हे, उनके हिसाब से ही Coins कम या ज्यादा होंगे  ।
                            <br><br>
                            6. एक बार में मैच का सौदा कम से कम 2,000 (दो हज़ार)  एवं ज्यादा से ज्यादा 5,00,000 (पाँच लाख) और सेशन का सौदा कम से कम 1,000 (एक हज़ार) एवं ज्यादा से ज्यादा 1,00,000 (एक लाख) तक का ही  लिया जायेगा। 
                            <br><br>
                            7. मैच के दौरान भाव को देख व समझ के ही सौदा करे। किये गए किसी भी सौदे को हटाया या बदला नहीं जाएगा। सभी सौदे के लिए स्वयं आप ही जिम्मेदार होंगे।
                            <br><br>
                            <br>
                            नोट : सर्वर या वेबसाईट में किसी तरह की  खराबी आने या बंद हो जाने पर  केवल किये गए सौदे  ही मान्य होंगे। ऐसी स्थिति में  किसी भी तरह का वाद-विवाद मान्य नहीं होगा।
                          <br>
                            </strong></td>
                          </tr>
                        </tbody></table></td>
                      </tr>
                    </tbody></table>
                    
                      <div class="form-actions">
                          <a href="index.php"><button type="button" class="btn btn-success">NEXT =&gt; MAIN MENU</button></a>
                          <a href="../Login.php?lg=1"><button type="button" class="btn">Log Out</button></a>
                      </div>
                      
                    <input name="PasswordModifyChk" type="hidden" id="PasswordModifyChk" value="" readonly="readonly">
                    
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