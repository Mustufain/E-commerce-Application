<%@ Page Title="Log in" Language="C#" AutoEventWireup="true" CodeFile="Signin.aspx.cs" Inherits="Account_Login" Async="true" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
       <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title></title>
   <script src="Scripts/jquery.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.easing.min.js"></script>
    <script src="Scripts/scrolling-nav.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/scrolling-nav.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />

    

    
</head>
    <body  id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
        <form runat="server">
   <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">E-Commerce</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="../Home.aspx">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="../Home.aspx">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="../Home.aspx">Contact</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="viewquestions.aspx">Forum</a>
                    </li>
                    
                    <li>
                        <a class="page-scroll" href="Signup.aspx">Sign up</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
      
            <div class="container container-table">
                <div class="row vertical-center-row">
                     <div class="text-center col-md-4 col-md-offset-4" style="top:100px" >
    
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Please log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server"  CssClass=" col-md-2 control-label">User name</asp:Label>
                        <div class="col-md-10" >
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control"  />
                           
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server"  CssClass=" col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10" >
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                           
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div>
                            <asp:Button ID="Button1" runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" OnClientClick="return loginvalidate()" />
                        </div>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" ID="SignupHyperLink" ViewStateMode="Disabled">Signup</asp:HyperLink>
                    if you don't have an account.
                </p>
            </section>
       
                </div>
                    </div>
                </div>
            
            </form>
        </body>
   
    <script type="text/javascript">
        function loginvalidate()
        {

            var username = document.getElementById('<%=UserName.ClientID %>').value;
            var password = document.getElementById('<%=Password.ClientID %>').value;
            if(username == "" || password=="")
            {

                alert("please fill all the required fields");
                return false;
            }
            else
                return true;
        }



</script>
 </html>

