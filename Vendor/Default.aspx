<%@ Page Title="" Language="C#" MasterPageFile="~/Vendor/Vendor.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Vendor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container centerdiv">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="PanelDashboard" runat="server">
            <ContentTemplate>
                <asp:Timer runat="server" ID="Timer1" Interval="5000" OnTick="Timer1_Tick">
                </asp:Timer>
                <%--                <div class="form-group">
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
                                            <b><%#Eval("CompanyName") %></b> added a post: 
                                            "<%# CutText(DataBinder.Eval(Container.DataItem,"Description"), 60) %>"
                                            <p style="font-size: 13px; text-transform: lowercase">
                                                <%#Eval("NotificationDate","{0:dd-MMM-yyyy hh:mmtt}") %>
                                                <asp:Label ID="lblPostId" Visible="false" Text='<%# Eval("PostId")%>' runat="server"></asp:Label>
                                                <asp:Label ID="lblClientId" Visible="false" Text='<%# Eval("UserId")%>' runat="server"></asp:Label>
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
                                SelectCommand="select top 15 p.Id, ua.Id, pn.PostId, p.UserId, ua.CompanyName,
pn.NotificationDate, p.Description   
from tblPostNotification as pn, tblPost as p, tblUserAccount as ua, 
tblTags as t, tblCompanyDetails as cd
where pn.PostId = p.Id
and p.UserId = ua.Id
and t.PostId = p.Id
and p.Status != 'Closed'
and (t.Tag = cd.SystemTitle 
or t.Tag = cd.SubSystemTitle 
or t.Tag = cd.ItemTitle
or t.Tag = cd.SubItemTitle)
and cd.UserId = @userid
order by pn.Id desc">
                                <SelectParameters>
                                    <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div class="form-group">
                                <asp:LinkButton ID="lbtnViewAll" CssClass="font-italic" runat="server">See All</asp:LinkButton>
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

