<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AccountSettings.aspx.cs" Inherits="Admin_AccountSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function Done() {
            return confirm("Are you sure?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <div class="form-group">
            <h4 class="text-center">Account Information</h4>
        </div>
        <br />
        <div class="centerdiv">
            <div class="form-group">
                <asp:Label runat="server" Text="Email: "></asp:Label>
                <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                <asp:LinkButton ID="lbtnEMailEdit" Style="font-size: 12px" CausesValidation="false" Text="Edit" runat="server" OnClick="lbtnEMailEdit_Click"></asp:LinkButton>
                <asp:Panel ID="PanelEmailEdit" Visible="false" runat="server">
                    <asp:TextBox ID="txtEmail" class="form-control" placeholder="New Email" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtEmail"
                        runat="server" ErrorMessage="Email required" Text="required"
                        ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtxtEmail"
                        runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail"
                        ForeColor="Red" Display="Dynamic" Text="invalid email (username)"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                    <asp:LinkButton ID="lbtnEmailUpdate" Style="font-size: 12px" runat="server" Text="Update"
                        OnClick="lbtnEmailUpdate_Click" OnClientClick="if ( ! Done()) return false;"
                        meta:resourcekey="btnDoneResource1" />
                    |
            <asp:LinkButton ID="lbtnEmailCancel" Style="font-size: 12px" CausesValidation="false"
                runat="server" OnClick="lbtnEmailCancel_Click" Text="Cancel" />
                </asp:Panel>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Password: "></asp:Label>
                <asp:Label ID="lblPassword" runat="server" Text="***"></asp:Label>
                <asp:LinkButton ID="lbtnPasswordEdit" Style="font-size: 12px" CausesValidation="false" Text="Edit" runat="server" OnClick="lbtnPasswordEdit_Click"></asp:LinkButton>
                <asp:Panel ID="PanelPasswordEdit" Visible="false" runat="server">
                    <asp:TextBox ID="txtOldPassword" TextMode="Password" class="form-control" placeholder="Old Password" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtOldPassword"
                        runat="server" ErrorMessage="Old Password required" Text="required"
                        ControlToValidate="txtOldPassword" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" placeholder="New Password" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtPassword"
                        runat="server" ErrorMessage="Password required" Text="required"
                        ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtConfirmPassword" class="form-control" placeholder="Confirm Password" TextMode="Password" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtConfirmPassword"
                        runat="server" ErrorMessage="Confirm Password required" Text="required"
                        ControlToValidate="txtConfirmPassword" ForeColor="Red"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidatorPassword" runat="server"
                        ErrorMessage="Password and Confirm Password must match"
                        ControlToValidate="txtConfirmPassword" ForeColor="Red"
                        ControlToCompare="txtPassword" Display="Dynamic"
                        Type="String" Operator="Equal" Text="password doesn't match">
                    </asp:CompareValidator>
                    <asp:LinkButton ID="lbtnPasswordUpdate" Style="font-size: 12px" runat="server" Text="Update"
                        OnClick="lbtnPasswordUpdate_Click" OnClientClick="if ( ! Done()) return false;"
                        meta:resourcekey="btnDoneResource1" />
                    |
            <asp:LinkButton ID="lbtnPasswordCancel" Style="font-size: 12px" CausesValidation="false"
                runat="server" OnClick="lbtnPasswordCancel_Click" Text="Cancel" />
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
