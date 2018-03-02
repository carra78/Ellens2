<%@  Page Culture ="en-IE" Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="EllensBnB.Pages.ContactUs1" %>
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
        <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath>
		<div class="bookingOption">
			<asp:Button ID="MakeNewReservation" runat="server" Text="Make New Reservation" CssClass="bookingOption" OnClick="MakeNewReservation_Click" />
			<asp:Button ID="UpdateExistingReservation" runat="server" Text="Update Existing Reservation" CssClass ="bookingOption" OnClick="UpdateExistingReservation_Click"/>
			
		</div>

		<div id="panels">
			<!--Default on all to be set to invisible-->
			<!--Appear when user clicks Make New Reservation button-->
			

			<asp:ScriptManager ID="ScriptManager1" runat="server">
			</asp:ScriptManager>


			<asp:UpdatePanel ID="UpdatePanelCalendar" runat="server" UpdateMode="Conditional">
				<ContentTemplate>
					<p class = "bookingOption">Please select dates to check room availibility</p>					
					<asp:Calendar ID="EllensWebCalendar" runat="server" OnDayRender="EllensCalendar_DayRender" OnSelectionChanged="EllensCalendar_SelectionChanged" Width="835px"></asp:Calendar>
					<asp:ListBox runat="server" ID="lstUserSelectedDates" Width="260px"></asp:ListBox>
					&nbsp;
					<asp:Button runat="server" Text="Select Dates" ID="btnSelectDates" OnClick="btnSelectDates_Click" />
					&nbsp;&nbsp;
					<asp:Button runat="server" Text="Clear Dates" ID="btnClearDates" OnClick="btnClearDates_Click" />
					&nbsp;&nbsp;
					<asp:Button ID="CheckAvailabilitySelectedDates" runat="server" Text="Check Availability" OnClick="CheckAvailabilitySelectedDates_Click" />
					
				</ContentTemplate>
			</asp:UpdatePanel>
       	
		
		<asp:UpdatePanel ID="UpdatePanelReturnAvailability" runat="server" UpdateMode="Conditional">
				<ContentTemplate>
					
					<asp:GridView ID="gvAvailability" runat="server" AutoGenerateColumns ="False">
						<Columns>
							<asp:BoundField DataField="UserDate" HeaderText="Your selected dates"
								DataFormatString ="{0:d}" />
							<asp:BoundField DataField="RoomID" HeaderText="Room" />
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
					<asp:Label ID="lblCustomerEmail" runat="server" Text="Enter email address:  " validationgroup="UpdatePanelReturnAvailabilityValidation"></asp:Label> &nbsp &nbsp
					<asp:TextBox ID="txtCustomerEmail" runat="server" validationgroup="UpdatePanelReturnAvailabilityValidation"></asp:TextBox>
					<br />
					<asp:Button ID="ReserveSelectedRooms" runat="server" Text="ReserveSelectedRooms" OnClick="ReserveSelectedRooms_Click" validationgroup="UpdatePanelReturnAvailabilityValidation"/>
					<br />
					
                     <!--  Email TxtBox Validation PT  1 -->                         <!--not in use............enableclientscript="false" -->
                     <asp:RequiredFieldValidator    
                                    ID="nameRequiredFieldValidator"         runat="server" 
                                    validationgroup="UpdatePanelReturnAvailabilityValidation"
                                    ControlToValidate="txtCustomerEmail"    Display="Dynamic"
                                    ErrorMessage="Email can't be blank"     ForeColor="Red"   
                                   
                            ></asp:RequiredFieldValidator>

                    <!--  Email TxtBox Validation PT  2 -->
                    <asp:RegularExpressionValidator     
                                    ID="emailRegularExpressionValidator"    runat="server" 
                                    validationgroup="UpdatePanelReturnAvailabilityValidation"
                                    ControlToValidate="txtCustomerEmail"    Display="Dynamic" 
                                    ErrorMessage="Please enter an email in a valid format"  ForeColor="Red"                                     
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ></asp:RegularExpressionValidator>      
                    
					<asp:Label ID="GordTestLabelRESERVE" runat="server" Text="Label"></asp:Label>
				</ContentTemplate>
			</asp:UpdatePanel>
						
			<asp:UpdatePanel ID="UpdatePanelRegisterNewCustomer" runat="server">
				<ContentTemplate>
					<asp:Label ID="lblEnteredCustomerEmail" runat="server" Text="">
						The inner HTML on this label needs to be set to the customer email provided
					</asp:Label>
					<br />
					<asp:Label ID="lblCustomerName" runat="server" Text="Name:  "></asp:Label> &nbsp &nbsp
					<asp:TextBox ID="txtCustomerName" runat="server" validationgroup="RegisterNewCustomerValidation"></asp:TextBox>
					<br />                                        			
			
                    <!--  txtCustomerName Validation PT  1 -->
                     <asp:RequiredFieldValidator    
                                    ID="RequiredFieldValidator1"          runat="server" 
                                    validationgroup="RegisterNewCustomerValidation"
                                    ControlToValidate="txtCustomerName"    Display="Dynamic"
                                    ErrorMessage="Name can't be blank"     ForeColor="Red"                                   
                            ></asp:RequiredFieldValidator>
					<br />

					<asp:Label ID="lblCustomerPhone" runat="server" Text="Telephone:  "></asp:Label> &nbsp &nbsp
					<asp:TextBox ID="txtCustomerPhone" runat="server" validationgroup="RegisterNewCustomerValidation"></asp:TextBox>
					<br />

                      <!--  txtPhoneNo Validation PT  1 -->
                     <asp:RequiredFieldValidator    
                                    ID="RequiredFieldValidator2"          runat="server" 
                                    validationgroup="RegisterNewCustomerValidation"
                                    ControlToValidate="txtCustomerPhone"  Display="Dynamic"
                                    ErrorMessage="Telephone Phone Number can't be blank"    ForeColor="Red"                                     
                            ></asp:RequiredFieldValidator>
					<br />
					<asp:Label ID="GordTestLabelNewCustomer" runat="server" Text="Label"></asp:Label>

					<asp:Label ID="lblCustomerCountry" runat="server" Text="Country"></asp:Label> &nbsp &nbsp
					<asp:DropDownList ID="ddlCountry" runat="server">
                        
                    </asp:DropDownList>
					<br />
					
					<asp:Button ID="CreateNewAccount" runat="server" Text="Create New Account" OnClick="CreateNewAccount_Click" validationgroup="RegisterNewCustomerValidation" />
				</ContentTemplate>

			</asp:UpdatePanel>
			
			<asp:UpdatePanel ID="UpdatePanelBookingConfirmation" runat="server">
				<ContentTemplate>
					<h2>Thank you for your reservation.</h2>
					<p>Your booking reference number is: <span runat="server" id="BookingIDReference">0</span></p>
				</ContentTemplate>

			</asp:UpdatePanel> 

			<asp:UpdatePanel ID ="UpdatePanelRetrieveBooking" runat="server">
				<ContentTemplate>
					<asp:Label ID="lblRetrieveBookingEmail" runat="server" Text="Email"></asp:Label>
					&nbsp;&nbsp;<asp:TextBox ID="txtRetrieveBookingEmail" runat="server"></asp:TextBox>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<asp:Label ID="lblRetrieveBookingID" runat="server" Text="BookingID"></asp:Label>
					&nbsp;
					<asp:TextBox ID="txtRetrieveBookingID" runat="server"></asp:TextBox>
					&nbsp;&nbsp;
					<asp:Button ID="btnRetrieveBooking" runat="server" Text="Retrieve Booking" OnClick="btnRetrieveBooking_Click" />
					<p>Reservation information: <br />
						Guest Name: <asp:Label runat="server" ID="lblRetrieveName"></asp:Label>
						<br />
						Guest Country: <asp:Label runat="server" ID ="lblRetrieveCountry"></asp:Label>
						<br />
						Guest Phone: <asp:Label runat="server" ID="lblRetrievePhone"></asp:Label>
						<br />
						BookingNotes: <asp:Label runat="server" ID="lblRetrieveBookingNotes"></asp:Label>
						<br />
					</p>
					<asp:GridView ID="gvRetrieveBooking" runat="server" AutoGenerateColumns="False">
						
					</asp:GridView>
					<asp:ObjectDataSource ID="dsRetrieveBooking" runat="server" SelectMethod="RetrieveBookingDetails" TypeName="EllensBnB.EllensCode.BookingElement">
						<SelectParameters>
							<asp:FormParameter FormField="txtRetrieveBookingEmail" Name="email" Type="String" />
							<asp:FormParameter FormField="txtRetrieveBookingID" Name="bookingID" Type="String" />
						</SelectParameters>
					</asp:ObjectDataSource>
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
