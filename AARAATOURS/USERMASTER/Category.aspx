<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/USERMASTER/umaster.Master" CodeBehind="Category.aspx.cs" Inherits="AARAATOURS.USERMASTER.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- promotions -->
    <section class="wthree-row w3-about py-lg-5">
        <div class="container py-5">
            <div class="title-section pb-sm-5 pb-3">
                <h3 class="heading-agileinfo text-center pb-4">Packages <span>Slot</span></h3>
            </div>

            <div class="row row-cols-md-2 row-cols-lg-3 ">
                <div class="card col-md-6 col-lg-4">
                    <img src="images/g1.jpg" class="" data-toggle="modal" data-target="#myModal" alt="Card image cap">
                    <div class="card-body w3ls-card">
                        <h5 class="card-title">Germany</h5>
                        <p class="card-text mb-3"><i class="fas fa-map-marker pr-2"></i>South Island </p>
                        <p class="card-text mb-3"><i class="far fa-clock pr-2"></i>Newzealand</p>
                        <a href="#" class="btn btn-primary">₹500</a>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myBookModal">Book</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Germney</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="agileits-w3layouts-info">
                        <div class="row row-cols-md-2 row-cols-lg-2">
                            <div class="card col-md-6 col-lg-6" data-toggle="modal" data-target="#myModal">
                                <img src="images/g1.jpg" class="" alt="Card image cap">
                            </div>
                            <div class="card col-md-6 col-lg-6" data-toggle="modal" data-target="#myModal">
                                <img src="images/g1.jpg" class="" alt="Card image cap">
                            </div>
                            <div class="card col-md-6 col-lg-6" data-toggle="modal" data-target="#myModal">
                                <img src="images/g1.jpg" class="" alt="Card image cap">
                            </div>
                        </div>
                        
                        <span>Category:<b><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></b></span><br />
                        <span>SubCategory:<b><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></b></span><br />
                        <span>Price:<b><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></b></span>

                        <p><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></p>
                    </div>
                    <%-- <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myBookModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Germany</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Name:</label>
                            <%--<input id="exampleFormControlInput1" placeholder="Enter Name">--%>
                            <asp:TextBox ID="TextBox1" runat="server" type="text" class="form-control"></asp:TextBox>
                        </div>
                        
                        <label>Gender:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                            <label class="form-check-label" for="inlineRadio1">Male</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                            <label class="form-check-label" for="inlineRadio2">Female</label>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Mobile Number:</label>
                            <asp:TextBox ID="TextBox2" runat="server" type="text" class="form-control"></asp:TextBox>

                            <%--<input type="text" class="form-control" placeholder="Enter Mobile Number">--%>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Email:</label>
                            <asp:TextBox ID="TextBox3" runat="server" type="email" class="form-control"></asp:TextBox>

                            <%--<input type="email" class="form-control" placeholder="Enter Email">--%>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">No. of Days:</label>
                            <asp:TextBox ID="TextBox4" runat="server" type="number" class="form-control"></asp:TextBox>

                            <%--<input type="number" class="form-control" placeholder="Enter Number">--%>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">No. of Children:</label>
                            <asp:TextBox ID="TextBox5" runat="server" type="number" class="form-control"></asp:TextBox>

                            <%--<input type="number" class="form-control" placeholder="Enter Number">--%>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">No. of Adults:</label>
                            <asp:TextBox ID="TextBox6" runat="server" type="number" class="form-control"></asp:TextBox>

                            <%--<input type="number" class="form-control" placeholder="Enter Number">--%>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Enquiry Message</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                        </div>
                        <div class="form-group text-center">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
