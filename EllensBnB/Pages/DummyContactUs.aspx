<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="DummyContactUs.aspx.cs" Inherits="EllensBnB.Pages.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Ellen's B&amp;B - Contact Us</title>
	<meta charset="utf-8">
	<meta name="description" content="Ellen's B&amp;B is the gateway to the West with easy access to the picturesque landscape of Connemara,
	Clifden and The Cliffs of Moher. 5 minutes drive by car/taxi or 25 minutes on foot will bring you to the bustling heart of Galway City
	where you can enjoy exploring the medieval streets of Galway - The city of Tribes.
	Contact us form, trip advisor certificates for 2015 and 2016">
	<meta name="keywords" content="best b and b;galway b&amp;b, great b&amp;bs in galway,cheap b&amp;bs in galway, galway guesthouses,
	b&amp;bs near salthill galway,award winning,tripadvisor 2015,tripadvisor 2016">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<button onclick="topFunction()" id="topBtn" title="Go to top">Top</button>
    <div role ="main" id="leftcol">
		<div class="bookingOption">
			<asp:Button ID="SelectMakeBooking" runat="server" Text="Make New Reservation" CssClass="bookingOption" OnClick="SelectMakeBooking_Click" />
			<asp:Button ID="SelectExistingBooking" runat="server" Text="Update Existing Reservation" CssClass ="bookingOption" OnClick="SelectExistingBooking_Click"/>
			
		</div>

		<div id="panels">
			<!--Default on all to be set to invisible-->
			<!--Appear when user clicks Make New Reservation button-->
			

			<asp:ScriptManager ID="ScriptManager1" runat="server">
			</asp:ScriptManager>


			<asp:UpdatePanel ID="UpdatePanelCheckDatesAreAvailable" runat="server" UpdateMode="Conditional">


			</asp:UpdatePanel>
			<asp:UpdatePanel ID="UpdatePanelCreateBooking" runat="server" UpdateMode="Conditional">
				<ContentTemplate>
                    
					<p class = "bookingOption">Please select dates to check room availibility</p>
					<asp:Calendar runat="server" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
					<asp:Button runat="server" Text="Button" />
					<asp:Button runat="server" Text="Button" />
					<asp:ListBox runat="server"></asp:ListBox>
				</ContentTemplate>
			</asp:UpdatePanel>
			

		</div>
		

	</div>
	
	<div role="complementary" id="rightcol"> 
		<!--
		<form method="get">
			<input class="search" type="search" name="keyword" id="keyword" placeholder="Search here..." >
			<input class="search" type="submit" value="Go">

		</form> -->
		<h3>Ellen Smith Bed &amp; Breakfast</h3>
		<p>12 St Bridgets Terrace,</p>
		<p>Galway.</p>
		<p>Tel:+353(0)87 234 5678</p>
		<p><img runat="server" src="~/Content/caImages/tn/tripadvisor2016.jpg" width="200" height="150" alt="Trip Advisor Cert 2016"></p>
		<p><img runat="server" src="~/Content/caImages/tn/tripadvisor2015.jpg" width="200" height="150" alt="Trip Advisor Cert 2015"></p>

	</div> <!--end of right column-->

</asp:Content>
