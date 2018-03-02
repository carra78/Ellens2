using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace EllensBnB.EllensCode
{
	public class Customer
	{
		public int CustomerID { get; set; }
		public string CustomerName { get; set; }
		public string CustomerCountry { get; set; }
		public string CustomerEmail { get; set; }
		public string CustomerPhone { get; set; }

		public Customer(int id, string name, string country, string email, string phone)
		{
			CustomerID = id;
			CustomerName = name;
			CustomerCountry = country;
			CustomerEmail = email;
			CustomerPhone = phone;
		}
		public Customer()
		{
		}

		public override string ToString()
		{
			StringBuilder sb = new StringBuilder();
			sb.Append(CustomerID);
			sb.Append(", ");
			sb.Append(CustomerEmail);
			sb.Append(", ");
			sb.Append(CustomerName);
			sb.Append(", ");
			sb.Append(CustomerCountry);
			sb.Append(", ");
			sb.Append(CustomerPhone);

			return sb.ToString();

		}
	}
}