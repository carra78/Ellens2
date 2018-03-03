using EllensBnB.EllensCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EllensBnB.Pages
{
	public partial class ExistingBooking : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				//hide controls for data display on page load
				RetrieveError.Visible = false;
				RetrievedData.Visible = false;
				gvRetrieveBooking.Visible = false;
			}
		}

		protected void btnRetrieveBooking_Click(object sender, EventArgs e)
		{
			try
			{
				RetrieveError.Visible = false;
				string email = txtEmail.Text.ToString(); //TODO - make all input lower case for pushing to database
				int bookingID = Convert.ToInt32(txtBookingID.Text);
				List<BookingElement> bookingInfo = DBMethods.RetrieveExistingBooking(email, bookingID);
				lblBookingID.Text = bookingID.ToString();
				lblEmail.Text = email;
				lblRetrieveName.Text = bookingInfo[0].CustomerName.ToString();
				lblRetrieveCountry.Text = bookingInfo[0].CustomerCountry.ToString();
				lblRetrievePhone.Text = bookingInfo[0].CustomerPhone.ToString();
				if (!string.IsNullOrEmpty(bookingInfo[0].BookingNotes))
				{
					lblRetrieveBookingNotes.Text = bookingInfo[0].BookingNotes.ToString();
				}

				gvRetrieveBooking.DataSource = bookingInfo;
				gvRetrieveBooking.DataBind();

				RetrievedData.Visible = true;
				gvRetrieveBooking.Visible = true;

				//clear input boxes
				txtEmail.Text = string.Empty;
				txtBookingID.Text = string.Empty;
				inputFields.Update();
				

			}
			catch (Exception)
			{
				RetrieveError.Visible = true;
				gvRetrieveBooking.Visible = false;
				RetrievedData.Visible = false;
			}


		}
	}
}