using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder {
    public partial class login : System.Web.UI.Page {
        SqlConnection conn = new SqlConnection("Server=cdmcoursedb.cstcis.cti.depaul.edu;uid=jvasallo;pwd=;database=jvasallo");
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
            SqlDataReader myReader;       
            conn.Open();

            // selecting the record from our "shelter" table which contains account information for specific username (which should be unique)...
            string strSelect = "SELECT * FROM Shelters";
            strSelect += string.Format(" WHERE username = @username");
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
            cmdSelect.Parameters.AddWithValue("@username", txtUserName.Text);
            myReader = cmdSelect.ExecuteReader(CommandBehavior.CloseConnection);

            while (myReader.Read()) {
                if (myReader["username"].ToString() == txtUserName.Text)
                {
                    string b64 = getEncryptedPassword(txtPassword.Text);
                    if (myReader["password"].ToString() == b64) {
                        Session["loggedin"] = true;
                        Session["UserName"] = txtUserName.Text;
                        Response.Redirect("account.aspx", false);
                    }
                }
            }
            myReader.Close();
            conn.Close();
            litMessage.Text = "Login not successful.  Please try again.";
        }

        string getEncryptedPassword(string pw) {
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
            string b64 = Convert.ToBase64String(hash);
            return b64;
        }

    }
}