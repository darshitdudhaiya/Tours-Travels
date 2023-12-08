<%@ Page Language="C#" MasterPageFile="~/admin-master/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AARAATOURS.admin_master.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <h1 class="mt-4">Contact</h1>
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
                                        <th>Name</th>
                                        <th>Mobile Number</th>
                                        <th>Eamil</th>
                                        <th>Message</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Container.ItemIndex + 1 %></td>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("mobile_number") %></td>
                                <td><%# Eval("email") %></td>
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
