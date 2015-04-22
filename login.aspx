<%@ Page Title="Log In to ETS Networks" Language="VB" CodeFile ="~/login.aspx.vb" Inherits ="login" MasterPageFile="~/masterpage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<br />

<asp:Label runat ="server" ID="dumlbl"></asp:Label>


<center>
<asp:LoginView ID="LoginView1" runat="server">
   
    
    <AnonymousTemplate >
    
    <table border ="0" width ="50%" align ="center"   >
    <tr>
    <td align ="center" valign ="top" >
    
       
       
<asp:Login ID="Login1" runat="server" DisplayRememberMe="true" 
RememberMeSet ="false"   Orientation="vertical" 
FailureText="You are unable to log in at this time.  Please try again."
LoginButtonType="Button " PasswordRecoveryText="Forgot Your Password?" TextBoxStyle-ForeColor ="Navy" 
PasswordRecoveryUrl="forgotpassword.aspx" 
TextBoxStyle-BackColor="AliceBlue"    
LoginButtonStyle-CssClass ="mybutton" 
TextBoxStyle-BorderStyle ="inset" DestinationPageUrl="~/login.aspx">
<TextBoxStyle BackColor="AliceBlue" BorderStyle="Inset" ForeColor="Navy" />
<LoginButtonStyle CssClass="mybutton"  />
<LayoutTemplate>
<table border="0" cellpadding="1" cellspacing="0" align="center" 
style="border-collapse:collapse;">
<tr>
<td>
<table border="0" cellpadding="0">
<tr>
<td align="center" colspan="2">
<b>Log In</b></td>
</tr>
<tr>
<td align="right">
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
</td>
<td>
<asp:TextBox ID="UserName" runat="server" BackColor="AliceBlue" 
BorderStyle="Inset" ForeColor="Navy"></asp:TextBox>
<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
ControlToValidate="UserName" ErrorMessage="User Name is required." 
ToolTip="User Name is required." ValidationGroup="ctl00$Login1">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">
<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
</td>
<td>
<asp:TextBox ID="Password" runat="server" BackColor="AliceBlue" 
BorderStyle="Inset" ForeColor="Navy" TextMode="Password"></asp:TextBox>
<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
ControlToValidate="Password" ErrorMessage="Password is required." 
ToolTip="Password is required." ValidationGroup="ctl00$Login1">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td colspan="2" align ="center" >
<asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
</td>
</tr>
<tr>
<td align="center" colspan="2" style="color:Red;">
<asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
</td>
</tr>
<tr>
<td align="center" colspan="2">
<asp:Button ID="LoginButton" runat="server" CommandName="Login" 
CssClass="mybutton" Text="Log In" ValidationGroup="ctl00$Login1" />
</td>
</tr>
<tr>
<td colspan="2" align ="center" >
<asp:HyperLink ID="PasswordRecoveryLink" runat="server"  Font-Size ="Smaller"  Font-Italic ="true" 
NavigateUrl="forgotpassword.aspx">Forgot Your Password?</asp:HyperLink>
</td>
</tr>
</table>
</td>
</tr>
</table>
</LayoutTemplate>
</asp:Login>

         </td>
    </tr>
    </table>
    
    <br /><br /><br />
    </AnonymousTemplate>
    
    
    
    <LoggedInTemplate >
    
    <table width="80%" border="0" align ="center" >
    <tr><td align="center" valign ="top" colspan ="4"  >
    
    
    Welcome back <asp:LoginName ID="LoginName1" runat="server" />!
        <br />
     
    </td>
    </tr><tr>
   <td  align="center">
       
    <tr>
     <td  align="center">
        <a href="admin/manageadmins.aspx">Administrators</a>
    </td>
    </tr><tr>
    <td  align="center">
        <a href="admin/changepassword.aspx">Change Password</a>
    </td>
    
    </tr>
    
    </table>
    </LoggedInTemplate>
    
    
    
    </asp:LoginView>

</center>





</asp:Content>

