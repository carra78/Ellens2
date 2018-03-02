using EllensBnB.EllensCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//using System.Data;  // used for xml binding for listOfCountries
using System.Xml;   // used for xml binding for listOfCountries

namespace EllensBnB.Pages
{
	public partial class ContactUs1 : System.Web.UI.Page
	{
		//load data from Rooms Table in DB - to access current pricing, etc.
		static List<Room> currentRoomData = Room.RoomData();
		//declare the booking element list to hold the request for this session
		List<BookingElement> sessionBookingElements = new List<BookingElement>();
		int bookingID = 0;
		string customerEmail;

		protected void Page_Load(object sender, EventArgs e)
		{
            // used for binding XML for listOfCountries
            if (!IsPostBack)
            {
                //this.BindXml();   // 1st version
               BindXml();          // 2nd version
            }
			//DropDownListCountries.DataSource = Enum.GetValues(typeof(EllensCode.EnumOfCountries));
			//UpdatePanelCalendar.Visible = false;
			//UpdatePanelReturnAvailability.Visible = false;
			//UpdatePanelRegisterNewCustomer.Visible = false;
			//UpdatePanelBookingConfirmation.Visible = false;

			lblRetrieveName.Visible = false;
			lblRetrieveCountry.Visible = false;
			lblRetrievePhone.Visible = false;
			lblRetrieveBookingNotes.Visible = false;



		}


		private void BindXml()
        {
            //string filePath = Server.MapPath(@"..\countries.xml");
            //using (DataSet ds = new DataSet())
            //{
            //    //ds.ReadXml(filePath);
            //    //ddlCountry.DataSource = ds;                
            //    //ddlCountry.DataTextField = "code";
            //    //ddlCountry.DataValueField = "iso";
            //    //ddlCountry.DataBind();
            //}

            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath(@"..\countries.xml"));

            foreach (XmlNode node in doc.SelectNodes("//country"))
            {
                ddlCountry.Items.Add(new ListItem(node.InnerText, node.Attributes["code"].InnerText));
            }
        }


        protected void MakeNewReservation_Click(object sender, EventArgs e)
		{

		}

		protected void UpdateExistingReservation_Click(object sender, EventArgs e)
		{

		}

		//List of dates that gets passed to lstDisplay on Contact
		List<DateTime> userSelectedDate = new List<DateTime>(); //consider moving into method as passed to Session Selected Dates
		protected void EllensCalendar_DayRender(object sender, DayRenderEventArgs e)
		{		
			EllenCalendar eCal = new EllenCalendar();
			eCal.SetSelectableDates(e);

			//List<DateTime> userSelectedDates = new List<DateTime>();
			if (e.Day.IsSelected)
			{
				
				userSelectedDate.Add(e.Day.Date);
				e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#4d88ff"); //bright blue
				e.Cell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000066"); //navy
				
			}
			Session["SelectedDates"] = userSelectedDate;

		}

		//List<DateTime> selectionChangedDateList;
		protected void EllensCalendar_SelectionChanged(object sender, EventArgs e)
		{

			if (Session["SelectedDates"] != null)
			{
				//selectionChangedDateList = (List<DateTime>)Session["SelectedDates"];
				//foreach (DateTime date in selectionChangedDateList)
				foreach(DateTime date in (List<DateTime>)Session["SelectedDates"])
				{
					EllensWebCalendar.SelectedDates.Add(date);
				}
				userSelectedDate.Clear();
			}
		}

		//List<DateTime> browserSelectedDates;// check if needed...
		List<string> userSelectedDatesForDatabaseQuery = new List<string>(); //TODO Check of dates need to be in string format for SQL query
		protected void btnSelectDates_Click(object sender, EventArgs e)
		{

			if (Session["SelectedDates"] != null)
			{
				//browserSelectedDates = (List<DateTime>)Session["SelectedDates"];
				lstUserSelectedDates.Items.Clear();
				lstUserSelectedDates.Items.Add("You have selected the following dates: ");
				//lstUserSelectedDates.Items.Add(string.Empty);

				//populate the list display box
				foreach (DateTime dt in (List<DateTime>)Session["SelectedDates"])
				{
					userSelectedDatesForDatabaseQuery.Add(dt.ToShortDateString());
					lstUserSelectedDates.Items.Add(dt.ToShortDateString());
				}

			}

		}
		
		protected void btnClearDates_Click(object sender, EventArgs e)
		{
			userSelectedDate.Clear();
			EllensWebCalendar.SelectedDates.Clear();
			lstUserSelectedDates.Items.Clear();
			Session["SelectedDates"] = null;
			userSelectedDatesForDatabaseQuery.Clear();
		}

		protected void CheckAvailabilitySelectedDates_Click(object sender, EventArgs e)
		{
			if (Session["SelectedDates"] != null)
			{
				//create booking elements for grid view display
				sessionBookingElements = BookingElement.CreateBookingElementsForUserSelectedDates
					((List<DateTime>)Session["SelectedDates"], currentRoomData);
				BookingElement.AddRoomRateByDate(currentRoomData, ref sessionBookingElements);
				BookingElement.AddAvailabilityToBookingElements(ref sessionBookingElements);
				//List<BookingElement> availableBookingElements = 
				BookingElement.BookingElementsWithAvailability(ref sessionBookingElements);
				gvAvailability.DataSource = sessionBookingElements;
				gvAvailability.DataBind();
				foreach (GridViewRow row in gvAvailability.Rows)
				{
					DropDownList dl = (DropDownList)row.FindControl("ddlUserGuests");
					int max = int.Parse(gvAvailability.Rows[row.RowIndex].Cells[2].Text);
					int[] ddlSource = Enumerable.Range(0, max + 1).ToArray();
					dl.DataSource = ddlSource;
					dl.DataBind();
				}

				UpdatePanelReturnAvailability.Update();
			}
		}

		protected void ReserveSelectedRooms_Click(object sender, EventArgs e)
        {
            //Email TxtBox Validation PT  3
            // disable unobtrusive validation
            UnobtrusiveValidationMode =
                System.Web.UI.UnobtrusiveValidationMode.None;
            // if this is not the first time the page is loading
            // (i.e., the user has already submitted form data)
            if (IsPostBack)
            {
                Page.Validate("UpdatePanelReturnAvailabilityValidation");  // validate the form

                // if the form is valid
                if (IsValid)
                {
                    // retrieve the values submitted by the user
                    string validEmail = txtCustomerEmail.Text;
                    // show the submitted values
                    GordTestLabelRESERVE.Text = validEmail;
                } // end if
            }
			//Retrieve date from the gridview and create new BookingElement List
			List<BookingElement> userSelectedBookingElements = new List<BookingElement>();
			foreach (GridViewRow row in gvAvailability.Rows)
			{
				CheckBox cb = (CheckBox)row.FindControl("cbxUserSelection");
				if (cb!=null && cb.Checked)
				{
					BookingElement b = new BookingElement();
					b.UserDate = Convert.ToDateTime(gvAvailability.Rows[row.RowIndex].Cells[0].Text);
					b.RoomID = Convert.ToInt32(gvAvailability.Rows[row.RowIndex].Cells[1].Text);
					DropDownList dl = (DropDownList)row.FindControl("ddlUserGuests");
					b.NumberOfGuests = Convert.ToInt32(dl.SelectedItem.Text);
					userSelectedBookingElements.Add(b);
				}
				
			}

			//add back in room rates for selected dates 
			BookingElement.AddRoomRateByDate(currentRoomData, ref userSelectedBookingElements);

			//Add any booking notes to each element			
			if (!string.IsNullOrEmpty(txtCustomerBookingNotes.Text) && 
				userSelectedBookingElements.Count > 0)
			{
				BookingElement.AddBookingNotesToBookingElements(txtCustomerBookingNotes.Text,
					ref userSelectedBookingElements);
			}

			//check if customer exists and if yes, capture relevant data
			customerEmail = txtCustomerEmail.Text;
			if (DBMethods.CheckExistingCustomer(customerEmail).ToString() == "false")
			{
				UpdatePanelRegisterNewCustomer.Visible = true;
			}
			if (userSelectedBookingElements.Count > 0)
			{
				bookingID = DBMethods.CreateBookingID(customerEmail, txtCustomerBookingNotes.Text);
				BookingElement.AddingBookingIDToBookingElements(bookingID, ref userSelectedBookingElements);
				DBMethods.CreateBookingElements(userSelectedBookingElements);
				BookingIDReference.InnerHtml = bookingID.ToString();
			}			
			

        }

        protected void CreateNewAccount_Click(object sender, EventArgs e)
        {
            //Register New Customer Validation PT  2

            // disable unobtrusive validation
            UnobtrusiveValidationMode =
                System.Web.UI.UnobtrusiveValidationMode.None;

            // if this is not the first time the page is loading
            // (i.e., the user has already submitted form data)
            if (IsPostBack)
            {
                Page.Validate("RegisterNewCustomerValidation");  // validate the form

                // if the form is valid
                if (IsValid)
                {
                    // retrieve the values submitted by the user
                    string validName = txtCustomerName.Text;
                    string validPhoneNUmber = txtCustomerPhone.Text;

                    // show the submitted values                                       ///  seems to want the whole page to be valid to carry out next command !!
                    GordTestLabelNewCustomer.Text = validName + " " + validPhoneNUmber;
                } // end if
            }
			string name = txtCustomerName.Text;
			string country = ddlCountry.SelectedItem.ToString();
			string phone = txtCustomerPhone.Text;
			DBMethods.CreateNewCustomer(customerEmail, country, name, phone);
			BookingIDReference.InnerHtml = bookingID.ToString();

		}

		protected void btnRetrieveBooking_Click(object sender, EventArgs e)
		{
			if (IsPostBack)
			{
				lblRetrieveName.Visible = false;
				lblRetrieveCountry.Visible = false;
				lblRetrievePhone.Visible = false;
				lblRetrieveBookingNotes.Visible = false;
				string email = txtRetrieveBookingEmail.Text;
				string id = txtRetrieveBookingID.Text;
				List<BookingElement> booking = BookingElement.RetrieveBookingDetails(email, id);
				lblRetrieveName.Text = booking[0].CustomerName;
				lblRetrieveCountry.Text = booking[0].CustomerCountry;
				lblRetrievePhone.Text = booking[0].CustomerPhone;
				lblRetrieveBookingNotes.Text = booking[0].BookingNotes;
				lblRetrieveName.Visible = true;
				lblRetrieveCountry.Visible = true;
				lblRetrievePhone.Visible = true;
				lblRetrieveBookingNotes.Visible = true;
				gvRetrieveBooking.DataSource = dsRetrieveBooking.Select();
				gvRetrieveBooking.DataBind();
			}

		}
	}
}