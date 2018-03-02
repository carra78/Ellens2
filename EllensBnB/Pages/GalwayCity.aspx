<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="GalwayCity.aspx.cs" Inherits="EllensBnB.Pages.GalwayCity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta charset="utf-8">
	<meta name="description" content="Ellen's B&amp;B is the gateway to the West with easy access to the picturesque landscape of Connemara,
	Clifden and The Cliffs of Moher. 5 minutes drive by car/taxi or 25 minutes on foot will bring you to the bustling heart of Galway City
	where you can enjoy exploring the medieval streets of Galway - The city of Tribes.Bus tours, walking tours, beaches, .">
	<meta name="keywords" content="best b and b;galway b&amp;b, great b&amp;bs in galway,cheap b&amp;bs in galway, galway guesthouses,
	b&amp;bs near salthill galway,near beaches, walking tours, hire bicycles, go horse riding">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<button onclick="topFunction()" id="topBtn" title="Go to top">Top</button>
    <div role="main" id="leftcol">
        <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath>
		<h2>Galway City Sights &amp; Activities</h2>
		<h4><em>Sightseeing tours can be booked with Ellen's B&amp;B at a discount.</em></h4>
		<h4>Galway City Sights</h4>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GC_galway_city_tours.jpg" width="160" height="117" class="floatleft" alt="Bus Hopon Hopoff">
		<p>
			<strong>Hop-on, Hop-off</strong> sightseeing tours of Galway City with <a target="_blank" href="http://lallytours.com/shop/g-gct/">Lally Tours.</a>
			Explore Galway with their friendly, knowledgeable guides to learn about this colourful city and see it from the best perspective, 
			their open top bus! On this tour, you’ll discover everything from medieval walls in the city centre to
			the sandy beaches of Salthill. Tour tickets are valid for 24 hours, and regularly departs from Eyre 
			Square &amp; Salthill, you can explore our favourite city.
		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GC_eyre_square.jpg" width="160" height="117" class="floatright" alt="Eyre Square">
		<p>
			<strong>Eyre Square</strong> is the centre piece to Galway City and over the years has been previously renamed in 1965, the "Kennedy Memorial Park"
			in honour of US President John F. Kennedy, who visited here shortly before his assassination in 1963. The park features the Quincentennial 
			fountain (1984) which is a representation of the Galway Hooker, which is a traditional fishing boat unique to Galway.  
		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GC_claddagh.jpg" width="160" height="117" class="floatleft" alt="the Claddagh">
		<p>
			<strong>The Claddagh</strong> The name of the Claddagh area is based on the Irish word "cladach", meaning a stony beach.  
			Legend has it that this area was most famous for the Claddagh ring, which was created by jeweller, Richard Joyce.  
			The design of the ring symbolises love, friendship and loyalty and is of two clasped hands holding a crowned heart 
			and is a popular souvenir for visitors to the city.
		</p>
		<hr>
		<h4><em>Other Activities</em></h4>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GC_golf.jpg" width="160" height="117" class="floatright" alt="Golf Course">
		<p>
			<strong>Golf Courses</strong> Ireland's West is littered with championship courses and challenging links 
			in some of Ireland's most beautiful landscapes as well as a range of nine hole courses where locals play all year round.  
			Although the main golf season runs from April to October, you can golf throughout the year so there’s no excuse not to fit in a game.  
			<a target="_blank" href="http://www.galwaygolf.com/">GalwayGolf</a> and <a target="_blank" href="http://www.galwaybaygolfresort.com/">GalwayBayResort</a> are two clubs located nearby.
		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GC_Horseriding.jpg" width="160" height="117" class="floatleft" alt="Horse Riding">
		<p>
			<strong>Horse Riding</strong> The <a target="_blank" href="http://www.clegganridingcentre.com/">Cleggan Beach Riding Centre</a>
			is Ireland’s premier horse riding holiday experience. Located in a beautiful seaside setting in Cleggan, Connemara,
			it has everything you could want for a perfect getaway.  Take some horse riding lessons in this beautiful setting, 
			or trek along the beach to Omey island. A vacation on the Wild Atlantic Way should definitely include this amazing experience.
		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GC_seafishing.jpg" width="160" height="117" class="floatright" alt="the Claddagh">
		<p>
			<strong>Angling </strong>With so many lakes, sea inlets and rivers, County Galway is an angler’s paradise.	
			Fishing in Galway is a wonderful experience; peaceful surroundings, majestic mountain ranges and stunning seascapes…what more could you ask for?  
			The choice for the keen angler includes lake fishing on Lough Corrib, sea fishing in Galway Bay, 
			salmon fishing at the weir on the River Corrib or fresh water fishing in the many rivers and mountain streams of Connemara. 
		</p>
		<hr>
	</div>	<!--end of left column-->
	<div role="complementary" id="rightcol">
		<aside>
			<h3><em>Upcoming Events</em></h3>
			<h4>May 2018</h4>
			<ul>
				<li>
					<a target="_blank" href="http://connemaramusselfestival.com/">Connemara Mussel Festival</a><br />
					<strong>28th April - 01st May 2018</strong><br />
					<em>"Cooking demonstrations, live music and of course plenty of mussels".</em>
				</li>
				<li>
					<a target="_blank" href="http://www.galwaybluechallenge.org/">Galway Blue Challenge</a><br>
					<strong>13th - 14th May 2018</strong><br />
					<em>"Challenge yourself in 2018...Cycle - Climb - Cycle."</em>
				</li>
				<li>
					<a target="_blank" href="http://galwayearlymusic.com/">Galway Early Music Festival</a><br>
					<strong>19th - 21st May 2018</strong><br />
					<em>"promoting the best of medieval, renaissance and baroque music making in Galway since 1996."</em>
				</li>
				<li>
					<a target="_blank" href="http://www.huiceiri.ie/">Galway Hooker Regatta</a><br />
					<strong>27th - 28th May 2018</strong><br />
					<em>"Traditional sailing boats"</em>
				</li>
			</ul>
		</aside>
		<p>
			<img runat="server" src="~/Content/caImages/tn/GC_hookers.jpg" width="210" height="180" alt="Hookers">
		</p>
		<aside>
			<h4>June 2018</h4>
			<uL>
				<li>
					<a target="_blank" href="http://www.galwaycycling.org/">Galway Bike Week</a><br>
					<strong>06th - 12th June 2018</strong><br />
					<em>"cycling events all over Galway county, organised the local authority, community groups, charities and cycling groups."</em>
				</li>
				<li>
					<a target="_blank" href="http://galwayrowingclub.ie/">Galway Rowing Regatta</a><br>
					<strong>18th June 2018</strong><br />
					<em>"Galway’s oldest rowing regatta, this year it celebrates its 133rd anniversary"</em>
				</li>
				<li>
					<a target="_blank" href="http://gaelforceevents.com/">Gaelforce West</a><br />
					<strong>24th June 2018</strong><br />
					<em>"Largest one day adventure race of its kind in the world involving cycling, running, hiking and kayaking."</em>
				</li>
				<li><a target="_blank" href="http://cliffdiving.redbull.com/en_IE">Red Bull Cliff Diving World Series</a><br>
					<strong>24th June 2018</strong><br />
					<em>"INIS MÓR.Standing 27m./ 90 ft. (men) and 21m. / 70 ft. (women) in height, divers will reach speeds more than 85km/h before meeting the wild Atlantic below. "</em>
				</li>
			</ul>
		</aside>
	</div> <!--end of right column-->

</asp:Content>
