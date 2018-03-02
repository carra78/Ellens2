using EllensBnB.EllensCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EllensBnB.Pages
{
	public partial class AdminPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				gvFutureReservations.Visible = true;
				gvTotalRevenue.Visible = false;
				gvUnpaid.Visible = false;
				gvAllCustomers.Visible = false;
				gvAllBookings.Visible = false;
			}
		}

		protected void drpReportList_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (drpReportList.SelectedItem.Text == "Future Reservations")
			{
				gvFutureReservations.Visible = true;
				gvTotalRevenue.Visible = false;
				gvUnpaid.Visible = false;
				gvAllCustomers.Visible = false;
				gvAllBookings.Visible = false;
			}
			else if (drpReportList.SelectedItem.Text == "Total Revenue")
			{
				gvFutureReservations.Visible = false;
				gvTotalRevenue.Visible = true;
				gvUnpaid.Visible = false;
				gvAllCustomers.Visible = false;
				gvAllBookings.Visible = false;
			}
			else if (drpReportList.SelectedItem.Text == "Unpaid Bookings")
			{
				gvFutureReservations.Visible = false;
				gvTotalRevenue.Visible = false;
				gvUnpaid.Visible = true;
				gvAllCustomers.Visible = false;
				gvAllBookings.Visible = false;
			}
			else if (drpReportList.SelectedItem.Text == "Customer List")
			{
				gvFutureReservations.Visible = false;
				gvTotalRevenue.Visible = false;
				gvUnpaid.Visible = false;
				gvAllCustomers.Visible = true;
				gvAllBookings.Visible = false;
			}
			else if (drpReportList.SelectedItem.Text == "All bookings")
			{
				gvFutureReservations.Visible = false;
				gvTotalRevenue.Visible = false;
				gvUnpaid.Visible = false;
				gvAllCustomers.Visible = false;
				gvAllBookings.Visible = true;
			}
		}
	}
}