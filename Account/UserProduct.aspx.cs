using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_userviewproduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["1738044"].ConnectionString);   //connction with database
    SqlCommand cmd;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");

        }
        else
        {
            con.Open();
            cmd = new SqlCommand(("select productname,productdesc,productprice,productimage from products where productid=" + Session["productid"]), con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string productname = (string)dr["productname"];
                string productdesc = (string)dr["productdesc"];
                string productprice = (string)dr["productprice"];
                string productimage = (string)dr["productimage"];
                name.Text = "Name:" + productname;
                desc.Text = "Description:" + productdesc;
                price.Text = "Price:" + productprice;
                image.ImageUrl = productimage;
            }

            con.Close();
        }
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
    protected void Unnamed_Click(object sender, EventArgs e)   //View Product
    {
        Response.Redirect("product.aspx");

    }
    protected void All_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");

    }
    protected void Unnamed_Click1(object sender, EventArgs e)  //Add To Cart
    {


                con.Open();
                cmd = new SqlCommand("Insert into user_product_junction values('" + Session["userid"] + "','" + Session["productid"] + "','" + 0 + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
         }

    protected void Unnamed_Click2(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("buy.aspx");
    }
    protected void A1_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("buy.aspx");
    }
}
