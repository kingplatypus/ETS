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
 DataTextField="clientname" OnDataBound ="clientddbound">
</asp:DropDownList>

<asp:SqlDataSource runat ="server" ID="ddsource"  ConnectionString="<%$ ConnectionStrings:etsConnectionString %>" 
 SelectCommand ="SELECT Clientname FROM clients ORDER BY clientname ASC  ">
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

</asp:Content>

