<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_dashboard.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="project3.admin.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
  <div class="container">
    <div class="main-body mt-5 px-5">
      <!-- Breadcrumb -->
      <nav aria-label="breadcrumb" class="main-breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li>
          <li class="breadcrumb-item active" aria-current="page">User Profile</li>
        </ol>
      </nav>
      <!-- /Breadcrumb -->

      <div class="row gutters-sm">
        <div class="col-md-3 mb-3">
          <div class="card">
            <div class="card-body">
              <div class="d-flex flex-column align-items-center text-center">
                <!--<img src="" alt="Admin">----------------------------------->
                  <asp:Image ID="Image1" runat="server"  class="rounded-circle mt-3" width="150px" Height="150px"  />
                <div class="mt-3">
                  <h4></h4>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-9">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">First Name</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <asp:Label ID="lblfirstname" runat="server" Text=""></asp:Label>
                </div>
              </div>
                <hr />
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Last Name</h6>                 
                </div>
                <div class="col-sm-9 text-secondary">
                    <asp:Label ID="lbllastname" runat="server" Text=""></asp:Label>
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Course</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <asp:Label ID="lblCourse" runat="server" Text=""></asp:Label>                
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">ClassNo</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <asp:Label ID="lblClass" runat="server" Text=""></asp:Label>
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Division</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <asp:Label ID="lblDivision" runat="server" Text=""></asp:Label>                 
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Mobile</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label>
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <h6 class="mb-0">Email</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-12">
                  <!-- <a class="btn btn-info"
                    href="./editProfile.php">Edit</a> -->
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Edit
                  </button>

                  <!-- Modal -->
                  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <div class="modal-header bg-primary" data-bs-theme="dark">
                          <h5 class="modal-title text-light" id="exampleModalLabel">Edit Profile</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <div class="row">
                            <div class="form-group col-md-6">
                              <label class="fw-semibold">First Name</label>
                              <input type="text" class="form-control fs-6 border-2" id="firstname" placeholder="First Name" name="firstname" required>
                            </div>
                            <div class="form-group col-md-6">
                              <label class="fw-semibold">Last Name</label>
                              <input type="text" class="form-control fs-6 border-2" id="lastname" placeholder="Last Name" name="lastname" required>
                            </div>
                          </div>

                          <div class="row">
                            <div class="form-group col-md-6">
                              <label class="fw-semibold">Gender</label>
                              <select name="gender" class="form-control fs-6 border-2" id="gender" required>
                                <option value="">Select Gender</option>
                                <option value="male">Male</option>
                                <option value="female">FeMale</option>
                              </select>
                            </div>
                            <div class="form-group col-md-6">
                              <label class="fw-semibold">Phone No</label>
                              <input type="text" class="form-control fs-6 border-2" id="phone" placeholder="Enter PhoneNo" name="phone" required>
                            </div>
                          </div>

                          <div class="row">
                            <div class="form-group col-md-6">
                              <label class="fw-semibold">Address</label>
                              <input type="text" class="form-control fs-6 border-2" id="address" placeholder="Enter Address" name="address" required>
                            </div>
                            <div class="form-group col-md-6">
                              <label class="fw-semibold">Email</label>
                              <input type="email" class="form-control fs-6 border-2" id="email" placeholder="Email Address" name="email" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="form-group col-md-6">
                              <label class="fw-semibold">Password</label>
                              <input type="password" class="form-control fs-6 border-2" id="password" placeholder="Password" name="password" required>
                            </div>
                            <div class="form-group col-md-6">
                              <label class="fw-semibold">Repassword</label>
                              <input type="password" class="form-control fs-6 border-2" id="repassword" placeholder="Repeat Password" name="repassword" required>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>

</div>
</asp:Content>
