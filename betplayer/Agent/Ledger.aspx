<%@ Page Language="C#" MasterPageFile="~/Agent/DashBoard.Master" AutoEventWireup="true" CodeBehind="Ledger.aspx.cs" Inherits="betplayer.Agent.Ledger" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="main-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN THEME CUSTOMIZER--><!-- END THEME CUSTOMIZER-->
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					  <h3 class="page-title">Ledger</h3>
						<ul class="breadcrumb">
							<li>
                                <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
							</li>
							<li><a href="#">Ledger</a><span class="divider">&nbsp;</span></li>
                            <li><a href="Dashboard.aspx"> <span style="color:#00F;"> <strong>Back</strong></span></a><span class="divider-last">&nbsp;</span></li>
                            <li class="pull-right search-wrap">
                                
                            </li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
                <div class="row-fluid circle-state-overview">
                    <div style="float:left;padding-left:20px;padding-right:20px;">
                        <div class="circle-wrap">
                            <a href="My_Ledger.aspx">
                                <div class="stats-circle turquoise-color">
                                    <i class="icon-user"></i>
                                </div>
                            <strong><p style="color:#4CC5CD;">My Ledger</p></strong>
                            </a>
                        </div>
                    </div>
                
                    <div style="float:left;padding-left:20px;padding-right:20px;">
                        <div class="circle-wrap">
                            <a href="Clientplusminus.aspx">
                                <div class="stats-circle red-color">
                                    <i class="icon-tags"></i>
                                </div>
                                <strong><p style="color:#E17F90;">Client Plus/Minus</p></strong>
                            </a>
                        </div>
                    </div>
                    
                    <div style="float:left;padding-left:20px;padding-right:20px;">
                        <div class="circle-wrap">
                        	<a href="ClientLedger.aspx">
                                <div class="stats-circle purple-color">
                                    <i class="icon-eye-open"></i>
                                </div>
                                <strong><p style="color:#C8ABDB;">Client Ledger</p></strong>
                            </a>
                        </div>
                    </div>
                    
                    <div style="float:left;padding-left:20px;padding-right:20px;">
                        <div class="circle-wrap">
                        	<a href="AllClientLedger.aspx">
                                <div class="stats-circle blue-color">
                                    <i class="icon-bar-chart"></i>
                                </div>
                                <strong><p style="color:#93C4E4;">ALL Client Ledger</p></strong>
                            </a>
                        </div>
                    </div>
                    
                    <div style="float:left;padding-left:20px;padding-right:20px;">
                        <div class="circle-wrap">
                            <a href="DateWiseReport.aspx">
                                <div class="stats-circle turquoise-color">
                                    <i class="icon-user"></i>
                                </div>
                            <strong><p style="color:#4CC5CD;">Date Wise Report</p></strong>
                            </a>
                        </div>
                    </div>
                	
                    <div style="float:left;padding-left:20px;padding-right:20px;">
                        <div class="circle-wrap">
                            <a href="Dashboard.aspx">
                                <div class="stats-circle gray-color">
                                    <i class="icon-comments-alt"></i>
                                </div>
                                <strong><p style="color:#B9BABA;">Back</p></strong>
                        	</a>
                        </div>
                    </div>
                    
                </div>
                       
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
</asp:Content>
