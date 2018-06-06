<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="UpdateClientLimit.aspx.cs" Inherits="betplayer.Agent.UpdateClientLimit" %>

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
		        <h3 class="page-title"> Client Limit</h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li>Master Details <span class="divider">&nbsp;</span> </li>
		          <li>Client Limit<span class="divider">&nbsp;</span></li>
                  <li><a href="ClientDetails.php"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
		            <h4><i class="icon-globe"></i>Client Limit</h4>
		            <span class="tools"> <a href="javascript:;" class="icon-chevron-down"></a> <a href="javascript:;" class="icon-remove"></a> </span> </div>
		          <div class="widget-body form"> 
                  <!-- BEGIN FORM-->
                    
                                        <div class="alert alert-error" id="Error" style="visibility:hidden">
                            
                    </div>
                    <table width="100%" class="table table-striped table-hover table-bordered">
                          <tbody><tr>
                            <td height="25" align="left" class="TableHeading">&nbsp;</td>
                            <td align="left" class="TableHeading">&nbsp;</td>
                            <td colspan="3" align="left" class="TableHeading">Client Limit</td>
                          </tr>
                          <tr>
                            <td height="25" align="left" class="TableHeading">SNo.</td>
                            <td align="left" class="TableHeading">Client  Name</td>
                            <td align="left" class="TableHeading">Fix Limit</td>
                            <td align="left" class="TableHeading">Current Limit</td>
                            <td align="left" class="TableHeading">Used Limit</td>
                          </tr>
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">1</td>
                            <td align="left" class="FontText">
                              <input name="ClientName1" type="text" class="TextBoxTransparent" id="ClientName1" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('1')" value="1144 Manoj" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit1" id="FixLimit1" style="text-align:right" type="text" value="0" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit1" id="Limit1" style="text-align:right" type="text" value="0" onblur="CheckTotalLimit('1')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit1" type="text" id="ULimit1" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">2</td>
                            <td align="left" class="FontText">
                              <input name="ClientName2" type="text" class="TextBoxTransparent" id="ClientName2" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('2')" value="1161 pandit" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit2" id="FixLimit2" style="text-align:right" type="text" value="0" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit2" id="Limit2" style="text-align:right" type="text" value="0" onblur="CheckTotalLimit('2')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit2" type="text" id="ULimit2" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">3</td>
                            <td align="left" class="FontText">
                              <input name="ClientName3" type="text" class="TextBoxTransparent" id="ClientName3" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('3')" value="1299 kapoor" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit3" id="FixLimit3" style="text-align:right" type="text" value="20000" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit3" id="Limit3" style="text-align:right" type="text" value="100" onblur="CheckTotalLimit('3')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit3" type="text" id="ULimit3" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">4</td>
                            <td align="left" class="FontText">
                              <input name="ClientName4" type="text" class="TextBoxTransparent" id="ClientName4" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('4')" value="1459 kapoor 22" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit4" id="FixLimit4" style="text-align:right" type="text" value="100" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit4" id="Limit4" style="text-align:right" type="text" value="100" onblur="CheckTotalLimit('4')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit4" type="text" id="ULimit4" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">5</td>
                            <td align="left" class="FontText">
                              <input name="ClientName5" type="text" class="TextBoxTransparent" id="ClientName5" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('5')" value="520 naval" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit5" id="FixLimit5" style="text-align:right" type="text" value="65000" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit5" id="Limit5" style="text-align:right" type="text" value="200" onblur="CheckTotalLimit('5')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit5" type="text" id="ULimit5" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">6</td>
                            <td align="left" class="FontText">
                              <input name="ClientName6" type="text" class="TextBoxTransparent" id="ClientName6" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('6')" value="523 deepak" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit6" id="FixLimit6" style="text-align:right" type="text" value="50000" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit6" id="Limit6" style="text-align:right" type="text" value="200" onblur="CheckTotalLimit('6')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit6" type="text" id="ULimit6" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">7</td>
                            <td align="left" class="FontText">
                              <input name="ClientName7" type="text" class="TextBoxTransparent" id="ClientName7" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('7')" value="526 rinku" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit7" id="FixLimit7" style="text-align:right" type="text" value="80000" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit7" id="Limit7" style="text-align:right" type="text" value="10" onblur="CheckTotalLimit('7')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit7" type="text" id="ULimit7" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">8</td>
                            <td align="left" class="FontText">
                              <input name="ClientName8" type="text" class="TextBoxTransparent" id="ClientName8" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('8')" value="528 bhagwan" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit8" id="FixLimit8" style="text-align:right" type="text" value="100000" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit8" id="Limit8" style="text-align:right" type="text" value="18400" onblur="CheckTotalLimit('8')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit8" type="text" id="ULimit8" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">9</td>
                            <td align="left" class="FontText">
                              <input name="ClientName9" type="text" class="TextBoxTransparent" id="ClientName9" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('9')" value="532 roky" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit9" id="FixLimit9" style="text-align:right" type="text" value="0" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit9" id="Limit9" style="text-align:right" type="text" value="0" onblur="CheckTotalLimit('9')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit9" type="text" id="ULimit9" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">10</td>
                            <td align="left" class="FontText">
                              <input name="ClientName10" type="text" class="TextBoxTransparent" id="ClientName10" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('10')" value="536 malik" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit10" id="FixLimit10" style="text-align:right" type="text" value="0" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit10" id="Limit10" style="text-align:right" type="text" value="0" onblur="CheckTotalLimit('10')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit10" type="text" id="ULimit10" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">11</td>
                            <td align="left" class="FontText">
                              <input name="ClientName11" type="text" class="TextBoxTransparent" id="ClientName11" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('11')" value="538 santro" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit11" id="FixLimit11" style="text-align:right" type="text" value="500000" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit11" id="Limit11" style="text-align:right" type="text" value="253600" onblur="CheckTotalLimit('11')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit11" type="text" id="ULimit11" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="25" align="left" class="FontText">12</td>
                            <td align="left" class="FontText">
                              <input name="ClientName12" type="text" class="TextBoxTransparent" id="ClientName12" style="text-align:right;text-align:left;" onblur="CheckTotalLimit('12')" value="9421 Hemant Test" readonly="">
                            </td>
                            <td align="left" class="TextBox100"><input name="FixLimit12" id="FixLimit12" style="text-align:right" type="text" value="10000" class="TextBox100"></td>
                            <td align="left" class="TextBox100"><input name="Limit12" id="Limit12" style="text-align:right" type="text" value="9500" onblur="CheckTotalLimit('12')" class="TextBox100"></td>
                            <td align="left" class="FontText"><input name="ULimit12" type="text" id="ULimit12" style="text-align:right" value="0" class="TextBox100" readonly="" disabled=""></td>
                          </tr>
                          
                          
                                                    <tr bgcolor="#FFFFFF">
                            <td height="20" align="left" class="FontText">&nbsp;</td>
                            <td align="left" class="FontText">&nbsp;</td>
                            <td align="left" class="FontText">&nbsp;</td>
                            <td align="left" class="FontText">&nbsp;</td>
                            <td align="left" class="FontText">&nbsp;</td>
                          </tr>
                          <tr bgcolor="#E9F3FD" class="TableHeading">
                            <td height="25" align="center" bgcolor="#FFFFFF"><strong>Limit</strong></td>
                            <td align="left" valign="middle" bgcolor="#FFFFFF" class="TableHeading"><input name="AgentLimit" type="text" id="AgentLimit" style="text-align:right" value="301551" readonly=""></td>
                            <td align="left" bgcolor="#FFFFFF" class="FontText">&nbsp;</td>
                            <td align="left" bgcolor="#FFFFFF" class="FontText"><input name="TotalLimit" type="text" class="TextBox100" id="TotalLimit" style="text-align:right" value="282110"></td>
                            <td align="left" bgcolor="#FFFFFF" class="FontText">&nbsp;</td>
                          </tr>
                          <tr bgcolor="#E9F3FD" class="TableHeading">
                            <td height="25" colspan="5" align="center" bgcolor="#FFFFFF" class="ButtonL" style="background:#FFF;">नोट : लिमिट को अपडेट करने के लिए अपडेट बटन को दो बार क्लिक करे।</td>
                          </tr>
                        </tbody></table>
                    <div class="form-actions">
				    <button type="button" class="btn btn-success" onclick="SaveLimit()">Update</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="ClientDetails.php"><button type="button" class="btn">Cancel</button></a>
                 	</div>
                      
                      
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