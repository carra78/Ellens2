﻿using EllensBnB.EllensCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EllensBnB.Pages
{
	public partial class ContactUs3 : System.Web.UI.Page
	{
		//load data from Rooms Table in DB - to access current pricing, etc.
		static List<Room> currentRoomData = Room.RoomData();
		//declare the booking element list to hold the request for availability check
		List<BookingElement> sessionBookingElements = new List<BookingElement>();
		//declaure the booking element list to hold the selected dates / rooms for actual booking
		List<BookingElement> userSelectedBookingElements = new List<BookingElement>();
		int bookingID = 0;
		string customerEmail;
		bool existingCustomer = false;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				BindXml();
			}
		}

		protected void MakeNewReservation_Click(object sender, EventArgs e)
		{

		}

		protected void btnExistingBookingASP_Click(object sender, EventArgs e)
		{
			Response.Redirect("ExistingBooking.aspx"); //user if pages on different servers 
													   //Server.Transfer("ExistingBooking.aspx"); //use if pages on the same server
		}

		//List of dates that gets passed to lstDisplay on Contact
		List<DateTime> userSelectedDate = new List<DateTime>(); //TODO consider moving into method as passed to Session Selected Dates
		protected void EllensCalendar_DayRender(object sender, DayRenderEventArgs e)
		{
			EllenCalendar eCal = new EllenCalendar();
			eCal.SetSelectableDates(e);
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
				foreach (DateTime date in (List<DateTime>)Session["SelectedDates"])
				{
					EllensWebCalendar.SelectedDates.Add(date);
				}
				userSelectedDate.Clear();
			}
		}

		List<string> userSelectedDatesForDatabaseQuery = new List<string>(); //TODO Check of dates need to be in string format for SQL query
		protected void btnSelectDates_Click(object sender, EventArgs e)
		{
			if (Session["SelectedDates"] != null)
			{
				lstUserSelectedDates.Items.Clear();
				lstUserSelectedDates.Items.Add("You have selected the following dates: ");

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
			NoAvailability.Visible = false;

			//reset gridview for availability to emply and clear
			gvAvailability.DataSource = null;
			gvAvailability.DataBind();
			UpdatePanelReturnAvailability.Update();
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
				
				BookingElement.BookingElementsWithAvailability(ref sessionBookingElements);

				//sort sessionBookingElements to date order
				List<BookingElement> sortedBookingElements = sessionBookingElements
					.OrderBy(o => o.UserDate).ToList();

				if (sortedBookingElements.Count > 0)
				{
					gvAvailability.DataSource = sortedBookingElements;
					gvAvailability.DataBind();
					foreach (GridViewRow row in gvAvailability.Rows)
					{
						DropDownList dl = (DropDownList)row.FindControl("ddlUserGuests");
						int max = int.Parse(gvAvailability.Rows[row.RowIndex].Cells[3].Text);
						int[] ddlSource = Enumerable.Range(0, max + 1).ToArray();
						dl.DataSource = ddlSource;
						dl.DataBind();
					}
					NoAvailability.Visible = false;
					UpdatePanelReturnAvailability.Update();
				}
				else
				{
					NoAvailability.Visible = true;
				}
			}
		}

		protected void btnCheckExisting_Click(object sender, EventArgs e)
		{
			Page.Validate("CustomerCheck");
			if (Page.IsValid)
			{

				string email = txtEmail.Text.ToString();
				var customer = DBMethods.CheckExistingCustomer(email);
				if (customer.GetType() == typeof(string))
				{
					existingCustomer = false;
					NotExistingCustomer.Visible = true;
					lblCustomerName.CssClass = "show";
					txtCustomerName.Text = string.Empty;
					txtCustomerName.CssClass = "show";
					lblCustomerPhone.CssClass = "show";
					txtCustomerPhone.Text = string.Empty;
					txtCustomerPhone.CssClass = "show";
					lblCustomerCountry.CssClass = "show";
					ddlCountry.SelectedIndex = 0;
					ddlCountry.CssClass = "show";
					MakeBooking.CssClass = "show";
					UpdatePanelRegisterNewCustomer.Update();
				}
				else
				{
					if (IsPostBack)
					{
						NotExistingCustomer.Visible = false;
						existingCustomer = true;
						txtCustomerName.Text = customer.CustomerName.ToString();
						txtCustomerPhone.Text = customer.CustomerPhone.ToString();
						//ddlCountry.SelectedIndex = ddlCountry.Items.IndexOf(ddlCountry.Items.FindByValue(customer.CustomerCountry));
						ddlCountry.SelectedValue = customer.CustomerCountry;
						lblCustomerName.CssClass = "show";
						txtCustomerName.CssClass = "show";
						lblCustomerPhone.CssClass = "show";
						txtCustomerPhone.CssClass = "show";
						lblCustomerCountry.CssClass = "show";
						ddlCountry.CssClass = "show";
						MakeBooking.CssClass = "show";

					}
				}

			}
			else
			{
				NotExistingCustomer.Visible = false;
				lblCustomerName.CssClass = "hidden";
				txtCustomerName.Text = string.Empty;
				txtCustomerName.CssClass = "hidden";
				lblCustomerPhone.CssClass = "hidden";
				txtCustomerPhone.Text = string.Empty;
				txtCustomerPhone.CssClass = "hidden";
				lblCustomerCountry.CssClass = "hidden";
				ddlCountry.SelectedIndex = 0;
				ddlCountry.CssClass = "hidden";
				MakeBooking.CssClass = "hidden";
				UpdatePanelRegisterNewCustomer.Update();
			}
		}
		protected void MakeBooking_Click(object sender, EventArgs e)
		{
			Page.Validate("CustomerDetails");
			if (Page.IsValid)
			{
				//Retrieve date from the gridview and create new BookingElement List

				foreach (GridViewRow row in gvAvailability.Rows)
				{
					CheckBox cb = (CheckBox)row.FindControl("cbxUserSelection");
					DropDownList dl = (DropDownList)row.FindControl("ddlUserGuests");
					if (cb != null && cb.Checked && Convert.ToInt32(dl.SelectedItem.Text) != 0)
					{
						BookingElement b = new BookingElement();
						b.ReservationDate = Convert.ToDateTime(gvAvailability.Rows[row.RowIndex].Cells[0].Text);
						b.RoomID = Convert.ToInt32(gvAvailability.Rows[row.RowIndex].Cells[1].Text);

						b.NumberOfGuests = Convert.ToInt32(dl.SelectedItem.Text);
						userSelectedBookingElements.Add(b);
					}
					else
					{
						NothingSelected.Visible = true;
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

				customerEmail = txtEmail.Text.ToString();
				string phone = txtCustomerPhone.Text.ToString();
				string country = ddlCountry.SelectedValue.ToString(); //TODO Validation to say can't select default item
				string name = txtCustomerName.Text.ToString();

				if (userSelectedBookingElements.Count > 0) //&& !string.IsNullOrEmpty(phone) 
														   //&& !string.IsNullOrEmpty(country) && !string.IsNullOrEmpty(name))
				{
					if (existingCustomer == false)
					{
						DBMethods.CreateNewCustomer(customerEmail, country, name, phone);
					}
					bookingID = DBMethods.CreateBookingID(customerEmail, txtCustomerBookingNotes.Text);
					BookingElement.AddingBookingIDToBookingElements(bookingID, ref userSelectedBookingElements);
					DBMethods.CreateBookingElements(userSelectedBookingElements);

					Session["BookingID"] = bookingID.ToString(); ;
					Response.Redirect("BookingConfirm.aspx");

				}
				else
				{
					NothingSelected.Visible = true;
				}
			}
			//else
			//{
			//	NotExistingCustomer.Visible = false;
			//	lblCustomerName.CssClass = "hidden";
			//	txtCustomerName.Text = string.Empty;
			//	txtCustomerName.CssClass = "hidden";
			//	lblCustomerPhone.CssClass = "hidden";
			//	txtCustomerPhone.Text = string.Empty;
			//	txtCustomerPhone.CssClass = "hidden";
			//	lblCustomerCountry.CssClass = "hidden";
			//	ddlCountry.SelectedIndex = 0;
			//	ddlCountry.CssClass = "hidden";
			//	MakeBooking.CssClass = "hidden";
			//	UpdatePanelRegisterNewCustomer.Update();
			//}

		}

		private void BindXml()
		{
			System.Xml.XmlDocument doc = new XmlDocument();
			doc.Load(Server.MapPath(@"..\countries.xml"));

			foreach (XmlNode node in doc.SelectNodes("//country"))
			{
				//ddlCountry.Items.Add(new ListItem(node.InnerText, node.Attributes["code"].InnerText));
				ddlCountry.Items.Add(new ListItem(node.InnerText, node.InnerText));//text & value
			}
			ddlCountry.Items.Insert(0, new ListItem("Select Country", "NA"));
		}
	}
}