<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Dashboard.Master" CodeBehind="SuperAgentPlusMinus.aspx.cs" Inherits="betplayer.admin.AgentPlusMinus" %>

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
		        <h3 class="page-title"> Client Plus Minus</h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li>Master Details <span class="divider">&nbsp;</span> </li>
		          <li>Client Plus Minus<span class="divider">&nbsp;</span></li>
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
		            <h4><i class="icon-globe"></i>Client Plus Minus</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form"> 
                  <!-- BEGIN FORM-->
                    <form name="BetPlayer" id="BetPlayer" method="post" action="ClientPlusMinus.php" autocomplete="off">
                    
                    <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="table table-striped table-hover table-bordered">
                          <tbody><tr>
                            <td width="75" height="25" align="left" valign="middle" style="vertical-align:middle;"><strong>CLIENT</strong></td>
                            <td align="left" valign="middle" style="vertical-align:middle;text-align:left;padding-top:10px;"><select name="ClientName" id="ClientName">
                                                            <option value="100 Jai">
                                100 Jai                              </option>
                                                            <option value="118 Puran">
                                118 Puran                              </option>
                                                            <option value="130 Ashad">
                                130 Ashad                              </option>
                                                            <option value="131 Sanjay">
                                131 Sanjay                              </option>
                                                            <option value="132 Satayam">
                                132 Satayam                              </option>
                                                            <option value="133 Yash">
                                133 Yash                              </option>
                                                            <option value="134 Tarik">
                                134 Tarik                              </option>
                                                            <option value="135 Sanker">
                                135 Sanker                              </option>
                                                            <option value="136 Rubi">
                                136 Rubi                              </option>
                                                            <option value="137 Dep">
                                137 Dep                              </option>
                                                            <option value="138 Shivam">
                                138 Shivam                              </option>
                                                            <option value="139 Sourabh">
                                139 Sourabh                              </option>
                                                            <option value="140 Asif">
                                140 Asif                              </option>
                                                            <option value="141 Vk">
                                141 Vk                              </option>
                                                            <option value="142 Nilesh">
                                142 Nilesh                              </option>
                                                            <option value="144 Nafees">
                                144 Nafees                              </option>
                                                            <option value="145 Nanna">
                                145 Nanna                              </option>
                                                            <option value="147 Arif">
                                147 Arif                              </option>
                                                            <option value="148 Manja">
                                148 Manja                              </option>
                                                            <option value="149 Sera">
                                149 Sera                              </option>
                                                            <option value="150 Doctor">
                                150 Doctor                              </option>
                                                            <option value="151 Shiva Bpl">
                                151 Shiva Bpl                              </option>
                                                            <option value="152 Vijay">
                                152 Vijay                              </option>
                                                            <option value="153 Ram ji">
                                153 Ram ji                              </option>
                                                            <option value="158 Anku">
                                158 Anku                              </option>
                                                            <option value="161 Munna">
                                161 Munna                              </option>
                                                            <option value="162 Upendra">
                                162 Upendra                              </option>
                                                            <option value="171 14 G">
                                171 14 G                              </option>
                                                            <option value="172 Appi">
                                172 Appi                              </option>
                                                            <option value="173 Yasin">
                                173 Yasin                              </option>
                                                            <option value="174 Jk">
                                174 Jk                              </option>
                                                            <option value="175 Endra Sahu">
                                175 Endra Sahu                              </option>
                                                            <option value="177 Anil">
                                177 Anil                              </option>
                                                            <option value="187 Manish chatarpur">
                                187 Manish chatarpur                              </option>
                                                            <option value="188 Radhe Radhe">
                                188 Radhe Radhe                              </option>
                                                            <option value="191 Sultan">
                                191 Sultan                              </option>
                                                            <option value="193 Kissu">
                                193 Kissu                              </option>
                                                            <option value="197 Manoj mc">
                                197 Manoj mc                              </option>
                                                            <option value="199 Mradul">
                                199 Mradul                              </option>
                                                            <option value="201 kalas">
                                201 kalas                              </option>
                                                            <option value="204 Bhasker">
                                204 Bhasker                              </option>
                                                            <option value="207 Jay">
                                207 Jay                              </option>
                                                            <option value="215 Dau">
                                215 Dau                              </option>
                                                            <option value="218 Baba">
                                218 Baba                              </option>
                                                            <option value="219 Jackpot">
                                219 Jackpot                              </option>
                                                            <option value="220 Shivam">
                                220 Shivam                              </option>
                                                            <option value="221 Sumit">
                                221 Sumit                              </option>
                                                            <option value="222 Lal singh">
                                222 Lal singh                              </option>
                                                            <option value="223 Devendra">
                                223 Devendra                              </option>
                                                            <option value="234 Mahakal">
                                234 Mahakal                              </option>
                                                          </select></td>
                            <td width="80" style="vertical-align:middle;"><strong>DATE FROM</strong></td>
                            <td width="170">
                            <div class="controls" style="vertical-align:middle;text-align:left;padding-top:5px;">
                                <input class=" m-ctrl-medium date-picker Width100" size="16" name="txtDateFrom" type="text" id="txtDateFrom" value="">
                            </div>
                            </td>
                            <td width="80" style="vertical-align:middle;"><strong>DATE TO</strong></td>
                            <td width="170">
                            <div class="controls" style="vertical-align:middle;text-align:left;padding-top:5px;">
                                <input class=" m-ctrl-medium date-picker Width100" size="16" name="txtDateTo" type="text" id="txtDateTo" value="">
                            </div>
                            </td>
                            <td width="125" align="center" valign="middle" style="text-align:center;vertical-align:middle;">
                            
                              	<button type="button" class="btn btn-success" onclick="ShowReport()">Show</button>
                            
                           </td>
                          </tr>
                        </tbody></table>
                    <br><br>
<br>

                    <br>
                                        <input name="From" type="hidden" id="From" value="">
                    <input name="To" type="hidden" id="To" value="">
                    <input name="FromID" type="hidden" id="FromID" value="">
                    <input name="DeleteChkMultiple" type="hidden" id="DeleteChkMultiple" value="">
                    <input name="DisplayChk" type="hidden" id="DisplayChk" value="">
                    <input name="MatchCount" type="hidden" id="MatchCount" value="">
      
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
