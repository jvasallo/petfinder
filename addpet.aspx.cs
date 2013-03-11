using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder {
    public partial class addpet : System.Web.UI.Page {
        SqlConnection conn = new SqlConnection("Server=cdmcoursedb.cstcis.cti.depaul.edu;uid=jvasallo;pwd=;database=jvasallo");

        protected void Page_Load(object sender, EventArgs e) {
            if (Session["loggedin"] == null) {
                Response.Redirect("login.aspx");
            }
            if (!this.IsPostBack) {
                FillCategoryList();
            }
        }

        private void FillCategoryList() {
            lstCategory.Items.Clear();
            string selectSQL = "SELECT CategoryID, CategoryName FROM Categories";
            SqlCommand cmd = new SqlCommand(selectSQL, conn);
            SqlDataReader myReader;

            try
            {
                conn.Open();
                myReader = cmd.ExecuteReader();
                while (myReader.Read())
                {
                    ListItem newItem = new ListItem();
                    newItem.Text = myReader["CategoryName"].ToString();
                    newItem.Value = myReader["CategoryID"].ToString();
                    lstCategory.Items.Add(newItem);
                }
                myReader.Close();
            }
            catch (Exception)
            {
                litMessage.Text = "Error reading list of categories. ";
            }
            finally
            {
                conn.Close();
            }
        }

        public void btnLogout_Click(object sender, EventArgs e) {
            Session["loggedin"] = null;
            Session["UserName"] = null;
            Response.Redirect("default.aspx");
        }

        int getShelterID(string shelterName)
        {
            int shelterID = 0;
            // sql commands to access shelters register to get shelterID
            SqlDataReader myReader;
            String strSelect = "SELECT * FROM Shelters";
            strSelect += string.Format(" WHERE username = @username");
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
            cmdSelect.Parameters.AddWithValue("@username", shelterName);
                        // check to get ShelterID from Shelter table.
            try
            {
                conn.Open();
                myReader = cmdSelect.ExecuteReader();
                while (myReader.Read()) {
                    if (myReader["username"].ToString() == shelterName) {
                        shelterID = Convert.ToInt32(myReader["ShelterID"]);
                    }
                    myReader.Close();
                }
            }
            catch (Exception)
            {
                //litMessage.Text = "Unable to verify account! Please contact administrator!";
            }
            return shelterID;
        }

        protected void btnAddPet_Click(object sender, EventArgs e) {
            string petname = txtNewPetName.Text;
            string strAge = txtNewPetAge.Text;
            char sex = Convert.ToChar(txtNewPetSex.SelectedValue);
            int age = 0;
            string description = txtNewPetDescription.Text;
            string shelterName = null;
            if (Session["UserName"] != null) {
                shelterName = Session["UserName"].ToString();
            }
            int shelterID = getShelterID(shelterName);

            int categoryID = Convert.ToInt32(lstCategory.SelectedValue);

            lblNoPetName.Text = "";
            lblNoPetAge.Text = "";
            lblNoPetDescription.Text = "";

            // check to see if user entered pet name
            if (petname == "") {
                lblNoPetName.Text = "Please enter a pet name!";
                return;
            }

            // check to see if user selected a pet sex
            if (sex == 'N') {
                lblNoPetSex.Text = "Please select Male or Female!";
                return;
            }

            // check to see if user entered pet age
            if (strAge == "") {
                lblNoPetAge.Text = "Please enter a pet age!";
                return;
            }
            else {
                try
                {
                    age = Convert.ToInt32(strAge);
                }
                catch (Exception) { 
                    lblNoPetAge.Text = "Please enter a valid age!"; 
                    return; 
                }
            }

            // check to see if description is blank
            if (description == "") {
                lblNoPetDescription.Text = "Please enter a Pet Description!";
                return;
            }

            // check to ensure description is within length constraints
            if (description.Length > 1000) {
                lblNoPetDescription.Text = "You description was over 1000 characters!";
                return;
            }

            // check to see if we got back a valid Shelter ID
            if (shelterID == 0) {
                litMessage.Text = "There was an error posting! Please contact an administrator!";
                return;
            }

            // if we got here all is good, and begin storing the DB
            string strInsert = "INSERT INTO Pets (PetName, Sex, Age, Description, ShelterID, CategoryID)";
            strInsert += string.Format(" VALUES (@petname,@sex,@age,@description,@shelterID,@categoryID)");
            SqlCommand cmdInsert = new SqlCommand(strInsert, conn);
            cmdInsert.Parameters.AddWithValue("@petname", petname);
            cmdInsert.Parameters.AddWithValue("@sex", sex);
            cmdInsert.Parameters.AddWithValue("@age", age);
            cmdInsert.Parameters.AddWithValue("@description", description);
            cmdInsert.Parameters.AddWithValue("@shelterID", shelterID);
            cmdInsert.Parameters.AddWithValue("@categoryID", categoryID);

            // we try to insert, if we fail we catch the exception and display user friendly error.
            try
            {
                cmdInsert.ExecuteNonQuery();
                Response.Redirect("account.aspx");
            }
            catch (Exception)
            {
                litMessage.Text = "Error adding pet! Please contact Administrator.";
            }
        }
    }
}