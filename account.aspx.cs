using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder {
    public partial class account : System.Web.UI.Page {
        SqlConnection conn = new SqlConnection("Server=cdmcoursedb.cstcis.cti.depaul.edu;uid=jvasallo;pwd=Exgv74dT;database=jvasallo");

        protected void Page_Load(object sender, EventArgs e) {
            if (Session["loggedin"] == null) {
                Response.Redirect("login.aspx");
            }
            if (!this.IsPostBack) {
                FillCategoryList();
            }
        }

        private void FillCategoryList() {
        /*
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
         */
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}