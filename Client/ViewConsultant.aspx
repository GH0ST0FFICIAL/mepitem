<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="ViewConsultant.aspx.cs" Inherits="Client_ViewConsultant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function Done() {
            return confirm("Are you sure?");
        }
    </script>
    <script>
        $(function () {
            $('#<%= txtSearch.ClientID  %>').quicksearch('#<%= GridView1.ClientID  %> tbody tr');
        })
    </script>
    <script>
        $(function () {
            $('#<%= txtSearch2.ClientID  %>').quicksearch('#<%= GridView2.ClientID  %> tbody tr');
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <div class="form-group">
            <h4 class="text-center">Company & Service Details</h4>
        </div>
        <br />
        <asp:Panel ID="PanelData" Visible="true" runat="server">
            <div class="row">
                <asp:LinkButton ID="lbtnGoBacktoDefault" Text="Go back" runat="server" OnClick="lbtnGoBacktoDefault_Click"></asp:LinkButton>
            </div>
            <br />
            <div class="gridviewScrollable">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                </div>
                <asp:GridView ID="GridView1" CssClass="table" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" PageSize="20">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company" SortExpression="CompanyName">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Details" Text="Details"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelDetails" Visible="false" runat="server">
            <div class="form-group">
                <div class="row">
                    <asp:LinkButton ID="lbtnGoBack" Text="Go back" runat="server" OnClick="lbtnGoBack_Click"></asp:LinkButton>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Label ID="lblConsultantName" Font-Bold="true" runat="server" Text="Label"></asp:Label>
                        | 
                             <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                        | 
                             <asp:Label ID="lblPhone" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-12">
                        <div class="gridviewScrollable">
                            <div class="form-group">
                                <asp:TextBox ID="txtSearch2" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                            </div>
                            <asp:GridView ID="GridView2" CssClass="table table-sm" AlternatingRowStyle-CssClass="alt" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" PageSize="20">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="System Title" SortExpression="SystemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SystemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub-System Title" SortExpression="SubSystemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubSystemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle Font-Bold="False" Width="20px" />
                                <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

