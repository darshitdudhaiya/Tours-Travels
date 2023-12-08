<%@ Page Language="C#" MasterPageFile="~/admin-master/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="Inquiry.aspx.cs" Inherits="AARAATOURS.admin_master.Inquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <h1 class="mt-4">Inquiry</h1>
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-around">
              
            </div>
            <div class="card-body table-responsive">
                <form runat="server">
                    <asp:Repeater ID="dispalytable" runat="server" OnItemCommand="dispalytable_ItemCommand">
                        <HeaderTemplate>
                            <table id="datatablesSimple" class="table table-bordered rounded">
                                <thead>
                                    <tr>
                                        <th>Index</th>
                                        <th>Package</th>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Mobile Number</th>
                                        <th>Email</th>
                                        <th>Number Of Days</th>
                                        <th>Child</th>
                                        <th>Adults</th>
                                        <th>Message</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Container.ItemIndex + 1 %></td>
                                <td><%# Eval("package_name") %></td>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("gender") %></td>
                                <td><%# Eval("mobile_number") %></td>
                                <td><%# Eval("email") %></td>
                                <td><%# Eval("no_of_days") %></td>
                                <td><%# Eval("child") %></td>
                                <td><%# Eval("adults") %></td>
                                <td><%# Eval("message") %></td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="DeleteRecord" CommandArgument='<%# Eval("id") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
