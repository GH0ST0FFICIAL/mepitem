<%@ Page Title="" Language="C#" MasterPageFile="~/Consultant/Consultant.master" AutoEventWireup="true" CodeFile="PostDetailAndOffer.aspx.cs" Inherits="Consultant_PostDetailAndOffer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function Done() {
            return confirm("Are you sure?");
        }
    </script>
    <script>
        $(function () {
            $('#<%= txtSearch.ClientID  %>').quicksearch('#<%= GridView2.ClientID  %> tbody tr');
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="PanelClient" Visible="true" runat="server">
        <div class="container centerdiv">
            <div class="form-group">
                <h4 class="text-center">Post Details and Offer</h4>
            </div>
            <br />
            <asp:Panel ID="PanelPostDetails" Visible="true" runat="server">
                <div class="form-group">
                    <div class="row">
                        <asp:LinkButton ID="lbtnGoBack" Text="Go back" runat="server" OnClick="lbtnGoBack_Click"></asp:LinkButton>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <asp:Label runat="server" Text="Posted on: "></asp:Label>
                            <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                            <asp:Button ID="btnSendOffer" runat="server" CssClass="btn btn-secondary btn-sm" Text="Send Offer" OnClick="btnSendOffer_Click"></asp:Button>
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
                        <div class="col-sm-12">
                            <asp:Label runat="server" Text="Posted By: "></asp:Label>
                            <asp:Label ID="lblCompanyName" Font-Bold="true" runat="server" Text="Label"></asp:Label>
                            | 
                                <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                            | 
                                <asp:Label ID="lblPhone" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <asp:GridView ID="GridView1" CssClass="table table-sm" AlternatingRowStyle-CssClass="alt" HeaderStyle-Width="20px" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True" GridLines="None" OnRowCommand="GridView1_RowCommand" PageSize="20">
                                <AlternatingRowStyle CssClass="alt" />
                                <Columns>
                                    <asp:TemplateField HeaderText="BOQ/Specification" HeaderStyle-Font-Bold="false" SortExpression="Specification">
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
                    <h5>Sent Offers</h5>
                </div>
                <div class="gridviewScrollable">
                    <div class="form-group">
                        <asp:TextBox ID="txtSearch" placeholder="Search" CssClass="form-control border-0" runat="server"></asp:TextBox>
                    </div>
                    <asp:GridView ID="GridView2" CssClass="table" EmptyDataText="No records to show" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound" AllowPaging="True" GridLines="None" PageSize="20" DataKeyNames="Id" DataSourceID="SqlDataSourceSentOffer">
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
                            <asp:TemplateField HeaderText="Client" SortExpression="CompanyName" ItemStyle-Width="200px" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" CssClass="badge badge-success" ToolTip="If you click this your offer will be closed and will not be shown to client" runat="server"
                                        CausesValidation="False" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Close"
                                        Text='<%# Bind("Status") %>' OnClientClick="if ( ! Done()) return false;"
                                        meta:resourcekey="btnDoneResource1"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceSentOffer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="select distinct tblOffer.Id, tblOffer.PostId, tblOffer.ClientId, tblOffer.CompanyId, tblOffer.MessageToClient, 
tblOffer.OfferDate, tblOffer.Status, tblOffer.Specification, tblUserAccount.CompanyName
from tblOffer, tblUserAccount, tblPost
where tblOffer.CompanyId = @userid
and tblUserAccount.Id = tblOffer.ClientId
and (tblOffer.PostId = @clientPostId)
order by tblOffer.OfferDate Desc;">
                        <SelectParameters>
                            <asp:SessionParameter Name="userid" SessionField="userid" />
                        </SelectParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="clientPostId" SessionField="clientPostId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceSentOffer2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="select distinct tblOffer.Id, tblOffer.PostId, tblOffer.ClientId, tblOffer.CompanyId, tblOffer.MessageToClient, 
tblOffer.OfferDate, tblOffer.Status, tblOffer.Specification, tblUserAccount.CompanyName
from tblOffer, tblUserAccount, tblPost
where tblOffer.CompanyId = @userid
and tblUserAccount.Id = tblOffer.ClientId
and (tblOffer.PostId = @PostIdFromNotification)
order by tblOffer.OfferDate Desc;">
                        <SelectParameters>
                            <asp:SessionParameter Name="userid" SessionField="userid" />
                        </SelectParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="PostIdFromNotification" SessionField="PostIdFromNotification" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </asp:Panel>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelOfferForm" Visible="false" runat="server">
        <div class="container centerdiv">
            <div class="form-group">
                <h4 class="text-center">Offer Form</h4>
            </div>
            <br />
            <div class="row">
                <asp:LinkButton ID="lbtnGoBackToPostDetails" CausesValidation="false" Text="Go back" runat="server" OnClick="lbtnGoBackToPostDetails_Click"></asp:LinkButton>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Message: "></asp:Label>
                        <asp:TextBox ID="txtMessage" class="form-control" TextMode="MultiLine" Rows="5" placeholder="Message for Client" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfdtxtMessage"
                            runat="server" ErrorMessage="Message required" Text="required"
                            ControlToValidate="txtMessage" Display="Dynamic" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Offer (Feedback) Upload"></asp:Label>
                        <asp:FileUpload ID="fupSpecification" class="form-control" runat="server" ViewStateMode="Enabled" AllowMultiple="false" />
                    </div>
                </div>
            </div>
            <asp:Panel ID="PanelSubmitButton" Visible="true" runat="server">
                <asp:Button ID="btnSubmit" class="btn btn-primary btn-sm" runat="server" Text="Submit"
                    OnClick="btnSubmit_Click" OnClientClick="if ( ! Done()) return false;"
                    meta:resourcekey="btnDoneResource1" />
            </asp:Panel>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelUpdateButton" Visible="false" runat="server">
        <div class="form-group">
            <asp:Button ID="btnUpdate" class="btn btn-primary btn-sm" runat="server" Text="Update"
                OnClientClick="if ( ! Done()) return false;"
                meta:resourcekey="btnDoneResource1" />
            <asp:Button ID="btnCancel" CausesValidation="false" class="btn btn-secondary btn-sm"
                runat="server" Text="Cancel" />
        </div>
    </asp:Panel>
</asp:Content>

