<%@ Page Title="Publisher Management" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Publishers.aspx.cs" Inherits="ThinkLoud.Settings.Publishers" %>
    <asp:Content ID="required" ContentPlaceHolderID="head" runat="server">
        <title>Publisher Management</title>
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
    <asp:Content ID="header" ContentPlaceHolderID="headerContent" runat="server">
        <a name="Top" />
            <table>
                <tr>
                    <td>
                        <img src="../Assets/Publishers.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7">
                        <span class="auto-style6">Publisher Management</span>
                    </td>
                    <td>
                        <span class="auto-style1">v2.2</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="returnBttn" runat="server" Text="Return" PostBackUrl="~/Search.aspx" /> <asp:Button ID="runRpt" runat="server" Text="Reports" PostBackUrl="~/Reports/ReportDashboard.aspx" /> <asp:Button ID="Button1" runat="server" Text="Templates" PostBackUrl="~/TemplatePopUp.aspx" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="#Details">Details</asp:LinkButton> &nbsp;- 
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="#Notes">Notes</asp:LinkButton> &nbsp;- 
                        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="#Contacts">Contacts</asp:LinkButton> &nbsp;- 
                        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="#Secondary Names">Secondary Names</asp:LinkButton>
                    </td>
                </tr>
            </table>                         
    </asp:Content>
<asp:Content ContentPlaceHolderID="bodyContent" runat="server">
    <!-- Publishers SQL DataSource -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" 
                SelectCommand="SELECT * FROM [Publishers] WHERE ID=@ID ORDER BY Name" 
                UpdateCommand="UPDATE Publishers SET Name = @Name, Notes = @Notes, TemplateID = @TemplateID, Website = @Website, Fax = @Fax, Phone = @Phone, ZipCode = @ZipCode, City = @City, State = @State, Address = @Address, DefaultSecName = @DefaultSecName, DefaultContact = @DefualtContact WHERE (ID = @ID)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="pubID" Name="ID" />
                </SelectParameters>
			    <UpdateParameters>
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="TemplateID" />
                    <asp:Parameter Name="Website" />
                    <asp:Parameter Name="Fax" />
                    <asp:Parameter Name="Phone" />
                    <asp:Parameter Name="ZipCode" />
                    <asp:Parameter Name="City" />
                    <asp:Parameter Name="State" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="DefaultSecName" />
                    <asp:Parameter Name="DefualtContact" />
                    <asp:Parameter Name="ID" />
                </UpdateParameters>
			</asp:SqlDataSource>
            
            <!-- Contacts SQL DataSource -->
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" 
                SelectCommand="SELECT * FROM [Contacts] WHERE PubID=@PubID"
                UpdateCommand="UPDATE [Contacts] SET Name=@Name, Email=@Email, Notes=@Notes, Phone=@Phone WHERE ID=@ID"  
                InsertCommand="INSERT INTO [Contacts] (Name, Email, Notes, Phone, PubID) VALUES (Name, Email, Notes, Phone, PubID=@PubID)"
                DeleteCommand="DELETE FROM [Contacts] WHERE ID=@ID" ProviderName="System.Data.SqlClient">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="pubID" Name="PubID" />
                </SelectParameters>
                <InsertParameters>
                    <asp:QueryStringParameter QueryStringField="pubID" Name="PubID" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Email" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="Phone" />
                    <asp:Parameter Name="ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <!-- PubSecName SQL DataSource -->
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" 
                SelectCommand="SELECT * FROM [PubSecName] WHERE PubID=@PubID"
                UpdateCommand="UPDATE [PubSecName] SET Name=@Name, Notes=@Notes WHERE ID=@ID"
                InsertCommand="INSERT INTO [PubSecName] (Name, Notes, PubID) VALUES (Name, Email, Notes, PubID=@PubID)"
                DeleteCommand="DELETE FROM [PubSecName] WHERE ID=@ID">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="pubID" Name="PubID" />
                </SelectParameters>
                <InsertParameters>
                    <asp:QueryStringParameter QueryStringField="pubID" Name="PubID" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
            </asp:SqlDataSource>
            
            <!-- Notes SQL DataSource -->
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ThinkLoud %>" 
                SelectCommand="SELECT * FROM [Notes] WHERE PubID=@PubID"
                UpdateCommand="UPDATE [Notes] SET Title=@Title, Text=@Text, DateModified=@DateModified, DateCreated=@DateCreated WHERE ID=@ID"
                InsertCommand="INSERT INTO [Notes] Title, Text, DateModified, DateCreated, PubID VALUES (Title, Text, DateModified, DateCreated, PubID=@PubID)"
                DeleteCommand="DELETE FROM [Notes] WHERE ID=@ID">
                <SelectParameters>
                    <asp:QueryStringParameter Name="PubID" QueryStringField="pubID" />
                </SelectParameters>
                <InsertParameters>
                    <asp:QueryStringParameter QueryStringField="pubID" Name="PubID" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <!-- Details Grid -->
            <a name="Details" />
            <table>
                <tr>
                    <td>
                        <img class="auto-style4" src="/Assets/Details.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style5">
                        <span class="auto-style6">Publisher Details</span>
                    </td>
                </tr>
            </table>
            <hr />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateEditButton="True" DataSourceID="SqlDataSource1" AutoGenerateRows="False" DataKeyNames="ID" Height="67px" Width="726px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    <em>Publisher ID is not valid</em>
                </EmptyDataTemplate>
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:TemplateField HeaderText="TemplateID" SortExpression="TemplateID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TemplateID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TemplateID") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TemplateID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Default Contact" SortExpression="DefaultContact">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DefaultContact") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DefaultContact") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DefaultContact") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Default Secondary Name" SortExpression="DefaultSecName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DefaultSecName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DefaultSecName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("DefaultSecName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                        <EditItemTemplate>
                            Address: <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            <br />
                            City: <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>,
                            State: <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                            Zip Code: <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Address: <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            <br />
                            City: <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>,
                            State: <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                            Zip Code: <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("City") %>'></asp:Label>, 
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                    <asp:BoundField DataField="Website" HeaderText="Website" SortExpression="Website" />
                    <asp:BoundField DataField="Notes" HeaderText="Note" SortExpression="Notes" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            
            <!-- Notes Grid -->
            <br />
            <a name="Notes" />
            <table>
                <tr>
                    <td>
                        <img class="auto-style4" src="/Assets/Notes.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7">
                        <span class="auto-style6">Notes</span>
                    </td>
                    <td>
                        <asp:Button id="Button2" runat="server" Text="+" OnClick="Button2_Click"/>
                    </td>
                </tr>
            </table>
            <hr />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateEditButton="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Width="726px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>                    
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" />
                    <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated"></asp:BoundField>
                    <asp:BoundField DataField="DateModified" HeaderText="Date Modified" SortExpression="DateModified"></asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    <em>No publisher notes found</em>
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
            
            <!-- Contacts Grid -->
            <br />
            <a name="Contacts" />
            <table>
                <tr>
                    <td>
                        <img class="auto-style4" src="/Assets/Contacts.png" style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7">
                        <span class="auto-style6">Contacts</span>
                    </td>
                    <td>
                        <asp:Button id="cmdNew0" runat="server" Text="+" OnClick="cmdNew0_Click"/>
                    </td>
                </tr>
            </table>
            <hr />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateEditButton="True" AutoGenerateColumns="False" Width="726px" AllowSorting="True" DataKeyNames="ID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">

                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    <em>No contacts found</em>
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

            <!-- Secondary Publisher Names Grid -->
            <br />
            <a name="Secondary Names" />
            <table>
                <tr>
                    <td>
                        <img class="auto-style4"src="/Assets/PubSecName.png"style="width: 48px; height: 48px"/>
                    </td>
                    <td class="auto-style7">
                        <span class="auto-style6">Publisher Secondary Names</span>
                    </td>
                    <td>
                        <asp:Button id="cmdNew1" runat="server" Text="+" OnClick="cmdNew1_Click"/>
                    </td>
                </tr>
            </table>
            <hr />
            <asp:GridView ID="GridView2" AutoGenerateEditButton="True" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="726px" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    <em>No secondary names found</em>
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
            <p style="text-align:right">
                <em>
                    <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="#Top">Top</asp:LinkButton>
                </em>
            </p>
</asp:Content>