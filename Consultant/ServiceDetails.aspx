<%@ Page Title="" Language="C#" MasterPageFile="~/Consultant/Consultant.master" AutoEventWireup="true" CodeFile="ServiceDetails.aspx.cs" Inherits="Consultant_ServiceDetails" %>

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
                    <asp:DropDownList ID="ddlSystem" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataSourceID="SqlDataSourceSystem" DataTextField="Title" DataValueField="Id">
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
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
                </div>
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
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Select" Text="Edit"></asp:LinkButton>
                                |
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="DeleteRow" Text="Delete" OnClientClick="if ( ! Done()) return false;"
                                    meta:resourcekey="btnDoneResource1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

