<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="addStudent.aspx.cs" Inherits="project3.admin.addStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xl px-5 col-11 mt-5">

    <!-- Page Heading -->
    <div class="">
        <h1 class="h3 mb-3 text-gray-800">Add Student</h1>
    </div>

    <div class="mb-3 border border-2 shadow p-4 rounded-3">
        <form  runat="server">
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="fw-semibold">First Name</label>
                    <asp:TextBox ID="txtfirstname" runat="server" class="form-control p-2" placeholder="Enter First Name"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Data" ControlToValidate="txtfirstname" class="text-danger" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please EnterValid Data" ValidationExpression="[a-zA-Z]*$" class="text-danger" ControlToValidate="txtfirstname"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group col-md-6">
                    <label class="fw-semibold">Last Name</label>
                    <asp:TextBox ID="txtlastname" runat="server" class="form-control p-2" placeholder="Enter Last Name"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Data" ControlToValidate="txtlastname" class="text-danger" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please EnterValid Data" ValidationExpression="[a-zA-Z]*$" class="text-danger" ControlToValidate="txtlastname"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="fw-semibold">Select Course</label>
                    <asp:DropDownList ID="cmbcourse" runat="server" class="form-control" DataValueField="course_Id" DataTextField="courseName">
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-6">
                    <label class="fw-semibold">ClassNo</label>
                    <asp:TextBox ID="txtclassno" runat="server" class="form-control p-2" placeholder="Enter ClassNo"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Data" ControlToValidate="txtlastname" class="text-danger" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please EnterValid Data" ValidationExpression="^\d+$" class="text-danger" ControlToValidate="txtclassno"></asp:RegularExpressionValidator>
                </div><br>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="fw-semibold">Division</label>
                    <asp:TextBox ID="txtdivision" runat="server" class="form-control p-2" placeholder="Enter Division"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Data" ControlToValidate="txtdivision" class="text-danger" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please EnterValid Data" ValidationExpression="[a-zA-Z]*$" class="text-danger" ControlToValidate="txtdivision"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group col-md-6">
                    <label class="fw-semibold">Phone Number</label>
                    <asp:TextBox ID="txtphoneno" runat="server" class="form-control p-2" placeholder="Enter PhoneNo"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Data" ControlToValidate="txtphoneno" class="text-danger" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please EnterValid Data" ValidationExpression="^\d+$" class="text-danger" ControlToValidate="txtphoneno"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="fw-semibold">Email</label>
                    <asp:TextBox ID="txtemail" runat="server" class="form-control p-2" placeholder="Enter email"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Data" ControlToValidate="txtemail" class="text-danger" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please EnterValid Data" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" class="text-danger" ControlToValidate="txtemail"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group col-md-6">
                    <label class="fw-semibold">Password</label>
                    <asp:TextBox ID="txtpassword" runat="server" class="form-control p-2" placeholder="Enter Password"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Data" ControlToValidate="txtpassword" class="text-danger" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please EnterValid Data" ValidationExpression="^[0-9a-zA-Z*]" class="text-danger" ControlToValidate="txtpassword"></asp:RegularExpressionValidator>
                </div>
                 <div class="form-group col-md-6">
                    <label class="fw-semibold">Select Image</label>
                     <asp:FileUpload ID="FileUpload1" runat="server" class="form-control p-2" />
                </div>
                <%-- <div class="form-group col-md-6">
                 <label class="fw-semibold">Select Role</label>
                <asp:DropDownList ID="cmbrole" runat="server" class="form-control p-2">
                </asp:DropDownList>                    
                </div>--%>
            </div>
            <div class="mt-4">              
                <asp:Button ID="btnsubmit" runat="server" Text="Add Student"  class="btn btn-gradient bg-info text-white fs-6 fw-semibold tracking-wide " OnClick="btnsubmit_Click"/>
            </div>
        </form>
    </div>

</div>
</asp:Content>
