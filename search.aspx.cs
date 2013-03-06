using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetFinder
{
    public partial class search : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Server=cdmcoursedb.cstcis.cti.depaul.edu;uid=jvasallo;pwd=Exgv74dT;database=jvasallo");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillCategoryList();

                string strSelect = @"SELECT PetName, Categories.CategoryName AS 'Pet Type', Sex, Age, Description, Shelters.shelter AS 'Shelter Name', Shelters.email 'Contact E-Mail' FROM Pets 
                                    JOIN Shelters ON Pets.ShelterID = Shelters.ShelterID 
                                    JOIN Categories ON Pets.CategoryID = Categories.CategoryID";
                SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
                SqlDataReader myReader;
                try {
                    conn.Open();
                    myReader = cmdSelect.ExecuteReader(CommandBehavior.CloseConnection);
                    gvCatalog.DataSource = myReader;
                    gvCatalog.DataBind();
                }
                catch (Exception) {
                }
                Label1.Text = "";
                conn.Close();
            }
        }

        private void FillCategoryList()
        {
            lstCategory.Items.Clear();
            string selectSQL = "SELECT CategoryID, CategoryName FROM Categories";
            SqlCommand cmd = new SqlCommand(selectSQL, conn);
            SqlDataReader myReader;

            try
            {
                conn.Open();
                myReader = cmd.ExecuteReader();
                lstCategory.Items.Add(new ListItem("Select...", "0"));
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Collecting the selected field and also the value entered into the text.
            int petCategory = Convert.ToInt32(lstCategory.SelectedValue);
            string description = txtDescription.Text;

            SqlDataReader myReader;
            // please don't steal my info :) Connecting to the database and openning the connection for use..
            conn.Open();

            string strSelect = @"SELECT PetName, Categories.CategoryName AS Type, Sex, Age, Description, Shelters.shelter, Shelters.email FROM Pets 
                                 JOIN Shelters ON Pets.ShelterID = Shelters.ShelterID
                                 JOIN Categories ON Pets.CategoryID = Categories.CategoryID";


            // all field search (petCategory, Age, and Description)
            if(petCategory != 0 && txtPetAge.Text != "" && description != "") {
                strSelect += string.Format(" WHERE Pets.CategoryID = @categoryID AND Age = @age AND Description Like @description");
            }
            // two field searches (petCategory and Age), (PetCategory and K/W), (Age and K/W)
            else if ((petCategory != 0) && (txtPetAge.Text != "") && (description == "")) {
                strSelect += string.Format(" WHERE Pets.CategoryID = @categoryID AND Age = @age");
            }
            else if ((petCategory != 0) && (txtPetAge.Text == "") && (description != "")) {
                strSelect += string.Format(" WHERE Pets.CategoryID = @categoryID AND Description Like @description");
            }
            else if ((petCategory == 0) && (txtPetAge.Text != "") && (description != ""))
            {
                strSelect += string.Format(" WHERE Age = @age AND Description Like @description");
            } 
            // singular searches (only petCategory, only Age, only description)
            else if (petCategory != 0 && txtPetAge.Text == "" && description == "") {
                strSelect += string.Format(" WHERE Pets.CategoryID = @categoryID");
            }
            else if (petCategory == 0 && txtPetAge.Text != "" && description == "") {
                strSelect += string.Format(" WHERE Age = @age");
            }
            else if (petCategory == 0 && txtPetAge.Text == "" && description != "") {
                strSelect += string.Format(" WHERE Description Like @description");
            }

            // we are making our string into a sql command and defining the @params.
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

            if (petCategory != 0) {
                cmdSelect.Parameters.AddWithValue("@categoryID", petCategory);
            }
            if (txtPetAge.Text != "") {
                cmdSelect.Parameters.AddWithValue("@age", Convert.ToInt32(txtPetAge.Text));
            }
            if (description != "") {
                cmdSelect.Parameters.AddWithValue("@description", "%" + description + "%");
            }

            // we are executing the command and collecting the information into our reader.
            myReader = cmdSelect.ExecuteReader(CommandBehavior.CloseConnection);

            // we then bind our reader to our "table" on the page. That way the data collected is displayed
            gvCatalog.DataSource = myReader;
            gvCatalog.DataBind();

            // getting the count of rows that will be displayed on the bottom of all the pages.
            // This will change as the results differ.
            int recordCount = gvCatalog.Rows.Count;
            Label1.Text = String.Format("Found {0} Records", recordCount.ToString());

            // always gracefully close the connection or else it can cause problems down the line.
            conn.Close();
        }
    }
}