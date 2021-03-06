﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewanswers.aspx.cs" Inherits="Account_threadwithoutlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    
   <script src="Scripts/jquery.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.easing.min.js"></script>
    <script src="Scripts/scrolling-nav.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/scrolling-nav.css" rel="stylesheet" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />

     <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <style type="text/css">
        .btn-success {
            margin-left: 550px;
        }
        #TextArea1 {
            width: 435px;
            height: 101px;
        }
    </style>
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
                        <a class="page-scroll" href="../Home.aspx"></a>
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
                    
                    <li>
                        <a class="page-scroll" href="Signup.aspx">Sign up</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div style="top:100px">
        <div class="container" style="position:absolute; left: 452px; top: 77px; height: 518px;;margin-left: -15em"> 
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="threadid" DataSourceID="SqlDataSource1" style="margin-left: 70px;" >
            <AlternatingItemTemplate>
                <div class="content-box no-pad">
                

<table class="common-tbl common-tbl-threads">
                 <thead>
        <tr class="bg-color">
            <th class="col1">Answer</th>
            
        </tr>
    </thead>
    <tbody>
    
    <tr class="icon last-row">
        <td class="col1 icon-announcement "> <h2>'<%#  Eval("answer") %>' </h2> 
        <p>Answered by  '<%# Eval("username")%>'  on <%# Eval("Date") %></p> </td>
      
    </tr>
        <tr>
            <hr />

        </tr>
  
    </tbody>
   
</table>

            </div>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No New Threads.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <div class="content-box no-pad">
                

<table class="common-tbl common-tbl-threads">
                     <thead>
        <tr class="bg-color">
            <th class="col1">Answer</th>
            
        </tr>
    </thead>
    <tbody>
    
    <tr class="icon last-row">
        <td class="col1 icon-announcement "> <h2>'<%#  Eval("answer") %>' </h2> 
        <p>Answered by  '<%# Eval("username")%>'  on <%# Eval("Date") %></p> </td>
      
    </tr>
        <tr>
            <hr />

        </tr>
  
    </tbody>
   
</table>

            </div>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server"></th>
                                    <th runat="server"></th>
                                    <th runat="server"></th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style=""></td>
                    </tr>
                      
                    </tr>
                      <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager2" runat="server" PageSize="5">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="threadidLabel" runat="server" Text='<%# Eval("threadid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="answerLabel" runat="server" Text='<%# Eval("answer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>

            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1738044 %>" SelectCommand="select register.username,Thread.threadid,Thread.answer,Thread.Date from Thread inner join Forum on Thread.id=Forum.id inner join register on thread.userid=register.userid where Thread.id=@id order by Thread.Date DESC">
             <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="forumid" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
     </div>
    </form>
</body>
</html>
