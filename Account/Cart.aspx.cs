using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_addtoCart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["1738044"].ConnectionString);   //connction with database
    SqlCommand cmd;
    SqlCommand cmd1;
    SqlDataReader rdr = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");

        }


    }
   

    protected void delete_Click(object sender, EventArgs e)   //delete product from cart
    {
        Button button = (sender as Button);
        //Get the orderid
        string orderid = button.CommandArgument;
        int orderid1 = Convert.ToInt32(orderid);
        Session["orderidtodelete"] = orderid1;
        string query = "delete from user_product_junction where userid=" + Session["userid"] + "and orderid=" + Session["orderidtodelete"];
        con.Open();
        cmd = new SqlCommand(query,con);
        cmd.ExecuteNonQuery();
        con.Close();
        ListView1.DataBind();

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
        Response.Redirect("ProductCategory.aspx");

    }
    protected void Unnamed_Click(object sender, EventArgs e)   //Buy product
    {
          Button button = (sender as Button);
        //Get the orderid
        string orderid = button.CommandArgument;
        int orderid1 = Convert.ToInt32(orderid);
        Session["orderid"] = orderid1;

        con.Open();
        string purcahse = "select productid from user_product_junction where orderid=" + orderid;
        string query = "UPDATE user_product_junction set buy=1 where orderid="+ orderid1;
        cmd = new SqlCommand(query,con);
        cmd1 = new SqlCommand(purcahse,con);
        cmd.ExecuteNonQuery();
        rdr = cmd1.ExecuteReader();
        while(rdr.Read())
        {
            Session["productidtobuy"] = rdr["productid"];
        }
        con.Close();
        ListView1.DataBind();

  
    }
    protected void A1_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("buy.aspx");
    }
}