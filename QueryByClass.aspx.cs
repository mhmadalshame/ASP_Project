using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class QueryByClass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGrades();
        }
    }

    private void LoadGrades()
    {
        string connStr = ConfigurationManager.ConnectionStrings["StudentRegistrationSystem"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT GradeID, GradeName FROM Grades";
            SqlCommand cmd = new SqlCommand(query, conn);
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                ddlGrades.DataSource = reader;
                ddlGrades.DataTextField = "GradeName";
                ddlGrades.DataValueField = "GradeID";
                ddlGrades.DataBind();

                ddlGrades.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Grade --", "0"));
            }
            catch (Exception ex)
            {
                lblClassResult.ForeColor = System.Drawing.Color.Red;
                lblClassResult.Text = "Error loading grades: " + ex.Message;
            }
        }
    }

    protected void btnQueryClass_Click(object sender, EventArgs e)
    {
        int gradeID;
        if (!int.TryParse(ddlGrades.SelectedValue, out gradeID) || gradeID == 0)
        {
            lblClassResult.ForeColor = System.Drawing.Color.Red;
            lblClassResult.Text = "Please select a grade.";
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["StudentRegistrationSystem"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT COUNT(*) FROM Students WHERE GradeID = @gradeID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@gradeID", gradeID);

            try
            {
                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                lblClassResult.ForeColor = System.Drawing.Color.Green;
                lblClassResult.Text = "The number of students in the selected grade is: " + count.ToString();
            }
            catch (Exception ex)
            {
                lblClassResult.ForeColor = System.Drawing.Color.Red;
                lblClassResult.Text = "Error: " + ex.Message;
            }
        }
    }
}
