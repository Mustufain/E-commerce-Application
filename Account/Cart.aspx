<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Account_addtoCart" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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
                        <a class="page-scroll" href="../Home.aspx">Log out</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
            
      
        <div  class="container"  style="position:absolute;top: 50%;left: 50%;margin-top: -9em;margin-left: -15em">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="orderid">
            <AlternatingItemTemplate>
                <div style="position:absolute;left: 70%;margin-top: 5em;margin-left: 25em">
                        <asp:Button runat="server" class="btn btn-success btn-sm" OnClick="delete_Click" Text="Remove from Cart" style="float:right;margin-bottom:10px" CommandArgument='<%# Eval("orderid") %>' ></asp:Button>
                        <asp:Button runat="server" class="btn btn-success btn-sm" OnClick="Unnamed_Click" Text="Buy" style="float:right;margin-bottom:10px"  CommandArgument='<%# Eval("orderid") %>' ></asp:Button>       
                     <br />
                           
                            </div> 
               <table>

                            <tr>
                                <td>

                                    <asp:Image ID="image" runat="server"  ImageUrl='<%# Eval("productimage") %>' />
                                </td>
                               
                                 
                                   
                            </tr>
                            <tr>

                                <td>
                                    <asp:Label ID="name" runat="server" Text='<%# Eval("productname") %>' >
                                        
                                    </asp:Label>

                                </td>
                            </tr>
                         
                            <tr>
                                <td>
                                    <asp:Label ID="price" runat="server" Text='<%# Eval("productprice") %>' ></asp:Label>

                                </td>

                            </tr>

                        </table>

                
                      
            </AlternatingItemTemplate>
           
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td><strong> Shopping Cart Is Empty!</strong></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                 <div style="position:absolute;left: 70%;margin-top: 5em;margin-left: 25em">
                        <asp:Button runat="server" class="btn btn-success btn-sm" OnClick="delete_Click" Text="Remove from Cart" style="float:right;margin-bottom:10px" CommandArgument='<%# Eval("orderid") %>' ></asp:Button>
                      <asp:Button runat="server" class="btn btn-success btn-sm" OnClick="Unnamed_Click" Text="Buy" style="float:right;margin-bottom:10px" CommandArgument='<%# Eval("orderid") %>' ></asp:Button>
                            <br />
                           
                            </div> 
               <table>

                            <tr>
                                <td>

                                    <asp:Image ID="image" runat="server"  ImageUrl='<%# Eval("productimage") %>' />
                                </td>
                               
                                 
                                   
                            </tr>
                            <tr>

                                <td>
                                    <asp:Label ID="name" runat="server" Text='<%# Eval("productname") %>' >
                                        
                                    </asp:Label>

                                </td>
                            </tr>
                           
                            <tr>
                                <td>
                                    <asp:Label ID="price" runat="server" Text='<%# Eval("productprice") %>' ></asp:Label>

                                </td>

                            </tr>

                        </table>

                      
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
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="productnameLabel" runat="server" Text='<%# Eval("productname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productpriceLabel" runat="server" Text='<%# Eval("productprice") %>' />
                    </td>
                    <td>
                        <asp:image ID="productimageLabel" runat="server" ImageUrl='<%# Eval("productimage") %>' />
                    </td>
                    <td>
                        <asp:Button runat="server" ID="delete" CommandArgument='<%#Eval("orderid") %>' Text="Remove from Cart" OnClick="delete_Click"/>
                    </td>
                
                </tr>
            </SelectedItemTemplate>
            
        </asp:ListView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1738044 %>" SelectCommand="viewCart" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
