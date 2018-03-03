﻿<%@ Page Title="" Language="C#" Culture ="en-IE" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="ExistingBooking.aspx.cs" Inherits="EllensBnB.Pages.ExistingBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Ellen's B&amp;B - Existing Booking</title>
	<meta charset="utf-8">
	<meta name="keywords" content="best b and b;galway b&amp;b, great b&amp;bs in galway,cheap b&amp;bs in galway, galway guesthouses,
	b&amp;bs near salthill galway,award winning,tripadvisor 2015,tripadvisor 2016">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

	<h2>Retrieve Existing Booking Details</h2>
	<asp:Label ID="Label1" runat="server" Text="Email"></asp:Label> &nbsp &nbsp
	<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox> &nbsp &nbsp &nbsp &nbsp

	<asp:Label ID="Label2" runat="server" Text="BookingID"></asp:Label> &nbsp &nbsp
	<asp:TextBox ID="txtBookingID" runat="server"></asp:TextBox>

	<asp:Button ID="btnRetrieveBooking" runat="server" Text="Retrieve Booking" OnClick="btnRetrieveBooking_Click" />

	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<p id="RetrieveError" runat="server">
				No booking with that email and / or booking ID exists - please try again
			</p>
			<p id="RetrievedData" runat="server">
				Reservation information:	<br />
				Booking ID: &nbsp &nbsp  <asp:Label runat="server" ID="lblBookingID"></asp:Label><br />
				Email : &nbsp &nbsp <asp:Label runat="server" ID="lblEmail"></asp:Label><br />
				Guest Name: &nbsp &nbsp<asp:Label runat="server" ID="lblRetrieveName"></asp:Label>	<br />
				Guest Country: &nbsp &nbsp<asp:Label runat="server" ID ="lblRetrieveCountry"></asp:Label> <br />
				Guest Phone: &nbsp &nbsp<asp:Label runat="server" ID="lblRetrievePhone"></asp:Label> <br />
				BookingNotes:&nbsp &nbsp <asp:Label runat="server" ID="lblRetrieveBookingNotes"></asp:Label> <br />
			</p>
			<asp:GridView ID="gvRetrieveBooking" runat="server" AutoGenerateColumns ="false">
				<Columns>
					<asp:BoundField DataField ="UserDate" HeaderText="Reservation Date" DataFormatString="{0:d}" />
					<asp:BoundField DataField="RoomName" HeaderText="Room Reserved" />
					<asp:BoundField DataField="NumberOfGuests" HeaderText="No of Guests" />
					<asp:BoundField DataField="RoomRate" HeaderText="Room Rate" DataFormatString="{0:c}" />

				</Columns>
			</asp:GridView>
		</ContentTemplate>
		<Triggers>
			<asp:AsyncPostBackTrigger ControlID ="btnRetrieveBooking" EventName="Click" />
		</Triggers>


	</asp:UpdatePanel>




</asp:Content>