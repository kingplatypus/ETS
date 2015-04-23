<%@ Page Title="" Language="VB" MasterPageFile="~/admin/admin.master" AutoEventWireup="false" CodeFile="clientInfo.aspx.vb" Inherits="Default2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>ETS CLIENT INFO</h2>
    
    <asp:DetailsView ID="DetailsView1" runat="server"
Width="100%"  AutoGenerateRows="False" DataSourceID="SqlDataSource1" 
        GridLines ="None" CellPadding="4" ForeColor="#333333">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField AccessibleHeaderText="Address" HeaderText="Address" />
            <asp:BoundField AccessibleHeaderText="Billing Address" 
                HeaderText="Billing Address" />
            <asp:BoundField AccessibleHeaderText="MSA?" HeaderText="MSA" />
            <asp:BoundField AccessibleHeaderText="Rate" HeaderText="Rate" />
            <asp:BoundField AccessibleHeaderText="Main Phone" 
                HeaderText="Main Phone Number" />
        </Fields>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    
    
    </asp:DetailsView>
        <%--CLIENT NAME
        MSA -- RATE
        ADDRESS
        MAIN PHONE
        
        Gridview: Contacts NAME|PHONE NUMBER
        GRidview: Servers
        Gridview: Wifi
        Gridview: Miscellany
   --%>       
    <h3>Additional Contacts</h3>
    <asp:GridView ID="contact" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField AccessibleHeaderText="Contact Name" HeaderText="Contact Name" />
            <asp:BoundField AccessibleHeaderText="Phone Number" HeaderText="Phone Number" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <h3>Server Info</h3>
        <asp:GridView ID="servers" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField AccessibleHeaderText="Server Name" HeaderText="Server Name" />
                <asp:BoundField AccessibleHeaderText="Function" HeaderText="Function" />
                <asp:BoundField AccessibleHeaderText="IP Address" HeaderText="IP Address" />
                <asp:BoundField AccessibleHeaderText="Operating System" 
                    HeaderText="Operating System" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <h3>Wifi Info</h3>
        <asp:GridView ID="wifi" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField AccessibleHeaderText="SSID" HeaderText="SSID" />
                <asp:BoundField AccessibleHeaderText="Username" HeaderText="Username" />
                <asp:BoundField AccessibleHeaderText="Password" HeaderText="Password" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <h3>Miscellaneous Info</h3>
        <asp:GridView ID="misc" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField AccessibleHeaderText="Item Name" HeaderText="Item Name" />
                <asp:BoundField AccessibleHeaderText="Details" HeaderText="Details" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <h3>Recent Tickets</h3>
        <asp:GridView ID="tickets" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    <%--collapsable section
    tickets, paged out (show most recent 5)--%>





</asp:Content>