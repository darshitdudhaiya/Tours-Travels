<%@ Page Language="C#" MasterPageFile="~/admin-master/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="UpdatePackage.aspx.cs" Inherits="AARAATOURS.admin_master.UpdatePackage" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xl px-5 col-11 mt-5">

     <!-- Page Heading -->
     <div class="">
         <h1 class="h3 mb-3 text-gray-800">Update Package</h1>
     </div>

     <div class="mb-3 border border-2 shadow p-4 rounded-3">
         <form runat="server">
             <div class="row">
                 <div class="form-group col-md-6">
                     <label class="fw-semibold">Select Category</label>
                     <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" DataValueField="id" DataTextField="name" AutoPostBack="True" OnSelectedIndexChanged="cmbcourse_SelectedIndexChanged">
                     </asp:DropDownList>
                 </div>
                 <div class="form-group col-md-6">
                     <label class="fw-semibold">Select Subcategory</label>
                     <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataValueField="id" DataTextField="name" AutoPostBack="True">
                     </asp:DropDownList>
                 </div>

             </div>
             <div class="row">
                 <div class="form-group col-md-6">
                     <label class="fw-semibold">Name</label>
                     <asp:TextBox ID="TextBox1" runat="server" class="form-control p-2" placeholder="Enter Package Name"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Data" ControlToValidate="TextBox1" class="text-danger"></asp:RequiredFieldValidator>
                 </div>
                 <div class="form-group col-md-6">
                     <label class="fw-semibold">Price</label>
                     <asp:TextBox ID="TextBox3" runat="server" class="form-control p-2" placeholder="Enter Package Price"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Price" ControlToValidate="TextBox3" class="text-danger"></asp:RequiredFieldValidator>
                 </div>
             </div>
             <div class="row mb-3">
                 <div class="form-group col-md-12">
                     <label class="fw-semibold">Details</label>
                     <asp:TextBox ID="TextBox2" class="form-control p-2" runat="server" placeholder="Enter Details" TextMode="MultiLine"></asp:TextBox>
                 </div>
             </div>
             <div class="row">
                 <div class="form-group col-md-4">
                     <label class="fw-semibold">Select Image</label>
                     <asp:FileUpload ID="FileUpload1" runat="server" class="form-control p-2" />
                 </div>
                 <div class="form-group col-md-4">
                     <label class="fw-semibold">Select Image</label>
                     <asp:FileUpload ID="FileUpload2" runat="server" class="form-control p-2" />
                 </div>
                 <div class="form-group col-md-4">
                     <label class="fw-semibold">Select Image</label>
                     <asp:FileUpload ID="FileUpload4" runat="server" class="form-control p-2" />
                 </div>
             </div>
             

             <div class="mt-4">
                 <asp:Button ID="Button1" runat="server" Text="Update Package" class="btn btn-gradient bg-info text-white fs-6 fw-semibold tracking-wide" OnClick="Button1_Click" />
             </div>
         </form>
     </div>

 </div>


</asp:Content>