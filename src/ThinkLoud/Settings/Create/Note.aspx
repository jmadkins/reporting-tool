<%@ Page Title="Create Note" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Note.aspx.cs" Inherits="ThinkLoud.Settings.Create.Note" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Create Note</title>    
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
        .auto-style8 {
            width: 492px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerContent" runat="server">
			<table>
                <tr>
                    <td>
                        <img src="../../Assets/Notes.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7">
                        <span class="auto-style6">Create New Note for Publisher</span>
                    </td>
                    <td>
                        <span class="auto-style1">v1.0</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="Button2" runat="server" Text="Create" OnClick="Button2_Click" /> <asp:Button ID="Button1" runat="server" Text="Return" OnClick="Button1_Click"/>
                    </td>
                </tr>
            </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContent">
		    <asp:Label id="Label2" runat="server" Width="100px">Title:</asp:Label>
		    <asp:TextBox id="txtTitle" runat="server" Width="220px" />
            <br />			
		    <asp:Label id="Label4" style="vertical-align:top" runat="server" Width="100px">Text:</asp:Label>
		    <asp:TextBox id="txtText" runat="server" Width="350px" TextMode="MultiLine" Height="150px" />
            <br />
            <asp:Label id="Label1" style="vertical-align:top" runat="server" Width="100px">Date Created:</asp:Label>
            <asp:TextBox id="txtDate" runat="server" Width="220px" />
		    <br />            
            <asp:Label id="lblResults" runat="server" Width="575px" Height="121px" Font-Bold="True" />

    </asp:Content>