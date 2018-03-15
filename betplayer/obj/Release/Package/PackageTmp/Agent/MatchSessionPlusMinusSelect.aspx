<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="MatchSessionPlusMinusSelect.aspx.cs" Inherits="betplayer.Agent.MatchSessionPlusMinusSelect" %>

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
		        <h3 class="page-title"> Match &amp; Session Plus Minus Selection
  <small> </small></h3>
		        <ul class="breadcrumb">
		          <li> <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span> </li>
		          <li> Sport's Betting <span class="divider">&nbsp;</span> </li>
		          <li> Match &amp; Session Plus Minus Selection<span class="divider">&nbsp;</span></li>
                  <li><a href="SportsDetails.aspx"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
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
                    <form name="BetPlayer" id="BetPlayer" method="post" action="MatchSessionPlusMinusDisplay.php" autocomplete="off">
                    
		            <div class="portlet-body">
		              <div class="clearfix">
		                
	                  </div>
		              <div class="space15"></div>
		            
                    </div>
		            
			                
            <table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tbody><tr>
    <td>
    
    </td>
  </tr>
</tbody></table>
<br>
<table class="table table-striped table-hover table-bordered">
    <tbody><tr>
      <td height="25" width="70%" style="text-align:center;vertical-align:middle;"> 
        <strong>AGENT &amp; CLIENT OF
SOUTH AFRICA V INDIA (2ND T20)        </strong></td>
      <td height="25" style="text-align:center;vertical-align:middle;"> 
      <button type="button" class="btn btn-success" onclick="ShowReport()">Show</button>
      </td>
    </tr>
</tbody></table><br>
        
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tbody><tr>
    <td valign="top">
    
    <table width="400" align="left" class="table table-striped table-hover table-bordered">
      
      <tbody><tr>
        <td width="20" height="25" align="center" class="TableHeadingCheckBox">
          
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-striped table-hover table-bordered">
            <tbody><tr>
              <td width="20" align="center" class="TableHeadingCheckBox"><div class="checker" id="uniform-246_M_A"><span class="checked"><input type="checkbox" checked="" name="246_M_A" id="246_M_A" onclick="SelectDeselectAllAgent_Match('246_M_A')" value="246_M_A" style="opacity: 0;"></span></div>
                </td>
              <td align="left" class="TableHeading">AGENT</td>
              </tr>
            </tbody></table>
          
          </td>
        
        <td width="20" align="center" class="TableHeadingCheckBox">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-striped table-hover table-bordered">
            <tbody><tr>
              <td width="20" align="center" class="TableHeadingCheckBox">
                <div class="checker" id="uniform-246_M_C"><span class="checked"><input type="checkbox" checked="" name="246_M_C" id="246_M_C" onclick="SelectDeselectAllClient_Match('246_M_C')" value="246_M_C" style="opacity: 0;"></span></div></td>
              <td align="left" class="TableHeading">CLIENT</td>
              </tr>
            </tbody></table>
          </td>
        
      </tr>
      <tr>
        <td height="25" align="center" class="TableHeadingCheckBox">
        
        <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                    <tbody><tr bgcolor="#FFFFFF">
            <td width="20" align="center"><div class="checker" id="uniform-246_M_A1"><span class="checked"><input type="checkbox" checked="" name="246_M_A1" id="246_M_A1" value="LALA MAU" style="opacity: 0;"></span></div></td>
            <td height="20" align="left" class="FontText">LALA MAU</td>
          </tr>
          		
                  </tbody></table>
          <input type="hidden" name="246_M_A_ALL" id="246_M_A_ALL" value="1">
        
        </td>
        <td align="center" class="TableHeadingCheckBox">
        
        <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                  </table>
          <input type="hidden" name="246_M_C_ALL" id="246_M_C_ALL" value="0">
        
        </td>
      </tr>
      </tbody></table>
    
    </td>
    <td valign="top">
    <table align="left" class="table table-striped table-hover table-bordered">
        <tbody>
          <tr><th width="33%" height="25" colspan="2" align="center" class="TableHeadingCheckBox">
          
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-striped table-hover table-bordered">
            <tbody><tr>
              <td width="20" align="center"><div class="checker" id="uniform-246_S_S"><span class="checked"><input type="checkbox" checked="" name="246_S_S" id="246_S_S" onclick="SelectDeselectAllSession('246_S_S')" value="246_S_S" style="opacity: 0;"></span></div></td>
              <td height="25" align="left" class="TableHeading">SESSION</td>
              </tr>
          </tbody></table>
          
            </th>
          <th width="33%" colspan="2" align="center">
          
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-striped table-hover table-bordered">
            <tbody><tr>
              <td width="20" align="center" class="TableHeadingCheckBox"><div class="checker" id="uniform-246_S_A"><span class="checked"><input type="checkbox" checked="" name="246_S_A" id="246_S_A" onclick="SelectDeselectAllAgent('246_S_A')" value="246_S_A" style="opacity: 0;"></span></div></td>
              <td align="left" class="TableHeading">AGENT</td>
              </tr>
            </tbody></table>
            
          </th>
          <th width="33%" colspan="2" align="center">
          
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-striped table-hover table-bordered">
            <tbody><tr>
              <td width="20" align="center" class="TableHeadingCheckBox"><div class="checker" id="uniform-246_S_C"><span class="checked"><input type="checkbox" checked="" name="246_S_C" id="246_S_C" onclick="SelectDeselectAllClient('246_S_C')" value="246_S_C" style="opacity: 0;"></span></div></td>
              <td align="left" class="TableHeading">CLIENT </td>
              </tr>
            </tbody></table>
            
            </th>
        </tr></tbody>
        <tbody><tr>
          <td height="25" colspan="2" align="center" valign="top">
            
            <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
              
                            </table>
            <input type="hidden" name="246_S_S_ALL" id="246_S_S_ALL" value="0">
            </td>
          <td colspan="2" align="center" valign="top">
            
            <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                            <tbody><tr bgcolor="#FFFFFF">
                <td width="20" align="center"><div class="checker" id="uniform-246_S_A1"><span class="checked"><input type="checkbox" checked="" name="246_S_A1" id="246_S_A1" value="LALA MAU" style="opacity: 0;"></span></div></td>
                <td height="20" align="left" class="FontText">LALA MAU</td>
                </tr>
                            </tbody></table>
            <input type="hidden" name="246_S_A_ALL" id="246_S_A_ALL" value="1">
            </td>
          <td colspan="2" align="center" valign="top">
            
            <table width="100%" border="0" cellspacing="2" cellpadding="0" class="table table-striped table-hover table-bordered">
                            </table>
            <input type="hidden" name="246_S_C_ALL" id="246_S_C_ALL" value="0">
            </td>
        </tr>
        
        </tbody></table>
    </td>
  </tr>
</tbody></table>

      
    
  


      
<input name="From" type="hidden" id="From" value="">
      <input name="To" type="hidden" id="To" value="0">
      <input name="FromID" type="hidden" id="FromID" value="">
      <input name="BackPage" type="hidden" id="BackPage" value="MatchSessionPlusMinusSelect.php?MT=246">
      <input name="DisplayChk" type="hidden" id="DisplayChk" value="Yes">
      <input name="MatchCount" type="hidden" id="MatchCount" value="1">
      <input name="MatchCode" type="hidden" id="MatchCode" value="246">
        <table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tbody><tr>
    <td>&nbsp;</td>
  </tr>
</tbody></table>
       
                    
                    <br>
<br>
<br>

		          
                  
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