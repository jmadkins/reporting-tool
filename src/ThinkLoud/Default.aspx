<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" MasterPageFile="~/Master.Master" Title="Home - PRT"%>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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
            .auto-style9 {
                width: 325px;
            }
        </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
        <table>
                <tr>
                    <td>
                        <img src="/Assets/Home.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7">
                        <span class="auto-style6">Home</span>
                    </td>
                </tr>
            </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bodyContent" runat="server" >
    <h3>Introduction</h3>
    <p>Homepage for the application. This will display informtion in a later release.</p>                
</asp:Content>