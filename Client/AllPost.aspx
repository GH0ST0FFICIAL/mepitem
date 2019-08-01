<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="AllPost.aspx.cs" Inherits="Client_AllPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function Done() {
            return confirm("Are you sure?");
        }
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlTags.ClientID  %>').select2({
                placeholder: 'Select'
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
            <h4 id="pageheader" runat="server" class="text-center">All Post</h4>
        </div>
        <br />
        <asp:Panel ID="PanelCreatePost" Visible="false" runat="server">
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Description"></asp:Label>
                        <asp:TextBox ID="txtDescription" class="form-control" TextMode="MultiLine" Rows="5" placeholder="Post Description" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfdtxtDescription"
                            runat="server" ErrorMessage="Post Description required" Text="required"
                            ControlToValidate="txtDescription" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Tags"></asp:Label>
                        <select id="ddlTags" name="ddlTags[]" runat="server" class="form-control" multiple="true">
                        </select>
                        <asp:RequiredFieldValidator ID="rfdTags"
                            runat="server" ErrorMessage="Tags required" Text="required (at least 1)"
                            ControlToValidate="ddlTags" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <%-- <div class="col-sm-3">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Add Tags"></asp:Label>
                        <asp:ListBox ID="lstboxAddTag" SelectionMode="Multiple" Rows="6" class="form-control" runat="server" OnSelectedIndexChanged="lstboxAddTag_SelectedIndexChanged"></asp:ListBox>
                        <asp:LinkButton ID="lbtnAddTag" CausesValidation="false" runat="server" Text="Add Tag" OnClick="lbtnAddTag_Click"></asp:LinkButton>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Remove Tags"></asp:Label>
                        <asp:ListBox ID="lstboxRemoveTag" SelectionMode="Multiple" Rows="6" class="form-control" runat="server"></asp:ListBox>
                        <asp:RequiredFieldValidator ID="rfdlstboxRemoveTag" Enabled="false"
                            runat="server" ErrorMessage="Tags required" Text="required"
                            ControlToValidate="lstboxRemoveTag" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <asp:LinkButton ID="lbtnRemoveTag" CausesValidation="false" runat="server" Text="Remove Tag" OnClick="lbtnRemoveTag_Click"></asp:LinkButton>
                    </div>
                </div>--%>
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
        <asp:Panel ID="PanelUpdateButton" Visible="false" runat="server">
            <div class="form-group">
                <asp:Button ID="btnUpdate" class="btn btn-primary btn-sm" runat="server" Text="Update"
                    OnClientClick="if ( ! Done()) return false;"
                    meta:resourcekey="btnDoneResource1" />
                <asp:Button ID="btnCancel" CausesValidation="false" class="btn btn-secondary btn-sm" runat="server" Text="Cancel" />
            </div>
            <asp:LinkButton ID="lbtnFinishUpdate" CausesValidation="false" runat="server">Done</asp:LinkButton>
        </asp:Panel>
        <asp:Panel ID="PanelPost" Visible="true" runat="server">
            <div class="row">
                <asp:LinkButton ID="lbtnInsert" runat="server" OnClick="lbtnInsert_Click">Insert New</asp:LinkButton>
            </div>
            <br />
            <div class="gridviewScrollable">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                </div>
                <asp:GridView ID="GridView1" CssClass="table" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" GridLines="None" PageSize="20">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Post Date" SortExpression="PostDate" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PostDate", "{0:dd MMM yyyy (hh:mm tt)}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Status" SortExpression="Status">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="UserId" SortExpression="UserId" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" CssClass="badge badge-success" ToolTip="If you click this your post will be closed and will not receive any offers" runat="server"
                                    CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Close"
                                    Text='<%# Bind("Status") %>' OnClientClick="if ( ! Done()) return false;"
                                    meta:resourcekey="btnDoneResource1"></asp:LinkButton>
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
            </div>
        </asp:Panel>
    </div>
</asp:Content>

