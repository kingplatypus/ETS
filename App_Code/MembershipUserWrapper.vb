

Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Collections.Generic
Imports System.ComponentModel


Namespace MembershipUtilities



    ''' <summary>
    ''' Summary description for MembershipUserWrapper
    ''' This class is inherited from MembershipUser 
    ''' Using the sytax public class ClassName (..) : base(initializers...) allows for calling the
    ''' contstructor of the base class.  In this case MembershipUser.
    ''' </summary>
    ''' 
    Public Class MembershipUserWrapper
        Inherits MembershipUser

        ''' <summary>
        ''' This constructor is used to create a MembershipUserWrapper from a MembershipUser object.  MembershipUser is a default type used
        ''' in the Membership API provided with ASP.NET 2.0
        ''' </summary>
        ''' <param name="mu">MembershipUser object</param>
        Public Sub New(ByVal mu As MembershipUser)
            MyBase.New(mu.ProviderName, mu.UserName, mu.ProviderUserKey, mu.Email, mu.PasswordQuestion, mu.Comment, _
             mu.IsApproved, mu.IsLockedOut, mu.CreationDate, mu.LastLoginDate, mu.LastActivityDate, mu.LastPasswordChangedDate, _
             mu.LastLockoutDate)
        End Sub


        ''' <summary>
        ''' This calls the base class UserName property.  It is here so we can tag
        ''' this property as the primary key so that datakeynames attribute gets set in the data control.
        ''' </summary>
        ''' 
        <DataObjectField(True)> _
        Public Overloads Overrides ReadOnly Property UserName() As String
            Get
                Return MyBase.UserName
            End Get
        End Property



        ''' <summary>
        ''' This constructor is used to create a MembershipUserWrapper from individual parameters values.  
        ''' For details of what each parameter means, see the Microsoft Membership class.
        ''' </summary>
        ''' <param name="comment">Passes to MembershipUser.comment</param>
        ''' <param name="creationDate">Passes to MembershipUser.creationDate</param>
        ''' <param name="email">Passes to MembershipUser.email</param>
        ''' <param name="isApproved">Passes to MembershipUser.isApproved</param>
        ''' <param name="lastActivityDate">Passes to MembershipUser.lastActivityDate</param>
        ''' <param name="lastLoginDate">Passes to MembershipUser.lastLoginDate</param>
        ''' <param name="passwordQuestion">Passes to MembershipUser.passwordQuestion</param>
        ''' <param name="providerUserKey">Passes to MembershipUser.providerUserKey</param>
        ''' <param name="userName">Passes to MembershipUser.userName</param>
        ''' <param name="lastLockoutDate">Passes to MembershipUser.lastLockoutDate</param>
        ''' <param name="providerName">Passes to MembershipUser.providerName</param>
        ''' 
        Public Sub New(ByVal comment As String, ByVal creationDate As DateTime, ByVal email As String, ByVal isApproved As Boolean, ByVal lastActivityDate As DateTime, ByVal lastLoginDate As DateTime, _
         ByVal passwordQuestion As String, ByVal providerUserKey As Object, ByVal userName As String, ByVal lastLockoutDate As DateTime, ByVal providerName As String)
            MyBase.New(providerName, userName, providerUserKey, email, passwordQuestion, comment, _
             isApproved, False, creationDate, lastLoginDate, lastActivityDate, DateTime.Now, _
             lastLockoutDate)
            ' This calls a constructor of MembershipUser automatically because of the base reference above
        End Sub

    End Class

End Namespace

