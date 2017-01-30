<%@ Page Title="Monthly Report - 1/4" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Step1.aspx.cs" Inherits="ThinkLoud.Step1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Monthly Report 1/4</title>

    <style type="text/css">
        .auto-style5 {
            font-size: xx-large;
        }
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
                        <img src="../Assets/Report.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7" colspan="2">
                        <span class="auto-style6">Step 1 - Select Publisher </span>
                    </td>
                </tr>
        </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContent">
        <asp:Label id="Label1" runat="server" Width="105px" Height="19px">Select Publisher:</asp:Label>
        <asp:DropDownList ID="lstPublishers" runat="server" Width="250px" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" /><br />
        <br />
        <asp:Button ID="cmdBegin" Height="24px" Text="Begin" runat="server" OnClick="cmdBegin_Click"/>
        <asp:Button ID="cmdExit" Height="24px" Text="Exit" runat="server" PostBackUrl="~/Default.aspx"/>        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" 
        SelectCommand="SELECT [ID], [Name] FROM [Publishers]">
    </asp:SqlDataSource>    
</asp:Content>