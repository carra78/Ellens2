using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace EllensBnB.Pages
{
    public partial class LogInForAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     
        protected void btnLogInNew_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string password = txtPassword.Text;

            SqlConnection con = new SqlConnection(@"Data Source=karensserver.database.windows.net;Initial Catalog=EllensBnB;Persist Security Info=True;User ID=ellenadminlogin;Password=PCEc2018");
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