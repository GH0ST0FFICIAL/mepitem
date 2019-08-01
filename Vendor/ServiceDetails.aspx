<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/Vendor.master" AutoEventWireup="true" CodeFile="ServiceDetails.aspx.cs" Inherits="Vendor_ServiceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function Done() {
            return confirm("Are you sure?");
        }
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlSystem.ClientID  %>').select2({
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlSubSystem.ClientID  %>').select2({
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlItem.ClientID  %>').select2({
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlSubItem.ClientID  %>').select2({
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= txtBrand.ClientID  %>').autocomplete({
                source: '../GenericHandler/BrandNameHandler.ashx'
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= txtMinCapacity.ClientID  %>').autocomplete({
                source: '../GenericHandler/MinCapacityHandler.ashx'
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= txtMaxCapacity.ClientID  %>').autocomplete({
                source: '../GenericHandler/MaxCapacityHandler.ashx'
            });
        });
    </script>
    <script>
        $(function () {
            $('#<%= txtSearch.ClientID  %>').quicksearch('#<%= GridView1.ClientID  %> tbody tr');
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <div class="form-group">
            <h4 class="text-center">Our Services</h4>
        </div>
        <br />
        <div class="centerdiv">
            <asp:Panel ID="PanelUpdateInfo" Visible="false" runat="server">
                <div class="form-group">
                    <asp:Label runat="server" Text="System"></asp:Label>
                    <asp:DropDownList ID="ddlSystem" class="form-control" AutoPostBack="True" runat="server" DataSourceID="SqlDataSourceSystem" DataTextField="Title" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSystem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSystem]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdSystem"
                        runat="server" ErrorMessage="Choose a System"
                        InitialValue="0" ControlToValidate="ddlSystem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Sub-System"></asp:Label>
                    <asp:DropDownList ID="ddlSubSystem" class="form-control" AppendDataBoundItems="true" AutoPostBack="True" runat="server" EnableViewState="False" DataSourceID="SqlDataSourceSubSystem" DataTextField="Title" DataValueField="Id">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSubSystem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSubSystem] WHERE ([SystemId] = @SystemId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSystem" Name="SystemId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdSubSystem" Enabled="false"
                        runat="server" ErrorMessage="Choose a Sub-System"
                        InitialValue="0" ControlToValidate="ddlSubSystem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Item"></asp:Label>
                    <asp:DropDownList ID="ddlItem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" EnableViewState="False" DataTextField="Title" DataValueField="Id" DataSourceID="SqlDataSourceItem">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceItem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblItem] WHERE ([SubSystemId] = @SubSystemId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSubSystem" Name="SubSystemId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdddlItem" Enabled="false"
                        runat="server" ErrorMessage="Choose an Item"
                        InitialValue="0" ControlToValidate="ddlItem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Sub-Item"></asp:Label>
                    <asp:DropDownList ID="ddlSubItem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" EnableViewState="False" DataTextField="Title" DataValueField="Id" DataSourceID="SqlDataSourceSubItem">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSubItem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSubItem] WHERE ([ItemId] = @ItemId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlItem" Name="ItemId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdddlSubItem" Enabled="false"
                        runat="server" ErrorMessage="Choose a Sub-Item"
                        InitialValue="0" ControlToValidate="ddlSubItem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Distributor/Brand"></asp:Label>
                    <asp:TextBox ID="txtBrand" class="form-control" placeholder="Add Brand Title" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtBrand" Enabled="false"
                        runat="server" ErrorMessage="Brand Title required" Text="required"
                        ControlToValidate="txtBrand" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label runat="server" Text="Minimum Capacity"></asp:Label>
                            <asp:TextBox ID="txtMinCapacity" class="form-control" placeholder="Minimum Capacity" runat="server">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfdtxtMinCapacity" Enabled="false"
                                runat="server" ErrorMessage="Minimum Capacity required" Text="required"
                                ControlToValidate="txtMinCapacity" Display="Dynamic" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label runat="server" Text="Maximum Capacity"></asp:Label>
                            <asp:TextBox ID="txtMaxCapacity" class="form-control" placeholder="Maximum Capacity" runat="server">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfdtxtMaxCapacity" Enabled="false"
                                runat="server" ErrorMessage="Maximum Capacity required" Text="required"
                                ControlToValidate="txtMaxCapacity" Display="Dynamic" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label runat="server" Text="Catalogue Upload"></asp:Label>
                            <asp:FileUpload ID="fupCatalogue" class="form-control" runat="server" ViewStateMode="Enabled" AllowMultiple="false" />
                            <asp:RequiredFieldValidator ID="rfdfupCatalogue" Enabled="false"
                                runat="server" Display="Dynamic" ErrorMessage="Choose a file for Catalogue" Text="required"
                                ControlToValidate="fupCatalogue" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <asp:Label runat="server" Text="BOQ/Specification Upload"></asp:Label>
                            <asp:FileUpload ID="fupSpecification" class="form-control" runat="server" ViewStateMode="Enabled" AllowMultiple="false" />
                            <asp:RequiredFieldValidator ID="rfdfupSpecification" Enabled="false"
                                runat="server" Display="Dynamic" ErrorMessage="Choose a file for Specification" Text="required"
                                ControlToValidate="fupSpecification" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelUpdateButton" Visible="false" runat="server">
                <div class="form-group">
                    <asp:Button ID="btnUpdate" class="btn btn-primary btn-sm" runat="server" Text="Update"
                        OnClick="btnUpdate_Click" OnClientClick="if ( ! Done()) return false;"
                        meta:resourcekey="btnDoneResource1" />
                    <asp:Button ID="btnCancel" CausesValidation="false" class="btn btn-secondary btn-sm"
                        runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </div>
                <asp:LinkButton ID="lbtnFinishUpdate" CausesValidation="false" runat="server" OnClick="lbtnFinishUpdate_Click">Done</asp:LinkButton>
            </asp:Panel>
        </div>
        <asp:Panel ID="PanelData" Visible="true" runat="server">
            <div class="row">
                <asp:LinkButton ID="lbtnInsert" runat="server" OnClick="lbtnInsert_Click">Insert New</asp:LinkButton>
            </div>
            <br />
            <div class="gridviewScrollable">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                </div>
                <asp:GridView ID="GridView1" CssClass="table text-nowrap" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand" PageSize="20">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="System" SortExpression="SystemTitle">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("SystemTitle") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sub-System" SortExpression="SubSystemTitle">
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
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Details" Text="Details"></asp:LinkButton>
                                | 
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Select" Text="Edit"></asp:LinkButton>
                                |
                                <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="DeleteRow" Text="Delete" OnClientClick="if ( ! Done()) return false;"
                                    meta:resourcekey="btnDoneResource1"></asp:LinkButton>
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
                            <asp:GridView ID="GridView2" CssClass="table table-sm" AlternatingRowStyle-CssClass="alt" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" OnRowCommand="GridView2_RowCommand" PageSize="20">
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

