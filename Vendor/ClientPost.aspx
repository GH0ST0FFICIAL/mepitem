<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/Vendor.master" AutoEventWireup="true" CodeFile="ClientPost.aspx.cs" Inherits="Vendor_ClientPost" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<%--    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <asp:Panel ID="PanelClient" Visible="true" runat="server">
        <div class="container centerdiv">
            <div class="form-group">
                <h4 class="text-center">Client Posts</h4>
            </div>
            <br />
            <div class="gridviewScrollable">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                </div>
               <%-- <asp:UpdatePanel ID="PanelDashboard" runat="server">
                    <ContentTemplate>
                        <asp:Timer runat="server" ID="Timer1" Interval="10000" OnTick="Timer1_Tick">
                        </asp:Timer>--%>
                        <asp:GridView ID="GridView1" CssClass="table" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="GridView1_RowCommand" GridLines="None" PageSize="20" DataSourceID="SqlDataSourceClientPost" DataKeyNames="Id">
                            <Columns>
                                <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UserId" SortExpression="UserId" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Posted On" SortExpression="PostDate">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("PostDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                            CommandName="Details" Text="Details"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:GridView>
                    <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
                <asp:SqlDataSource ID="SqlDataSourceClientPost" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="select distinct tblPost.Description, tblPost.PostDate, tblPost.UserId, tblPost.Id
from tblUserAccount, tblTags, tblPost, tblCompanyDetails
where tblTags.PostId = tblPost.Id
and (tblTags.Tag = tblCompanyDetails.SystemTitle 
or tblTags.Tag = tblCompanyDetails.SubSystemTitle 
or tblTags.Tag = tblCompanyDetails.ItemTitle
or tblTags.Tag = tblCompanyDetails.SubItemTitle)
and tblPost.Status != 'Closed'
and tblCompanyDetails.UserId = @userid
order by tblPost.PostDate Desc;">
                    <SelectParameters>
                        <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

