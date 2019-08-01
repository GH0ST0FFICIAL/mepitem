<%@ Page Title="" Language="C#" MasterPageFile="~/Generic/Generic.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Generic_ChangePassword" %>

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
            <h4 class="text-center">Change Password</h4>
        </div>
        <br />
        <div class="centerdiv" style="width:50%">
            <div class="form-group">
                <asp:Label runat="server" Text="Email (Username)"></asp:Label>
                <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rfdtxtEmail"
                    runat="server" ErrorMessage="Email required" Text="required"
                    ControlToValidate="txtEmail" ForeColor="Red"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revtxtEmail"
                    runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail"
                    ForeColor="Red" Display="Dynamic" Text="invalid email (username)"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                </asp:RegularExpressionValidator>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" class="form-control" placeholder="Password" TextMode="Password" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfdtxtPassword"
                            runat="server" ErrorMessage="Password required" Text="required"
                            ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Confirm Password"></asp:Label>
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
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="btnOk" class="btn btn-primary btn-sm" runat="server" Text="Change Password"
                    OnClick="btnOk_Click" OnClientClick="if ( ! Done()) return false;"
                    meta:resourcekey="btnDoneResource1" />
            </div>
            <div class="form-group">
                <p>
                    <a href="Login.aspx">Login </a>instead.
                If you do not have an account, <a href="Register.aspx">register</a>.
                </p>
            </div>
        </div>
    </div>
</asp:Content>

