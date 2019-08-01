<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/Vendor.master" AutoEventWireup="true" CodeFile="InsertServiceDetails.aspx.cs" Inherits="Vendor_InsertServiceDetails" %>

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
        $(document).ready(function () {
            $('#<%= txtNewSystemTitle.ClientID  %>').autocomplete({
                source: '../GenericHandler/SystemHandler.ashx'
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlNewSystem.ClientID  %>').select2({
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= txtNewSubSystemTitle.ClientID  %>').autocomplete({
                source: '../GenericHandler/SubSystemHandler.ashx'
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlNewSubSystem.ClientID  %>').select2({
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= txtNewItemTitle.ClientID  %>').autocomplete({
                source: '../GenericHandler/ItemHandler.ashx'
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlNewSubSystem2.ClientID  %>').select2({
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlNewItem.ClientID  %>').select2({
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= txtNewSubItemTitle.ClientID  %>').autocomplete({
                source: '../GenericHandler/SubItemHandler.ashx'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <div class="form-group">
            <h4 class="text-center">Our Services</h4>
        </div>
        <br />
        <div class="centerdiv">
            <asp:Panel ID="PanelAddInfo" Visible="true" runat="server">
                <div class="form-group">
                    <asp:Label runat="server" Text="System"></asp:Label>
                    <asp:DropDownList ID="ddlSystem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataSourceID="SqlDataSourceSystem" DataTextField="Title" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSystem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSystem]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdSystem"
                        runat="server" ErrorMessage="Choose a System"
                        InitialValue="0" ControlToValidate="ddlSystem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                    <asp:LinkButton ID="lbtnInsertNewSystem" runat="server" Font-Size="12px"
                        CausesValidation="false" OnClick="lbtnInsertNewSystem_Click">Insert New</asp:LinkButton>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Sub-System"></asp:Label>
                    <asp:DropDownList ID="ddlSubSystem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" EnableViewState="False" DataSourceID="SqlDataSourceSubSystem" DataTextField="Title" DataValueField="Id">
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
                    <asp:LinkButton ID="lbtnInsertNewSubSystem" runat="server" Font-Size="12px"
                        CausesValidation="false" OnClick="lbtnInsertNewSubSystem_Click">Insert New</asp:LinkButton>
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
                    <asp:LinkButton ID="lbtnInsertNewItem" runat="server" Font-Size="12px"
                        CausesValidation="false" OnClick="lbtnInsertNewItem_Click">Insert New</asp:LinkButton>
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
                    <asp:LinkButton ID="lbtnInsertNewSubItem" runat="server" Font-Size="12px"
                        CausesValidation="false" OnClick="lbtnInsertNewSubItem_Click">Insert New</asp:LinkButton>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Distributor/Brand"></asp:Label>
                    <asp:TextBox ID="txtBrand" class="form-control" placeholder="Brand Title" runat="server">
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
                <asp:Panel ID="PanelSubmitButton" Visible="true" runat="server">
                    <div class="form-group">
                        <asp:Button ID="btnSubmit" class="btn btn-primary btn-sm" runat="server" Text="Submit"
                            OnClick="btnSubmit_Click" OnClientClick="if ( ! Done()) return false;"
                            meta:resourcekey="btnDoneResource1" />
                    </div>
                </asp:Panel>
                <asp:LinkButton ID="lbtnFinishInsert" CausesValidation="false" runat="server" OnClick="lbtnFinishInsert_Click">Done</asp:LinkButton>
            </asp:Panel>
            <asp:Panel ID="PanelAddNewSystem" Visible="false" runat="server">
                <div class="form-group">
                    <asp:Label runat="server" Text="System Title"></asp:Label>
                    <asp:TextBox ID="txtNewSystemTitle" class="form-control" placeholder="System Title" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtNewSystemTitle"
                        runat="server" ErrorMessage="System Title required" Text="required"
                        ControlToValidate="txtNewSystemTitle" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
                <asp:LinkButton ID="lbtnSubmitNewSystem" runat="server" Text="Submit"
                    OnClick="lbtnSubmitNewSystem_Click" OnClientClick="if ( ! Done()) return false;"
                    meta:resourcekey="btnDoneResource1" />
                | 
                        <asp:LinkButton ID="lbtnDoneNewSystem" runat="server" Text="Done" CausesValidation="false"
                            OnClick="lbtnDoneNewSystem_Click" meta:resourcekey="btnDoneResource1" />
            </asp:Panel>
            <asp:Panel ID="PanelAddNewSubSystem" Visible="false" runat="server">
                <div class="form-group">
                    <asp:Label runat="server" Text="System"></asp:Label>
                    <asp:DropDownList ID="ddlNewSystem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataTextField="Title" DataValueField="Id" DataSourceID="SqlDataSourceNewSystem">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNewSystem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSystem]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdddlNewSystem"
                        runat="server" ErrorMessage="Choose a System"
                        InitialValue="0" ControlToValidate="ddlNewSystem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Sub-System Title"></asp:Label>
                    <asp:TextBox ID="txtNewSubSystemTitle" class="form-control" placeholder="Sub-System Title" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtNewSubSystemTitle"
                        runat="server" ErrorMessage="Sub-System Title required" Text="required"
                        ControlToValidate="txtNewSubSystemTitle" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
                <asp:LinkButton ID="lbtnSubmitNewSubSystem" runat="server" Text="Submit"
                    OnClick="lbtnSubmitNewSubSystem_Click" OnClientClick="if ( ! Done()) return false;"
                    meta:resourcekey="btnDoneResource1" />
                | 
                        <asp:LinkButton ID="lbtnDoneNewSubSystem" runat="server" Text="Done" CausesValidation="false"
                            OnClick="lbtnDoneNewSubSystem_Click" meta:resourcekey="btnDoneResource1" />
            </asp:Panel>
            <asp:Panel ID="PanelAddNewItem" Visible="false" runat="server">
                <div class="form-group">
                    <asp:Label runat="server" Text="Sub-System"></asp:Label>
                    <asp:DropDownList ID="ddlNewSubSystem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataTextField="Title" DataValueField="Id" DataSourceID="SqlDataSourceNewSubSystem">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNewSubSystem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSubSystem]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdddlNewSubSystem"
                        runat="server" ErrorMessage="Choose a Sub-System"
                        InitialValue="0" ControlToValidate="ddlNewSubSystem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Item Title"></asp:Label>
                    <asp:TextBox ID="txtNewItemTitle" class="form-control" placeholder="Item Title" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtNewItemTitle"
                        runat="server" ErrorMessage="Item Title required" Text="required"
                        ControlToValidate="txtNewItemTitle" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
                <asp:LinkButton ID="lbtnSubmitNewItem" runat="server" Text="Submit"
                    OnClick="lbtnSubmitNewItem_Click" OnClientClick="if ( ! Done()) return false;"
                    meta:resourcekey="btnDoneResource1" />
                | 
                        <asp:LinkButton ID="lbtnDoneNewItem" runat="server" Text="Done" CausesValidation="false"
                            OnClick="lbtnDoneNewItem_Click" meta:resourcekey="btnDoneResource1" />
            </asp:Panel>
            <asp:Panel ID="PanelAddNewSubItem" Visible="false" runat="server">
                <div class="form-group">
                    <asp:Label runat="server" Text="Sub-System"></asp:Label>
                    <asp:DropDownList ID="ddlNewSubSystem2" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataTextField="Title" DataValueField="Id" DataSourceID="SqlDataSourceNewSubSystem2">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNewSubSystem2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSubSystem]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdddlNewSubSystem2"
                        runat="server" ErrorMessage="Choose a Sub-System"
                        InitialValue="0" ControlToValidate="ddlNewSubSystem2"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Item"></asp:Label>
                    <asp:DropDownList ID="ddlNewItem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataTextField="Title" DataValueField="Id" EnableViewState="False" DataSourceID="SqlDataSourceNewItem">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNewItem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblItem] WHERE ([SubSystemId] = @SubSystemId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlNewSubSystem2" Name="SubSystemId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdddlNewItem"
                        runat="server" ErrorMessage="Choose an Item"
                        InitialValue="0" ControlToValidate="ddlNewItem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Sub-Item Title"></asp:Label>
                    <asp:TextBox ID="txtNewSubItemTitle" class="form-control" placeholder="Sub-Item Title" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ErrorMessage="Sub-Item Title required" Text="required"
                        ControlToValidate="txtNewSubItemTitle" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
                <asp:LinkButton ID="lbtnSubmitNewSubItem" runat="server" Text="Submit"
                    OnClick="lbtnSubmitNewSubItem_Click" OnClientClick="if ( ! Done()) return false;"
                    meta:resourcekey="btnDoneResource1" />
                | 
                        <asp:LinkButton ID="lbtnDoneNewSubItem" runat="server" Text="Done" CausesValidation="false"
                            OnClick="lbtnDoneNewSubItem_Click" meta:resourcekey="btnDoneResource1" />
            </asp:Panel>
        </div>
    </div>
</asp:Content>

