<%@ Page ClientTarget="uplevel" Language="VB" MasterPageFile="~/MasterPage.master"  Title="Forgot Your Password?" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ MasterType virtualpath="~/masterpage.master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">



    <table width ="50%" align ="center" ><tr><td>
    
<asp:PasswordRecovery ID="PasswordRecovery1" runat="server"  >

<UserNameTemplate>
<table border="0" cellpadding="1" cellspacing="0" 
style="border-collapse:collapse;">
<tr>
<td>
<table border="0" cellpadding="0">
<tr>
<td align="center" colspan="2">
Forgot Your Password?</td>
</tr>
<tr>
<td align="center" colspan="2">
Enter your User Name to receive your password.</td>
</tr>
<tr>
<td align="right">
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
</td>
<td align ="left" >
<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
ControlToValidate="UserName" ErrorMessage="User Name is required." 
ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="center" colspan="2" style="color:Red;">
<asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
</td>
</tr>
<tr>
<td align="center" colspan="2">
<asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" 
ValidationGroup="PasswordRecovery1" CssClass ="mybutton" />
</td>
</tr>
</table>
</td>
</tr>
</table>
</UserNameTemplate>

<SuccessTemplate>
<table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
<tr>
<td>
<table border="0" cellpadding="0">
<tr>
<td>
Your password has been sent to you at the email address you provided.<br />
check junkmail folders if you do not see the message in your inbox.<br />
please <a href="login.aspx">login</a> and change your password as email is not secure.


</td>
</tr>
</table>
</td>
</tr>
</table>
</SuccessTemplate>
</asp:PasswordRecovery>



</td></tr></table>

<br /><br /><br />
</asp:Content> 