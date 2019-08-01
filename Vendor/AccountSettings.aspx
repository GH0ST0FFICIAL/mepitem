<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/Vendor.master" AutoEventWireup="true" CodeFile="AccountSettings.aspx.cs" Inherits="Vendor_AccountSettings" %>

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
                <asp:Label runat="server" Text="Company Name: "></asp:Label>
                <asp:Label ID="lblCompanyName" runat="server" Text="Label"></asp:Label>
                <asp:LinkButton ID="lbtnCompanyNameEdit" Style="font-size: 12px" CausesValidation="false" Text="Edit" runat="server" OnClick="lbtnCompanyNameEdit_Click"></asp:LinkButton>
                <asp:Panel ID="PanelCompanyNameEdit" Visible="false" runat="server">
                    <asp:TextBox ID="txtCompanyName" class="form-control" placeholder="New Name" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtCompanyName"
                        runat="server" ErrorMessage="Company Name required" Text="required"
                        ControlToValidate="txtCompanyName" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <asp:LinkButton ID="lbtnCompanyNameUpdate" Style="font-size: 12px" runat="server" Text="Update"
                        OnClick="lbtnCompanyNameUpdate_Click" OnClientClick="if ( ! Done()) return false;"
                        meta:resourcekey="btnDoneResource1" />
                    |
            <asp:LinkButton ID="lbtnCompanyNameCancel" Style="font-size: 12px" CausesValidation="false"
                runat="server" OnClick="lbtnCompanyNameCancel_Click" Text="Cancel" />
                </asp:Panel>
            </div>
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
            <div class="form-group">
                <asp:Label runat="server" Text="Address: "></asp:Label>
                <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                <asp:LinkButton ID="lbtnAddressEdit" Style="font-size: 12px" CausesValidation="false" Text="Edit" runat="server" OnClick="lbtnAddressEdit_Click"></asp:LinkButton>
                <asp:Panel ID="PanelAddressEdit" Visible="false" runat="server">
                    <asp:TextBox ID="txtAddress" class="form-control" placeholder="New Address" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtAddress"
                        runat="server" ErrorMessage="Address required" Text="required"
                        ControlToValidate="txtAddress" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <asp:LinkButton ID="lbtnAddressUpdate" Style="font-size: 12px" runat="server" Text="Update"
                        OnClick="lbtnAddressUpdate_Click" OnClientClick="if ( ! Done()) return false;"
                        meta:resourcekey="btnDoneResource1" />
                    |
            <asp:LinkButton ID="lbtnAddressCancel" Style="font-size: 12px" CausesValidation="false"
                runat="server" OnClick="lbtnAddressCancel_Click" Text="Cancel" />
                </asp:Panel>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Contact Number: "></asp:Label>
                <asp:Label ID="lblPhone" runat="server" Text="Label"></asp:Label>
                <asp:LinkButton ID="lbtnPhoneEdit" Style="font-size: 12px" CausesValidation="false" Text="Edit" runat="server" OnClick="lbtnPhoneEdit_Click"></asp:LinkButton>
                <asp:Panel ID="PanelPhoneEdit" Visible="false" runat="server">
                    <asp:TextBox ID="txtPhone" class="form-control" MaxLength="200" placeholder="New Phone Number" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtPhone"
                        runat="server" ErrorMessage="Phone Number required" Text="required"
                        ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtxtPhone" runat="server" ErrorMessage="Invalid Phone Number"
                        ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red"
                        ValidationExpression="^([\+]?(?:00)?[0-9]{1,3}[\s.-]?[0-9]{1,12})([\s.-]?[0-9]{1,4}?)$">
                    </asp:RegularExpressionValidator>
                    <asp:LinkButton ID="lbtnPhoneUpdate" Style="font-size: 12px" runat="server" Text="Update"
                        OnClick="lbtnPhoneUpdate_Click" OnClientClick="if ( ! Done()) return false;"
                        meta:resourcekey="btnDoneResource1" />
                    |
            <asp:LinkButton ID="lbtnPhoneCancel" Style="font-size: 12px" CausesValidation="false"
                runat="server" OnClick="lbtnPhoneCancel_Click" Text="Cancel" />
                </asp:Panel>
            </div>
            <div class="form-group">
                <asp:Label runat="server" Text="Website Address: "></asp:Label>
                <asp:HyperLink EnableViewState="true" ID="lblWebsite" runat="server" Text="Label"></asp:HyperLink>
                <asp:LinkButton ID="lbtnWebsiteEdit" Style="font-size: 12px" CausesValidation="false" Text="Edit" runat="server" OnClick="lbtnWebsiteEdit_Click"></asp:LinkButton>
                <asp:Panel ID="PanelWebsiteEdit" Visible="false" runat="server">
                    <asp:TextBox ID="txtWebsite" class="form-control" placeholder="Website URL" runat="server">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfdtxtWebsite"
                        runat="server" ErrorMessage="Website URL required" Text="required"
                        ControlToValidate="txtWebsite" Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rev" runat="server" ErrorMessage="Invalid Website URL"
                        ControlToValidate="txtWebsite" Display="Dynamic"
                        ValidationExpression="^([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$">
                    </asp:RegularExpressionValidator>
                    <asp:LinkButton ID="lbtnWebsiteUpdate" Style="font-size: 12px" runat="server" Text="Update"
                        OnClick="lbtnWebsiteUpdate_Click" OnClientClick="if ( ! Done()) return false;"
                        meta:resourcekey="btnDoneResource1" />
                    |
            <asp:LinkButton ID="lbtnWebsiteCancel" Style="font-size: 12px" CausesValidation="false"
                runat="server" OnClick="lbtnWebsiteCancel_Click" Text="Cancel" />
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>

