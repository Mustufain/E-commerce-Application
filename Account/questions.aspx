<%@ Page Language="C#" AutoEventWireup="true" CodeFile="questions.aspx.cs" Inherits="Account_Forum" %>



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
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/productlist.css" rel="stylesheet" />
    <style>
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
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
<body>
    <form id="form1" runat="server">
        
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
                        <a class="page-scroll" href="questions.aspx">Forum</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown">Product Categories</a>
                        <ul class="dropdown-content">
                                 
                                <li><a  id="All"  runat ="server" onserverclick="All_ServerClick">  All products </a></li> 
                                <li><a  id="A1"  runat ="server" onserverclick="A1_ServerClick">  Purchased products </a></li> 
                                <li><a  id="Rolex"  runat ="server" onserverclick="watch_ServerClick">  Rolex </a></li>
                                <li><a  runat="server" id="Tissot" onserverclick="handbag_ServerClick">  Tissot </a></li>
                                <li><a  runat="server" id="Omega" onserverclick="television_ServerClick">  Omega </a></li>

                </ul>                        
                    </li>
                      <li>
                        <a class="page-scroll" href="Products.aspx">Products</a>
                    </li>
                     <li><a href="Cart.aspx" runat="server" class="glyphicon glyphicon-shopping-cart white"></a> </li>
                    
                    <li>
                        <a class="page-scroll" href="../Home.aspx">Log out</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
            
 <div class="container" style="position:absolute; left: 452px; top: 77px; height: 518px;;margin-left: -15em""> 
    
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" style="margin-left: 60px;">
                <AlternatingItemTemplate>
                  <div class="content-box no-pad">
                

<table class="common-tbl common-tbl-threads">
    <thead>
        <tr class="bg-color">
            <th class="col1">Question</th>
            
        </tr>
    </thead>
    <tbody>
    
    <tr class="icon last-row">
        <td class="col1 icon-announcement "> <h2>'<%#  Eval("message") %>' </h2> 
        <p>Created by  '<%# Eval("username")%>'  on <%# Eval("Date") %></p> </td>
      
    </tr>
        <tr>
            <hr />

        </tr>
  
    </tbody>
    <tfoot>
        <asp:Button runat="server" ID="replies" Text="View Replies" OnClick="replies_Click" CommandArgument='<%#Eval("id") %>' CssClass="btn btn-success"/> 
    </tfoot>
</table>

            </div>
                </AlternatingItemTemplate>
               
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No Questions added.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
           
                <ItemTemplate>
                  <div class="content-box no-pad">
                

<table class="common-tbl common-tbl-threads">
    <thead>
        <tr class="bg-color">
            <th class="col1">Question</th>
           
        </tr>
    </thead>
    <tbody>
    
    <tr class="icon last-row">
        <td class="col1 icon-announcement "> <h2>'<%#  Eval("message") %>' </h2> 
        <p>Created by '<%# Eval("username")%>' on <%# Eval("Date") %></p> </td>
       
     
            
    </tr>
       

               
      
        <tr>
            <hr />

        </tr>
  
    </tbody>
    <tfoot>
        <asp:Button runat="server" ID="replies" Text="View Replies" OnClick="replies_Click" CommandArgument='<%#Eval("id") %>' CssClass="btn btn-success"/> 
    </tfoot>
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
                         <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
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
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                        </td>
                        <td>
                            <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1738044 %>" SelectCommand="
select forum.id,register.username,forum.message,forum.Date from register inner join forum on register.userid = forum.userid order by forum.Date DESC
"></asp:SqlDataSource>
     
        
    <div id="footer" style="position:relative;" >
   <asp:TextBox runat="server" ID="Post" CssClass="form-control" placeholder="Post a question"
     
    TextMode="multiline" Columns="70" Rows="10" style="margin-bottom:10px; margin-left:451px; margin-top: 985px;" Height="171px" />
                          

            
  
      <asp:Button Text="Post"   CssClass="btn btn-success" runat="server" OnClick="Unnamed_Click"/>
            

      </div> 


   </form>
</body>
</html>
