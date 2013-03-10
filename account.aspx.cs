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
            if (!Page.IsPostBack)
            {
                string strSelect = @"SELECT PetName, Categories.CategoryName AS 'Pet Type', Sex, Age, Description
                                     FROM Pets 
                                     JOIN Shelters ON Pets.ShelterID = Shelters.ShelterID 
                                     JOIN Categories ON Pets.CategoryID = Categories.CategoryID";
                strSelect += string.Format(" WHERE Pets.ShelterID = @userid");
                SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
                string shelterName = null;
                if (Session["UserName"] != null) {
                    shelterName = Session["UserName"].ToString();
                }
                int shelterID = getShelterID(shelterName);
                cmdSelect.Parameters.AddWithValue("@userid", shelterID);
                SqlDataReader myReader = null;
                try
                {
                    conn.Open();
                }
                catch (Exception) { }

                myReader = cmdSelect.ExecuteReader(CommandBehavior.CloseConnection);                    
                gvCatalog.DataSource = myReader;
                gvCatalog.DataBind();    
                conn.Close();
            }
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
            catch (Exception) { }
            return shelterID;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        { }

        // This needs to be overridden so that we can embed Asp:LinkButtons and more in UserControls.
        public override void VerifyRenderingInServerForm(Control control)
        {
        }

    }
}