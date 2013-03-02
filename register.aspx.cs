using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder {
    public partial class register : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["loggedin"] != null) {
                Response.Redirect("account.aspx");
            }
        }

        string UserNameAndEncryptedPassword(string userName, string pw) {
            // here is the secret word
            string keyString = "My_53cr3t_K3y";
            // prepare secret word for encryption work
            byte[] key = Encoding.ASCII.GetBytes(keyString.ToCharArray());
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

        protected void Page_Login(object sender, EventArgs e) {
            if (!Page.IsPostBack) {
                txtNewUserName.Text = "";
                lblNoName.Text = "";
                litMessage.Text = "";
            }
        }

        protected void btnRegister_Click(object source, EventArgs e) {
            string userName = txtNewUserName.Text;
            string passwordString = txtNewPassword.Text;
            string verifyPassword = txtVerifyPassword.Text;
            string b64 = UserNameAndEncryptedPassword(userName, passwordString);
            string path = Server.MapPath("passwords.txt"); //~/Database/passwords.txt

            lblNoName.Text = "";
            lblNoPass.Text = "";

            // check to see if user entered username
            if (userName == "") {
                lblNoName.Text = "Please enter a username.";
                return;
            }

            // check to see if username is taken.
            StreamReader sr = new StreamReader (path);
            string line = "";
            while(sr.Peek( ) > -1) {
                line = sr.ReadLine( );
                if (line.Split(';')[0] == b64.Split(';')[0]) {
                    sr.Close( );
                    lblNoName.Text = "Username taken. Please select another.";
                    return;       
                }
            }
            sr.Close();

            // check to see if the user provided a password
            if (verifyPassword == "") {
                lblNoPass.Text = "Please enter a password.";
                return;
            }

            // if we got here all is good, and begin storing the user;password
            FileStream fs = new FileStream(path, FileMode.Append, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            sw.WriteLine(b64);
            sw.Close();

            Session["loggedin"] = true;
            Response.Redirect("account.aspx");
        }
    }
}