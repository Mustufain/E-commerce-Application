using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using WebSite4;

public partial class Account_Login : Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["1738044"].ConnectionString);   //connction with database
    SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {    


        }

        protected void LogIn(object sender, EventArgs e)  //check wether Signuped or not 
        {
            var check="";
            var userid = "";
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Signin";                                  //Name of stored Procedure 
            cmd.Parameters.AddWithValue("@UserName", UserName.Text);   //input param
            cmd.Parameters.AddWithValue("@pass", Password.Text);   //input param
            cmd.Parameters.Add("@returnuser", SqlDbType.NVarChar,200);
            cmd.Parameters.Add("@userid", SqlDbType.Int);               //userid
            cmd.Parameters["@returnuser"].Direction = ParameterDirection.Output;
            cmd.Parameters["@userid"].Direction = ParameterDirection.Output;
          
            try
            {
                cmd.ExecuteNonQuery();
                check = cmd.Parameters["@returnuser"].Value.ToString();           //Value of output parameter when user logged In
                userid = cmd.Parameters["@userid"].Value.ToString();
                if(UserName.Text=="admin" && Password.Text=="admin")                           //if admin logs in
                {
                    Session["userid"] = userid;
                    Session["username"] = UserName.Text;
                    Response.Redirect("adminprod.aspx");
                  
                }

                else if (UserName.Text != "admin" && check == UserName.Text)  //if normal user logs in
                {
                    Session["userid"] = userid;
                    Session["username"] = UserName.Text;
                    
                    Response.Redirect("Products.aspx");
                
                }
            }
            catch (SqlException ex)
            {

                Console.WriteLine(ex.Message.ToString());
            }
       
            UserName.Text = "";
            Password.Text = "";
            con.Close();
            
        }
}