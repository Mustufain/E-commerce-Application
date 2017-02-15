<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminViewProducts.aspx.cs" Inherits="Account_ViewProducts" %>

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
                        <a class="page-scroll" href="adminprod.aspx">Add Products</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="questions.aspx">Forum</a>
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
    <div style="margin-top:100px">
  
  
    
        <asp:ListView ID="ListView1"  runat="server" DataKeyNames="productid" DataSourceID="SqlDataSource1"  OnItemUpdating="ListView1_ItemUpdating">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                       
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="productidLabel" runat="server" Text='<%# Eval("productid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productnameLabel" runat="server" Text='<%# Eval("productname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productdescLabel" runat="server" Text='<%# Eval("productdesc") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productpriceLabel" runat="server" Text='<%# Eval("productprice") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productcategLabel" runat="server" Text='<%# Eval("productcateg") %>' />
                    </td>
                    <td>
                        <asp:Image ID="productimageLabel" runat="server" ImageUrl='<%# Eval("productimage") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td> 
                        <asp:Button ID="UpdateButton" runat="server" Text="Update" CommandName="Update"  />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                   
                    <td>
                        <asp:Label ID="productidLabel1" runat="server" Text='<%# Eval("productid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="productnameTextBox" runat="server" Text='<%# Bind("productname") %>'  />
                    </td>
                    <td>
                        <asp:TextBox ID="productdescTextBox" runat="server" Text='<%# Bind("productdesc") %>'  />
                    </td>
                    <td>

                        <asp:TextBox runat="server" ID="productpriceTextBox" Text='<%# Bind("productprice") %>'>  </asp:TextBox>

                    </td>
                    <td>
                       <asp:DropDownList SelectedValue='<%# Bind("productcateg") %>' runat="server" ID="dropdownlist" style="overflow:auto" CssClass="dropdown">
                                 <asp:ListItem Enabled="true" Text="Select Category" Value="-1"></asp:ListItem>
                                 <asp:ListItem Text="Rolex" Value="Rolex">  </asp:ListItem>
                                <asp:ListItem Text="Tissot" Value="Tissot"></asp:ListItem>
                                <asp:ListItem Text="Omega" Value="Omega"></asp:ListItem>
    </asp:DropDownList>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload2"  runat="server" />
                        <asp:Label ID="fileuploadvalidate" runat="server" ></asp:Label>
                        
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No products added.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
        
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                     
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="productidLabel" runat="server" Text='<%# Eval("productid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productnameLabel" runat="server" Text='<%# Eval("productname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productdescLabel" runat="server" Text='<%# Eval("productdesc") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productpriceLabel" runat="server" Text='<%# Eval("productprice") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productcategLabel" runat="server" Text='<%# Eval("productcateg") %>' />
                    </td>
                    <td>
                        <asp:Image ID="productimageLabel" runat="server" ImageUrl='<%# Eval("productimage") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server"></th>
                                    <th runat="server">productid</th>
                                    <th runat="server">productname</th>
                                    <th runat="server">productdesc</th>
                                    <th runat="server">productprice</th>
                                    <th runat="server">productcateg</th>
                                    <th runat="server">productimage</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="productidLabel" runat="server" Text='<%# Eval("productid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productnameLabel" runat="server" Text='<%# Eval("productname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productdescLabel" runat="server" Text='<%# Eval("productdesc") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productpriceLabel" runat="server" Text='<%# Eval("productprice") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productcategLabel" runat="server" Text='<%# Eval("productcateg") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productimageLabel" runat="server" Text='<%# Eval("productimage") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$  ConnectionStrings:1738044 %>" SelectCommand="SELECT [productid], [productname], [productdesc], [productprice], [productcateg], [productimage] FROM [products]" UpdateCommand="UPDATE [products] SET [productname] = @productname, [productdesc] = @productdesc, [productprice] = @productprice,[productcateg]=@productcateg,[productimage] = @productimage WHERE [productid] = @productid">
           
            <UpdateParameters>
                <asp:Parameter Name="productname" Type="String" />
                <asp:Parameter Name="productdesc" Type="String" />
                <asp:Parameter Name="productprice" Type="String" />
                <asp:Parameter Name="productid" />
                
            </UpdateParameters>
        </asp:SqlDataSource>
            <footer>
                <p>&copy; <%: DateTime.Now.Year %> - My ASP.NET Application</p>
            </footer>
    </form>
  <!--  <script>
        function fileuploadvalidate()
        {
           
         var fileupload = document.getElementById('').value;
            if(fileupload==' ')
            {
                alert("please choose an image");
                return false;
            }
        }

    </script>-->
</body>
    
</html>
