<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SubItem.aspx.cs" Inherits="Admin_SubItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function Done() {
            return confirm("Are you sure?");
        }
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= txtTitle.ClientID  %>').autocomplete({
                source: '../GenericHandler/SubItemHandler.ashx'
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
        $(function () {
            $('#<%= txtSearch.ClientID  %>').quicksearch('#<%= GridView1.ClientID  %> tbody tr');
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <div class="form-group">
            <h4 class="text-center">Sub-Item Information</h4>
        </div>
        <br />
        <div class="centerdiv">
            <asp:Panel ID="PanelAddInfo" Visible="false" runat="server">
                <div class="form-group">
                    <asp:Label runat="server" Text="Sub-System"></asp:Label>
                    <asp:DropDownList ID="ddlSubSystem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataSourceID="SqlDataSourceSubSystem" DataTextField="Title" DataValueField="Id">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSubSystem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblSubSystem]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdSubSystem"
                        runat="server" ErrorMessage="Choose a Sub-System"
                        InitialValue="0" ControlToValidate="ddlSubSystem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Item"></asp:Label>
                    <asp:DropDownList ID="ddlItem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" EnableViewState="False" DataSourceID="SqlDataSourceItem" DataTextField="Title" DataValueField="Id">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceItem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblItem] WHERE ([SubSystemId] = @SubSystemId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSubSystem" Name="SubSystemId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfdItem"
                        runat="server" ErrorMessage="Choose an Item"
                        InitialValue="0" ControlToValidate="ddlItem"
                        ForeColor="Red" Display="Dynamic" Text="required">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Sub-Item Title"></asp:Label>
                    <asp:TextBox ID="txtTitle" class="form-control" placeholder="Sub-Item Title" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtTitle"
                        runat="server" ErrorMessage="Sub-Item Title required" Text="required"
                        ControlToValidate="txtTitle" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
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
            <asp:Panel ID="PanelUpdateButton" Visible="false" runat="server">
                <div class="form-group">
                    <asp:Button ID="btnUpdate" class="btn btn-primary btn-sm" runat="server" Text="Update"
                        OnClick="btnUpdate_Click" OnClientClick="if ( ! Done()) return false;"
                        meta:resourcekey="btnDoneResource1" />
                    <asp:Button ID="btnCancel" CausesValidation="false" class="btn btn-secondary btn-sm" runat="server" Text="Cancel"
                        OnClick="btnCancel_Click" />
                </div>
                <asp:LinkButton ID="lbtnFinishUpdate" CausesValidation="false" runat="server" OnClick="lbtnFinishUpdate_Click">Done</asp:LinkButton>

            </asp:Panel>
            <asp:Panel ID="PanelData" Visible="true" runat="server">
                <div class="row">
                    <asp:LinkButton ID="lbtnInsert" runat="server" OnClick="lbtnInsert_Click">Insert New</asp:LinkButton>
                </div>
                <br />
                <div class="gridviewScrollable">
                    <div class="form-group">
                        <asp:TextBox ID="txtSearch" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                    </div>
                    <asp:GridView ID="GridView1" CssClass="table text-nowrap" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="20">
                        <Columns>
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sub-Item Title" SortExpression="Title">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Select" Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

