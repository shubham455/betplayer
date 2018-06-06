<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="betplayer.admin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../admin/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gridview1"  CssClass="table table-striped table-hover table-bordered" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
