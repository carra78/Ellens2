using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace EllensBnB.EllensCode
{
	public class BookedDates
	{
		public DateTime BookedDate { get; set; }
		public int RoomID { get; set; }

		public BookedDates(DateTime date, int roomID)
		{
			BookedDate = date;
			RoomID = roomID;
		}

		public static List<BookedDates> AvailabilityForSpecifiedRoom(int roomID)
		{
			List<BookedDates> bookedDates = DBMethods.GetDatesReserved();
			var selectedRoomBookedDates = (from d in bookedDates
										   where d.RoomID == roomID
										   select d).ToList();
			return selectedRoomBookedDates;
		}


		public static List<DateTime> DatesRoomBookedForUserSelectedDates(List<BookedDates> roomBookedDates, List<DateTime> userSelectedDates)
		{
			List<DateTime> bookedDates = new List<DateTime>();

			foreach (var item in roomBookedDates)
			{
				var booked = (from d in userSelectedDates
							  where d.Date == item.BookedDate
							  select d).ToList();
				foreach (var date in booked)
				{
					if (!bookedDates.Contains(date))
					{
						bookedDates.Add(date);
					}
				}
			}

			return bookedDates;
		}


		public override string ToString()
		{
			StringBuilder sb = new StringBuilder();
			sb.Append(BookedDate.ToShortDateString());
			sb.Append(" Room: ");
			sb.Append(RoomID);
			return sb.ToString();
		}
	}
}