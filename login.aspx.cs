using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder {
    public partial class login : System.Web.UI.Page {

        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack)
            {
                txtUserName.Text = "";
                litMessage.Text = "";
                if (Session["loggedin"] != null) {
                    Response.Redirect("account.aspx");
                }
            }
        }
      
        protected void btnLogin_Click(object sender, EventArgs e) { 
            string b64 = UserNameAndEncryptedPassword();
            string line = "";
            string pathname = Server.MapPath("passwords.txt"); //~/Database/passwords.txt
            StreamReader sr = new StreamReader (pathname);
            while(sr.Peek( ) > -1) {
                line = sr.ReadLine( );
                if (line == b64) {
                    sr.Close( );
                    Session["loggedin"] = true;
                    Response.Redirect("account.aspx");
                }
            }
            sr.Close( );
            litMessage.Text = "Login not successful.  Please try again.";
        }

        string UserNameAndEncryptedPassword() {
            // retrieve username
            string userName = txtUserName.Text;
            // retrieve password
            string pw = txtPassword.Text;
            // here is the secret word
            string keyString = "My_53cr3t_K3y";
            // prepare secret word for encryption work
            byte[] key = Encoding.ASCII.GetBytes(keyString.ToCharArray( ));
            // prepare password for encryption         
            byte[] password = Encoding.ASCII.GetBytes(pw.ToCharArray());
            // set up the encryption object, using secret word
            HMACSHA1 hmac = new HMACSHA1(key);
            // compute encryted password
            byte[] hash = hmac.ComputeHash(password);
            // and reformat it as a string.
            string b64 = userName + ";" + Convert.ToBase64String(hash);
            return b64;
        }

    }
}