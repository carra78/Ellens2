<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="GalwayOther.aspx.cs" Inherits="EllensBnB.Pages.GalwayOther" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta charset="utf-8">
	<meta name="description" content="Ellen's B&amp;B is the gateway to the West with easy access to the picturesque landscape of Connemara,
	Clifden and The Cliffs of Moher. 5 minutes drive by car/taxi or 25 minutes on foot will bring you to the bustling heart of Galway City
	where you can enjoy exploring the medieval streets of Galway - The city of Tribes.Sightseeing tours to Cliffs of Moher, Connemara, The Burren and the Aran Islands">
	<meta name="keywords" content="best b and b;galway b&amp;b, great b&amp;bs in galway,cheap b&amp;bs in galway, galway guesthouses,
	b&amp;bs near salthill galway,award winning, Connemara, Cliffs of Moher, Aran Island, Burren, Discounted tickets available.">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<button onclick="topFunction()" id="topBtn" title="Go to top">Top</button>
    <div role="main" id="leftcol">
        <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath>
		<h2>Galway Surrounds</h2>
		<h4><em>Sightseeing tours can be booked with Ellen's B&amp;B at a discount.</em></h4>
		<h4>Galway sightseeing</h4>
		<p>
			Galway is a perfect base to explore the wide range of attractions dotted outside of the city.  
			Within a short distance by bus or car you can visit any of the places listed below.  
			So make sure you see at least a few of these places on your next visit.
		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GO_aran_islands.jpg" width="160" height="117" class="floatleft" alt="Aran Islands">
		<p>
			<strong>The Aran Islands</strong> are located about 48km (30 miles) from the mouth of Galway Bay.  
			Inishmore (or Inis Mór) is the largest of the three islands which measures just 14km (9 miles) in length and 4.8km (3 miles) at its widest point.  
			The islands are famous for their prehistoric and Christian monuments including the spectacular Dún Aengus fort 
			that is one of best examples of this type of fort in all of Europe.
		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GO_cliffsofmoher.jpg" width="160" height="117" class="floatright" alt="Cliffs of Moher">
		<p>
			<strong>The Cliffs of Moher</strong> are one of Ireland's most visited tourist attractions.  
			Situated in North-West Clare between the villages of Liscannor and Doolin, the Cliffs of Moher are one 
			of Ireland's most spectacular natural wonders. Over 700 feet tall at their highest point, the shale and sandstone 
			cliffs drop almost vertically to the Atlantic ocean far below. From the top there are views, to the Aran Islands and Galway Bay.

		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GO_the_burren.jpg" width="160" height="117" class="floatleft" alt="The Burren">
		<p>
			<strong>The Burren</strong>, in County Clare is a barren place, famous for its unique rock formations and exceptional 
			diversity of flora and fauna. There are also large number of historic sites contained within The Burren, making it a popular 
			visitor attraction for the region. Many visitors also come for the walking, sea-angling, photography and caving that make this 
			corner of Ireland such an attraction. 
		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GO_connemara.jpg" width="160" height="117" class="floatright" alt="Connemara">
		<p>
			The distinct region of <strong>Connemara</strong> is located in the north west corner of County Galway.  
			Connemara's breathtaking landscape is a mixture of unspoilt rivers, lakes, woodlands, rich meadowlands, rugged hills, 
			dramatic mountains and stunning coastline of sandy beaches and crystal blue waters. Connemara is a Gaeltacht 
			(Irish-speaking) area, rich in Irish culture, heritage and traditions. The main town in the Connemara region is Clifden.  
			It has lots of quirky shops, restaurants and traditional Irish pubs to explore. 
		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GO_kylemoreAbbey.jpg" width="160" height="117" class="floatleft" alt="Kylemore Abbey">
		<p>
			<strong>Kylemore Abbey </strong>A trip to the West of Ireland is not complete without experiencing the beauty and tranquility 
			of Kylemore Abbey and Gardens. It has an abundance of nature trails, woodland and a beautiful walled garden that will bring you back 
			to the Victorian era. Facilities include a visitor centre, an exhibition housed in the main reception rooms of the house and a video 
			which takes the visitor through the history of the house and its occupants. 
		</p>
		<hr>
		<img runat="server" src="~/Content/caImages/tn/GO_Dungaire_Castle.jpg" width="160" height="117" class="floatright" alt="Dunguarire Castle">
		<p>
			<strong>Dunguaire Castle </strong> is a magnificent 16th century castle overlooking the village of Kinvara and Galway Bay.  
			From Apr - Sep the castle comes alive with medieval banquets &amp; performances. Part of the lore is that the Lord of the castle 
			was very generous and he continued this generosity into the afterlife. Today, if a person stands at the front gate and asks a question, 
			they will have an answer to their question by the end of the day.
		</p>
		<hr>
	</div>	<!--end of left column-->
	<div role="complementary" id="rightcol">
		<aside>
			<h3><em>BOOK SIGHTSEEING TOURS</em></h3>
			<h4>Connemara Day Tour - Departs 10am</h4>
			<ul>
				<li>Stops at Kylemore Abbey, Lennane Village, Killary Fyord and village of An Spidéal</li>
			</ul>
			<h4>Cliffs of Moher & The Burren Day Tour - Departs 10am</h4>
			<ul>
				<li>2 hours at the cliffs, stops at lunar like burren region, Dunguaire Castle, Aillwee Caves & Birds of Prey Centre</li>
			</ul>
			<h4>Cliffs of Moher Express Bus - Departs 12pm</h4>
			<ul>
				<li>A Non-Stop Express Shuttle Service to the Cliffs of Moher, with 2 hours at the cliffs before returning to Galway</li>
			</ul>
			<h4>Galway Shore Excursion - Departs 10am</h4>
			<ul>
				<li> Dunguaire castle, the round tower, Woodville Walled Garden, St Brendan's Cathedral, and Turoe Stone.</li>
			</ul>
			<h4>1 Day Tour of the Aran Islands - Departs 9am</h4>
			<ul>
				<li>Wonderful opportunity to tour one of the three Aran Islands including transfer to the harbour, ferry to the Island &amp; guiding while on the island.</li>
			</ul>
			<h4>Knock Spiritual Tour Private Tour - Departs 9am</h4>
			<ul>
				<li>The spiritual nature of this tour takes in the Marian shrine of Knock as well as the 7th century Augustinian abbey at Cong</li>
			</ul>
		</aside>
		<p>
			<img runat="server" src="~/Content/caImages/lg/GO_signs.jpg" width="200" height="300" alt="Road Signs">
		</p>

	</div> <!--end of right column-->


</asp:Content>
