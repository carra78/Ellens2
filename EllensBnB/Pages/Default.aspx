<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EllensBnB.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Ellen's B&amp;B - Home</title>
	<meta charset="utf-8">
	<meta name="description" content="Ellen's B&amp;B is the gateway to the West with easy access to the picturesque landscape of Connemara,
	Clifden and The Cliffs of Moher. 5 minutes drive by car/taxi or 25 minutes on foot will bring you to the bustling heart of Galway City
	where you can enjoy exploring the medieval streets of Galway - The city of Tribes.Cosy guest lounge, spacious dining room, fabulous rooms.">
	<meta name="keywords" content="best b and b;galway b&amp;b, great b&amp;bs in galway,cheap b&amp;bs in galway, galway guesthouses,
	b&amp;bs near salthill galway,award winning 2015 &amp;2016, lounge, dining room, family room">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<script type="text/javascript" src="/Scripts/Ellen_JSScript.js"></script>
    <script type="text/javascript" src="/Scripts/Ellen_JSScript1.js"></script>
    <div role="main" class="slideshow-container">
		<div class="mySlides fade">
			<div class="numbertext">1 / 5</div>
			<img runat="server" src="~/Content/caImages/lg/IS_Restaurants.jpg" style="width:100%" alt="Galway City Restaurants">
			<div class="text">Galway City Restaurants</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">2 / 5</div>
			<img runat="server" src="~/Content/caImages/lg/IS_Cottage.jpg" style="width:100%" alt="Connemara">
			<div class="text">Connemara</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">3 / 5</div>
			<img runat="server" src="~/Content/caImages/lg/IS_salthill_prom.jpg" style="width:100%" alt="Salthill Prominade">
			<div class="text">Salthill Prominade</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">4 / 5</div>
			<img runat="server" src="~/Content/caImages/lg/IS_Cliffsofmoherlg.jpg" style="width:100%" alt="Cliffs of Moher">
			<div class="text">Cliffs of Moher</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">5 / 5</div>
			<img runat="server" src="~/Content/caImages/lg/IS_Galway_docks.jpg" style="width:100%" alt="Galway Docks">
			<div class="text">Galway Docks</div>
		</div>
	</div>
	<div style="text-align:center">
		<span class="dot" onclick="currentSlide(1)"></span>
		<span class="dot" onclick="currentSlide(2)"></span>
		<span class="dot" onclick="currentSlide(3)"></span>
		<span class="dot" onclick="currentSlide(4)"></span>
		<span class="dot" onclick="currentSlide(5)"></span>
	</div>
	<div Id="centerCol">
		<h2>Check Out Our Comfortable Rooms and Guest Facilities</h2>
		<h4>Ellen's B&amp;B is the perfect guesthouse offering the perfect base for your holiday in the West of Ireland.</h4>
		<div class="polaroid">
			<img src="../Content/caImages/lg/IC_sitting_room.jpg" alt="Sitting Room" width="290" height="196">
			<button class="container">Cosy Guest Lounge</button>
			<div class="panel">
				<p>We have a cosy lounge that guests may use during their stay with tea/coffee making facilities.</p>
			</div>
		</div>
		<div class="polaroid">
			<img src="../Content/caImages/lg/IC_dining_room.jpg" alt="Dining Room" width="290" height="196">
			<button class="container">Spacious Dining Room</button>
			<div class="panel">
				<p>Breaksfast is included with rooms. Enjoy a great breakfast in our Dining Room. Our speciality is Eggs Benedict!</p>
			</div>
		</div>
		<div class="polaroid">
			<img src="../Content/caImages/lg/R_family_room.jpg" alt="Family Room" width="290" height="196">
			<button class="container" onclick="showPanel('family_panel')">Family Room</button>
			<div id="family_panel" class="panel">
				<p>We have options in room sizes, accommodating 1, 2, 3 &amp;4 people in our family room. Check out our <a href="Ellen_Rooms.html">Rooms</a></p>
			</div>
		</div>
	</div>
    <button onclick="topFunction()" id="topBtn" title="Go to top">Top</button>
   

</asp:Content>
