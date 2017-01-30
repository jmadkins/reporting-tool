<%@ Page Title="About" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ThinkLoud.About" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About</title>
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
            .auto-style10 {
                width: 44px;
                text-align: left;
                font-weight: bold;
            }
            .auto-style11 {
                width: 611px;
                text-align: left;
            }
        </style>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="headerContent" runat="server">
        <table>
            <tr>
                    <td>
                        <img src="/Assets/Information.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7">
                        <span class="auto-style6">About</span>
                    </td>
                </tr>
            </table>           
    </asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server" >
        <table>
            <tr>
                <td class="auto-style10">Application</td>
                <td class="auto-style11"><asp:Label ID="appName" runat="server" /></td>
            </tr>
            <tr>
                <td class="auto-style10">Company</td>
                <td class="auto-style11"><asp:Label ID="company" runat="server" /></td>
            </tr>
            <tr>
                <td class="auto-style10">Version</td>         
                <td class="auto-style11"><asp:Label ID="versionNumber" runat="server" /></td>       
            </tr>
            <tr>
                <td class="auto-style10">Support</td>
                <td class="auto-style11"><a href="mailto:support@adkinssd.com">support@adkinssd.com</a></td>
            </tr>
        </table>
        <p>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Assets/ASDLogo.png" />
        </p>
        <p>Copyright © 2013 Adkins Software Development</p>
        <p>Use of this software is for the explicit use of Adkins Software Development it's employees.<br />
        Reproduction in whole or part without permission is prohibited.</p>
        <hr />
        <h3>Change Log</h3>        
        <ul>
            <li>Resolved several issues that would prevent the application from loading correctly</li>
            <li>Reports (not yet operational)</li>
            <li>Publisher Management improvements</li>
            <li>Search improvements</li>
            <li>UI Tweaks and speed improvements</li>
        </ul>
    </asp:Content>