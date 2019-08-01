<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="PostDetailAndOffer.aspx.cs" Inherits="Client_PostDetailAndOffer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(function () {
            $('#<%= txtSearch2.ClientID  %>').quicksearch('#<%= GridView3.ClientID  %> tbody tr');
        })
    </script>
    <script>
        $(function () {
            $('#<%= txtSearch3.ClientID  %>').quicksearch('#<%= GridView4.ClientID  %> tbody tr');
        })
    </script>
    <script>
        $(function () {
            $('#<%= txtSearch4.ClientID  %>').quicksearch('#<%= GridView5.ClientID  %> tbody tr');
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <div class="form-group">
            <h4 id="pageheader" runat="server" class="text-center">Post and Offer Details</h4>
        </div>
        <br />
        <asp:Panel ID="PanelDetails" runat="server">
            <div class="form-group">
                <div class="row">
                    <asp:LinkButton ID="lbtnGoBack" Text="Go back" runat="server" OnClick="lbtnGoBack_Click"></asp:LinkButton>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <asp:Label runat="server" Text="Posted on: "></asp:Label>
                        <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                        | 
                            <asp:Label runat="server" Text="Status: "></asp:Label>
                        <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Label runat="server" Text="Description: "></asp:Label>
                        <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Label runat="server" Font-Size="14px" Text="Tags: "></asp:Label>
                        <asp:Label ID="lblTags" Font-Size="14px" Font-Italic="true" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <asp:Label ID="lblEmail" Font-Size="14px" runat="server" Text="Label"></asp:Label>
                        <asp:LinkButton ID="lbtnEMailEdit" Style="font-size: 12px" CausesValidation="false" Text="Edit" runat="server" OnClick="lbtnEMailEdit_Click"></asp:LinkButton>
                        | 

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
                        <asp:Label ID="lblPhone" Font-Size="14px" runat="server" Text="Label"></asp:Label>
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
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:GridView ID="GridView2" CssClass="table table-sm" AlternatingRowStyle-CssClass="alt" HeaderStyle-Width="20px" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" OnRowCommand="GridView2_RowCommand" PageSize="20">
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                                <asp:TemplateField HeaderText="BOQ/Specification" HeaderStyle-Font-Bold="false" SortExpression="Specification">
                                    <EditItemTemplate>
                                        <asp:FileUpload ID="FileUploadSpecificationEdit" runat="server" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Download" CommandArgument='<%# Eval("Specification") %>' Text='<%# Eval("Specification") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle Font-Bold="False" Width="20px" />
                            <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <h5>Offers</h5>
            </div>
            <div class="gridviewScrollable">
                <div class="form-group">
                    <asp:TextBox ID="txtSearch2" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                </div>
                <asp:GridView ID="GridView3" CssClass="table" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView3_RowCommand" AllowPaging="True" GridLines="None" PageSize="20" DataKeyNames="Id" DataSourceID="SqlDataSourceOffer">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PostId" SortExpression="PostId" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PostId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ClientId" SortExpression="ClientId" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClientId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CompanyId" SortExpression="CompanyId" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("CompanyId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Offered On" SortExpression="OfferDate" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("OfferDate", "{0:dd MMM yyyy (hh:mm tt)}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company" SortExpression="CompanyName" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="CompanyDetails" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text='<%# Bind("CompanyName") %>' ForeColor="Gray" ToolTip="Click to view company details"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Message To Client" SortExpression="MessageToClient">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("MessageToClient") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Offer (Feedback) File" SortExpression="Specification">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Download" CommandArgument='<%# Eval("Specification") %>' Text='<%# Eval("Specification") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceOffer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="select distinct tblOffer.Id, tblOffer.PostId, tblOffer.ClientId, tblOffer.CompanyId, tblOffer.MessageToClient, 
tblOffer.OfferDate, tblOffer.Specification, tblUserAccount.CompanyName
from tblOffer, tblUserAccount, tblPost
where tblOffer.ClientId = @userid
and tblOffer.PostId = @clientPostId
and tblOffer.CompanyId = tblUserAccount.Id
and tblOffer.Status != 'Closed'
order by tblOffer.OfferDate Desc;">
                    <SelectParameters>
                        <asp:SessionParameter Name="userid" SessionField="userid" />
                    </SelectParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="clientPostId" SessionField="clientPostId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceOffer2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="select distinct tblOffer.Id, tblOffer.PostId, tblOffer.ClientId, tblOffer.CompanyId, tblOffer.MessageToClient, 
tblOffer.OfferDate, tblOffer.Specification, tblUserAccount.CompanyName
from tblOffer, tblUserAccount, tblPost
where tblOffer.ClientId = @userid
and tblOffer.PostId = @PostIdFromNotification
and tblOffer.Id = @OfferIdFromNotification
and tblOffer.CompanyId = tblUserAccount.Id
and tblOffer.Status != 'Closed'
order by tblOffer.OfferDate Desc;">
                    <SelectParameters>
                        <asp:SessionParameter Name="userid" SessionField="userid" />
                    </SelectParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="PostIdFromNotification" SessionField="PostIdFromNotification" />
                    </SelectParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="OfferIdFromNotification" SessionField="OfferIdFromNotification" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceOffer3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="select distinct tblOffer.Id, tblOffer.PostId, tblOffer.ClientId, tblOffer.CompanyId, tblOffer.MessageToClient, 
tblOffer.OfferDate, tblOffer.Specification, tblUserAccount.CompanyName
from tblOffer, tblUserAccount, tblPost
where tblOffer.ClientId = @userid
and tblOffer.PostId = @PostIdFromNotification
and tblOffer.CompanyId = tblUserAccount.Id
and tblOffer.Status != 'Closed'
order by tblOffer.OfferDate Desc;">
                    <SelectParameters>
                        <asp:SessionParameter Name="userid" SessionField="userid" />
                    </SelectParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="PostIdFromNotification" SessionField="PostIdFromNotification" />
                    </SelectParameters>
                </asp:SqlDataSource>
<%--                <asp:LinkButton ID="lbtnShowAllOffers" Visible="false" runat="server" OnClick="lbtnShowAllOffers_Click">All Offers</asp:LinkButton>--%>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelConsultantCompanyDetails" Visible="false" runat="server">
            <div class="form-group">
                <div class="row">
                    <asp:LinkButton ID="lbtnGoBackToPanelDetails1" Text="Go back" runat="server" OnClick="lbtnGoBackToPanelDetails1_Click"></asp:LinkButton>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Label ID="lblConsultantName" Font-Bold="true" runat="server" Text="Label"></asp:Label>
                        | 
                             <asp:Label ID="lblConsultantEmail" runat="server" Text="Label"></asp:Label>
                        | 
                             <asp:Label ID="lblConsultantPhone" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-12">
                        <div class="gridviewScrollable">
                            <div class="form-group">
                                <asp:TextBox ID="txtSearch3" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                            </div>
                            <asp:GridView ID="GridView4" CssClass="table table-sm" AlternatingRowStyle-CssClass="alt" HeaderStyle-Width="20px" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" PageSize="20">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="System Title" SortExpression="SystemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SystemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub-System Title" SortExpression="SubSystemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("SubSystemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle Font-Bold="False" Width="20px" />
                                <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelVendorCompanyDetails" Visible="false" runat="server">
            <div class="form-group">
                <div class="row">
                    <asp:LinkButton ID="lbtnGoBackToPanelDetails2" Text="Go back" runat="server" OnClick="lbtnGoBackToPanelDetails2_Click"></asp:LinkButton>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Label ID="lblVendorName" Font-Bold="true" runat="server" Text="Label"></asp:Label>
                        | 
                             <asp:Label ID="lblVendorEmail" runat="server" Text="Label"></asp:Label>
                        | 
                             <asp:Label ID="lblVendorPhone" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-sm-12">
                        <div class="gridviewScrollable">
                            <div class="form-group">
                                <asp:TextBox ID="txtSearch4" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                            </div>
                            <asp:GridView ID="GridView5" CssClass="table table-sm" AlternatingRowStyle-CssClass="alt" HeaderStyle-Width="20px" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" OnRowCommand="GridView5_RowCommand" PageSize="20">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="System" SortExpression="SystemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SystemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub-System" SortExpression="SubSystemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubSystemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item" SortExpression="ItemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub-Item" SortExpression="SubItemTitle">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("SubItemTitle") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Distributor/Brand" SortExpression="BrandName">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("BrandName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" HeaderText="Min. Capacity" SortExpression="MinCapacity">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("MinCapacity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" HeaderText="Max. Capacity" SortExpression="MaxCapacity">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("MaxCapacity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Catalogue" SortExpression="Catalogue">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Download" CommandArgument='<%# Eval("Catalogue") %>' Text='<%# Eval("Catalogue") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BOQ/Specification" SortExpression="Specification">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Download" CommandArgument='<%# Eval("Specification") %>' Text='<%# Eval("Specification") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle Font-Bold="False" Width="20px" />
                                <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

