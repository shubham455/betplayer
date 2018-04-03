<%@ Page Language="C#" MasterPageFile="~/superagent/DashBoard.Master" AutoEventWireup="true" CodeBehind="ModifyAgent.aspx.cs" Inherits="betplayer.Super_Agent.ModifyAgent" %>

<asp:Content ID ="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

     <div class="content-wrapper" style="height: 1200px">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Modify Client
        
            </h1>

        </section>
        <div class="col-md-6" style="padding-top: 20px !important">
            <div class="box box-warning ">
                <div class="box-header with-border">
                    <h3 class="box-title">Modify Client</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">

                    <!-- text input -->
                     <div class="form-group has-feedback">
                        <label>Code</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**" ControlToValidate="txtcode"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtcode" runat="server" class="form-control" placeholder="Enter..."></asp:TextBox>

                    </div>
                    <div class="form-group has-feedback">
                        <label>Name</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Enter..."></asp:TextBox>

                    </div>

                    <div class="form-group">
                        <div class="form-group">
                            <label>Contact No.</label>
                            <asp:RequiredFieldValidator ID="ChildNametxtValidator" runat="server" ErrorMessage="**" ControlToValidate="txtcontactno"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtcontactno" runat="server" class="form-control" placeholder="Enter..." MaxLength="10"></asp:TextBox>
                        </div>
                        
                        
                        <div class="form-group">
                            <label>Password</label>
                            <asp:RequiredFieldValidator ID="BirthPlacetxtValidator" runat="server" ErrorMessage="**" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtpassword" runat="server" class="form-control" placeholder="Enter..."></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <label>Client limit</label>
                            <asp:RequiredFieldValidator ID="MNametxtValidator" runat="server" ErrorMessage="**" ControlToValidate="txtclientlimit"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtclientlimit" runat="server" class="form-control" placeholder="Enter..."></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Agent current limit</label>
                            <asp:RequiredFieldValidator ID="FNametxtValidator" runat="server" ErrorMessage="**" ControlToValidate="txtAgentLimit"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtAgentLimit" runat="server" class="form-control" placeholder="Enter..."></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Agent share%</label>
                            <asp:RequiredFieldValidator ID="PresentAddtxtValidator6" runat="server" ErrorMessage="**" ControlToValidate="txtAgentShare"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtAgentShare" runat="server" class="form-control" placeholder="Enter..." ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Client Share%</label>
                            <asp:RequiredFieldValidator ID="PermanentAddtxtValidator7" runat="server" ErrorMessage="**" ControlToValidate="txtClientShare"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtClientShare" runat="server" class="form-control" placeholder="Enter..." ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Client Commision Percantage</label>
                           
                        </div>
                        <div class="form-group">
                            <label>Session Commission Type </label>
                             <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"  AppendDataBoundItems="true" DataTextField="UserName" DataValueField="UserID">
                            <asp:ListItem Text="Please Select" Value="1">Commission Type</asp:ListItem>
                                 <asp:ListItem Text="Please Select" Value="2">No Commission</asp:ListItem>
                                 <asp:ListItem Text="Please Select" Value="3">Only On MInus</asp:ListItem>
                                 <asp:ListItem Text="Please Select" Value="4">Bet By Bet</asp:ListItem>

                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="DropDownList1"
                            ErrorMessage="Value Required!" InitialValue="0"></asp:RequiredFieldValidator>

                        </div>
                       
                        <asp:Button ID="Submit" runat="server" class="btn btn-block btn-info btn-sm" Text="Update" OnClick="Submit_Click" />
                         <asp:Button ID="Button1" runat="server" class="btn btn-block btn-info btn-sm" Text="Cancel" OnClick="Button1_Click"  />
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    
</asp:content>
