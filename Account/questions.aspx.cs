using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Forum : System.Web.UI.Page
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
    protected void Unnamed_Click(object sender, EventArgs e)  //Post Question
    {
        string message = Post.Text;                              //question
        int userid = Int32.Parse(Session["userid"].ToString());   //username
        string date = DateTime.Now.ToString();                   //date
      
        String query = "Insert into Forum values('" + userid + "','" + message + "','" + date + "')";

        cmd = new SqlCommand(query,con);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch(SqlException )
        {


        }
        ListView1.DataBind();
        
        Post.Text = "";
      
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
    protected void All_ServerClick(object sender, EventArgs e)  //All products could be seen
    {
        Response.Redirect("Products.aspx");

    }
    protected void replies_Click(object sender, EventArgs e)   //Get forum id
    {
        Button button = (sender as Button);

        //Get the forumid
        string id = button.CommandArgument;
        int forumid = Convert.ToInt32(id);
        Session["forumid"] = forumid;
        Session["question"] = Post.Text;
        con.Open();
        string query = "select Date from Forum where id=" + forumid;
        cmd= new SqlCommand(query,con);
        try
        {
           SqlDataReader reader = cmd.ExecuteReader();
           Session["date"] = reader.ToString(); 
           con.Close();
        }
        catch(SqlException)
        {

        }
       
        Response.Redirect("answers.aspx");

    }
    protected void A1_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("buy.aspx");
    }
}