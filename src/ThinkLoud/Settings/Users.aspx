<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="ThinkLoud.Settings.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Management</title>
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
<asp:Content ID="Content2" ContentPlaceHolderID="headerContent" runat="server">
			<table>
                <tr>
                    <td>
                        <img src="../Assets/Settings.png" />
                    </td>
                    <td class="auto-style7" colspan="2">
                        <span class="auto-style6">User Management</span>
                    </td>
                    <td>
                        <span class="auto-style1">v1.1</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        Select User: <asp:DropDownList id="lstUser" runat="server" Width="187px" Height="21px" AutoPostBack="True" onselectedindexchanged="lstAuthor_SelectedIndexChanged" />
                    </td>                 
                </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Button id="cmdNew" runat="server" Text="New" onclick="cmdNew_Click" />
                            <asp:Button id="cmdUpdate" runat="server" Text="Save" onclick="cmdUpdate_Click" />
                            <asp:Button id="cmdDelete" runat="server" Text="Delete" onclick="cmdDelete_Click" />
                            <asp:Button id="cmdInsert" runat="server" Text="Insert" onclick="cmdInsert_Click" Visible="false"/>
                        </td>
                    </tr>
                </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContent">	
				
			<asp:Label id="Label10" runat="server" Width="100px">Unique ID:</asp:Label>
			<asp:TextBox id="txtID" runat="server" Width="75px"/><br />
			
			<asp:Label id="Label2" runat="server" Width="100px">Name:</asp:Label>
			<asp:TextBox id="txtName" runat="server" Width="175px" /><br />
			
			<asp:Label id="Label3" runat="server" Width="100px">Username:</asp:Label>
			<asp:TextBox id="txtUsername" runat="server" Width="175px" /><br />
			
			<asp:Label id="Label4" runat="server" Width="100px">Password:</asp:Label>
			<asp:TextBox id="txtPassword" runat="server" Width="175px" TextMode="Password" />&nbsp;*passwords are not viewable<br />
			
			<asp:Label id="Label5" runat="server" Width="100px">Email:</asp:Label>
			<asp:TextBox id="txtEmail" runat="server" Width="320px" /><br />
			
			<br />
			
			<asp:Label id="lblResults" runat="server" Width="575px" Height="121px" Font-Bold="True"></asp:Label>
</asp:Content>