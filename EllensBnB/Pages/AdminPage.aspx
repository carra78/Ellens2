<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="EllensBnB.Pages.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<button onclick="topFunction()" id="topBtn" title="Go to top">Top</button>
    <div role ="main" id="ReportsPage">
        <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        
            <asp:UpdatePanel ID="Reports" runat="server">
                <ContentTemplate>
                    <p>Select reports to run</p>
                    <!--<asp:Label ID="ReportsList" runat="server" Text="Reports"></asp:Label>--> &nbsp &nbsp
                    <asp:DropDownList ID="drpReportsList" runat="server" Width="400px">
                        <asp:ListItem Value="All bookings in date order"></asp:ListItem>
                        <asp:ListItem Value ="Future bookings"></asp:ListItem>
                        <asp:ListItem Value ="Unpaid bookings"></asp:ListItem>
                        <asp:ListItem Value ="Customer distribution list"></asp:ListItem>
                        <asp:ListItem Value ="All bookings by customer"></asp:ListItem>
                    </asp:DropDownList>&nbsp &nbsp
                        <p>The data grid reports is here. Column headings will come from individual reports, data binding to be set</p>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EllensBnBConnectionString %>" SelectCommand="uspGetAllBookings" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerEmail" DataSourceID="SqlDataSource1" Font-Size="Small" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                                <asp:BoundField DataField="BookingID" HeaderText="Booking ID" SortExpression="BookingID" />
                                <asp:BoundField DataField="DateBookingCreated" DataFormatString="{0:d}" HeaderText="Date Created" SortExpression="DateBookingCreated" />
                                <asp:BoundField DataField="Paid" HeaderText="Paid" SortExpression="Paid" />
                                <asp:BoundField DataField="RoomID" HeaderText="Room No." SortExpression="RoomID" />
                                <asp:BoundField DataField="NumberOfGuests" HeaderText="Number Of Guests" SortExpression="NumberOfGuests" />
                                <asp:BoundField DataField="RoomRate" HeaderText="Room Rate" SortExpression="RoomRate" DataFormatString="{0:c2}" />
                                <asp:BoundField DataField="BookingNotes" HeaderText="Notes" SortExpression="BookingNotes" />
                                <asp:BoundField DataField="RoomName" HeaderText="Room" SortExpression="RoomName" />
                                <asp:BoundField DataField="CustomerName" HeaderText="Customer" SortExpression="CustomerName" />
                                <asp:BoundField DataField="CustomerCountry" HeaderText="Country" SortExpression="CustomerCountry" />
                                <asp:BoundField DataField="CustomerEmail" HeaderText="Email" ReadOnly="True" SortExpression="CustomerEmail" />
                                <asp:BoundField DataField="CustomerPhone" HeaderText="Phone" SortExpression="CustomerPhone" />
                            </Columns>
                            </asp:GridView>
                            
                            
                    <!-- Columns to be defined.  8 Options for field types - some below -->
                    
                    <%--<asp:GridView ID="gvReports" runat="server" AutoGenerateColumns ="false">
                        <Columns>                            
                            <asp:Boundfield HeaderText ="Date Selected"/>
                            <asp:BoundField HeaderText ="Room 1" />
                            <asp:BoundField HeaderText ="Room 2" />
                            <asp:Templatefield></asp:Templatefield>
                            <asp:HyperLinkField />
                            <asp:CommandField />
                            <asp:CheckBoxField />
                        </Columns>
                        
                    </asp:GridView> --%>
    
                </ContentTemplate>                

            </asp:UpdatePanel>


    </div><!--end of reports-->

</asp:Content>
