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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlDataReader myReader;
                SqlConnection conn = new SqlConnection("Server=cdmcoursedb.cstcis.cti.depaul.edu;uid=jvasallo;pwd=;database=jvasallo");
                string strSelect = "SELECT * FROM Products2013";
                SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
                conn.Open();
                myReader = cmdSelect.ExecuteReader(CommandBehavior.CloseConnection);
    
                gvCatalog.DataSource = myReader;
                gvCatalog.DataBind();

                conn.Open();
                conn.Dispose();
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            // Collecting the selected field and also the value entered into the text.
            string selectedField = rdoFieldSpecified.SelectedValue;
            string specifiedValue = txtIDCode.Text;

            SqlDataReader myReader;
            // please don't steal my info :) Connecting to the database and openning the connection for use..
            SqlConnection conn = new SqlConnection("Server=cdmcoursedb.cstcis.cti.depaul.edu;uid=jvasallo;pwd=;database=jvasallo");
            conn.Open();

            // starting off our query string then appending the where clause of:
            // WHERE @selectedField = @id. id represents the specifiedValue param.
            // Note: This seems like the only way to add this, I wasn't able to do:
            // WHERE @seletecField = @id, after research the variable you are checking for
            // typically can't be insterted as a param. Not sure if that's right or wrong.
            string strSelect = "SELECT * FROM Products2013";
            strSelect += string.Format(" WHERE {0} = @id", selectedField);

            // we are making our string into a sql command and defining the @id param.
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
            cmdSelect.Parameters.AddWithValue("@id", int.Parse(specifiedValue));

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