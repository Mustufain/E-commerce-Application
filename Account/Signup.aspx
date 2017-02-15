<%@ Page Title="Signup" Language="C#"  AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Account_Signup" %>

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
                        <a class="page-scroll" href="Signin.aspx">Sign in</a>
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
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="The user name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="firstname" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="firstname"  CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="firstname"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The firstname field is required." />
                
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="surname" CssClass="col-md-2 control-label">Sur Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="surname"  CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="surname"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The surname field is required." />
                
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="emailaddress" CssClass="col-md-2 control-label">Email Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="emailaddress"  CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="emailaddress"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The emailaddress field is required." />
                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="emailaddress" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="Button1" runat="server" OnClick="CreateUser_Click" Text="Signup" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
              </div>
                    </div>
    </div>
            </form>           
    </body>
</html>

