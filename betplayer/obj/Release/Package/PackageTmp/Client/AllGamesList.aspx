<%@ Page Language="C#" MasterPageFile="~/Client/Menu.Master" AutoEventWireup="true" CodeBehind="AllGamesList.aspx.cs" Inherits="betplayer.Client.AllGamesList" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <% foreach(System.Data.DataRow row in MatchesDataTable.Rows) { %>
    <div>
    
    </div>
    
    <div class="TeamName">
        <a href="#"><%: row["teamA"] %> v <%: row["teamB"] %></a>
    </div>
    <div class="profile-details">
        
        <a href="javascript:RedirectPage(<%: row["apiID"] %>);"  onclick="Redirect('<%: row["apiID"] %>');event.preventDefault();">
            <table width="100%" border="0" cellspacing="2" cellpadding="2">
                <tbody>
                    <tr>
                        <td width="1%">&nbsp;</td>
                        <td align="center" style="vertical-align: middle; text-align: center">

                            <div class="profile_picture">
                                <p align="center">
                                    <img src="<%=TeamtoImgpath(row["TeamA"].ToString()) %>" alt="team image" style="height:100px"></p>
                            </div>

                        </td>
                        <td class="GameList" style="vertical-align: top;">

                            <table width="99%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td class="GameList" align="center"><%: row["DateTime"] %> </td>
                                    </tr>
                                    <tr>
                                        <td class="GameList" align="center">Match Bets : <asp:Label ID="lblmatch" runat="server" Text="0"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="GameList" align="center">Session Bets : <asp:Label ID="lblSession" runat="server" Text="0"/></td>
                                    </tr>
                                    <tr>
                                        <td class="GameList" align="center">Declared :Yes</td>
                                    </tr>
                                    <tr>
                                        <td class="GameList" align="center">Won By : <%: row["winnerTeam"] %></td>
                                    </tr>
                                </tbody>
                            </table>

                        </td>
                        <td align="center" style="vertical-align: middle;">
                            <p align="center">
                                <img src="<%=TeamtoImgpath(row["TeamB"].ToString()) %>"alt="team image" style="height:100px"></p>
                        </td>
                        <td width="1%">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
        </a>
    </div>
    <br>
    &nbsp;<br>
    
    <% } //foreach %>


    <div class="content_bottom">
        <div class="clear"></div>
    </div>
   
     

      <script lang="javascript">
          function RedirectPage(MatchID)
          {
                ID = MatchID;
               <%redirect(ID);%>;
          }
          </script>

</asp:Content>