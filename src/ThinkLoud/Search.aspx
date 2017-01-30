<%@ Page Title="Publisher Query" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="ThinkLoud.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

<asp:Content ContentPlaceHolderID="headerContent" runat="server">
        <table>
            <tr>
                <td>
                    <img src="Assets/Search.png" style="width: 48px; height: 48px"/>
                </td>
                <td class="auto-style7">
                    <span class="auto-style6">Publisher Query</span>
                </td>
                <td>
                    <span class="auto-style1">v1.1</span>
                </td>
            </tr>            
        </table>  
</asp:Content>

<asp:Content ContentPlaceHolderID="bodyContent" runat="server" >
    <div style="background-color: #FFE0C0; height: auto; width: 765px; padding: 5px ">
        <table>
            <tr>
                <td colspan="2">
                    Parameters: <asp:TextBox ID="parameterTB" runat="server" Width="200px" />
                    <asp:Button ID="queryButton" OnClick="queryBtn_Click" runat="server" Text="Execute"/>                    
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    The % character acts like a wildcard. You can use it either before or after your parameter.
                </td>
            </tr>
        </table>
    </div>
    <hr />
    <!-- Publishers SQL DataSource -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" 
        SelectCommand="SELECT * FROM Publishers" FilterExpression="Name LIKE '{0}'">
        <FilterParameters>
            <asp:ControlParameter ControlID="parameterTB" PropertyName="Text" Name="Name"/>
        </FilterParameters>
	</asp:SqlDataSource>      
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="759px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>                
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Notes") %>' Rows="4"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Rows="4" Text='<%# Bind("Notes") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
                <em>No data was returned</em>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
</asp:Content>