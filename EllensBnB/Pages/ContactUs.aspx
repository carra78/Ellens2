<%@ Page Title="" Culture="en-IE" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs3.aspx.cs" Inherits="EllensBnB.Pages.ContactUs3" %>
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
        <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath><br />

		
		<div id="panels">
			<!--Default on all to be set to invisible-->
			<!--Appear when user clicks Make New Reservation button-->
			

			<asp:ScriptManager ID="ScriptManager1" runat="server">
			</asp:ScriptManager>


			<asp:UpdatePanel ID="UpdatePanelCalendar" runat="server" UpdateMode="Conditional">
				<ContentTemplate>
					
					<p class="bookingOption"><strong>Please select dates to check room availibility</strong></p>					
					<asp:Calendar ID="EllensWebCalendar" runat="server" OnDayRender="EllensCalendar_DayRender" OnSelectionChanged="EllensCalendar_SelectionChanged" Width="835px"></asp:Calendar>
					<asp:ListBox runat="server" ID="lstUserSelectedDates" CssClass="listBox" Rows="4"></asp:ListBox>
					
					<asp:Button runat="server" Text="Select Dates" CssClass="selectBtn" ID="btnSelectDates" OnClick="btnSelectDates_Click" />
					&nbsp;&nbsp;
					<asp:Button runat="server" Text="Clear Dates" ID="btnClearDates" OnClick="btnClearDates_Click" />
					&nbsp;&nbsp;
					<asp:Button ID="CheckAvailabilitySelectedDates" runat="server" CssClass="availBtn" Text="Check Availability" OnClick="CheckAvailabilitySelectedDates_Click" />
					<p id ="NoAvailability" runat="server" visible ="false">
						Sorry - no rooms available on selected date(s) - Please try again
					</p>
				</ContentTemplate>
			</asp:UpdatePanel>

			<asp:UpdatePanel ID="UpdatePanelReturnAvailability" runat="server" UpdateMode="Conditional">
				<ContentTemplate>					
					<asp:GridView ID="gvAvailability" runat="server" AutoGenerateColumns ="False">
						<Columns>
							<asp:BoundField DataField="UserDate" HeaderText="Your selected dates"
								DataFormatString ="{0:d}" />
							<asp:BoundField DataField="RoomID" HeaderText="RoomID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
							<asp:BoundField DataField="RoomName" HeaderText="Room" />
							<asp:BoundField DataField="MaxCapacity" HeaderText="Max Capacity" />
							<asp:BoundField DataField="RoomRate" HeaderText="Rate" 
								DataFormatString ="{0:c}"/>
							<asp:TemplateField HeaderText ="No of Guests">
								<ItemTemplate>
									<asp:DropDownList ID="ddlUserGuests" runat="server" 										
										DataField ="NumberOfGuests">										
									</asp:DropDownList>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Select">
								<ItemTemplate>									
									<asp:CheckBox ID="cbxUserSelection" runat="server" 
										checked ='<%# Convert.ToBoolean(Eval("UserSelected")) %>' />									
								</ItemTemplate>
							</asp:TemplateField>	
						</Columns>
					</asp:GridView>
					<br /> 
					<p>Add any additional notes or comments here (e.g. Early or late arrival, allergies, etc.):</p>
					<asp:TextBox ID="txtCustomerBookingNotes" runat="server" Height="69px" Width="852px"></asp:TextBox>
					<br />
					
				</ContentTemplate>
			</asp:UpdatePanel>

			
			<asp:UpdatePanel ID="UpdatePanelRegisterNewCustomer" runat="server" UpdateMode="Conditional">
				<ContentTemplate>
					<asp:Label ID="lblEmail" runat="server" CssClass="show" Text="Email: "></asp:Label>					
					<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
						ControlToValidate="txtEmail" Display="Dynamic" 
						ErrorMessage="Email address is required" ValidationGroup="CustomerCheck">*</asp:RequiredFieldValidator> 
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
						ControlToValidate="txtEmail" Display="Dynamic" 
						ErrorMessage="E-mail addresses must be in the format of name@domain.xyz." 
						ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
						ValidationGroup="CustomerCheck">Invalid format!</asp:RegularExpressionValidator>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
						ControlToValidate="txtEmail" Display="Dynamic" 
						ErrorMessage="Email address is required" ValidationGroup="CustomerDetails">*</asp:RequiredFieldValidator> 
					<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
						ControlToValidate="txtEmail" Display="Dynamic" 
						ErrorMessage="E-mail addresses must be in the format of name@domain.xyz." 
						ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
						ValidationGroup="CustomerDetails">Invalid format!</asp:RegularExpressionValidator>
					<asp:TextBox ID="txtEmail" runat="server" CssClass="show"></asp:TextBox> 
					<asp:Button ID="btnCheckExisting" runat="server" Text="Look Up Email"  Width="150px" OnClick="btnCheckExisting_Click" ValidationGroup="CustomerCheck" />
					<br />
					<p id ="NotExistingCustomer" runat ="server" visible ="false">
						No details found - please enter your information below.
					</p >
					<asp:Label ID="lblCustomerName" runat="server" Text="Name:" CssClass ="hidden" ></asp:Label>
					
					<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
						ErrorMessage="Name cannot be blank" Display="Dynamic"  
						ControlToValidate="txtCustomerName" ValidationGroup="CustomerDetails">*</asp:RequiredFieldValidator> 
					<asp:TextBox ID="txtCustomerName" runat="server" CssClass ="hidden"></asp:TextBox> 
					<br />
					<asp:Label ID="lblCustomerPhone" runat="server" Text="Telephone:" CssClass="hidden" ></asp:Label> 
					
					<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
						ErrorMessage="Phone cannot be blank" Display="Dynamic" 
						ControlToValidate="txtCustomerPhone" ValidationGroup="CustomerDetails" >*</asp:RequiredFieldValidator> 
					<asp:TextBox ID="txtCustomerPhone" runat="server" CssClass="hidden"></asp:TextBox>
					<br />
					<asp:Label ID="lblCustomerCountry" runat="server" Text="Country:" CssClass="hidden"></asp:Label> 					
					<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
						ErrorMessage="Please select a country" ControlToValidate="ddlCountry"
						InitialValue ="NA" Display="Dynamic" ValidationGroup="CustomerDetails" >*</asp:RequiredFieldValidator> 
					<asp:DropDownList ID="ddlCountry" runat="server" CssClass="hidden">                        
					</asp:DropDownList>
					<br />			
					
					
					<asp:Button ID="MakeBooking" runat="server" Text="Make Booking" 
						CssClass ="hidden" OnClick="MakeBooking_Click" 
						ValidationGroup ="CustomerDetails" />
					<p id ="NothingSelected" runat="server" visible="false">Missing booking information - please try again</p>
				</ContentTemplate>

			</asp:UpdatePanel>

		</div>

		</div>
	
	<div role="complementary" id="rightcol"> 
		<div >
			
			<br /><br />
			<asp:Button ID="btnExistingBookingASP" runat="server" Text="Retrieve Existing Booking"
				CssClass ="retrieveBooking" OnClick="btnExistingBookingASP_Click" />
			<br />
			
		</div>
		
		<h3>Ellen Smith Bed &amp; Breakfast</h3>
		<p>12 St Bridgets Terrace,</p>
		<p>Galway.</p>
		<p>Tel:+353(0)87 234 5678</p>
		

		<p><img runat="server" src="~/Content/caImages/tn/tripadvisor2016.jpg" width="200" height="150" alt="Trip Advisor Cert 2016"></p>
		<p><img runat="server" src="~/Content/caImages/tn/tripadvisor2015.jpg" width="200" height="150" alt="Trip Advisor Cert 2015"></p>

	</div> <!--end of right column-->



    



</asp:Content>
