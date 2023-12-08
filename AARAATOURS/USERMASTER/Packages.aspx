<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/USERMASTER/umaster.Master" CodeBehind="Packages.aspx.cs" Inherits="AARAATOURS.USERMASTER.Packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- promotions -->
    <section class="wthree-row w3-about py-lg-5">
        <div class="container py-5">
            <div class="title-section pb-sm-5 pb-3">
                <h3 class="heading-agileinfo text-center pb-4">Packages <span>Slot</span></h3>
            </div>

            <div class="row row-cols-md-2 row-cols-lg-3 gap-3">
                <%--<div class="card col-md-6 col-lg-4">
                    <img src="images/g1.jpg" class="" data-toggle="modal" data-target="#myModal" alt="Card image cap">
                    <div class="card-body w3ls-card">
                        <h5 class="card-title">Germany</h5>
                        <p class="card-text mb-3"><i class="fas fa-map-marker pr-2"></i>South Island </p>
                        <p class="card-text mb-3"><i class="far fa-clock pr-2"></i>Newzealand</p>
                        <a href="#" class="btn btn-primary">₹500</a>
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myBookModal">Book</button>
                    </div>
                </div>--%>
                <asp:Repeater ID="cardRepeater" runat="server" OnItemCommand="CardRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="card col-md-6 col-lg-4">
                            <asp:LinkButton ID="btnShowModal" runat="server" CommandName="ShowModal" CommandArgument='<%# Eval("id") %>'>
                                <img src='<%# Eval("image_1", "/admin-master/images/{0}") %>' class="card-img-top" data-toggle="modal" data-target="#myModal" alt="Card image cap">
                            </asp:LinkButton>
                            <div class="card-body w3ls-card">
                                <h5 class="card-title"><%# Eval("name") %></h5>
                                <p class="card-text mb-3"><span style="color: #cc2105">Category Name : </span><%# Eval("category_name") %> </p>
                                <p class="card-text mb-3"><span style="color: #cc2105">Sub Category Name : </span><%# Eval("sub_category_name") %> </p>
                                <button  class="btn btn-danger" type="button">₹ <%# Eval("price") %></button>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="ShowBookingModal" CommandArgument='<%# Eval("id") %>' BackColor="Transparent">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myBookModal">Book</button>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>


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
                        <div class="row row-cols-md-2 row-cols-lg-2 mb-4">
                            <div class="card col-md-4 col-lg-4" data-toggle="modal" data-target="#myModal">
                                <img src="images/g1.jpg" id="image1" alt="Card image cap">
                            </div>
                            <div class="card col-md-4 col-lg-4" data-toggle="modal" data-target="#myModal">
                                <img src="images/g1.jpg" id="image2" alt="Card image cap">
                            </div>
                            <div class="card col-md-4 col-lg-4" data-toggle="modal" data-target="#myModal">
                                <img src="images/g1.jpg" id="image3" alt="Card image cap">
                            </div>
                        </div>


                        <span class="my-5 mt-5">Category : &nbsp;<b><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></b></span><br />
                        <span class="my-5">SubCategory : &nbsp;<b><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></b></span><br />
                        <span class="my-5">Price : &nbsp;<b><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></b></span><br />
                        <span class="my-5">Details : &nbsp;<p id="details"></p>
                            </b></span>

                        <%--<p>
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </p>--%>
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
                    <asp:TextBox ID="TextBox7" runat="server" type="hidden" class="form-control"></asp:TextBox>

                    <div class="form-group">
                        <label for="exampleFormControlInput1">Name:</label>
                        <%--<input id="exampleFormControlInput1" placeholder="Enter Name">--%>
                        <asp:TextBox ID="TextBox1" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>

                    <label>Gender:</label>
                    <div class="form-check form-check-inline">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                            <asp:ListItem class="mx-5" Text="Male" />
                            <asp:ListItem Text="Female" />
                        </asp:RadioButtonList>
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
                        <asp:TextBox ID="TextBox4" runat="server" type="text" class="form-control"></asp:TextBox>

                        <%--<input type="number" class="form-control" placeholder="Enter Number">--%>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">No. of Children:</label>
                        <asp:TextBox ID="TextBox5" runat="server" type="text" class="form-control"></asp:TextBox>

                        <%--<input type="number" class="form-control" placeholder="Enter Number">--%>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">No. of Adults:</label>
                        <asp:TextBox ID="TextBox6" runat="server" type="text" class="form-control"></asp:TextBox>

                        <%--<input type="number" class="form-control" placeholder="Enter Number">--%>
                    </div>

                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Enquiry Message</label>
                        <asp:TextBox ID="TextBox8" TextMode="MultiLine" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group text-center">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function updateModal(image1, image2, image3, details, name, category, subCategory, price) {
            // Set the values in the modal
            document.getElementById('image1').src = `/admin-master/images/${image1}`;
            document.getElementById('image2').src = `/admin-master/images/${image2}`;
            document.getElementById('image3').src = `/admin-master/images/${image3}`;
            document.getElementById('<%= Label1.ClientID %>').innerText = category;
            document.getElementById('<%= Label2.ClientID %>').innerText = subCategory;
            document.getElementById('<%= Label3.ClientID %>').innerText = + price;

            // If you want to display the name in the modal header
            document.querySelector('.modal-title').innerText = name;

            // Assuming Label4 is inside the <p> tag
            document.getElementById('details').innerText = details;

            // Open the modal
            $('#myModal').modal('show');
        }

        function bookingModal(id) {
            // Set the values in the modal
            document.getElementById('<%= TextBox7.ClientID %>').innerText = id;

            // Use the correct modal ID
            $('#myBookModal').modal('show');
        }
    </script>

</asp:Content>
