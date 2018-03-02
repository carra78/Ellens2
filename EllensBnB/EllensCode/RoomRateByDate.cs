using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace EllensBnB.EllensCode
{
	public class RoomRateByDate
	{
		public int RoomID { get; set; }
		public DateTime ReservationDate { get; set; }
		public decimal RoomRate { get; set; }

		public RoomRateByDate(int roomID, DateTime reservationDate)
		{
			RoomID = roomID;
			ReservationDate = reservationDate;
		}

		public override string ToString()
		{
			StringBuilder sb = new StringBuilder();
			sb.Append(RoomID);
			sb.Append(", ");
			sb.Append(ReservationDate);
			if (RoomRate != 0)
			{
				sb.Append(", ");
				sb.Append(RoomRate);
			}

			return sb.ToString();
		}
	}
}