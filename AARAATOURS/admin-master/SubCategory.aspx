<%@ Page Language="C#" MasterPageFile="~/admin-master/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="SubCategory.aspx.cs" Inherits="AARAATOURS.admin_master.SubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <h1 class="mt-4">Sub Category</h1>
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-around">
                <a href="AddSubCategory.aspx">
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
                                        <th>Id</th>
                                        <th>Category Name</th>
                                        <th>Sub Category Name</th>
                                        <th>Sub Category Details</th>
                                        <th>Sub Category Image</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                 <td><%# Container.ItemIndex + 1 %></td>
                                <td><%# Eval("category_name") %></td>
                                <td class="text-left"><%# Eval("name") %></td>
                                <td class="text-left"><%# Eval("details") %></td>
                                <td>
                                    <asp:Image ID="imgSubCategory" runat="server" ImageUrl='<%# Eval("image", "images/{0}") %>' Height="100" Width="100" />
                                </td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Edit" CssClass="btn btn-primary" />
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
