<%@ Page Title="Login" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ThinkLoud.Login" %>

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

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: #FFE0C0; height: auto; width: 765px; padding: 10px">
        <table>
                <tr>
                    <td>
                        <img src="/Assets/Lock.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7">
                        <span class="auto-style6">Login</span>
                    </td>
                </tr>
            </table>
    </div>

    <div style="background-color: #E0E0E0; height: auto; width: 765px; padding: 10px">
        
        <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="237px" Width="335px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
        
    </div>
</asp:Content>