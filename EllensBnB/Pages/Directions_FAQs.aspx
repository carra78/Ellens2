<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="Directions_FAQs.aspx.cs" Inherits="EllensBnB.Pages.Directions_FAQs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Ellen's B&amp;B - Directions_FAQs</title>
	<meta charset="utf-8">
	<meta name="description" content="Ellen's B&amp;B is the gateway to the West with easy access to the picturesque landscape of Connemara,
	Clifden and The Cliffs of Moher. 5 minutes drive by car/taxi or 25 minutes on foot will bring you to the bustling heart of Galway City
	where you can enjoy exploring the medieval streets of Galway - The city of Tribes.50miles/80kms from shannon airport, 2 hour drive from Dublin airport.">
	<meta name="keywords" content="best b and b;galway b&amp;b, great b&amp;bs in galway,cheap b&amp;bs in galway, galway guesthouses,
	b&amp;bs near salthill galway,award winning,near Shannon airport, near rail and bus connections">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCdTFtI080qn1YvYJNzJEPN_qEQqXToQs0&callback=initMap">
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<button onclick="topFunction()" id="topBtn" title="Go to top">Top</button>
    <div role="main" id="leftcol">
        <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath>
		<h2 class="direction">Location of Ellen's B&amp;B in Galway</h2>
		<div id="map"></div>
		<h2 class="direction">FAQs - Frequently Asked Questions?</h2>
		<dl>
			<dt><strong>What are the check in times?</strong></dt>
			<dd>
				Regular check-in times are daily from 12pm - 6pm. Please make the B&amp;B aware 
				if you plan to arrive outside of these hours.
			</dd>
			<dt><strong>Are the homes checked by B&amp;B Ireland?</strong></dt>
			<dd>
				We are approved to Fáilte Ireland and Northern Ireland Tourist Board standards 
				(The official Irish Tourist Boards).  We have also been awarded Certificates of Excellence by tripadvisor in 2015 &amp;2016.
			</dd>
			<dt><strong>Disabled Persons</strong></dt>
			<dd>
				We are approved by Comhairle and by the National Rehabilitation Board.<br>
				Please let us know at the time of booking to ensure the appropriate room is available.
			</dd><dt><strong>Guide Dogs and Pets</strong></dt>
			<dd>
				With the exception of Guide Dogs, in the interest of hygiene pets are not allowed inside the premises.  
				We can gladly provide you with references to local kennels.
			</dd>
			<dt><strong>What credit cards are accepted?</strong></dt>
			<dd>
				We accept Visa and Mastercard credit cards.
			</dd>
			<dt><strong>What are the restrictions on smoking?</strong></dt>
			<dd>
				We do not allow smoking indoors, alternatively, we do provide outside smoking areas.
			</dd>
			<dt><strong>Where do I get tickets for tours?</strong></dt>
			<dd>
				We can organise tour tickets for the main excursions at a discount. For other events, the ticket box office is 
				located in Eyre Square,within walking distance of the Bed &amp; Breakfast.
			</dd>
			<dt><strong>Are there Restaurants nearby?</strong></dt>
			<dd>
				There are a range of restaurants to suit all tastes and budgets within walking distance.
			</dd>
			<dt><strong>Your question is not answered?</strong></dt>
			<dd>
				Please <a href="../Pages/ContactUs.aspx">contact us</a> by email or phone, we are here to help.
			</dd>
		</dl>

	</div>	<!--end of left column-->
	
	<div role="complementary" id="rightcol">
		<aside class="direction">
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
			<h3><em>Latitude, Longitude</em></h3>
			<p>(53.277232, -9.048089)</p>
			<h3>By Car</h3>
			<p>From Shannon Airport, 50ms/80kms.</p>
			<p>From Dublin Airport, approx 2 hours.</p>
			<p>
				<a target="_blank" href="https://www.maps.ie/route-planner.htm">Car Route Planner</a>
			</p>
			<h3>By Train</h3>
			<p>
				<a target="_blank" href="http://www.irishrail.ie/home/">Irish Rail</a>
				Station - just off Eyre Square.<br>
				Trains from Dublin to Galway - 2&frac12; hrs
			</p>
			<h3>By Bus</h3>
			<p>
				<a target="_blank" href="http://www.BusEireann.ie">Bus Eireann</a> - to Eyre Square.<br>
				<a target="_blank" href="http://www.citylink.ie/">Citylink</a> - to Forster street.<br>
				<a target="_blank" href="http://www.gobus.ie/">Gobus</a> - to Forster street.
			</p> 
			<h3>Car Hire</h3>
			<p>
				<a target="_blank" href="https://www.budget.ie/">Budget car rental</a>
			</p>
			<p>
				<a target="_blank" href="https://www.europcar.ie/">europcar</a>
			</p>
			<p>
				<a target="_blank" href="http://www.iwmotorhomes.ie/">Irish West Motorhomes</a>
			</p>
			<h3>Ferries</h3>
			<p><a target="_blank" href="http://www.aranislandferries.com/">Aran Island Ferries</a></p>
			<p><a target="_blank" href="http://inishbofinislanddiscovery.com/">InishBofin Ferries</a></p>
			<p><a target="_blank" href="https://www.obrienline.com/">O'Brien Line Doolin Ferries</a></p>
			<h3>Travel within Galway City</h3>
			<p>Train station and national bus stops are within walking distance of Ellen's.</p>
			<p>Taxis are available upon request.</p>
			<p>Nearest bus stop is 60 yards away.</p>
		</aside>
	</div> <!--end of right column-->

</asp:Content>
