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

public partial class Account_ViewProducts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["1738044"].ConnectionString);   //connction with database
    SqlCommand cmd;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        DropDownList dropdownlist = ListView1.Items[e.ItemIndex].FindControl("dropdownlist") as DropDownList;
        string category = dropdownlist.SelectedValue;
        FileUpload fileUpload1 = ListView1.Items[e.ItemIndex].FindControl("FileUpload2") as FileUpload;
        if (fileUpload1.HasFile)
        {

            System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(fileUpload1.FileContent);
            System.Drawing.Image objImage = ScaleImage(bmpPostedImage, 200);

            var stream = new System.IO.MemoryStream();
            objImage.Save(stream, ImageFormat.Png);
            stream.Position = 0;

            BinaryReader br = new BinaryReader(stream);
            byte[] imagebytes = br.ReadBytes((Int32)stream.Length);
            string base64String = Convert.ToBase64String(imagebytes, 0, imagebytes.Length);
            string url = "data:image/png;base64," + base64String;

            e.NewValues.Add("productimage", url);
        } // if File is not choosen on update retrieve the previous image
        else
        {
            Label fileuploadlabel = ListView1.Items[e.ItemIndex].FindControl("fileuploadvalidate") as Label;
            Label productid = ListView1.Items[e.ItemIndex].FindControl("productidLabel1") as Label;
            fileuploadlabel.Text = "Please choose an image";
            con.Open();
            cmd = new SqlCommand("select productimage from products where productid =" + productid.Text, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                e.NewValues.Add("productimage", dr["productimage"]);
            }
            con.Close();
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