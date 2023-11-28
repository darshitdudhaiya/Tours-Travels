<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AARAATOURS.ADMINMASTER.Login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all" />
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all" />
    <link href="css/hover.css" type="text/css" rel="stylesheet" media="all" />
    <link href="css/mislider.css" rel="stylesheet" type="text/css" />
    <link href="css/mislider-custom.css" rel="stylesheet" type="text/css" />
    <link href="css/fontawesome-all.min.css" rel="stylesheet" />
    <link href="//fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i" rel="stylesheet" />

</head>
 <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container" style="height:100vh">
                        <div class="row justify-content-center align-items-center h-100">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg">
                                    <div class="card-header"><h3 class="text-center font-weight-dark my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form runat="server">
                                            <div class="form-floating mb-3">
                                                <label for="inputEmail">Email address</label>
                                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Enter Username"></asp:TextBox>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <label for="inputPassword">Password</label>
                                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Enter Password" Type="password" TextMode="Password"></asp:TextBox>
                                            </div>
                                            
                                            <div class="d-flex align-items-center justify-content-center mt-4 mb-0">
                                                <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-primary" OnClick="Login_Click"/>
                                            </div>
                                        </form>
                                    </div>
                                   <%-- <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register.html">Need an account? Sign up!</a></div>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
     <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
     <!-- //js -->

     <!-- testimonial-plugin -->
     <script src="js/mislider.js" type="text/javascript"></script>
     <script src="js/counter.js" type="text/javascript"></script>
     <!-- //stats -->
     <!-- start-smooth-scrolling -->
     <script src="js/move-top.js" type="text/javascript"></script>
     <script src="js/easing.js" type="text/javascript"></script>
     <script src="js/SmoothScroll.min.js" type="text/javascript"></script>

     <script src="js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <center>
        <table style="width: 433px; height: 370px; background-color: #FF9933; font-size: large; font-weight: bold;">
            <th colspan="2" align="center"><img src="images/sin.PNG" id="" width="100px" style="height: 40px" align="center"/> </th>
            <tr>
                <td colspan="2" align="center" style="height: 42px">Select&nbsp&nbsp
                    <asp:DropDownList ID="DropDownList_login" runat="server">
                        <asp:ListItem>User</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                    </asp:DropDownList></td>
           </tr>

            <tr>
                <td align="center">Username</td>
                <td align="center"><asp:TextBox ID="txt_username" runat="server" placeholder=" Enter Email ID"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="validusername" runat="server" ControlToValidate="txt_username" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator> 
                </td>
            </tr>

            <tr>
                <td style="height: 72px" align="center">Password</td>
                <td style="height: 72px" align="center"><asp:TextBox ID="txt_password" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="validfname" runat="server" ControlToValidate="txt_password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator> 
                </td>
            </tr>

           

            <tr>
                <td colspan="2" align="center"><asp:Button ID="btn_login" runat="server" Text="Login" BackColor="#669900" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="btn_login_Click" ></asp:Button>
                    &nbsp&nbsp&nbsp<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Sign Up</asp:LinkButton>&nbsp&nbsp&nbsp
                    <asp:LinkButton ID="LinkButton_changepass" runat="server" Font-Bold="True" Font-Underline="True" OnClick="LinkButton_changepass_Click" >Change Password</asp:LinkButton>
                </td>
            </tr>
        </table>
    </center>


</asp:Content>--%>

