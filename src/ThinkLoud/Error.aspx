<%@ Page Title="Error" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="ThinkLoud.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: x-small;
        }
        .auto-style4 {
            width: 50px;
            height: 50px;
        }        
        .auto-style5 {
            font-size: x-large;
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
                    <img src="Assets/ErrorCircle.png" style="width: 48px; height: 48px"/>
                </td>
                <td class="auto-style7">
                    <span class="auto-style6">Whoops...</span>
                </td>
                <td>
                    <span class="auto-style1">v1.2</span>
                </td>
            </tr>
        </table>    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server">
    <p>
        It looks like there was an error. The support team has been notified, and will try to resolve the issue as soon as possible.
    </p>
    <asp:Button ID="Button2" runat="server" Text="Return" OnClientClick="" OnClick="Button2_Click"/> <asp:Button ID="Button1" runat="server" Text="Go Home" PostBackUrl="~/Default.aspx"/>
</asp:Content>