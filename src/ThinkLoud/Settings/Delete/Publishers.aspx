<%@ Page Title="Delete Publisher" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Publishers.aspx.cs" Inherits="ThinkLoud.Settings.Delete.Publishers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Delete Publisher</title>
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
        .auto-style9 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerContent" runat="server">
        <table>
            <tr>
                <td>
                    <img src="../../Assets/Delete.png" style="width: 48px; height: 48px" />
                </td>
                <td class="auto-style7">
                        <span class="auto-style6">Delete Publisher</span>
                    </td>
                <td>
                    <span class="auto-style1">V1.2</span>
                </td>
            </tr>
        </table>          
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="bodyContent">
        <table>
            <tr>
                <td class="auto-style8">
                    Please enter the ID number of the publisher you would like to delete:
                </td>
               <td>
                    <asp:TextBox runat="server" ID="pubIDTB" />
                </td>
            </tr>            
        </table>
        <h3>Data that will be deleted:</h3>
        <ul>
            <li>Publisher details</li>
            <li>Contacts</li>
            <li>Secondary names</li>
        </ul>
        <p>
            <span class="auto-style9"><strong>This process can not be un-done!</strong></span>
        </p>

        <p>
            <strong>Please note: you will not be able to delete a publisher if there is any report data for them stored in the database. If you need to delete a publisher from the database please contact your the support team.</strong><br /><br />
            <asp:Button runat="server" ID="deleteButton" Text="Delete Publisher" OnClick="deleteButton_Click"/>
        </p>
        <asp:Label id="lblResults" runat="server" Width="575px" Height="121px" Font-Bold="True"></asp:Label>
</asp:Content>
