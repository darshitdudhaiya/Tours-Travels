<%@ Page Language="C#" MasterPageFile="~/admin-master/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="AARAATOURS.admin_master.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <h1 class="mt-4">Category</h1>
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-around">
                <a href="AddCategory.aspx">
                    <i class="fas fa-plus me-1 btn btn-primary"></i>
                </a>
            </div>
            <div class="card-body table-responsive">
                <form runat="server">
                    <asp:Repeater ID="dispalytable" runat="server" OnItemCommand="dispalytable_ItemCommand">
                        <HeaderTemplate>
                            <table id="datatablesSimple" class="table table-bordered rounded">
                                <thead>
                                    <tr>
                                        <th>Index</th>
                                        <th>Category Name</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Container.ItemIndex + 1 %></td>
                                <td class="text-left"><%# Eval("name") %></td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Edit" CssClass="btn btn-primary" CommandName="GetRecord" CommandArgument='<%# Eval("id") %>'/>
                                </td>
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
