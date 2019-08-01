<%@ Page Title="" Language="C#" MasterPageFile="~/Consultant/Consultant.master" AutoEventWireup="true" CodeFile="InsertServiceDetails.aspx.cs" Inherits="Consultant_InsertServiceDetails" %>

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
                        <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
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
        </div>
    </div>
</asp:Content>

