using Microsoft.AspNet.Identity;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using WebSite4;

public partial class Account_Signup : Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["1738044"].ConnectionString);   //connction with database
    SqlCommand cmd;
    protected void CreateUser_Click(object sender, EventArgs e)  //here the user creates an account
    {
        try 
        { 

        con.Open();
        cmd = new SqlCommand("Insert into register values('" + UserName.Text + "','" + Password.Text + "','" + firstname.Text + "','" + surname.Text + "','" + emailaddress.Text + "')", con);
        cmd.ExecuteNonQuery();
        UserName.Text = "";
        Password.Text = "";
        firstname.Text = "";
        surname.Text = "";
        emailaddress.Text="";
        con.Close();
           
        }
        catch(SqlException )
        {


        }

    }
}