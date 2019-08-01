<%@ Page Title="" Language="C#" MasterPageFile="~/Generic/Generic.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Generic_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <div class="form-group">
            <h4 class="text-center">Login Information</h4>
        </div>
        <br />
        <div class="centerdiv" style="width:50%">
            <div class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Modal body text goes here.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">Save changes</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
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
                </div>
                <div class="col-sm-12">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" class="form-control" placeholder="Password" TextMode="Password" runat="server">                          
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfdtxtPassword"
                            runat="server" ErrorMessage="Password required" Text="required"
                            ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <asp:CheckBox ID="CheckBox1" Text="&nbsp;Show/Hide Password" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" class="btn btn-primary btn-sm" runat="server" Text="Login"
                    OnClick="btnLogin_Click" OnClientClick="if ( ! Done()) return false;"
                    meta:resourcekey="btnDoneResource1" />
            </div>
            <div class="form-group">
                <p>
                    Forgot Password? Click <a href="ForgotPassword.aspx">here</a>.
                    If you do not have an account, <a href="Register.aspx">register</a>.
                </p>
            </div>
            <div class="form-group">
                <p style="text-align: right; font-size: 14px; font-weight: bold; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif">
                    <i>"Adaptability is a key to survive in a competitive market"</i>
                </p>
            </div>
        </div>
    </div>
</asp:Content>

