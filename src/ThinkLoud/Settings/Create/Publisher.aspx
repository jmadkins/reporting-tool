<%@ Page Title="Create Publisher" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Publisher.aspx.cs" Inherits="ThinkLoud.Settings.Create.Publisher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Create Publisher</title>    
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
                        <img src="../../Assets/Publishers.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7">
                        <span class="auto-style6">Create New Publisher</span>
                    </td>
                    <td>
                        <span class="auto-style1">v1.2</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="Button2" runat="server" Text="Create" OnClick="Button2_Click" /><asp:Button ID="Button1" runat="server" Text="Return" OnClick="Button1_Click" />
                    </td>
                </tr>
        </table>	
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContent">
		<table>
            <tr>
                <td>Publisher Name:</td>
                <td><asp:TextBox id="txtName" runat="server" Width="200px" /></td>
            </tr>
		</table>
	    <br />
        <asp:Label id="lblResults" runat="server" Width="575px" Height="121px" Font-Bold="True" />
</asp:Content>
