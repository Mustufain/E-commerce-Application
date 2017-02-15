using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_threads : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["1738044"].ConnectionString);   //connction with database
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("Login.aspx");

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
   
 
    protected void Unnamed_Click(object sender, EventArgs e) // Reply 
    {
        string message = Reply.Text;                                   //answer
        int userid = Int32.Parse(Session["userid"].ToString());       //username
        string date = DateTime.Now.ToString();                        //date
        int forumid = Int32.Parse(Session["forumid"].ToString());
        String query = "Insert into Thread values('" + forumid + "','" + message + "','" + date + "','" + userid + "')";
        cmd = new SqlCommand(query,con);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


        }
        catch(SqlException)
        {

        }
        ListView1.DataBind();
        Reply.Text="";

    }
    protected void A1_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("buy.aspx");
    }
    protected void All_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");
    }
}