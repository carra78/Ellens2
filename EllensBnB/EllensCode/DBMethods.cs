using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

namespace EllensBnB.EllensCode
{
	public class DBMethods
	{
        /* New connection string code - linking directly to Web.config file*/
        static string connectionString = ConfigurationManager.ConnectionStrings["EllensBnBConnectionString"].ConnectionString;

        /*old connectionstring*/
        //static string connectionString = "Server = tcp:karensserver.database.windows.net,1433; Initial Catalog = EllensBnB; Persist Security Info = False; User ID = ellenadminlogin; Password =PCEc2018; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;";
        
        //static SqlConnection dbConnection = new SqlConnection(connectionString);

		//calls uspGetDatesReserved - no parameters required.  Returns all booked dates and associated roomID
		public static List<BookedDates> GetDatesReserved()
		{
			SqlConnection dbConnection = new SqlConnection(connectionString);
			SqlCommand getDatesReserved = new SqlCommand("uspGetDatesReserved", dbConnection);
			getDatesReserved.CommandType = CommandType.StoredProcedure;
			List<BookedDates> queryResult = new List<BookedDates>();
			try
			{
				dbConnection.Open();
				SqlDataReader reader = getDatesReserved.ExecuteReader();
				while (reader.Read())
				{
					BookedDates booking = new BookedDates(reader.GetDateTime(0), reader.GetInt32(1));
					queryResult.Add(booking);
				}
			}
			catch (Exception)
			{
				throw;
			}
			finally
			{
				dbConnection.Close();
			}
			return queryResult;
		}
		
		//call uspCreateBookingID
		public static int CreateBookingID(string custEmail, string bookingNotes = null, string paidStatus = null)
		{
			int result;
			SqlConnection dbConnection = new SqlConnection(connectionString);
			SqlCommand cmdCreateBookingID = new SqlCommand("uspCreateBookingID", dbConnection);
			cmdCreateBookingID.CommandType = CommandType.StoredProcedure;
			SqlParameter customerEmail = new SqlParameter("@CustomerEmail", SqlDbType.VarChar, 50);
			cmdCreateBookingID.Parameters.Add(customerEmail);
			SqlParameter paid = new SqlParameter("@Paid", SqlDbType.VarChar, 20);
			cmdCreateBookingID.Parameters.Add(paid);
			SqlParameter notes = new SqlParameter("@BookingNotes", SqlDbType.VarChar, 255);
			cmdCreateBookingID.Parameters.Add(notes);

			var bookingID = new SqlParameter("@BookingID", SqlDbType.Int);
			bookingID.Direction = ParameterDirection.Output;
			cmdCreateBookingID.Parameters.Add(bookingID);

			try
			{
				dbConnection.Open();
				customerEmail.Value = custEmail;
				paid.Value = (paidStatus == null) ? "" : paidStatus;
				notes.Value = (bookingNotes == null) ? "" : bookingNotes;
				cmdCreateBookingID.ExecuteNonQuery();
				result = (int)bookingID.Value;
			}
			catch (Exception)
			{

				throw;
			}
			finally
			{
				dbConnection.Close();
			}

			return result;
		}

		//call uspCreateBookingElements - Create one row in the table
		public static void CreateBookingElements(int bookingID, int roomID, DateTime date, int guests, decimal rate)
		{
			SqlConnection dbConnection = new SqlConnection(connectionString);
			SqlCommand cmdCreateBookingElements = new SqlCommand("uspCreateBookingElements", dbConnection);
			cmdCreateBookingElements.CommandType = CommandType.StoredProcedure;
			SqlParameter pBookingID = new SqlParameter("@BookingID", SqlDbType.Int);
			cmdCreateBookingElements.Parameters.Add(pBookingID);
			SqlParameter pRoomID = new SqlParameter("@RoomID", SqlDbType.Int);
			cmdCreateBookingElements.Parameters.Add(pRoomID);
			SqlParameter pDate = new SqlParameter("@DateReserved", SqlDbType.Date);
			cmdCreateBookingElements.Parameters.Add(pDate);
			SqlParameter pGuest = new SqlParameter("NumberOfGuests", SqlDbType.Int);
			cmdCreateBookingElements.Parameters.Add(pGuest);
			SqlParameter pRate = new SqlParameter("@RoomRate", SqlDbType.Decimal);
			cmdCreateBookingElements.Parameters.Add(pRate);
			try
			{
				dbConnection.Open();
				pBookingID.Value = bookingID;
				pRoomID.Value = roomID;
				pDate.Value = date;
				pGuest.Value = guests;
				pRate.Value = rate;
				cmdCreateBookingElements.ExecuteNonQuery();

			}
			catch (Exception)
			{

				throw;
			}
			finally
			{
				dbConnection.Close();
			}

		}

		//call uspCreateBookingElements - Create one or many rows in the table
		public static void CreateBookingElements(List<BookingElement> bookingElements)
		{
			SqlConnection dbConnection = new SqlConnection(connectionString);
			SqlCommand cmdCreateBookingElements = new SqlCommand("uspCreateBookingElements", dbConnection);
			cmdCreateBookingElements.CommandType = CommandType.StoredProcedure;
			SqlParameter pBookingID = new SqlParameter("@BookingID", SqlDbType.Int);
			cmdCreateBookingElements.Parameters.Add(pBookingID);
			SqlParameter pRoomID = new SqlParameter("@RoomID", SqlDbType.Int);
			cmdCreateBookingElements.Parameters.Add(pRoomID);
			SqlParameter pDate = new SqlParameter("@DateReserved", SqlDbType.Date);
			cmdCreateBookingElements.Parameters.Add(pDate);
			SqlParameter pGuest = new SqlParameter("NumberOfGuests", SqlDbType.Int);
			cmdCreateBookingElements.Parameters.Add(pGuest);
			SqlParameter pRate = new SqlParameter("@RoomRate", SqlDbType.Decimal);
			cmdCreateBookingElements.Parameters.Add(pRate);
			try
			{
				dbConnection.Open();
				foreach (var bookingElement in bookingElements)
				{
					pBookingID.Value = bookingElement.BookingID;
					pRoomID.Value = bookingElement.RoomID;
					pDate.Value = bookingElement.ReservationDate;
					pGuest.Value = bookingElement.NumberOfGuests;
					pRate.Value = bookingElement.RoomRate;
					cmdCreateBookingElements.ExecuteNonQuery();
				}

				

			}
			catch (Exception)
			{

				throw;
			}
			finally
			{
				dbConnection.Close();
			}

		}

		//call uspRetrieveRoomRate - single date
		public static decimal RetrieveRoomRate(int roomID, DateTime reservationDate)
		{
			SqlConnection dbConnection = new SqlConnection(connectionString);
			decimal roomrate;
			SqlCommand cmdRetrieveRoomRate = new SqlCommand("uspRetrieveRoomRate", dbConnection);
			cmdRetrieveRoomRate.CommandType = CommandType.StoredProcedure;
			SqlParameter pRoomID = new SqlParameter("@RoomID", SqlDbType.Int);
			cmdRetrieveRoomRate.Parameters.Add(pRoomID);
			SqlParameter pDate = new SqlParameter("@ReservationDate", SqlDbType.Date);
			cmdRetrieveRoomRate.Parameters.Add(pDate);

			var pRoomRate = new SqlParameter("@RoomRate", SqlDbType.Decimal);
			pRoomRate.Direction = ParameterDirection.ReturnValue;
			cmdRetrieveRoomRate.Parameters.Add(pRoomRate);

			try
			{
				dbConnection.Open();
				pRoomID.Value = roomID;
				pDate.Value = reservationDate;
				cmdRetrieveRoomRate.ExecuteNonQuery();
				roomrate = decimal.Parse(pRoomRate.Value.ToString());

			}
			catch (Exception)
			{

				throw;
			}
			finally
			{
				dbConnection.Close();
			}

			return roomrate;
		}

		//call uspRetrieveRoomRate - single date
		public static void RetrieveRoomRate(ref List<RoomRateByDate> dates)
		{
			SqlConnection dbConnection = new SqlConnection(connectionString);
			SqlCommand cmdRetrieveRoomRate = new SqlCommand("uspRetrieveRoomRate", dbConnection);
			cmdRetrieveRoomRate.CommandType = CommandType.StoredProcedure;
			SqlParameter pRoomID = new SqlParameter("@RoomID", SqlDbType.Int);
			cmdRetrieveRoomRate.Parameters.Add(pRoomID);
			SqlParameter pDate = new SqlParameter("@ReservationDate", SqlDbType.Date);
			cmdRetrieveRoomRate.Parameters.Add(pDate);

			var pRoomRate = new SqlParameter("@RoomRate", SqlDbType.Decimal);
			pRoomRate.Direction = ParameterDirection.ReturnValue;
			cmdRetrieveRoomRate.Parameters.Add(pRoomRate);

			try
			{
				dbConnection.Open();
				foreach (var item in dates)
				{
					pRoomID.Value = item.RoomID;
					pDate.Value = item.ReservationDate;
					cmdRetrieveRoomRate.ExecuteNonQuery();
					item.RoomRate = decimal.Parse(pRoomRate.Value.ToString());

				}

			}
			catch (Exception)
			{
				throw;
			}
			finally
			{
				dbConnection.Close();
			}
		}


		//calls uspCheckExistingCustomer
		//returns a Customer object if exists and false bool if not existing customer
		public static dynamic CheckExistingCustomer(string custemail)
		{
			SqlConnection dbConnection = new SqlConnection(connectionString);
			SqlCommand cmdCheckExistingCustomer = new SqlCommand("uspCheckExistingCustomer", dbConnection);
			cmdCheckExistingCustomer.CommandType = CommandType.StoredProcedure;
			SqlParameter pCustomerEmail = new SqlParameter("@CustomerEmail", SqlDbType.VarChar, 50);
			cmdCheckExistingCustomer.Parameters.Add(pCustomerEmail);
			Customer checkResult = new Customer();
			bool notCustomer;

			try
			{
				dbConnection.Open();
				pCustomerEmail.Value = custemail;
				SqlDataReader reader = cmdCheckExistingCustomer.ExecuteReader();
				if (reader.HasRows)
				{
					while (reader.Read())
					{
						checkResult.CustomerID = reader.GetInt32(0);
						checkResult.CustomerName = reader.GetString(1);
						checkResult.CustomerCountry = reader.GetString(2);
						checkResult.CustomerEmail = reader.GetString(3);
						checkResult.CustomerPhone = reader.GetString(4);
					}
					return checkResult;
				}
				else
				{
					notCustomer = false;
					return notCustomer.ToString();
				}
			}
			catch (Exception)
			{
				throw;
			}
			finally
			{
				dbConnection.Close();
			}
		}


		//calls uspCreateNewCustomer if not existing
		public static void CreateNewCustomer(string custEmail, string country, string name, string phone)
		{
			SqlConnection dbConnection = new SqlConnection(connectionString);
			SqlCommand cmdCreateNewCustomer = new SqlCommand("uspCreateNewCustomer", dbConnection);
			cmdCreateNewCustomer.CommandType = CommandType.StoredProcedure;
			SqlParameter pCustomerEmail = new SqlParameter("@CustomerEmail", SqlDbType.VarChar, 50);
			SqlParameter pCustomerCountry = new SqlParameter("@CustomerCountry", SqlDbType.VarChar, 20);
			SqlParameter pCustomerPhone = new SqlParameter("@CustomerPhone", SqlDbType.VarChar, 20);
			SqlParameter pCustomerName = new SqlParameter("@CustomerName", SqlDbType.VarChar, 50);

			cmdCreateNewCustomer.Parameters.Add(pCustomerEmail);
			cmdCreateNewCustomer.Parameters.Add(pCustomerName);
			cmdCreateNewCustomer.Parameters.Add(pCustomerCountry);
			cmdCreateNewCustomer.Parameters.Add(pCustomerPhone);

			try
			{
				dbConnection.Open();
				pCustomerEmail.Value = custEmail;
				pCustomerName.Value = name;
				pCustomerCountry.Value = country;
				pCustomerPhone.Value = phone;
				cmdCreateNewCustomer.ExecuteNonQuery();
			}
			catch (Exception)
			{
				throw;
			}
			finally
			{
				dbConnection.Close();
			}
		}

		//calls uspRetrieveExistingBooking
		public static List<BookingElement> RetrieveExistingBooking(string email, int bookingID)
		{
			if (String.IsNullOrEmpty(email) || bookingID == 0)
			{
				List<BookingElement> empty = new List<BookingElement>();
				return empty;
			}
			else
			{
				SqlConnection dbConnection = new SqlConnection(connectionString);
				SqlCommand cmdRetrieveExistingBooking = new SqlCommand("uspRetrieveExistingBooking", dbConnection);
				cmdRetrieveExistingBooking.CommandType = CommandType.StoredProcedure;
				SqlParameter pCustomerEmail = new SqlParameter("@CustomerEmail", SqlDbType.VarChar, 50);
				SqlParameter pBookingID = new SqlParameter("@BookingID", SqlDbType.Int);
				cmdRetrieveExistingBooking.Parameters.Add(pBookingID);
				cmdRetrieveExistingBooking.Parameters.Add(pCustomerEmail);


				List<BookingElement> existingBooking = new List<BookingElement>();
				try
				{
					dbConnection.Open();
					pBookingID.Value = bookingID;
					pCustomerEmail.Value = email;
					SqlDataReader reader = cmdRetrieveExistingBooking.ExecuteReader();
					if (reader.HasRows)
					{
						while (reader.Read())
						{

							BookingElement b = new BookingElement();
							b.ReservationDate = reader.GetDateTime(0);
							b.BookingID = reader.GetInt32(1);
							b.DateBookingCreated = reader.GetDateTime(2);
							b.Paid = reader.GetString(3);
							b.RoomID = reader.GetInt32(4);
							b.NumberOfGuests = reader.GetInt32(5);
							b.RoomRate = reader.GetDecimal(6);
							b.BookingNotes = reader.GetString(7);
							b.RoomName = reader.GetString(8);
							b.CustomerName = reader.GetString(9);
							b.CustomerCountry = reader.GetString(10);
							b.CustomerEmail = reader.GetString(11);
							b.CustomerPhone = reader.GetString(12);
							existingBooking.Add(b);
						}
					}
				}
				catch (Exception)
				{
					throw;
				}
				finally
				{
					dbConnection.Close();
				}
				return existingBooking;
			}
		}

		//call uspGetRoomTableData
		public static List<Room> GetRoomTableData()
		{
			SqlConnection dbConnection = new SqlConnection(connectionString);
			SqlCommand cmdGetRoomTableData = new SqlCommand("uspGetRoomTableData", dbConnection);
			cmdGetRoomTableData.CommandType = CommandType.StoredProcedure;
			List<Room> roomData = new List<Room>();
			using (dbConnection)
			{
				dbConnection.Open();
				SqlDataReader reader = cmdGetRoomTableData.ExecuteReader();
				while (reader.Read())
				{
					Room r = new Room();
					r.RoomID = Convert.ToInt32(reader["RoomID"]);
					r.RoomName = reader["RoomName"].ToString();
					r.MaxCapacity = Convert.ToInt32(reader["RoomMaxCapacity"]);
					r.RoomPriceSummer = Convert.ToDecimal(reader["RoomPriceSummer"]);
					r.RoomPriceWinter = Convert.ToDecimal(reader["RoomPriceWinter"]);
					roomData.Add(r);
				}
			}
			return roomData;

		}

	}
}