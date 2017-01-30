<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ThinkLoud.Admin.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Dashboard</title>
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
        .auto-style4 {
            width: 50px;
            height: 50px;
        }        
        .auto-style5 {
            font-size: x-large;
        }
        .auto-style10 {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headerContent" runat="server">
        <table>
            <tr>
                <td>
                    <img src="../Assets/Settings.png" />
                </td>
                <td class="auto-style7">
                    <span class="auto-style6">Admin Dashboard</span>
                </td>
                <td>
                    <span class="auto-style1">v1.1</span>
                </td>
            </tr>
        </table>          
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContent" >
        <table>
                <tr>
                    <td>
                        <img class="auto-style4" src="/Assets/Publishers.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style5">
                        <span class="auto-style6">Publishers</span>
                    </td>
                </tr>
        </table>
        <asp:Button ID="newPublisherBtn" runat="server" Text=" Create " PostBackUrl="~/Settings/Create/Publisher.aspx"/>
        <asp:Button ID="delPublisherBtn" runat="server" Text=" Delete " PostBackUrl="~/Settings/Delete/Publishers.aspx"/>
        <asp:Button ID="searchPublisherBtn" runat="server" Text=" Query " PostBackUrl="~/Search.aspx"/>
        <br />
        <h5>Quick Nav</h5>        
        Publisher ID: <asp:TextBox ID="quickNavTB" runat="server"></asp:TextBox> <asp:Button ID="quickNavBtn" runat="server" Text=" Go! " OnClick="quickNavBtn_Click"/>
        <br /><br />
        <hr />
        <table>
                <tr>
                    <td>
                        <img class="auto-style4" src="/Assets/Report.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style5">
                        <span class="auto-style6">Monthly Reports</span>
                    </td>
                </tr>
            </table>
        <asp:Button ID="Button2" runat="server" Text=" Start Monthly Report Now " PostBackUrl="~/Reports/MonthlyReport/Step1.aspx"/>
        <h4>Report CC Users</h4>
        <p>These are the email address that will appear in the CC field of the Monthly Report Process</p>
        <asp:Button ID="Button1" runat="server" Text=" Manage " PostBackUrl="~/Settings/Users.aspx"/>
        <br /><br />
        <h4>Email Templates</h4>
        <p>These are customizable templates for emails. You can have templates for specific publishers or specific circumstances.</p>
        <asp:Button ID="Button3" runat="server" Text=" Manage " PostBackUrl="~/Settings/Email.aspx"/>
</asp:Content>