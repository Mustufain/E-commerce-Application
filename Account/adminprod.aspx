<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="adminprod.aspx.cs" Inherits="Account_adminproduct" Async="true" %>


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
        <div style="top:100px">
    
  <div style=" display: inline-block; width: 100%;">

        <div style=" float: left;margin-top:100px">
       
     <div class="form-group" >
                        <asp:Label ID="Label1" runat="server"  CssClass="col-md-2 control-label">Product name</asp:Label>
           
           
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="ProductName" CssClass="form-control" style="margin-bottom:10px"/>
                                                </div>

                    </div>
        
         <div class="form-group" >
                        <asp:Label ID="Label2" runat="server"  CssClass="col-md-2 control-label">Product Description</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="ProductDesc" CssClass="form-control"  TextMode="multiline" Columns="50" Rows="5" style="margin-bottom:10px" />
                          
                        </div>
             </div>
                
              <div class="form-group">
                        <asp:Label ID="Label3" runat="server"  CssClass="col-md-2 control-label">Product Price</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="ProductPrice" CssClass="form-control" style="margin-bottom:10px" />
                           
                  </div>
                  </div>
                   <div class="form-group">
                        <asp:Label ID="Label4" runat="server"  CssClass="col-md-2 control-label">Product Category</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList runat="server" ID="dropdownlist" style="overflow:auto" CssClass="dropdown">
                                 <asp:ListItem Enabled="true" Text="Select Category" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Rolex" Value="Rolex">  </asp:ListItem>
                                <asp:ListItem Text="Tissot" Value="Tissot"></asp:ListItem>
                                <asp:ListItem Text="Omega" Value="Omega"></asp:ListItem>
                                
    </asp:DropDownList>
                            <!--<asp:TextBox runat="server" ID="ProductCateg" CssClass="form-control" style="margin-bottom:10px"/> -->
                           
                        </div>
                                            </div>
    
                 <div>
                      <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <table>
                            <tr>
      
        <td> 
        <asp:TextBox ID="TextBox2" runat="server"  />
        </td>
        <td>
        <td> 
    
        </td>
        <td>
        <asp:FileUpload ID="FileUpload2" runat="server"  />
        </td>
              </td>
        </tr>
                       </table>
                                 </div>
             
                    </div>
                     <table><tr><td></td><td><p><asp:Label ID="Label5" runat="server" Text="Choose Image"></asp:Label>  </p></td></tr></table>
    </div>
            <div>
                              
         <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                               <asp:Button runat="server" ID="btnupload" OnClick="btnupload_Click" Text="Upload" />
                              <asp:Button ID="Button1" runat="server" OnClick="addproduct" Text="Add Product" CssClass="btn btn-default" OnClientClick="return Validate()"/>

                               <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="View Products" CssClass="btn btn-default"  />
                        </div>
             
                    </div>
                         
    </div>
            </div>


     <div style="float:right;margin-top:50px">

            <asp:Panel runat="server" ID="panel1" Visible="false">
                <asp:Image ID="image1" runat="server"/>
                <br />

               
                <asp:Button ID="btncancel" runat="server" Text="Cancel" OnClick="btncancel_Click"/>


           </asp:Panel>
         </div>
    </div>
            </div>
            </form>
    </body>
    <script type="text/javascript">
        function Validate() {
            
            var name = document.getElementById('<%= ProductName.ClientID %>').value;
            var fileupload = document.getElementById('<%= FileUpload2.ClientID %>').value;
            var panel = document.getElementById('<%= panel1.ClientID %>').value;
            var desc = document.getElementById('<%= ProductDesc.ClientID %>').value;
            var price = document.getElementById('<%= ProductPrice.ClientID %>').value;
            var categ = document.getElementById('<%= ProductCateg.ClientID %>').value;
            if (name == "" || desc == "" || price == "" || categ == "") {

                alert('Please fill all the required fields');
                return false;

            }

            else if (fileupload == "")
            {
                alert('Please choose an image');
                return false;
            }

            else if(panel == "")
            {
                alert('Please upload an image');
                return false;
            }

            else
                return true;


        }
</script>
</html>

