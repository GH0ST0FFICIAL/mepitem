<%@ Page Title="" Language="C#" MasterPageFile="~/Generic/Generic.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Generic_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function Done() {
            return confirm("Are you sure?");
        }
    </script>
    <script>
        $(document).ready(function () {
            $('#<%= ddlCompanyType.ClientID  %>').select2({
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <div class="form-group">
            <h4 class="text-center">Register Information</h4>
        </div>
        <br />
        <div class="centerdiv" style="width:50%">
            <div class="form-group">
                <asp:Label runat="server" Text="We Are"></asp:Label>
                <asp:DropDownList ID="ddlCompanyType" class="form-control" AppendDataBoundItems="True" AutoPostBack="True" runat="server" DataTextField="CompanyType" DataValueField="Id" DataSourceID="SqlDataSourceCompanyType">
                    <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCompanyType" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblCompanyType]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="rfdddlCompanyType"
                    runat="server" ErrorMessage="Choose Organization Type"
                    InitialValue="0" ControlToValidate="ddlCompanyType"
                    ForeColor="Red" Display="Dynamic" Text="required">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Company Name/ Title"></asp:Label>
                <asp:TextBox ID="txtCompanyName" class="form-control" placeholder="Company Name" runat="server">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rfdtxtCompanyName"
                    runat="server" ErrorMessage="Company Name required" Text="required"
                    ControlToValidate="txtCompanyName" Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Location Address"></asp:Label>
                <asp:TextBox ID="txtAddress" class="form-control" placeholder="Address" TextMode="MultiLine" Rows="2" runat="server">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rfdtxtAddress"
                    runat="server" ErrorMessage="Address required" Text="required"
                    ControlToValidate="txtAddress" Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Contact Number"></asp:Label>
                        <asp:TextBox ID="txtPhone" class="form-control" MaxLength="200" placeholder="Phone Number" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfdtxtPhone"
                            runat="server" ErrorMessage="Phone Number required" Text="required"
                            ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revtxtPhone" runat="server" ErrorMessage="Invalid Phone Number"
                            ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red"
                            ValidationExpression="^([\+]?(?:00)?[0-9]{1,3}[\s.-]?[0-9]{1,12})([\s.-]?[0-9]{1,4}?)$">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server">
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
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" placeholder="Password" runat="server">
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
                <asp:Label runat="server" Text="Website Address (Optional)"></asp:Label>
                <asp:TextBox ID="txtWebsite" class="form-control" placeholder="Website URL" runat="server">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="rfdtxtWebsite" Enabled="false"
                    runat="server" ErrorMessage="Website URL required" Text="required"
                    ControlToValidate="txtWebsite" Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="rev" runat="server" ErrorMessage="Invalid Website URL"
                    ControlToValidate="txtWebsite" Display="Dynamic"
                    ValidationExpression="^([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$">
                </asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegister" class="btn btn-primary btn-sm" runat="server" Text="Register"
                    OnClick="btnRegister_Click"
                    OnClientClick="if ( ! Done()) return false;"
                    meta:resourcekey="btnDoneResource1" />
            </div>
            <div class="form-group">
                <p>
                    <a href="Login.aspx">Login </a>instead.
                </p>
            </div>
        </div>
    </div>

</asp:Content>

