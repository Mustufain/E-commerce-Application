using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");

        }


    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        //Get the reference of the clicked button.
           Button button = (sender as Button);
 
         //Get the productid
             string productid = button.CommandArgument;
             int productid1 = Convert.ToInt32(productid);
             Session["productid"] = productid1;
             Response.Redirect("UserProduct.aspx");
     
    }
    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        //Get the reference of the clicked button.
           Button button = (sender as Button);
 
         //Get the productid
             string productid = button.CommandArgument;
             int productid1 = Convert.ToInt32(productid);
             Session["productid"] = productid1;
             Response.Redirect("UserProduct.aspx");
     
    }
    protected void watch_ServerClick(object sender, EventArgs e)
    {
        Session["category"] = Rolex.ID;
        Response.Redirect("ProductCategory.aspx");


    }
    protected void handbag_ServerClick(object sender, EventArgs e)
    {
        Session["category"] = Tissot.ID;
        Response.Redirect("ProductCategory.aspx");

    }
    protected void television_ServerClick(object sender, EventArgs e)
    {
        Session["category"] = Omega.ID;
        Response.Redirect("ProductCategory.aspx");

    }
    protected void All_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");

    }
    protected void A1_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("buy.aspx");
    }
}