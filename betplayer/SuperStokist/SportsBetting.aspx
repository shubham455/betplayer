<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SuperStokist/DashBoard.Master" CodeBehind="SportsBetting.aspx.cs" Inherits="betplayer.SuperStokist.SportsBetting" %>

<asp:Content ID="content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="main-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN THEME CUSTOMIZER--><!-- END THEME CUSTOMIZER-->
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					  <h3 class="page-title">
					  Sport's Betting</h3>
						<ul class="breadcrumb">
							<li>
                                <a href="#"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
							</li>
							<li><a href="SportsDetails.aspx">Sport's Betting</a><span class="divider">&nbsp;</span></li>
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
                            <a href="SportsDetails.aspx">
                                <div class="stats-circle turquoise-color">
                                    <i class="icon-user"></i>
                                </div>
                            <strong><p style="color:#4CC5CD;">Sport's Details</p></strong>
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