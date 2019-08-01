<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/Vendor.master" AutoEventWireup="true" CodeFile="ViewConsultantAndVendor.aspx.cs" Inherits="Vendor_ViewConsultantAndVendor" %>

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
                        <asp:Label ID="lblVendorName" Font-Bold="true" runat="server" Text="Label"></asp:Label>
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
                            <asp:GridView ID="GridView2" CssClass="table table-sm" AlternatingRowStyle-CssClass="alt" EmptyDataText="No records to show" runat="server" OnRowCommand="GridView2_RowCommand" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" PageSize="20">
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
                                    <asp:TemplateField HeaderText="Item" SortExpression="ItemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub-Item" SortExpression="SubItemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("SubItemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Distributor/Brand" SortExpression="BrandName">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("BrandName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" HeaderText="Min. Capacity" SortExpression="MinCapacity">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("MinCapacity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" HeaderText="Max. Capacity" SortExpression="MaxCapacity">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("MaxCapacity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField Visible="false" HeaderText="Catalogue" SortExpression="Catalogue">
                                <EditItemTemplate>
                                    <asp:FileUpload ID="FileUploadCatalogueEdit" runat="server" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Download" CommandArgument='<%# Eval("Catalogue") %>' Text='<%# Eval("Catalogue") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField Visible="false" HeaderText="Specification" SortExpression="Specification">
                                <EditItemTemplate>
                                    <asp:FileUpload ID="FileUploadSpecificationEdit" runat="server" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Download" CommandArgument='<%# Eval("Specification") %>' Text='<%# Eval("Specification") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="MoreDetails" Text="More Details"></asp:LinkButton>
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
        <asp:Panel ID="PanelServiceDetails" Visible="false" runat="server">
            <div class="form-group">
                <div class="row">
                    <asp:LinkButton ID="lbtnGoBackToDetails" Text="Go back" runat="server" OnClick="lbtnGoBackToDetails_Click"></asp:LinkButton>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Label runat="server" Text="System: "></asp:Label>
                        <asp:Label ID="lblSystem" runat="server" Text="Label"></asp:Label>
                        | 
                            <asp:Label runat="server" Text="Sub-System: "></asp:Label>
                        <asp:Label ID="lblSubSystem" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Label runat="server" Text="Item: "></asp:Label>
                        <asp:Label ID="lblItem" runat="server" Text="Label"></asp:Label>
                        |
                            <asp:Label runat="server" Text="Sub-Item: "></asp:Label>
                        <asp:Label ID="lblSubItem" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Label runat="server" Text="Distributor/Brand: "></asp:Label>
                        <asp:Label ID="lblBrand" runat="server" Text="Label"></asp:Label>
                        |
                            <asp:Label runat="server" Text="Min. Capacity: "></asp:Label>
                        <asp:Label ID="lblMinCapacity" runat="server" Text="Label"></asp:Label>
                        |
                            <asp:Label runat="server" Text="Max. Capacity: "></asp:Label>
                        <asp:Label ID="lblMaxCapacity" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="gridviewScrollable">
                            <asp:GridView ID="GridView3" CssClass="table table-sm" AlternatingRowStyle-CssClass="alt" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" OnRowCommand="GridView3_RowCommand" PageSize="20">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Catalogue" HeaderStyle-Font-Bold="false" SortExpression="Catalogue">
                                        <EditItemTemplate>
                                            <asp:FileUpload ID="FileUploadCatalogueEdit" runat="server" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Download" CommandArgument='<%# Eval("Catalogue") %>' Text='<%# Eval("Catalogue") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BOQ/Specification" HeaderStyle-Font-Bold="false" SortExpression="Specification">
                                        <EditItemTemplate>
                                            <asp:FileUpload ID="FileUploadSpecificationEdit" runat="server" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Download" CommandArgument='<%# Eval("Specification") %>' Text='<%# Eval("Specification") %>'></asp:LinkButton>
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

