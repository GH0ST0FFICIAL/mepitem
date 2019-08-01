<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Client.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Client_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="PanelDashboard" runat="server">
            <ContentTemplate>
                <asp:Timer runat="server" ID="Timer1" Interval="5000" OnTick="Timer1_Tick">
                </asp:Timer>
                <%--  <div class="form-group">
                    <h5>User(Company) Count</h5>
                </div>
                <hr />--%>
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="form-group">
                                <h5>Notification</h5>
                            </div>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-sm-12">
                                        <div id="divNotification" class="alert alert-primary" runat="server">
                                            <b><%#Eval("CompanyName") %></b> has an offer: 
                                            "<%# CutText(DataBinder.Eval(Container.DataItem,"MessageToClient"), 60) %>"
                                            <p style="font-size: 13px; text-transform: lowercase">
                                                <%#Eval("NotificationDate","{0:dd-MMM-yyyy hh:mmtt}") %>
                                                <asp:Label ID="lblPostId" Visible="false" Text='<%# Eval("PostId")%>' runat="server"></asp:Label>
                                                <asp:Label ID="lblClientId" Visible="false" Text='<%# Eval("UserId")%>' runat="server"></asp:Label>
                                                <asp:Label ID="lblOfferId" Visible="false" Text='<%# Eval("OfferId")%>' runat="server"></asp:Label>
                                                <asp:LinkButton ID="lbtnViewPost" CommandName="ToPostDetails" CssClass="font-italic" runat="server">View</asp:LinkButton>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblEmptyData" Text="No records to show" ForeColor="Gray" runat="server" Visible="false"></asp:Label>
                                </FooterTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="select distinct top 15 ua.Id, ua.CompanyName, onf.Id, onf.PostId, onf.OfferId, onf.NotificationDate, 
o.Id, o.PostId, o.MessageToClient, o.CompanyId, o.Status, p.Id, p.UserId
from tblUserAccount as ua, tblCompanyDetails as cd, 
tblOfferNotification as onf, tblOffer as o, tblPost as p
where onf.OfferId = o.Id
and o.CompanyId = ua.Id
and onf.PostId = o.PostId
and o.PostId = p.Id
and o.Status != 'Closed'
and o.ClientId = @userid
order by onf.Id desc">
                                <SelectParameters>
                                    <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div class="form-group">
                                <asp:LinkButton ID="lbtnViewAll" Visible="true" CssClass="font-italic" runat="server">See All</asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <h5>User Count</h5>
                            </div>
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title">Total Consultant</p>
                                        <h5 id="h5Consultant" runat="server" class="card-text"></h5>
                                        <asp:Button ID="btnViewConsultant" runat="server" Text="View" CssClass="btn btn-sm btn-outline-primary my-2 my-sm-0" OnClick="btnViewConsultant_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title">Total Vendor</p>
                                        <h5 id="h5Vendor" runat="server" class="card-text"></h5>
                                        <asp:Button ID="btnViewVendor" runat="server" Text="View" CssClass="btn btn-sm btn-outline-primary my-2 my-sm-0" OnClick="btnViewVendor_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title">Total Consultant/ Vendor</p>
                                        <h5 id="h5ConsultantAndVendor" runat="server" class="card-text"></h5>
                                        <asp:Button ID="btnViewConsultantAndVendor" runat="server" Text="View" CssClass="btn btn-sm btn-outline-primary my-2 my-sm-0" OnClick="btnViewConsultantAndVendor_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title">Total Client</p>
                                        <h5 id="h5Client" runat="server" class="card-text"></h5>
                                        <asp:Button ID="btnViewClient" runat="server" Text="View" CssClass="btn btn-sm btn-outline-primary my-2 my-sm-0" OnClick="btnViewClient_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

