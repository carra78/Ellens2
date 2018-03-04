using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace EllensBnB.Pages
{
    public partial class LogInForAdmin : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["EllensBnBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {           
        }

     
        protected void btnLogInNew_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string password = txtPassword.Text;
                        
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand(@"select count(*) from dbo.Users where username = '" + userName + "' and pword = '" + password + "'");
            cmd.Connection = con;

            int passwordExistInDB = Convert.ToInt32(cmd.ExecuteScalar());
            if (passwordExistInDB > 0)
            {
                lblLogInStatus.Text = "Valid Password";
                con.Close();
                Response.Redirect("AdminPage.aspx");
            }
            else
            {
                lblLogInStatus.Text = "Invalid Login Details";
                con.Close();
            }
        }

    }
}