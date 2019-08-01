<%@ Page Title="" Language="C#" MasterPageFile="~/Generic/Generic.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Generic_ForgotPassword" %>

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
            <h4 class="text-center">Forgot Password?</h4>
        </div>
        <br />
        <div class="centerdiv" style="width:50%">
            <div class="form-group">
                <asp:Label runat="server" Text="Your password reset link will be sent to the provided email"></asp:Label>
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
            <div class="form-group">
                <asp:Button ID="btnSend" class="btn btn-primary btn-sm" runat="server" Text="Send Link"
                    OnClick="btnSend_Click" OnClientClick="if ( ! Done()) return false;"
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

