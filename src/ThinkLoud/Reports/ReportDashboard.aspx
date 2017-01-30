<%@ Page Title="Reports Dashboard" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ReportDashboard.aspx.cs" Inherits="ThinkLoud.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reports</title>
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
                width: 85px;
            }
            </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headerContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <img src="/Assets/DBReports.png" style="width: 48px; height: 48px"/>
                </td>
                <td class="auto-style7">
                    <span class="auto-style6">Report Dashboard</span>
                </td>
                <td>
                    <span class="auto-style1">ALPHA</span>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    Select Report: <asp:DropDownList id="lstReports" runat="server" Width="187px" Height="21px" AutoPostBack="True" OnSelectedIndexChanged="lstReports_SelectedIndexChanged"  >
                        <asp:ListItem Value="null">- Select Report -</asp:ListItem>
                        <asp:ListItem Value="pubDetails">Publisher Details</asp:ListItem>
                        <asp:ListItem Value="monthlyReport">Monthly Report</asp:ListItem>
                        <asp:ListItem Value="contacts" Enabled="False">Contacts</asp:ListItem>
                        <asp:ListItem Value="templates" Enabled="False">Templates</asp:ListItem>
                        <asp:ListItem Value="pubSecNames" Enabled="False">Publisher Secondary Names</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="Button1" runat="server" Text="Return" OnClick="Button1_Click" /> <asp:Label ID="reportLabel" runat="server" Text="" />
                </td>
            </tr>
        </table>       
</asp:Content>

<asp:Content ContentPlaceHolderID="bodyContent" runat="server" >
    
</asp:Content>