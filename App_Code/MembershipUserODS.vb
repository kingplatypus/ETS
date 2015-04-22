


Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Globalization
Imports System.Collections.ObjectModel

Namespace MembershipUtilities

   
    <DataObject(True)> _
    Public Class MembershipUserODS

 
        <DataObjectMethod(DataObjectMethodType.Insert, True)> _
        Public Shared Sub Insert(ByVal userName As String, ByVal isApproved As Boolean, ByVal comment As String, ByVal lastLockoutDate As DateTime, ByVal creationDate As DateTime, ByVal email As String, _
        ByVal lastActivityDate As DateTime, ByVal providerName As String, ByVal isLockedOut As Boolean, ByVal lastLoginDate As DateTime, ByVal isOnline As Boolean, ByVal passwordQuestion As String, _
        ByVal lastPasswordChangedDate As DateTime, ByVal password As String, ByVal passwordAnswer As String)


            ' The incoming parameters, password and passwordAnswer are not properties of the
            ' MembershipUser class.  Membership has special member functions to deal with these
            ' two special properties for security reasons.  For this reason, they do not appear
            ' in a datacontrol that is created with this user object.  
            '
            ' the only reason you may want to have defaults is so you can build insert into your
            ' datacontrol.  A better approach would be to either follow the example shown in the
            ' Membership.asp page where the parameters are set directly to the userobject, or not
            ' include "new" at all in your control and use the other controls in the Membership API
            ' for creating new members.  (CreateUserWizard, etc)
            '
            ' It is recommended that you only enable the following lines if you are sure of what you are doing

            'if (password == null)
            '{
            '    password = "pass0word";
            '}

            'if (passwordAnswer == null)
            '{
            '    passwordAnswer = "Password Answer";
            '}



            Dim status As MembershipCreateStatus
            Membership.CreateUser(userName, password, email, passwordQuestion, passwordAnswer, isApproved, _
             status)

            If status <> MembershipCreateStatus.Success Then
                Throw New ApplicationException(status.ToString())
            End If

            Dim mu As MembershipUser = Membership.GetUser(userName)
            mu.Comment = comment
            Membership.UpdateUser(mu)

        End Sub

        ''' <summary>
        ''' Takes as input the original username and the current username
        ''' </summary>
        ''' <param name="providerUserKey"></param>
        ''' <param name="Original_providerUserKey"></param>
        ''' 
        <DataObjectMethod(DataObjectMethodType.Delete, True)> _
        Public Shared Sub Delete(ByVal UserName As String)
            Membership.DeleteUser(UserName, True)
        End Sub

        ''' <summary>
        ''' This update method is the default update as shown by the class attribute.
        ''' 
        ''' </summary>
        ''' <param name="original_UserName">MembershipUser.UserName originally retrieved</param>
        ''' <param name="email">MembershipUser.email</param>
        ''' <param name="isApproved">MembershipUser.isApproved</param>
        ''' <param name="comment">MembershipUser.comment</param>
        ''' <param name="password">MembershipUser.password</param>
        ''' <param name="passwordAnswer">MembershipUser.passwordAnswer</param>
        ''' <param name="lastActivityDate">MembershipUser.lastActivityDate</param>
        ''' <param name="lastLoginDate">MembershipUser.lastLoginDate</param>
        ''' 
        <DataObjectMethod(DataObjectMethodType.Update, True)> _
        Public Shared Sub Update(ByVal UserName As String, ByVal email As String, ByVal IsLockedOut As Boolean)
            Dim dirtyFlag As Boolean = False

            Dim mu As MembershipUser = Membership.GetUser(UserName)

            

            If mu.Email = Nothing OrElse mu.Email.CompareTo(email) <> 0 Then
                dirtyFlag = True
                mu.Email = email
            End If


            If mu.IsLockedOut Then

                ' dirtyFlag = True
                mu.UnlockUser()
            End If

            If dirtyFlag = True Then
                Membership.UpdateUser(mu)
            End If
        End Sub

        ''' <summary>
        ''' This is just used to set the IsApproved status.
        ''' username is always passed in for searching purposes.
        ''' </summary>
        ''' <param name="original_username">Current UserName to Update (primary key)</param>
        ''' <param name="isApproved">MembershipUser.isApproved</param>
        ''' 
        <DataObjectMethod(DataObjectMethodType.Update, False)> _
        Public Shared Sub Update(ByVal Username As String, ByVal isApproved As Boolean)
            Dim dirtyFlag As Boolean = False
            Dim mu As MembershipUser = Membership.GetUser(Username)

            If mu.IsApproved <> isApproved Then
                dirtyFlag = True
                mu.IsApproved = isApproved
            End If
            If dirtyFlag = True Then
                Membership.UpdateUser(mu)
            End If
        End Sub

        ''' <summary>
        ''' Make a list of MembershipUserWrapper objects
        ''' </summary>
        ''' <returns>A List of type MembershipUserWrapper</returns>
        ''' 
        <DataObjectMethod(DataObjectMethodType.[Select], False)> _
        Public Shared Function GetMembers() As List(Of MembershipUserWrapper)
            Return GetMembers(True, True, Nothing, Nothing)
        End Function

        ''' <summary>
        ''' Make a list of MembershipUserWrapper objects by current sort
        ''' </summary>
        ''' <param name="sortData">Whicfh Column to perform the sort on</param>
        ''' <returns>A List of type MembershipUserWrapper</returns>
        ''' 
        <DataObjectMethod(DataObjectMethodType.[Select], True)> _
        Public Shared Function GetMembers(ByVal sortData As String) As List(Of MembershipUserWrapper)
            ' All Users, All approvalStatus
            Return GetMembers(True, True, Nothing, sortData)
        End Function

        ''' <summary>
        ''' returns all approved users by specified sort
        ''' </summary>
        ''' <param name="approvalStatus">if true, return approved users</param>
        ''' <param name="sortData">description of sort</param>
        ''' <returns>A List of type MembershipUserWrapper</returns>
        ''' 
        <DataObjectMethod(DataObjectMethodType.[Select], False)> _
        Public Shared Function GetMembers(ByVal approvalStatus As Boolean, ByVal sortData As String) As List(Of MembershipUserWrapper)
            If approvalStatus = True Then
                Return GetMembers(True, False, Nothing, sortData)
            Else
                Return GetMembers(False, True, Nothing, sortData)
            End If
        End Function

        ''' <summary>
        ''' Return a collection of MembershipUserWrapper's based on criteria passed in as parameters
        ''' </summary>
        ''' <param name="returnAllApprovedUsers">returns all users with approval set to true</param>
        ''' <param name="returnAllNotApproviedUsers">return all users with approval set to false</param>
        ''' <param name="usernameToFind">return based on username (overrides approval above)</param>
        ''' <param name="sortData">sort parameter</param>
        ''' <returns>Returns a Collection of Users (as recommended by FxCop)</returns>
        ''' 
        <DataObjectMethod(DataObjectMethodType.[Select], False)> _
        Public Shared Function GetMembers(ByVal returnAllApprovedUsers As Boolean, ByVal returnAllNotApprovedUsers As Boolean, ByVal usernameToFind As String, ByVal sortData As String) As List(Of MembershipUserWrapper)

            Dim memberList As New List(Of MembershipUserWrapper)()

            ' See if we are looking for just one user
            If usernameToFind <> Nothing Then
                Dim mu As MembershipUser = Membership.GetUser(usernameToFind)
                If mu Is Nothing Then
                Else
                End If
                Dim md As New MembershipUserWrapper(mu)
                memberList.Add(md)
            End If

            'Else
            Dim muc As MembershipUserCollection = Membership.GetAllUsers()
            For Each mu As MembershipUser In muc
                If (returnAllApprovedUsers = True AndAlso mu.IsApproved = True) OrElse (returnAllNotApprovedUsers = True AndAlso mu.IsApproved = False) Then
                    Dim md As New MembershipUserWrapper(mu)
                    memberList.Add(md)
                End If
            Next

            If sortData = Nothing Then
                sortData = "UserName"
            End If
            If sortData.Length = 0 Then
                sortData = "UserName"
            End If

            ' Make a special version of sortData for the switch statement so that whether or not the
            ' DESC is appended to the string sortData, it will switch on the base of that string.
            Dim sortDataBase As String = sortData
            ' init and assume there is not DESC appended to sortData
            Dim descString As String = " DESC"
            If sortData.EndsWith(descString) Then
                sortDataBase = sortData.Substring(0, sortData.Length - descString.Length)
            End If

            Dim comparison As Comparison(Of MembershipUserWrapper) = Nothing

            '        Select Case sortDataBase
            '            Case "UserName"
            '		comparison = New Comparison(Of MembershipUserWrapper)(Function(lhs As MembershipUserWrapper, rhs As MembershipUserWrapper) Do
            '                Return lhs.UserName.CompareTo(rhs.UserName)
            '		End Function)
            '		Exit Select
            '	Case "Email"
            '		comparison = New Comparison(Of MembershipUserWrapper)(Function(lhs As MembershipUserWrapper, rhs As MembershipUserWrapper) Do
            '			If lhs.Email = Nothing Or rhs.Email = Nothing Then
            '				Return 0
            '			Else
            '				Return lhs.Email.CompareTo(rhs.Email)
            '			End If
            '		End Function)
            '		Exit Select
            '	Case "CreationDate"
            '		comparison = New Comparison(Of MembershipUserWrapper)(Function(lhs As MembershipUserWrapper, rhs As MembershipUserWrapper) Do
            '			Return lhs.CreationDate.CompareTo(rhs.CreationDate)
            '		End Function)
            '		Exit Select
            '	Case "IsApproved"
            '		comparison = New Comparison(Of MembershipUserWrapper)(Function(lhs As MembershipUserWrapper, rhs As MembershipUserWrapper) Do
            '			Return lhs.IsApproved.CompareTo(rhs.IsApproved)
            '		End Function)
            '		Exit Select
            '	Case "IsOnline"
            '		comparison = New Comparison(Of MembershipUserWrapper)(Function(lhs As MembershipUserWrapper, rhs As MembershipUserWrapper) Do
            '			Return lhs.IsOnline.CompareTo(rhs.IsOnline)
            '		End Function)
            '		Exit Select
            '	Case "LastLoginDate"
            '		comparison = New Comparison(Of MembershipUserWrapper)(Function(lhs As MembershipUserWrapper, rhs As MembershipUserWrapper) Do
            '			Return lhs.LastLoginDate.CompareTo(rhs.LastLoginDate)
            '		End Function)
            '		Exit Select
            '	Case Else
            '		comparison = New Comparison(Of MembershipUserWrapper)(Function(lhs As MembershipUserWrapper, rhs As MembershipUserWrapper) Do
            '			Return lhs.UserName.CompareTo(rhs.UserName)
            '		End Function)
            '		Exit Select
            'End Select

				If sortData.EndsWith("DESC") Then
                'memberList.Sort(comparison)
					memberList.Reverse()
				Else
                'memberList.Sort(comparison)

				End If
            'End If

        ' FxCopy will give us a warning about returning a List rather than a Collection.
        ' We could copy the data, but not worth the trouble.
			Return memberList

		End Function
    End Class
End Namespace

'=======================================================
'Service provided by Telerik (www.telerik.com)
'Conversion powered by NRefactory.
'Built and maintained by Todd Anglin and Telerik
'=======================================================
