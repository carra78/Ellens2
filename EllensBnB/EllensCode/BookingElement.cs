using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace EllensBnB.EllensCode
{
	public class BookingElement
	{
		public int BookingID { get; set; }
		public int RoomID { get; set; }
		public DateTime ReservationDate { get; set; }
		public int NumberOfGuests { get; set; } = 0;
		public decimal RoomRate { get; set; }

		//added for retrieve BookingExistingBooking as returns all details
		public DateTime DateBookingCreated { get; set; }
		public string Paid { get; set; }
		public string BookingNotes { get; set; }
		public string RoomName { get; set; }
		public string CustomerName { get; set; }
		public string CustomerCountry { get; set; }
		public string CustomerEmail { get; set; }
		public string CustomerPhone { get; set; }

		//added for ContactForm DGV Test
		public DateTime UserDate { get; set; }
		public bool RoomAvailable { get; set; } = true; //programmatically set to false if booked
		public int MaxCapacity { get; set; }
		public bool UserSelected { get; set; } = false;

		public BookingElement(int bookingID, int roomID, DateTime reservedDate, int noOfGuests, decimal roomRate)
		{
			BookingID = bookingID;
			RoomID = roomID;
			ReservationDate = reservedDate;
			NumberOfGuests = noOfGuests;
			RoomRate = roomRate;
		}

		public BookingElement(int bookingID, int roomID, DateTime reservedDate, int noOfGuests)
		{
			BookingID = bookingID;
			RoomID = roomID;
			ReservationDate = reservedDate;
			NumberOfGuests = noOfGuests;
		}

		public BookingElement()
		{
		}

		public static List<BookingElement> CreateBookingElementsForUserSelectedDates(List<DateTime> dates, List<Room> currentRoomData)
		{
			List<Room> roomData = currentRoomData;
			List<BookingElement> bookingElement = new List<BookingElement>();
			foreach (Room r in roomData)
			{
				foreach (DateTime date in dates)
				{
					BookingElement b = new BookingElement();
					b.UserDate = date.Date;
					b.RoomID = r.RoomID;
					b.MaxCapacity = r.MaxCapacity; //added for gridview drop down
					bookingElement.Add(b);

				}

			}
			return bookingElement;
		}

		public static void AddRoomRateByDate(List<Room> currentRoomData, ref List<BookingElement> bookingElement)
		{
			//TODO O(n2) problem... but only a small loop
			int[] summerMonths = { 4, 5, 6, 7, 8, 9 };
			foreach (Room r in currentRoomData)
			{
				foreach (BookingElement be in bookingElement)
				{
					if (be.RoomID == r.RoomID)
					{
						be.RoomRate = (summerMonths.Contains(be.UserDate.Month)) ? r.RoomPriceSummer : r.RoomPriceWinter;
					}
				}
			}

		}

		public static void AddAvailabilityToBookingElements(ref List<BookingElement> bookingElements)
		{
			List<BookedDates> booked = DBMethods.GetDatesReserved(); //calls Database
			foreach (BookingElement be in bookingElements)
			{
				for (int i = 0; i < booked.Count; i++)
				{
					if (be.UserDate == booked[i].BookedDate && be.RoomID == booked[i].RoomID)
					{
						be.RoomAvailable = false;
					}
				}
			}

		}

		public static void BookingElementsWithAvailability(ref List<BookingElement> bookingElements)
		{
			bookingElements = (from be in bookingElements
								where be.RoomAvailable == true
								select be).ToList<BookingElement>();
		}

		public static void AddBookingNotesToBookingElements(string notes, ref List<BookingElement> bookingElements)
		{
			foreach (BookingElement be in bookingElements)
			{
				be.BookingNotes = notes;
			}
		}

		public static void AddingBookingIDToBookingElements(int id, ref List<BookingElement> bookingElements)
		{
			foreach (BookingElement be in bookingElements)
			{
				be.BookingID = id;
			}
		}

		public static List<BookingElement> RetrieveBookingDetails(string email, string bookingID)
		{
			List<BookingElement> existingBooking = DBMethods.RetrieveExistingBooking(email, Convert.ToInt32(bookingID));
			return existingBooking;
		}
	}
}