<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="EllensBnB.Pages.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<button onclick="topFunction()" ID="topBtn" title="Go to top">Top</button>
   
    <div role ="main" ID="ReportsPage">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        
            <asp:UpdatePanel ID="Reports" runat="server">
                <ContentTemplate>
                    <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath>
                    <p><strong>Select reports to run</strong></p>
                    
                    <asp:DropDownList ID="drpReportList" AutoPostBack="true" runat="server" CssClass="cssDropdown" OnSelectedIndexChanged="drpReportList_SelectedIndexChanged">
                        <asp:ListItem Value="Future Reservations" ></asp:ListItem>
                        <asp:ListItem Value ="Total Revenue"></asp:ListItem>
                        <asp:ListItem Value ="Unpaid Bookings"></asp:ListItem>
                        <asp:ListItem Value ="Customer List"></asp:ListItem>
                        <asp:ListItem Value ="All bookings"></asp:ListItem>
                    </asp:DropDownList>
                   
                       <br /> <br />
                       
                    <div class="overflow">
                       <!--Future Reservations report-->
                        <asp:SqlDataSource ID="FutureReservations" runat="server" ConnectionString="<%$ ConnectionStrings:EllensBnBConnectionString %>"
                                SelectCommand="uspGetDatesReservedWithCustomer" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:GridView ID="gvFutureReservations" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                DataSourceID="FutureReservations" DataKeyNames="CustomerEmail" Font-Size="Small" PageSize="8">
                          <PagerStyle CssClass="cssPager" />
                        <Columns>
                            <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                            <asp:BoundField DataField="BookingID" HeaderText="Booking ID" SortExpression="BookingID" />
                            <asp:BoundField DataField="DateBookingCreated" DataFormatString="{0:d}" HeaderText="Date Created" SortExpression="DateBookingCreated" />
                            <asp:BoundField DataField="Paid" HeaderText="Paid" SortExpression="Paid" />
                            <asp:BoundField DataField="RoomID" HeaderText="Room No" SortExpression="RoomID" />
                            <asp:BoundField DataField="NumberOfGuests" HeaderText="Number Of Guests" SortExpression="NumberOfGuests" />
                            <asp:BoundField DataField="RoomRate" DataFormatString="{0:c2}" HeaderText="Room Rate" SortExpression="RoomRate" />
                            <asp:BoundField DataField="BookingNotes" HeaderText="Notes" SortExpression="BookingNotes" />
                            <asp:BoundField DataField="RoomName" HeaderText="Room" SortExpression="RoomName">
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CustomerName" HeaderText="Customer" SortExpression="CustomerName" />
                            <asp:BoundField DataField="CustomerCountry" HeaderText="Country" SortExpression="CustomerCountry" />
                            <asp:BoundField DataField="CustomerEmail" HeaderText="Email" ReadOnly="True" SortExpression="CustomerEmail" />
                            <asp:BoundField DataField="CustomerPhone" HeaderText="Phone" SortExpression="CustomerPhone" />
                        </Columns>
                        </asp:GridView>

                    <!--Total Revenue report-->
                    <asp:SqlDataSource ID="GetTotalRevenue" runat="server" ConnectionString="<%$ ConnectionStrings:EllensBnBConnectionString %>"
                                SelectCommand="uspGetTotalRevenueByYear" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:GridView ID="gvTotalRevenue" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                DataSourceID="GetTotalRevenue" Font-Size="Small" PageSize="8">
                       <PagerStyle CssClass="cssPager" />
                        <Columns>
                            <asp:BoundField DataField="Year" HeaderText="Year" ReadOnly="True" SortExpression="Year" >
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Width="75px" Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RoomName" HeaderText="Room" SortExpression="RoomName">
                            <ItemStyle Wrap="False" Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Total Sales" DataFormatString="{0:c2}" HeaderText="Total Sales" ReadOnly="True" SortExpression="Total Sales" >
                            <ItemStyle Width="150px" Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                        <RowStyle Width="110px" Wrap="False" />
                        </asp:GridView>

                    <!--Unpaid report-->
                    <asp:SqlDataSource ID="UnpaidBookings" runat="server" ConnectionString="<%$ ConnectionStrings:EllensBnBConnectionString %>"
                                 SelectCommand="uspGetUnpaidBookings" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:GridView ID="gvUnpaid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                 DataSourceID="UnpaidBookings" DataKeyNames="CustomerEmail" Font-Size="Small" PageSize="8">
                        <PagerStyle CssClass="cssPager" />
                        <Columns>
                            <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                            <asp:BoundField DataField="BookingID" HeaderText="BookingID" SortExpression="BookingID" />
                            <asp:BoundField DataField="DateBookingCreated" DataFormatString="{0:d}" HeaderText="Date Created" SortExpression="DateBookingCreated" />
                            <asp:BoundField DataField="Paid" HeaderText="Paid" SortExpression="Paid" />
                            <asp:BoundField DataField="RoomID" HeaderText="Room No" SortExpression="RoomID" />
                            <asp:BoundField DataField="NumberOfGuests" HeaderText="Number Of Guests" SortExpression="NumberOfGuests" />
                            <asp:BoundField DataField="RoomRate" DataFormatString="{0:c2}" HeaderText="Room Rate" SortExpression="RoomRate" />
                            <asp:BoundField DataField="BookingNotes" HeaderText="Notes" SortExpression="BookingNotes" />
                            <asp:BoundField DataField="RoomName" HeaderText="Room" SortExpression="RoomName" ItemStyle-Wrap="False"/>
                            <asp:BoundField DataField="CustomerName" HeaderText="Customer" SortExpression="CustomerName" />
                            <asp:BoundField DataField="CustomerCountry" HeaderText="Country" SortExpression="CustomerCountry" />
                            <asp:BoundField DataField="CustomerEmail" HeaderText="Email" ReadOnly="True" SortExpression="CustomerEmail" />
                            <asp:BoundField DataField="CustomerPhone" HeaderText="Phone" SortExpression="CustomerPhone" />
                        </Columns>
                    </asp:GridView>

                         <!--Customer listing report-->
                    <asp:SqlDataSource ID="AllCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:EllensBnBConnectionString %>"
                                 SelectCommand="uspGetAllCustomers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:GridView ID="gvAllCustomers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                 DataSourceID="AllCustomers" DataKeyNames="CustomerEmail" Font-Size="Small" PageSize="8">
                        <PagerStyle CssClass="cssPager" />
                        <Columns>
                            <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                            <asp:BoundField DataField="CustomerName" HeaderText="Customer" SortExpression="CustomerName" />
                            <asp:BoundField DataField="CustomerCountry" HeaderText="Country" SortExpression="CustomerCountry" />
                            <asp:BoundField DataField="CustomerEmail" HeaderText="Email" ReadOnly="True" SortExpression="CustomerEmail" />
                            <asp:BoundField DataField="CustomerPhone" HeaderText="Phone" SortExpression="CustomerPhone" />
                        </Columns>
                    </asp:GridView>

                           <!--All Bookings report-->
                        <asp:SqlDataSource ID="AllBookings" runat="server" ConnectionString="<%$ ConnectionStrings:EllensBnBConnectionString %>"
                                        SelectCommand="uspGetAllBookings" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:GridView ID="gvAllBookings" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                        DataSourceID="AllBookings" DataKeyNames="CustomerEmail" Font-Size="Small" PageSize="8">
                            <PagerStyle CssClass="cssPager" />
                            <Columns>
                                <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                                <asp:BoundField DataField="BookingID" HeaderText="BookingID" SortExpression="BookingID" />
                                <asp:BoundField DataField="DateBookingCreated" DataFormatString="{0:d}" HeaderText="Date Created" SortExpression="DateBookingCreated" />
                                <asp:BoundField DataField="Paid" HeaderText="Paid" SortExpression="Paid" />
                                <asp:BoundField DataField="RoomID" HeaderText="Room No" SortExpression="RoomID" />
                                <asp:BoundField DataField="NumberOfGuests" HeaderText="Number Of Guests" SortExpression="NumberOfGuests" />
                                <asp:BoundField DataField="RoomRate" HeaderText="Room Rate" DataFormatString="{0:c2}" SortExpression="RoomRate" />
                                <asp:BoundField DataField="BookingNotes" HeaderText="Notes" SortExpression="BookingNotes" ItemStyle-Width="200" ItemStyle-Wrap="False" />
                                <asp:BoundField DataField="RoomName" HeaderText="Room" SortExpression="RoomName" ItemStyle-Wrap="False"/>
                                <asp:BoundField DataField="CustomerName" HeaderText="Customer" SortExpression="CustomerName" />
                                <asp:BoundField DataField="CustomerCountry" HeaderText="Country" SortExpression="CustomerCountry" />
                                <asp:BoundField DataField="CustomerEmail" HeaderText="Email" ReadOnly="True" SortExpression="CustomerEmail" />
                                <asp:BoundField DataField="CustomerPhone" HeaderText="Phone" SortExpression="CustomerPhone" />
                            </Columns>
                        </asp:GridView>     
                       
                    </div><!--end of scrolling style for gridviews-->
                </ContentTemplate>                

            </asp:UpdatePanel>

    </div><!--end of reports-->

</asp:Content>
