using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace EllensBnB.EllensCode
{
	public class EllenCalendar
	{
		public void SetSelectableDates(DayRenderEventArgs e)
		{
			//make only days after today bookable
			if (e.Day.Date.CompareTo(DateTime.Today) < 1)
			{
				e.Day.IsSelectable = false;
				e.Cell.BackColor = System.Drawing.Color.LightGray;
			}
			//make days more than 365 days ahead unbookable		

			DateTime maxBookingDate = DateTime.Today.AddDays(365);
			if (e.Day.Date > maxBookingDate)
			{
				e.Day.IsSelectable = false;
				e.Cell.BackColor = System.Drawing.Color.LightGray;
			}
		}
	}
}