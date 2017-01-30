<%@ Page Title="Email Template Management" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="ThinkLoud.Settings.Email" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Email Template Management</title>
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
                        <img src="../Assets/Email.png" />
                    </td>
                    <td class="auto-style7" colspan="2">
                        <span class="auto-style6">Email Template Management</span>
                    </td>
                    <td>
                        <span class="auto-style1">v1.1</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        Select Template: <asp:DropDownList id="lstTemplates" runat="server" Width="187px" Height="21px" AutoPostBack="True" onselectedindexchanged="lstAuthor_SelectedIndexChanged" />
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
			<asp:TextBox id="txtID" runat="server" Width="100px" />
            <br />			
			<asp:Label id="Label2" runat="server" Width="100px">Name:</asp:Label>
			<asp:TextBox id="txtName" runat="server" Width="255px" />
            <br />			
			<asp:Label id="Label3" runat="server" Width="100px" Height="200px" style="margin-top: 0px">Text:</asp:Label>
			<asp:TextBox id="txtText" runat="server" Width="490px" Height="200px" TextMode="MultiLine" />
            <br />			
			<br />			
			<asp:Label id="lblResults" runat="server" Width="575px" Height="107px" Font-Bold="True" />
</asp:Content>