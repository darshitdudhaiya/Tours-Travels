<%@ Page Language="C#" MasterPageFile="~/admin-master/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="UpdateCategory.aspx.cs" Inherits="AARAATOURS.admin_master.UpdateCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xl px-5 col-11 mt-5">
        <div class="">
            <h1 class="h3 mb-3 text-gray-800">Update Category</h1>
        </div>
        <div class="mb-3 border border-2 shadow p-4 rounded-3">
            <form runat="server">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="fw-semibold mb-1">Category Name</label>
                        <asp:TextBox ID="TextBox1" runat="server" class="form-control p-2" placeholder="Enter Category Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name Is Required"></asp:RequiredFieldValidator>
                    </div>
                </div
                <div class="mt-4">
                    <asp:Button ID="Button2" class="btn btn-gradient bg-info text-white fs-6 fw-semibold tracking-wide" runat="server" Text="Update" OnClick="Button1_Click" />
                </div>
            </form>
        </div>
    </div>
</asp:Content>