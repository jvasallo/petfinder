using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder {
    public partial class register : System.Web.UI.Page {
        SqlConnection conn = new SqlConnection("Server=cdmcoursedb.cstcis.cti.depaul.edu;uid=jvasallo;pwd=;database=jvasallo");

        // if users navigate to register button somehow after logged in, redirect to myaccount
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["loggedin"] != null) {
                Response.Redirect("account.aspx");
            }
        }

        string getEncryptedPassword(string pw) {
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
            string b64 = Convert.ToBase64String(hash);
            return b64;
        }

        protected void Page_Login(object sender, EventArgs e) {
            if (!Page.IsPostBack) {
                txtNewShelterName.Text = "";
                txtNewEmailAddress.Text = "";
                txtNewUserName.Text = "";
                lblNoShelterName.Text = "";
                lblNoEmail.Text = "";
                lblNoName.Text = "";
                litMessage.Text = "";
            }
        }

        protected void btnRegister_Click(object source, EventArgs e) {
            string shelterName = txtNewShelterName.Text;
            string email = txtNewEmailAddress.Text;
            // creating a regex to determine users enter a real email.
            Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            string userName = txtNewUserName.Text;
            string passwordString = txtNewPassword.Text;
            string verifyPassword = txtVerifyPassword.Text;
            string b64 = getEncryptedPassword(passwordString);

            SqlDataReader myReader;
            

            // tries its hand at openning the connection via the credentials provided
            try {
                conn.Open();
            }
            catch (Exception) {
                litMessage.Text = "Registration is currently not working. Apologies.";
            }

            // selecting the record from our "shelter" table which contains account information for specific username (which should be unique)...
            string strSelect = "SELECT * FROM Shelters";
            strSelect += string.Format(" WHERE username = @username");
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
            cmdSelect.Parameters.AddWithValue("@username", txtNewUserName.Text);
            myReader = cmdSelect.ExecuteReader();

            lblNoShelterName.Text = "";
            lblNoEmail.Text = "";
            lblNoName.Text = "";
            lblNoPass.Text = "";

            // check to see if user entered username
            if (shelterName == "") {
                lblNoShelterName.Text = "Please enter a shelter name.";
                return;
            }

            // check to see if user entered a valid email address
            Match match = regex.Match(email);
            if (!match.Success) {
                lblNoEmail.Text = "Please enter a valid email address.";
                return;
            }    
   
            // check to see if user entered username
            if (userName == "") {
                lblNoName.Text = "Please enter a username.";
                return;
            }

            // check to see if username is taken.
            while (myReader.Read())
            {
                if (myReader["username"].ToString() == txtNewUserName.Text)
                {
                    lblNoName.Text = "Username taken. Please select another.";
                    return;
                }
            }
            // always gracefully close the connection or else it can cause problems down the line.
            myReader.Close();

            // check to see if the user provided a password
            if (verifyPassword == "") {
                lblNoPass.Text = "Please enter a password.";
                return;
            }

            // if we got here all is good, and begin storing the DB
            string strInsert = "INSERT INTO Shelters (username, password, email, shelter)";
            strInsert += string.Format(" VALUES (@username,@password,@email,@shelter)");
            SqlCommand cmdInsert = new SqlCommand(strInsert, conn);
            cmdInsert.Parameters.AddWithValue("@username", userName);
            cmdInsert.Parameters.AddWithValue("@password", b64);
            cmdInsert.Parameters.AddWithValue("@email", email);
            cmdInsert.Parameters.AddWithValue("@shelter", shelterName);

            // we try to insert, if we fail we catch the exception and display user friendly error.
            try {
                cmdInsert.ExecuteNonQuery();
                Session["loggedin"] = true;
                Session["UserName"] = userName;
                Response.Redirect("account.aspx");
            }
            catch (Exception) {
                litMessage.Text = "Error Creating Account! Please contact Administrator.";
            }
        }
    }
}