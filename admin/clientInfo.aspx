<%@ Page Title="" Language="VB" MasterPageFile="~/admin/admin.master" AutoEventWireup="false" CodeFile="clientInfo.aspx.vb" Inherits="Default2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>ETS CLIENT INFO</h2>
    
    <script type="text/javascript">
    function Highlight_On(obj) {
        if (obj != null) {
            obj.originalBgColor = obj.style.backgroundColor
            obj.style.backgroundColor = "#E5F1FF"
        }
    }

    function Highlight_Off(obj) {
        if (obj != null) {
            obj.style.backgroundColor = obj.originalBgColor
        }
    }

    function ClientPopulated(source, eventArgs) {

        //alert(source._currentPrefix.toLowerCase());

        if (source._currentPrefix != null) {
            var list = source.get_completionList();
            var search = source._currentPrefix.toLowerCase();
            for (var i = 0; i < list.childNodes.length; i++) {
                var text = list.childNodes[i].innerHTML;
                var index = text.toLowerCase().indexOf(search);
                if (index != -1) {
                    var value = text.substring(0, index);
                    value += '<span class="ListItemHiliteText">';
                    value += text.substr(index, search.length);
                    value += '</span>';
                    value += text.substring(index + search.length);
                    //
                    value = value.replace(/(\r\n|\r|\n)/g, '<br />');

                    list.childNodes[i].innerHTML = value;
                }
            }
        }
    }


    // Function to remove highlight span once selected
    function ClientItemSelected(source, e) {
        source.get_element().value = (document.all) ? e._item.innerText : e._item.textContent;
    }

</script>




<asp:DropDownList runat ="server" ID="clientdd" Width ="200"   
DataSourceID ="ddsource" AutoPostBack="true" 
 OnSelectedIndexChanged ="clientddchanged" EnableViewState ="true" 
 DataTextField="clientname" DataValueField="key" OnDataBound ="clientddbound">
</asp:DropDownList>

<asp:SqlDataSource runat ="server" ID="ddsource"  ConnectionString="<%$ ConnectionStrings:etsConnectionString %>" 
 SelectCommand ="SELECT Clientname, [key] FROM clients ORDER BY clientname ASC  ">
</asp:SqlDataSource>






<br /><br />

<asp:Label runat ="server" ID="messagelabel" EnableViewState ="false" ForeColor ="Red"></asp:Label>

<asp:TextBox ID="txtsearch" runat="server" OnTextChanged="clientnamechanged"  Width ="200"
 AutoPostBack="true" AutoCompleteType ="Disabled"></asp:TextBox>
<cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" 
runat="server" TargetControlID="txtsearch" WatermarkText="Client Name"
WatermarkCssClass="watermark">
</cc1:TextBoxWatermarkExtender>

<cc1:AutoCompleteExtender ID="AutoCompleteExtender2"
runat="server" ServicePath="findclient.asmx" 
ServiceMethod="findclient"  
MinimumPrefixLength="2"  CompletionSetCount="12" 
CompletionListItemCssClass="autocompitem"
CompletionListHighlightedItemCssClass="autocomphighlite"  
TargetControlID="txtsearch"
 OnClientPopulated="ClientPopulated"
 OnClientItemSelected="ClientItemSelected"
 >
</cc1:AutoCompleteExtender>

<asp:Panel ID="ticketpnl" runat="server">
    
    <asp:DetailsView ID="DetailsView1" runat="server"
Width="100%"  AutoGenerateRows="False" DataSourceID="SqlDataSource1" 
        GridLines ="None" CellPadding="4" ForeColor="#333333">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="key" HeaderText="key" InsertVisible="False" 
                ReadOnly="True" SortExpression="key" Visible="False" />
            <asp:TemplateField AccessibleHeaderText="Client Name" HeaderText="Client Name" 
                SortExpression="clientname">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("clientname") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("clientname") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("clientname") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Billing Address" SortExpression="billingaddress">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("billingaddress") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("billingaddress") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("billingaddress") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MSA?" SortExpression="MSA">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("MSA") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("MSA") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("MSA") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rate" SortExpression="rate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("rate") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("rate") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("rate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
        GridLines="None" DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="clientkey" HeaderText="clientkey" 
                SortExpression="clientkey" Visible="False" />
            <asp:TemplateField HeaderText="Contact" SortExpression="contact">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("contact") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("contact") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Extension" SortExpression="extension">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("extension") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("extension") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ETSConnectionString %>" 
        SelectCommand="SELECT [clientkey], [phone], [contact], [extension] FROM [Phone] WHERE ([clientkey] = @clientkey)">
            <SelectParameters>
                <asp:ControlParameter ControlID="clientdd" Name="clientkey" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ETSConnectionString %>" 
        
        SelectCommand="SELECT [key], [clientname], [address], [billingaddress], [MSA], [rate], [Phone] FROM [Clients] WHERE ([key] = @key)">
            <SelectParameters>
                <asp:ControlParameter ControlID="clientdd" Name="key" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
        <h3>Server Info</h3>
        <h3>
            <asp:GridView ID="servers" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" 
                GridLines="None">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="clientkey" HeaderText="clientkey" 
                        SortExpression="clientkey" Visible="False" />
                    <asp:TemplateField HeaderText="Server Name" SortExpression="servername">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("servername") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("servername") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IP" SortExpression="IP">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("IP") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("IP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Server Function" SortExpression="serverfunction">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("serverfunction") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("serverfunction") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Username" SortExpression="uname">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("uname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("uname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password" SortExpression="pwd">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("pwd") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("pwd") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ETSConnectionString %>" 
                SelectCommand="SELECT [clientkey], [servername], [IP], [serverfunction], [uname], [pwd] FROM [Servers] WHERE ([clientkey] = @clientkey)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="clientdd" Name="clientkey" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            Wifi Info</h3>
        <asp:GridView ID="wifi" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="clientkey" HeaderText="clientkey" 
                    SortExpression="clientkey" Visible="False" />
                <asp:TemplateField HeaderText="SSID" SortExpression="SSID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SSID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SSID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Router IP" SortExpression="IP">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("IP") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("IP") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Username" SortExpression="username">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password" SortExpression="pwd">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("pwd") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("pwd") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ETSConnectionString %>" 
        SelectCommand="SELECT [clientkey], [SSID], [IP], [username], [pwd] FROM [WIFI] WHERE ([clientkey] = @clientkey)">
            <SelectParameters>
                <asp:ControlParameter ControlID="clientdd" Name="clientkey" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
        <h3>Miscellaneous Info</h3>
        <asp:GridView ID="misc" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource5">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Memo" 
                    ShowHeader="False" SortExpression="Memo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Memo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Memo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ETSConnectionString %>" 
        SelectCommand="SELECT [Memo] FROM [Clients] WHERE ([key] = @key)">
            <SelectParameters>
                <asp:ControlParameter ControlID="clientdd" Name="key" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
        <h3>Recent Tickets</h3>
        <asp:GridView ID="tickets" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField AccessibleHeaderText="compKey" HeaderText="compKey" 
                    Visible="False"></asp:TemplateField>
                <asp:TemplateField AccessibleHeaderText="tech" HeaderText="Tech">
                </asp:TemplateField>
                <asp:TemplateField AccessibleHeaderText="timeDate" HeaderText="Time/Date">
                </asp:TemplateField>
                <asp:TemplateField AccessibleHeaderText="notes" HeaderText="Notes">
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
</asp:Panel> 





</asp:Content>