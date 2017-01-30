<%@ Page Title="Monthly Report - 2/4" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Step2.aspx.cs" Inherits="ThinkLoud.Step2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Monthly Report 2/4</title>

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
                        <img src="../Assets/Publishers.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7" colspan="2">
                        <span class="auto-style6">Step 2 - Publisher Information</span></td>
                </tr>
            <tr>
                <td colspan="2">
                    Publisher: <asp:Label ID="publisherNameLabel" runat="server" style="font-size: medium" /> 
                    <br />
                    <asp:Button ID="viewPublisher" runat="server" Text="View Publisher" OnClick="viewPublisher_Click" />
                </td>
            </tr>
        </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContent">
		When querying the Computing Reviews database for publishers, please make sure to also query for these publishers as well<br />
		<br />
		<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
			<AlternatingItemTemplate>
				<span style="background-color: #FFF8DC;">Name:
					<asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
					<br />
					Notes:
					<asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
					<br />
					<br />
				</span>
			</AlternatingItemTemplate>
			<EditItemTemplate>
				<span style="background-color: #008A8C;color: #FFFFFF;">Name:
				<asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
				<br />
				Notes:
				<asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
				<br />
				<asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
				<br />
                <br />
				</span>
			</EditItemTemplate>
			<EmptyDataTemplate>
				<span>No data was returned.</span>
			</EmptyDataTemplate>
			<InsertItemTemplate>
				<span style="">Name:
				<asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
				<br />Notes:
				<asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
				<br />
				<asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
				<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
				<br />
				<br /></span>
			</InsertItemTemplate>
			<ItemTemplate>
				<span style="background-color: #DCDCDC;color: #000000;">Name:
				<asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
				<br />
				Notes:
				<asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
				<br />
<br /></span>
			</ItemTemplate>
			<LayoutTemplate>
				<div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
					<span runat="server" id="itemPlaceholder" />
				</div>
				<div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
				</div>
			</LayoutTemplate>
			<SelectedItemTemplate>
				<span style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Name:
				<asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
				<br />
				Notes:
				<asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
				<br />
                <br /></span>
			</SelectedItemTemplate>
		</asp:ListView>
		<br />
		<asp:Button ID="cmdBegin" Height="24px" Text="Next" runat="server" OnClick="cmdBegin_Click" />        
		<br />
		<br />
		<asp:Label id="lblResults" runat="server" Width="575px" Height="121px" Font-Bold="True"></asp:Label>
	<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" 
		SelectCommand="SELECT PubSecName.Name, PubSecName.Notes FROM dbo.PubSecName INNER JOIN dbo.Publishers ON PubSecName.PubID = Publishers.ID WHERE (Publishers.Name = @Name)">
		<SelectParameters>
			<asp:ControlParameter ControlID="publisherNameLabel" Name="Name" PropertyName="Text" />
		</SelectParameters>
	</asp:SqlDataSource>
</asp:Content>