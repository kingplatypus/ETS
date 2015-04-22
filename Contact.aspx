<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Contact.aspx.vb" Inherits="Contact" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h4>ETS Networks, Inc.<br />
<a href="mailto:Info@ETSNetworksInc.com">Info@ETSNetworksinc.com</a>
<br />
(828) 348-1510 (Office)

<br />

56 White Oak Rd, Arden, NC 28704
</h4>



<table width ="100%">
<tr>
<td align ="center" valign ="top" >
<asp:Label runat ="server" ID="msgsentlbl"></asp:Label>

<asp:DetailsView GridLines="none" DefaultMode="Insert" 
ID="DetailsView1"  Width ="60%"
BorderStyle="None" BorderWidth="0" runat="server" AutoGenerateRows="False" 
 HorizontalAlign="center" 
   >
<Fields>

<asp:TemplateField ItemStyle-HorizontalAlign ="Center"  >
<ItemTemplate >
      <b>Please fill out the form with any questions you may have and we will reply
       as soon as possible!</b>

 
<asp:Label runat="server" ID="MessageLabel"  Font-Bold="true" ></asp:Label>
<asp:Label runat="server" ID="infolbl"  Font-Bold="true" ></asp:Label>


</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="name:" HeaderStyle-HorizontalAlign ="Right" >

<InsertItemTemplate>



<asp:TextBox Columns="200" Width="500" ID="contactname" runat="server" Text='<%# Bind("contactname") %>'></asp:TextBox>
<asp:RequiredFieldValidator Text="You must enter your name!"
 SetFocusOnError="true" ControlToValidate="contactname" 
 ID="RequiredFieldValidator1"  runat="server" 
 ErrorMessage="You must enter your name!" Display="none" >
</asp:RequiredFieldValidator>
    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1"  CssClass="val"
    runat="server" TargetControlID="RequiredFieldValidator1" >
    </cc1:ValidatorCalloutExtender>


</InsertItemTemplate>


</asp:TemplateField>            

<asp:TemplateField HeaderText="message:" HeaderStyle-HorizontalAlign ="Right">
<InsertItemTemplate>
<asp:RequiredFieldValidator Text="You must enter a message!" 
SetFocusOnError="true" ControlToValidate="contactmessage" 
ID="RequiredFieldValidator2"  runat="server" 
ErrorMessage="You must enter a message!" Display="none" >
</asp:RequiredFieldValidator>
    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" 
    runat="server" TargetControlID="RequiredFieldValidator2" >
    </cc1:ValidatorCalloutExtender>

<asp:TextBox Columns="200" Width="500" TextMode="MultiLine" Rows="6" Wrap="true" ID="contactmessage" runat="server" Text='<%# Bind("contactmessage") %>'></asp:TextBox>


</InsertItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="email:" HeaderStyle-HorizontalAlign ="Right">
<InsertItemTemplate>
<asp:TextBox Columns="200" Width="500" ID="contactemail" runat="server" Text='<%# Bind("contactemail") %>'></asp:TextBox>
</InsertItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="phone:" HeaderStyle-HorizontalAlign ="Right">
<InsertItemTemplate>

<asp:TextBox Columns="200" Width="500" ID="contactphone" runat="server" Text='<%# Bind("contactphone") %>'></asp:TextBox>
</InsertItemTemplate>
</asp:TemplateField>




</Fields>
<InsertRowStyle HorizontalAlign="Left" />


<FooterTemplate>
<asp:Button ID="Mailitbtn" runat="server" Text="Submit" OnClick="Mailit"  CssClass ="mybutton"  />
</FooterTemplate>
<FooterStyle HorizontalAlign="Center" />



</asp:DetailsView>

</td>
<td align ="center" valign ="top" >

<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13000.880088690841!2d-82.507349!3d35.449347!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xecebb412a686fbff!2sETS+Networks+Inc.com!5e0!3m2!1sen!2sus!4v1417016411050" width="300" height="250" frameborder="0" style="border:0"></iframe>


</td>
</tr>
</table>



</asp:Content>

