<%@ Page Title="ETS Networks | Tips and Tricks" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="tips.aspx.vb" Inherits="tips" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2>Tips and Tricks</h2>

 <asp:Panel runat ="server" ID="uploadpnl"  HorizontalAlign="Center" >
Upload Pics:

<asp:FileUpload runat ="server" ID="FileUpload1" CssClass="mybutton"   />
     
        <asp:Button id="UploadBtn" Text="Upload Picture" OnClick="upload"  runat="server" Width="115px" CssClass ="mybutton" />
        <br />
        <asp:Label ID="infolbl" runat ="server"  EnableViewState ="false"></asp:Label>
        <hr />
</asp:Panel>


<asp:UpdatePanel runat ="server" ID="up1">
<ContentTemplate>



<asp:DetailsView ID="DetailsView1" runat="server" BorderStyle="None" BorderWidth="0"
Width="100%"  AutoGenerateRows="False" DataSourceID="SqlDataSource1" GridLines ="None"
 DataKeyNames ="key" OnDataBound ="detailsbound" >
<Fields>
<asp:TemplateField ShowHeader="False" SortExpression="homebody">

<ItemStyle HorizontalAlign="Left"  />
<ItemTemplate>
<table width ="100%">
<tr>
<td  valign ="top" >

<p>
<img src="img/tips/<%# Eval("pic") %>"  alt ="<%#EVAL("pic") %>"  style =" border :inset 4px #1d2c53; float:right ;"  />

<asp:Label ID="Label1" runat="server" Text='<%# Eval("body") %>' ></asp:Label>
<asp:Label ID="lblkeywords" runat="server" Text='<%# Eval("keywords") %>'  Visible ="false" ></asp:Label>
<asp:Label ID="lbltitle" runat="server" Text='<%# Eval("title") %>'  Visible ="false" ></asp:Label>
<asp:Label ID="piclbl" runat="server" Text='<%# Eval("pic") %>' Visible ="false"></asp:Label>
</p>
<br />
<asp:DropDownList runat ="server" ID="picdd" Visible ="false"    >
</asp:DropDownList>

</td>

</tr>
</table>

</ItemTemplate>
<EditItemTemplate>
<table>
<tr>
<td width="500" valign ="top" >
<b>Page Title:</b><asp:TextBox runat ="server" ID="txttitle" Text ='<%#Bind("title") %>' Width="500"></asp:TextBox>
<br />
<b>Keywords:</b><asp:TextBox runat ="server" ID="txtkeywords" Text ='<%#Bind("keywords") %>' Width="500"></asp:TextBox>
<br />

   <cc2:Editor ID="Editor1" runat="server" Content='<%#Bind("body") %>'   Height ="600"  Width ="100%"/>
</td> 
<td width="350" valign ="top" >
<asp:Label ID="piclbl" runat="server" Text='<%# Eval("pic") %>' Visible ="false"></asp:Label>
<img src="img/tips/<%# Eval("pic") %>"   alt ="<%#EVAL("pic") %>" />
<br />
<asp:DropDownList runat ="server" ID="picdd"  >
</asp:DropDownList>
</td> 
</tr> 
</table> 
</EditItemTemplate>
</asp:TemplateField>
 <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="mybutton"  />
</Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:etsConnectionString %>"
SelectCommand="SELECT * FROM [tips]"
 UpdateCommand ="UPDATE tips set body=@body, pic=@pic, keywords=@keywords, title=@title WHERE [key]=@key">
  <UpdateParameters>
 <asp:ControlParameter ControlID ="detailsview1$picdd" Name ="pic" />
 </UpdateParameters>
 </asp:SqlDataSource>

 </ContentTemplate>
</asp:UpdatePanel>




</asp:Content>

