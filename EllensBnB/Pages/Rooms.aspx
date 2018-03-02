<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="EllensBnB.Pages.Rooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Ellen's B&amp;B - Rooms</title>
	<meta charset="utf-8">
	<meta name="description" content="Ellen's B&amp;B is the gateway to the West with easy access to the picturesque landscape of Connemara,
	Clifden and The Cliffs of Moher. 5 minutes drive by car/taxi or 25 minutes on foot will bring you to the bustling heart of Galway City
	where you can enjoy exploring the medieval streets of Galway - The city of Tribes. Newly renovated bed &amp; breakfast with all facilities upgraded to highest standard.">
	<meta name="keywords" content="best b and b;galway b&amp;b, great b&amp;bs in galway,cheap b&amp;bs in galway, galway guesthouses,
	b&amp;bs near salthill galway,award winning,newly renovated,modern, room options">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<button onclick="topFunction()" id="topBtn" title="Go to top">Top</button>
    <div role="main" id="leftcol">
        <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath>
		<h2>Room Options at Ellen's</h2>
		<p>
			At Ellen's Bed and Breakfast we pride ourselves by ensuring your stay with us is relaxing and comfortable.
		</p>
		<p>
			We have a number luxurious furnished rooms for your sleeping comfort. We have double, twin, triple and family suites available.
		</p>
		<p>
			Each room is non-smoking, own private bathroom with full size baths, separate walk-in tropical rain showers, 
			spotlessly clean and tastefully decorated.
		</p>
		<p>
			All rooms have central heating, iron and ironing board, hairdryer, with 32" to 40" flat T.V. and tea/coffee making facilities.
		</p>
		<p>
			Full breakfast, free 24-hour wireless broadland internet access throughout, free private off street car park and all 
			taxes are included in the rate.
		</p>
		<ul>
			<li>Our bed and breakfast rates vary on the time year.</li>
			<li>We are open all year round.</li>
			<li>For excellent rates on Galway Accommodation look no further than the Ellen's B&amp;B Guesthouse.</li>
		</ul>
		<table role="grid">
			<thead>
				<tr>
					<th id="roomRates">Room Rates</th>
					<th id="singleRoom">The Tara Suite<br><small>1 Person</small></th>
					<th id="doubleTwin">The Lir Suite<br><small>2 People</small></th>
					<th id="doubleTwin2">The Boyne Suite<br><small>2 -3 People</small></th>
					<th id="familyRooms">The Kells Suite<br><small>3 - 4 People</small></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="5"><small><em>Why not contact us, rates can vary depending on length of stay</em></small></td>
				</tr>
			</tfoot>
			<tbody>
				<tr>
					<th id="Winter">Winter<br><small>Oct1 - Mar 31</small></th>
					<td headers="singleRoom">&euro;60</td>
					<td headers="doubleTwin">&euro;90</td>
					<td headers="doubleTwin2">&euro;100</td>
					<td headers="familyRooms">&euro;120</td>
				</tr>
				<tr>
					<th id="Summer">Summer<br><small>Apr1 - Sep 30</small></th>
					<td headers="singleRoom">&euro;90</td>
					<td headers="doubleTwin">&euro;120</td>
					<td headers="doubleTwin2">&euro;135</td>
					<td headers="familyRooms">&euro;150</td>
				</tr>
			</tbody>
		</table>
		<ul>
			<li>Regular check-in times are daily from 12pm - 6pm.</li>
			<li>Breakfast is served from 7.30am weekdays and 7am weekends.</li>
			<li>Please make the B&amp;B aware if you plan to arrive outside of these hours or require an earlier breakfast.</li>
		</ul>
		<div id="gallery">
			<ul>
				<li>
					<a target="_blank" runat="server" href="~/Content/caImages/lg/R_single_room.jpg">
						<figcaption>The Tara Suite</figcaption>
						<img class="rmImg" runat="server" src="~/Content/caImages/tn/R_single_room.jpg" width="175" height="125">
					</a>
				</li>
				<li>
					<a target="_blank" runat="server" href="~/Content/caImages/lg/R_twin_room.jpg">
						<figcaption>The Lir Suite</figcaption>
						<img class="rmImg" runat="server" src="~/Content/caImages/tn/R_twin_room.jpg" width="175" height="125"/>
					</a>
				</li>
				<li>
					<a target="_blank" runat="server" href="~/Content/caImages/lg/R_triple_room.jpg">
						<figcaption>The Boyne Suite</figcaption>
						<img class="rmImg" runat="server" src="~/Content/caImages/tn/R_triple_room.jpg" width="175" height="125">
					</a>
				</li>
				<li>
					<a target="_blank" runat="server" href="~/Content/caImages/lg/R_family_room.jpg">
						<figcaption>The Kells Suite</figcaption>
						<img class="rmImg" runat="server" src="~/Content/caImages/tn/R_family_room.jpg" width="175" height="125">
					</a>
				</li>
				<li>
					<a target="_blank" runat="server" href="~/Content/caImages/lg/R_Bathroom.jpg">
						<figcaption>Bathroom</figcaption>
						<img class="rmImg" runat="server" src="~/Content/caImages/tn/R_Bathroom.jpg" width="175" height="125">
					</a>
				</li>
				<li>
					<a target="_blank" runat="server" href="~/Content/caImages/lg/R_Entrance_Hall.jpg">
						<figcaption>Entrance Hall</figcaption>
						<img class="rmImg" runat="server" src="~/Content/caImages/tn/R_Entrance_Hall.jpg" width="175" height="125">
					</a>
				</li>
			</ul>
		</div>
		<ul>
			<li><strong>The Tara Suite</strong> - Single Room – sleeps max of 1 person. Own private balcony.</li>
			<li><strong>The Lir Suite</strong> - Double or Twin Room – sleeps max of 2 people.</li>
			<li><strong>The Boyne Suite</strong> - Triple Room – sleeps max of 3 people. Three single beds or one double bed and one single bed provided.</li>
			<li><strong>The Kells Suite</strong> - Family Room – sleeps max of 2 adults and 2 children. One double and two single beds. Cots available.</li>
		</ul>
		<p>
			We have plenty of options in rooms, accommodating 1, 2, 3, &amp; upto 4 people in our family room "The Kells Suite". All rooms are serviced daily with fresh towels	
			and Tea/Coffee making facilities are replenished if needed.
		</p>
	</div>	<!--end of left column-->

	<div role="complementary" id="rightcol">
		<aside>
			<!--
			<form method="get">
				<fieldset class="booking">
					<legend>Booking form</legend>
					<label for="myDate1">Checkin</label>
					<input required class="booking" type="date" name="myDate1" id="myDate1"><br>
					<label for="myDate2">Checkout</label>
					<input required class="booking" type="date" name="myDate2" id="myDate2"><br>
					<label class="booking" for="email"><span>*</span>E-mail:</label>
					<input required class="booking" type="email" id="email" name="email" placeholder="Your email...">
					<input class="booking" type="submit" onclick="CheckDate()" value ="send"> <input class="booking" type="reset">
				</fieldset>
			</form> -->
			<h3>Breakfast choices</H3>
			<ul>
				<li>Juice</li>
				<li>Cereals</li>
				<li>Fresh Fruit</li><li>Yogurt</li>
				<li>Cereals</li>
				<li>Cooked meats and cheeses</li>
				<li>Eggs - anyway you like...</li>
				<li>Omelettes - smoked salmon</li>
				<li>Speciality - Eggs Benedict</li>
			</ul>
			<h3>Gluten Free</H3>
			<ul>
				<li>Gluten free menu available</li>
			</ul>
			<p>
				<em>"I am trained as a chef and take great pride and pleasure in presenting and creating breakfast options that will tempt anyone!"</em>
			</p>
		</aside>
		<aside>
			<h3>Facilities</h3>
			<ul>
				<li>Free WiFi</li>
				<li>Flat TV</li>
				<li>Hairdryer</li>
				<li>Free Parking</li>
				<li>Iron and Ironing board</li>
				<li>Tea/Coffee making facilities</li>
			</ul>
			<h3>Facilities nearby</h3>
			<ul>
				<li>Coastal walks</li>
				<li>3 Sandy beaches</li>
				<li>Irish music pubs</li>
				<li>Variety of restuarants</li>
				<li>Eyre Square Shopping Centre</li>
			</ul>
			<h3>Other options</H3>
			<ul>
				<li>Golfing</li>
				<li>Fishing</li>
				<li>Horse riding</li>
				<li>Bike hire</li>
				<li>Water sports</li>
			</ul>
		</aside>
		<p>
			<img runat="server" src="~/Content/caImages/tn/tripadvisor2016.jpg" width="200" height="150" alt="Trip Advisor Cert 2016">
		</p>
	</div>
</asp:Content>
