<%@ Page Title="Monthly Report - 3/4" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Step3.aspx.cs" Inherits="ThinkLoud.MonthlyReport.Step3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Monthly Report 3/4</title>

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
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerContent" runat="server">
        <table>
                <tr>
                    <td>
                        <img src="../Assets/AddAttachment.png" />
                    </td>
                    <td class="auto-style7" colspan="2">
                        <span class="auto-style6">Step 3 - Upload Excel Spreadsheet</span>
                    </td>
                </tr>
        </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContent">
        <p>Please upload the excel spreadsheet(s) that you would like to be attached to the email that is send to the publisher.</p>
        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" Width="433px" />
        <br />
        <br />
        <asp:Button ID="cmdBegin" Height="24px" Text="Next" runat="server" OnClick="cmdBegin_Click"/>
        <br />
        <asp:Label id="lblResults" runat="server" Width="575px" Height="121px" Font-Bold="True"></asp:Label>

  
</asp:Content>