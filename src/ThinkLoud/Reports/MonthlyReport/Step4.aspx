<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Step4.aspx.cs" Inherits="ThinkLoud.ComposeEmail" MasterPageFile="~/Master.Master" Title="Monthly Report - 4/4" %>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <title>Monthly Report 4/4</title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-small;
        }
        .auto-style6 {
            font-size: xx-large;
        }
        .auto-style7 {
            width: 730px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
        <table>
                <tr>
                    <td>
                        <img src="../Assets/Send.png" />
                    </td>
                    <td class="auto-style7" colspan="2">
                        <span class="auto-style6">Step 4 - Send Email</span>
                    </td>
                </tr>
        </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContent">
    <table>
        <tr>
             <td>
                 To: 
             </td>
            <td>
                 <asp:TextBox ID="txtTo" runat="server" Width="550px"/>
            </td>
        </tr>
        <tr>
             <td>
                 CC: 
             </td>
            <td>
                 <asp:TextBox ID="txtCC" runat="server" Width="550px" />&nbsp;<asp:Button ID="Button3" Text="defaults" runat="server" OnClientClick="javascript: defaultCC"/>
            </td>
        </tr>
        <tr>
             <td>
                 BCC: 
             </td>
            <td>
                 <asp:TextBox ID="txtBCC" runat="server" Width="550px" />
            </td>
        </tr>
        <tr>
             <td>
                 Subject:
             </td>
            <td>
                 <asp:TextBox ID="txtSubject" runat="server" Width="550px" />
            </td>
        </tr>
        <tr>
             <td>
                 <p>Body:</p>
             </td>
            <td>
                 <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Height="516px" Width="701px" />
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td>
                 <asp:Button ID="cmdSend" Height="24px" Text="Send Email(s)" runat="server" OnClientClick="javascript:return alertBox()" OnClick="cmdSend_Click"/>
                &nbsp;<asp:Button ID="Button2" Height="24px" Text="Clear" runat="server" OnClientClick="javascript:return alertBox()" OnClick="cmdClear_Click"/>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" SelectCommand="SELECT * FROM [Publishers]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" SelectCommand="SELECT * FROM [Templates]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" SelectCommand="SELECT * FROM [Contacts]"></asp:SqlDataSource>
</asp:Content>