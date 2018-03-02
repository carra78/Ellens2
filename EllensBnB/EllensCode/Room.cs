using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EllensBnB.EllensCode
{
	public class Room
	{
		public int RoomID { get; set; }
		public string RoomName { get; set; }
		public int MaxCapacity { get; set; }
		public decimal RoomPriceSummer { get; set; }
		public decimal RoomPriceWinter { get; set; }

		//returns all the data from the room table in the DB
		public static List<Room> RoomData()
		{
			List<Room> roomData = DBMethods.GetRoomTableData();
			return roomData;
		}

	}
}