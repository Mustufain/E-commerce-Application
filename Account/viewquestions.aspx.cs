using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_forumwithoutlogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["1738044"].ConnectionString);   //connction with database
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    


    }
    protected void replies_Click(object sender, EventArgs e)   //Get forum id
    {
        Button button = (sender as Button);

        //Get the forumid
        string id = button.CommandArgument;
        int forumid = Convert.ToInt32(id);
        Session["forumid"] = forumid;
        Response.Redirect("threadwithoutlogin.aspx");

    }
}