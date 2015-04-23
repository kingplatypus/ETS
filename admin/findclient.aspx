<%@ Page Title="" Language="VB" MasterPageFile="~/admin/admin.master" AutoEventWireup="false" CodeFile="findclient.aspx.vb" Inherits="admin_findclient" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"   Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


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
 DataTextField="clientname" DataValueField ="key" OnDataBound ="clientddbound">
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




<!--tickets--->
<asp:Panel runat ="server" ID="ticketpnl">

<asp:DetailsView ID="AddContact" runat="server" 
Height="50px" Width="100%" AutoGenerateRows="False" DefaultMode="insert" 
DataKeyNames="key" DataSourceID="ticketdatasource"   
OnItemInserting ="ticketinserting" OnItemInserted ="ticketinserted">
<Fields>

<asp:TemplateField ShowHeader ="false"  >

<InsertItemTemplate>


<table>
<tr>
<td align ="right" width="40%" >
<b>Ticket Date:</b>
</td>
<td align ="left" >
<asp:TextBox ID="txtcontactdate" runat="server" Text='<%# Bind("ticketdate") %>' ValidationGroup ="ticket"></asp:TextBox>
<cc1:CalendarExtender runat ="server" ID="calex1" Animated ="true" PopupPosition="BottomRight" TargetControlID ="txtcontactdate">
</cc1:CalendarExtender>

<asp:RequiredFieldValidator runat ="server" ID="valctdate" ControlToValidate="txtcontactdate" ValidationGroup ="ticket"
ErrorMessage="*Enter a Date" Display="dynamic"  ></asp:RequiredFieldValidator> 
<asp:CompareValidator ID="CompareValidator3" runat="server"  ControlToValidate="txtcontactdate"
Operator="dataTypeCheck" ErrorMessage="*(mm/dd/yyyy)" Display="dynamic" Type="date" SetFocusOnError="true" ></asp:CompareValidator>

</td>

</tr>

<tr>
<td align ="right" >
<b>Notes:</b>
</td>
<td align ="left" >
<asp:TextBox ID="txtnotes" runat="server" Text='<%# Bind("notes") %>' TextMode ="MultiLine" Rows ="6"
Width ="550" ValidationGroup ="ticket"></asp:TextBox>


</td>

</tr>
</table>


 </InsertItemTemplate>
<ItemStyle HorizontalAlign="Left" />
<HeaderStyle HorizontalAlign="Right" />
</asp:TemplateField>



<asp:CommandField ShowInsertButton="True"  ButtonType="Button" CausesValidation="true" ValidationGroup ="ticket" ItemStyle-HorizontalAlign="Center"    >
<HeaderStyle HorizontalAlign="Center"  />
</asp:CommandField>

</Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="ticketdatasource" runat="server" ConnectionString="<%$ ConnectionStrings:etsConnectionString %>"
InsertCommand ="INSERT INTO Tickets (clientid, contactdate, dateentered, contactperson, notes) VALUES	(@clientid, @contactdate, @dateentered, @contactperson, @notes)"
SelectCommand ="SELECT * FROM Tickets WHERE clientid=@clientid ORDER BY contactdate DESC"
UpdateCommand ="UPDATE Tickets SET contactdate=@contactdate, notes=@notes WHERE [key]=@key"
 DeleteCommand ="DELETE FROM Tickets WHERE [key]=@key">

<InsertParameters >
<asp:ControlParameter ControlID ="clientdd" Name ="clientid" PropertyName ="SelectedValue" />
<asp:Parameter Name="dateentered" Type="DateTime" />
<asp:Parameter Name="contactdate" Type="DateTime" />
<asp:Parameter Name="contactperson" Type ="string" />
<asp:Parameter Name="notes" Type="string" />
</InsertParameters>
<SelectParameters>
<asp:ControlParameter ControlID ="clientdd" Name ="clientid" PropertyName ="SelectedValue" />
</SelectParameters>
</asp:SqlDataSource>

<br /><br />




<asp:GridView ID="Ticketgrid" runat="server" AutoGenerateColumns="False"
DataKeyNames="key" DataSourceID="ticketdatasource" 
Width="100%" AllowPaging="True" AllowSorting="True" 
>
<Columns>



<asp:BoundField DataField="clientid" HeaderText="ctid" InsertVisible="False" ReadOnly="True"
SortExpression="ctid" Visible ="False"  />

<asp:TemplateField HeaderText="date entered" SortExpression="dateentered">
<EditItemTemplate>
<asp:TextBox ID="TextBox2" runat="server"  Columns="9" Text='<%# Bind("dateentered","{0:d}") %>'></asp:TextBox>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="Label2" runat="server" Text='<%# Bind("dateentered","{0:d}") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="contact date" SortExpression="contactdate">
<EditItemTemplate>
<asp:TextBox ID="TextBox1" runat="server" Columns="9" Text='<%# Bind("contactdate","{0:d}") %>'></asp:TextBox>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="Label1" runat="server" Text='<%# Bind("contactdate","{0:d}") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>



<asp:BoundField DataField="contactperson" HeaderText="contacted by" SortExpression="contactperson" />
<asp:BoundField DataField="notes" HeaderText="notes" SortExpression="notes" />
<asp:CommandField ButtonType ="Button" ShowCancelButton ="true" ShowDeleteButton ="true" ShowEditButton ="true" />

</Columns>
<EmptyDataTemplate>
No Recent Tickets Found
</EmptyDataTemplate>
</asp:GridView>



                        
                        </asp:Panel>


</asp:Content>

