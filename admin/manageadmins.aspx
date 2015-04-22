<%@ Page Language="VB" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile ="~/admin/Membership.aspx.vb" Inherits ="_Default"  Title="Manage Administrator Accounts" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"   Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<script language ="VBSCRIPT" runat="Server" >
    

    
    
    Protected Sub createduser(ByVal sender As Object, ByVal e As System.EventArgs)
        ' Dim DropDownList1 As DropDownList = cuwUser.FindControl("DropDownList1")
        ' infolbl.Text = "CREATEDUSER"
        ' Roles.AddUserToRole(cuwUser.UserName, "admin")
        GridViewMemberUser.DataBind()
        'Response.Redirect("manageadmins.aspx")
 
        
        
    End Sub
    
    Sub GridViewMemberUserBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
       
     
    End Sub
    Sub Continuegroup(ByVal sender As Object, ByVal e As System.EventArgs)
        
        Response.Redirect("manageadmins.aspx")
 

        
    End Sub
    
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate >


<h2>Manage Administrator Accounts</h2>

                
  <!--user grid-->


 <!--create users>-->
    
    <asp:Label runat ="server" ID="infolbl"></asp:Label>
    
    <table width ="100%" border ="0">
    <tr>
    <td align ="center" >
    
    <asp:Panel runat ="server" >
    
<asp:CreateUserWizard ID="cuwUser" runat="server" 
InvalidEmailErrorMessage="This is not a valid email."
InvalidPasswordErrorMessage ="This password does not meet the minimum requirements."
LoginCreatedUser ="false"  InstructionTextStyle-HorizontalAlign="Center" 
 NavigationStyle-HorizontalAlign="Center" 
UserNameRequiredErrorMessage ="A user name is required."
OnCreatedUser="createduser"  
HeaderStyle-HorizontalAlign="center"  
CompleteSuccessTextStyle-HorizontalAlign="center" 
ErrorMessageStyle-HorizontalAlign ="center" 
HyperLinkStyle-HorizontalAlign ="center" 
TitleTextStyle-HorizontalAlign ="center" 
Width ="60%"  >
<WizardSteps>
<asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server"  Title="Create Administrator Account">
<ContentTemplate>
<table border="0" align ="center" width ="100%" >
<tr>
<td align="center"  colspan="2">
<b>Create Administrator Account</b>
</td>
</tr>
<tr>
<td align="right" width ="35%">
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label></td>
<td align ="left" >
<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
ErrorMessage="A user name is required." ToolTip="A user name is required." ValidationGroup="cuwUser">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">
<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></td>
<td align ="left">
<asp:TextBox ID="Password" runat="server" TextMode="Password" ></asp:TextBox>
<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="cuwUser">*</asp:RequiredFieldValidator>
<asp:Label ID="helplbl"  runat="server"></asp:Label>
<cc1:PasswordStrength ID="PasswordStrength1" BarIndicatorCssClass="barindicator"
DisplayPosition="RightSide" MinimumSymbolCharacters="0" PreferredPasswordLength="6"
StrengthIndicatorType="Text" HelpStatusLabelID="helplbl" HelpHandlePosition="AboveRight"  TargetControlID="Password" 
runat="server" >
</cc1:PasswordStrength>
</td>
</tr>
<tr>
<td align="right">
<asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label></td>
<td align ="left">
<asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
<asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
ValidationGroup="cuwUser">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td align="right">
<asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label></td>
<td align ="left">
<asp:TextBox ID="Email" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="cuwUser">*</asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td align="center"  colspan="2">
<asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
ValidationGroup="cuwUser"></asp:CompareValidator>
</td>
</tr>
<tr>
<td align="center" colspan="2" style="color: red">
<asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
</td>
</tr>
</table>
</ContentTemplate>
</asp:CreateUserWizardStep>


<asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
<ContentTemplate>
<table border="0" align ="center" width ="80%" >

<tr>
<td align="center">
Your new admin account has been successfully created.
<br />
<a href="manageadmins.aspx" >Create Another?</a>

</td>


</tr>

</table>
</ContentTemplate>
</asp:CompleteWizardStep>

</WizardSteps>
<InstructionTextStyle HorizontalAlign="Center" />
<CompleteSuccessTextStyle HorizontalAlign="Center" />
<HeaderStyle HorizontalAlign="Center" />
<ErrorMessageStyle HorizontalAlign="Center" />
<TitleTextStyle HorizontalAlign="Center" />
<HyperLinkStyle HorizontalAlign="Center" />
<CreateUserButtonStyle   CssClass ="mybutton " />

  
</asp:CreateUserWizard>



 
</asp:Panel>
 


   </td>
    </tr>
    </table>


<asp:UpdateProgress ID="UpdateProgress1" runat="server"
AssociatedUpdatePanelID="UpdatePanel1" >
<ProgressTemplate>
<div style ="background-color :White;">
<img src="../img/loading.gif" />
<br />
<h3>Updating..............</h3>
</div>  
</ProgressTemplate>
</asp:UpdateProgress>


  <br /><hr />
    
<asp:GridView ID="GridViewMemberUser" runat="server" 
 AllowPaging="false"  PagerSettings-Mode ="NumericFirstLast" 
  PagerStyle-Font-Size ="Medium"  PagerStyle-HorizontalAlign ="Center" PagerSettings-Position="TopAndBottom" 
   PagerStyle-Font-Bold ="true" 
  AutoGenerateColumns="False" PageIndex ="1"
DataKeyNames="UserName" DataSourceID="ObjectDataSourceMembershipUser" 
AllowSorting="True" 
 
Width="100%" OnRowDataBound ="GridViewMemberUserBound" >
<Columns>
<asp:CommandField ShowEditButton="True" ButtonType ="button" ControlStyle-CssClass="mybutton" />

<asp:TemplateField>
<ItemTemplate >
<asp:Button runat ="server" Text ="Delete" ID="Delete2"  Width ="50px"
OnClientClick ="return confirm('Are you sure you want to delete this user? They will no longer have access to the system!');"
CommandName="delete"  CommandArgument="Delete" CssClass ="mybutton">
</asp:Button>
</ItemTemplate>
</asp:TemplateField>
    <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
        <EditItemTemplate>
            <asp:Label ID="lbluser" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
        </EditItemTemplate>
        <ItemTemplate>
            <asp:Label ID="lbluser" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>

<asp:TemplateField Visible ="false"  >
<ItemTemplate >
<asp:Label runat ="server" ID="uidlbl" Text ='<%#Eval("ProviderUserKey") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>

<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />

<asp:BoundField DataField="PasswordQuestion" HeaderText="PasswordQuestion" ReadOnly="True"
SortExpression="PasswordQuestion" Visible ="False"  />

<asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" Visible ="False"  />

<asp:BoundField DataField="CreationDate" HeaderText="CreationDate" ReadOnly="True" Visible ="False" 
SortExpression="CreationDate" />
<asp:CheckBoxField DataField="IsApproved" HeaderText="IsApproved" SortExpression="IsApproved" Visible ="False"  />
<asp:BoundField DataField="LastLockoutDate" Visible="False" HeaderText="LastLockoutDate" ReadOnly="True"
SortExpression="LastLockoutDate" />
<asp:BoundField DataField="LastLoginDate" HeaderText="Last Login" SortExpression="LastLoginDate" ReadOnly="True" />
<asp:CheckBoxField DataField="IsOnline" HeaderText="IsOnline" ReadOnly="True" SortExpression="IsOnline"  Visible ="false" />
<asp:CheckBoxField DataField="IsLockedOut" HeaderText="Locked Out?"
SortExpression="IsLockedOut" />
<asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" SortExpression="LastActivityDate" Visible="False" />
<asp:BoundField DataField="LastPasswordChangedDate" HeaderText="LastPasswordChangedDate" Visible="False"
ReadOnly="True" SortExpression="LastPasswordChangedDate" />

<asp:BoundField DataField="ProviderName" HeaderText="ProviderName" ReadOnly="True" Visible="False"
SortExpression="ProviderName" />

<asp:TemplateField >
<ItemTemplate >
<asp:Label runat ="server" ID="myrole"></asp:Label>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>

<asp:ObjectDataSource ID="ObjectDataSourceMembershipUser" runat="server" DeleteMethod="Delete"
InsertMethod="Insert"  SelectMethod="GetMembers"
TypeName="MembershipUtilities.MembershipUserODS"  
 UpdateMethod ="Update"
SortParameterName="SortData"  >
<DeleteParameters>
<asp:Parameter Name="UserName" Type="String" />
</DeleteParameters>

<UpdateParameters>


<asp:Parameter Name="Email" Type="String" />
<asp:Parameter Name="IsLockedOut" Type="Boolean" />
</UpdateParameters> 

<SelectParameters>
<asp:Parameter Name="sortData" Type="String" />
</SelectParameters>
<InsertParameters>
<asp:Parameter Name="userName" Type="String" />
<asp:Parameter Name="isApproved" Type="Boolean" />
<asp:Parameter Name="comment" Type="String" />
<asp:Parameter Name="lastLockoutDate" Type="DateTime" />
<asp:Parameter Name="creationDate" Type="DateTime" />
<asp:Parameter Name="email" Type="String" />
<asp:Parameter Name="lastActivityDate" Type="DateTime" />
<asp:Parameter Name="providerName" Type="String" />
<asp:Parameter Name="isLockedOut" Type="Boolean" />
<asp:Parameter Name="lastLoginDate" Type="DateTime" />
<asp:Parameter Name="isOnline" Type="Boolean" />
<asp:Parameter Name="passwordQuestion" Type="String" />
<asp:Parameter Name="lastPasswordChangedDate" Type="DateTime" />
<asp:Parameter Name="password" Type="String" />
<asp:Parameter Name="passwordAnswer" Type="String" />
</InsertParameters>
</asp:ObjectDataSource>

<br />
<hr />
   
  
    
   
<br /><br />


</ContentTemplate>
</asp:UpdatePanel> 
</asp:Content>
