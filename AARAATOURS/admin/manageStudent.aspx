<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="manageStudent.aspx.cs" Inherits="project3.admin.manageStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <h1 class="mt-4">Tables</h1>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
            </div>

            <div class="row px-3">
                <div class="form-group col-md-4">
                    <label class="fw-semibold">Select Course</label>
                    <asp:DropDownList ID="cmbcourse" runat="server" class="form-control" DataValueField="course_Id" DataTextField="courseName" AutoPostBack="True" OnSelectedIndexChanged="cmbcourse_SelectedIndexChanged" >
                    </asp:DropDownList>
                </div>
                <div class="mt-4 col-8 text-end">

                    <asp:Button ID="btnadd" runat="server" Text="Add NewStudent" class="btn btn-gradient bg-info text-white fs-6 fw-semibold tracking-wide" OnClick="btnadd_Click" />
                </div>
            </div>

            <br />
            <div class="card-body">
                <asp:Repeater ID="dispalytable" runat="server">
                    <HeaderTemplate>
                        <table id="datatablesSimple">

                            <thead>

                                <tr>
                                    <th>StudId</th>
                                    <th>FirsrtName</th>
                                    <th>LastName</th>
                                    <th>Course</th>
                                    <th>ClassNo</th>
                                    <th>DiviSion</th>
                                    <th>PhoneNo</th>
                                    <th>Email</th>
                                 <%--   <th>Image</th>--%>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <tr class="text-center">
                            <td><%# Eval("stud_Id") %></td>
                            <td><%# Eval("firstname") %></td>
                            <td><%# Eval("lastname") %></td>
                            <td><%# Eval("course_id") %></td>
                            <td><%# Eval("classNo") %></td>
                            <td><%# Eval("division") %></td>
                            <td><%# Eval("phoneNo") %></td>
                            <td><%# Eval("email") %></td>
                           <%-- <td>
                                <asp:image id="image1" runat="server" imageurl='<%# eval("img") %>' width="50px" height="50px" />
                            </td>--%>
                            <td>
                                <asp:LinkButton ID="btndelete" runat="server" OnClick="btndelete_Click" Visible="false">Delete</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>

                    <FooterTemplate>
                        </tbody>
            </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
                            

    </form>
</asp:Content>
