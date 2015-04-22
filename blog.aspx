<%@ Page Title="ETS Networks | Blog" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="blog.aspx.vb" Inherits="theblog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2>ETS Blog</h2>

<iframe height ="1000" width ="100%" id ="iframe" src="http://etsnetworksinc.blogspot.com/"></iframe>


<%--<asp:Panel runat ="server" ID="uploadpnl"  HorizontalAlign="Center" >

<br /><br />
<table border ="0" align="center" width="70%">
<tr>
<td align ="right" width="185" >
<b>Upload Pics:
</b> 
</td> 
<td align ="left">
<asp:FileUpload runat ="server" ID="FileUpload1" CssClass="mybutton"   />
     
        <asp:Button id="UploadBtn" Text="Add Picture" OnClick="upload"  runat="server" Width="105px" CssClass ="mybutton" />
        <br />
        <asp:Label ID="infolbl" runat ="server" ></asp:Label>
      
</td>
</tr> 
</table> 
</asp:Panel>

<asp:DetailsView runat ="server" ID="addblog" DataKeyNames ="key"
 DataSourceID ="blogdatasource" HorizontalAlign ="Center" AutoGenerateRows ="false" 
  DefaultMode ="insert"  GridLines ="None" Width ="70%" OnItemInserting ="bloginserting"
   OnDataBound ="addblogbound">
 <Fields>
 <asp:TemplateField ShowHeader ="false" >
<InsertItemTemplate>
<table border ="0">
<tr>
<td align ="right"  width="185" >
<b>Title:</b>
</td>
<td align ="left" colspan ="2">
<asp:TextBox runat ="server" ID="txttitle" Width ="300" Text ='<%#Bind("title") %>' ValidationGroup ="b"></asp:TextBox>
<asp:RequiredFieldValidator runat ="server" ID="req1" SetFocusOnError ="true" ControlToValidate ="txttitle"
 ValidationGroup ="b" Display ="Dynamic" ErrorMessage ="*required" ForeColor ="Red"></asp:RequiredFieldValidator>
</td>
<td>
&nbsp;
</td>
</tr>
<tr>
<td align ="right">
<b>Choose an Image:</b>
</td>
<td align ="left">
  <asp:DropDownList runat ="server" ID="picdd" AppendDataBoundItems ="true"  >
  <asp:ListItem Text ="(SELECT IMAGE)" Value ="SEL"></asp:ListItem>
</asp:DropDownList>
</td> 
<td align ="right">
<b>No Image:</b>
</td>
<td align ="left">
<asp:CheckBox runat ="server" ID="chkimg" Checked ='<%#Bind("noimg") %>' />
</td>

</tr>
<tr>
<td colspan ="4">
 <cc2:Editor ID="myeditor" runat="server" Content='<%#Bind("body") %>'   Height ="300"  Width ="100%"/>


</td>
</tr>
</table>

</InsertItemTemplate> 

 </asp:TemplateField>
 
 
<asp:CommandField ButtonType ="Button" ShowInsertButton ="true" ShowEditButton ="false" ValidationGroup ="b"
 ControlStyle-CssClass="mybutton" ItemStyle-HorizontalAlign ="Center" inserttext="Add Blog Entry"/>
 
</Fields>
 </asp:DetailsView>

<div style ="width:90%; text-align :center ; margin-left :auto ; margin-right :auto ;">

<br /><br />
</div> 

<asp:GridView runat ="server" ID="bloggrid" HorizontalAlign ="Center" DataKeyNames ="key"
 DataSourceID ="blogdatasource" AllowPaging ="true" PageSize ="10" AllowSorting ="false" 
  AutoGenerateColumns ="false" GridLines ="None" ShowHeader ="false" ShowFooter ="false" 
   Width ="99%" OnRowDataBound ="blogrowbound" PagerSettings-Mode ="NextPrevious" PagerSettings-Position ="Bottom" 
    PagerStyle-Font-Bold ="true" PagerStyle-HorizontalAlign ="Right"  OnRowUpdating ="blogrowupdating"
     PagerSettings-NextPageText ="Read Older Entries" PagerSettings-PreviousPageText ="Previous" PagerStyle-BackColor ="#f68d66"
      PagerStyle-ForeColor ="White" RowStyle-cssclass="blogbg" BorderColor ="#3d2a24"
       BorderStyle ="solid" BorderWidth ="4">
   <EmptyDataTemplate>
   <i>no blog data at this time....</i>
   
   </EmptyDataTemplate>
  <Columns >
  <asp:TemplateField>
  <ItemTemplate>
  
  <table width="100%" border ="0" cellpadding ="8" cellspacing ="3">
  <tr>
  <th align ="left" colspan ="2" >
    <asp:Label runat ="server" ID="lbltime" Text ='<%#Bind("dateadded", "{0:D}") %>' ForeColor ="#3d2a24"></asp:Label>
    <div style ="height:5px; border-bottom : solid 2px #f68d66; ">
        </div>
  </th>
  </tr>
  <tr>
  <td align ="left" valign ="top" width="255" >
  <asp:CheckBox runat ="server" ID="chkimg" Checked ='<%#Bind("noimg") %>' Visible ="false"  />
 
  <asp:Label runat ="server" ID="imglbl" Text ='<%#Eval("imgname") %>' Visible ="false" ></asp:Label>
  <asp:Image runat ="server" ID="myimg" Width ="250" BorderStyle ="Solid" BorderWidth ="3" BorderColor ="#3d2a24" />
  </td>
  <td align ="left" valign ="top"  >
    <asp:Label runat ="server" ID="lbltitle" Text ='<%#Bind("title") %>' CssClass ="blogheader"></asp:Label>
 <br /><br />
    <asp:Label runat ="server" ID="lblbody" Text ='<%#Bind("body") %>'></asp:Label>
  </td>
  </tr>
 <tr>
 <td colspan ="2" align ="center" >
   <asp:Button runat ="server" ID="btnedit" Text ="Edit" OnClick ="changerow" CssClass ="mybutton" />

<asp:Button runat ="server" Text ="Delete" ID="btndel"  
OnClientClick ="return confirm('Are you sure you want to delete this item?');"
CommandName="delete"  CommandArgument="Delete" CssClass ="mybutton">
</asp:Button>
 </td>
 </tr>
  </table>
<br /><br />
   <asp:DropDownList runat ="server" ID="picdd" Visible ="false" >
  </asp:DropDownList>
  </ItemTemplate>
  
  
  <EditItemTemplate>
    
  <table width="100%" border ="0" cellpadding ="5" cellspacing ="3">
  <tr>
  <th align ="left" colspan ="2" >
    <asp:Label runat ="server" ID="lbltime" Text ='<%#Bind("dateadded", "{0:D}") %>' ForeColor ="#3ac2d8"></asp:Label>
    <hr />
  </th>
  </tr>
  <tr>
  <td align ="left" valign ="top" width="255" >
  <b>No Image:</b><asp:CheckBox runat ="server" ID="chkimg" Checked ='<%#Bind("noimg") %>' Visible ="true"  />
 
  <asp:Label runat ="server" ID="imglbl" Text ='<%#Eval("imgname") %>' Visible ="false" ></asp:Label>
  <asp:Image runat ="server" ID="myimg" Width ="250" />
  <asp:DropDownList runat ="server" ID="picdd">
  </asp:DropDownList>
  </td>
  <td align ="left" valign ="top"  >
    <asp:textbox runat ="server" ID="lbltitle" Text ='<%#Bind("title") %>' ></asp:textbox>
 <br /><br />
 <cc2:Editor ID="myeditor" runat="server" Content='<%#Bind("body") %>'   Height ="300"  Width ="100%"/>

  </td>
  </tr>
  <tr>
 <td colspan ="2" align ="center" >
  
<asp:Button runat ="server" ID="btnedit" Text ="Update" CommandArgument ="Update"  CssClass ="mybutton"
CommandName ="Update" />
<asp:Button runat ="server" Text ="Delete" ID="btndel"  
OnClientClick ="return confirm('Are you sure you want to delete this item?');"
CommandName="delete"  CommandArgument="Delete" CssClass ="mybutton">
</asp:Button>
 </td>
 </tr>
  </table>
<br /><br />
  
  
  
  </EditItemTemplate>
  </asp:TemplateField>
  </Columns> 
   
   </asp:GridView>
   <asp:SqlDataSource runat ="server" ID="blogdatasource" ConnectionString="<%$ ConnectionStrings:etsconnectionstring %>" 
    SelectCommand ="SELECT * FROM [blog] ORDER BY dateadded DESC"
     InsertCommand ="INSERT INTO [blog] (title, body, dateadded,imgname, noimg ) VALUES (@title, @body, @thedate, @imgname, @noimg)"
      DeleteCommand ="DELETE FROM [blog] WHERE [key]=@key"
       UpdateCommand ="UPDATE [blog] SET title=@title, imgname=@pic, noimg=@noimg, body=@body WHERE [key]=@key">
      <InsertParameters>
      <asp:ControlParameter ControlID ="addblog$picdd" Name ="imgname" PropertyName ="selectedvalue" />
      </InsertParameters>
   </asp:SqlDataSource>
   --%>
   
</asp:Content>

