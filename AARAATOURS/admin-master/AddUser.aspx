<%@ Page Language="C#" MasterPageFile="~/admin-master/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="AARAATOURS.admin_master.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="layoutAuthentication" style="min-height: 80vh">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-3">
                                    <div class="card-header">
                                        <h3 class="text-center font-weight-dark my-4">Add User</h3>
                                    </div>
                                    <div class="card-body">
                                        <form runat="server">
                                            <div class="form-floating mb-2">
                                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="name@example.com"></asp:TextBox>
                                                <label for="inputEmail">Username</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Username Is Required"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-floating mb-2">
                                                <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="name@example.com"></asp:TextBox>
                                                <label for="inputEmail">Email</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Email Is Required"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-floating mb-2">
                                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="EnterPassword" Type="password" TextMode="Password"></asp:TextBox>
                                                <label for="inputPassword">Password</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password Is Required"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-floating mb-2">
                                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="EnterPassword" Type="password" TextMode="Password"></asp:TextBox>
                                                <label for="inputPassword">Confirm Password</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Confirm Password Is Reqired"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="Confirm Password Is Not Matched With Password"></asp:CompareValidator>
                                            </div>
                                            <div class="d-flex  justify-content-center mt-2 mb-0">
                                                <asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-primary" OnClick="Button1_Click" />
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
</asp:Content>
