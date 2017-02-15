using CodeCarvings.Piczard;
using ImageResizer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_adminproduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["1738044"].ConnectionString);   //connction with database
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["Image"] = null;
        }

    }
    protected void addproduct(object sender, EventArgs e)    //add products to database
    {

           string category= dropdownlist.SelectedValue;

           if (category != "-1" && panel1.Visible)       //If item is selected
           {
               con.Open();
               cmd = new SqlCommand("Insert into products values('" + ProductName.Text + "','" + ProductDesc.Text + "','" + ProductPrice.Text + "','" + category + "','" + Session["url"].ToString() + "')", con);
               cmd.ExecuteNonQuery();
               ProductName.Text = "";
               ProductCateg.Text = "";
               ProductDesc.Text = "";
               ProductPrice.Text = "";
               panel1.Visible = false;
               con.Close();
           }
           else
               Response.Write("Please upload file for item to be added successfully");
        }
        

    
    //View products
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminViewProducts.aspx");
    }
   
    //Cancel Image
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }
    // Upload Image resizing image

    protected void btnupload_Click(object sender, EventArgs e)   
    {
        if (FileUpload2.HasFile)
        {
            System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(FileUpload2.PostedFile.InputStream);
            System.Drawing.Image objImage = ScaleImage(bmpPostedImage, 200);



            var stream = new System.IO.MemoryStream();
            objImage.Save(stream, ImageFormat.Png);
            stream.Position = 0;

            BinaryReader br = new BinaryReader(stream);
            byte[] imagebytes = br.ReadBytes((Int32)stream.Length);
            string base64String = Convert.ToBase64String(imagebytes, 0, imagebytes.Length);
            string url = "data:image/png;base64," + base64String;
            Session["url"] = url;
            image1.ImageUrl = url;
            panel1.Visible = true;
        }
        else
        {

            Response.Redirect("adminprod.aspx");
        }
        
    }
    public static System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxHeight)   //Image Resize
    {
        var ratio = (double)maxHeight / image.Height;

        var newWidth = (int)(image.Width * ratio);
        var newHeight = (int)(image.Height * ratio);

        var newImage = new Bitmap(newWidth, newHeight);
        using (var g = Graphics.FromImage(newImage))
        {
            g.DrawImage(image, 0, 0, newWidth, newHeight);
        }
        return newImage;
    }
}