<%@ Page Language="C#" MasterPageFile="~/admin-master/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="Package.aspx.cs" Inherits="AARAATOURS.admin_master.Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <h1 class="mt-4">Package</h1>
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-around">
                <a href="AddPackage.aspx">
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
                                        <th>Sub Category Name</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Details</th>
                                        <th colspan="3">Packages Images</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Container.ItemIndex + 1 %></td>
                                <td><%# Eval("category_name") %></td>
                                <td><%# Eval("sub_category_name") %></td>
                                <td class="text-left"><%# Eval("name") %></td>
                                <td><%# Eval("price") %></td>
                                <td class="text-left"><%# Eval("details") %></td>
                                <td>
                                    <asp:Image ID="imgSubCategory" runat="server" ImageUrl='<%# Eval("image_1", "images/{0}") %>' Height="100" Width="100" />
                                </td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image_2", "images/{0}") %>' Height="100" Width="100" />
                                </td>
                                <td>
                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("image_3", "images/{0}") %>' Height="100" Width="100" />
                                </td>
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
