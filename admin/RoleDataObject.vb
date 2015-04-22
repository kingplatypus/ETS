
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
Imports System.Collections.ObjectModel

Namespace MembershipUtilities

    ''' <summary>
    ''' A class used to encapsulate the Roles in ASP.NET Membermanagement 2.0
    ''' </summary>
    ' This attribute allows the 
    <DataObject(True)> _
    Public Class RoleDataObject

        ''' <summary>
        ''' Used to get all roles available
        ''' </summary>
        ''' <returns></returns>
        ''' 
        <DataObjectMethod(DataObjectMethodType.[Select], True)> _
        Public Shared Function GetRoles() As List(Of RoleData)
            Return GetRoles(Nothing, False)
        End Function

        ''' <summary>
        ''' Returns a collection of RoleData type values.  This specialized constructor lets you request by
        ''' an individual user
        ''' </summary>
        ''' <param name="userName">if null and showOnlyAssignedRolls==false, display all roles</param>
        ''' <param name="showOnlyAssignedRolls">if true, just show assigned roles</param>
        ''' <returns></returns>
        <DataObjectMethod(DataObjectMethodType.[Select], False)> _
        Public Shared Function GetRoles(ByVal userName As String, ByVal showOnlyAssignedRolls As Boolean) As List(Of RoleData)
            Dim roleList As New List(Of RoleData)()

            Dim roleListStr As String() = Roles.GetAllRoles()
            For Each roleName As String In roleListStr
                Dim userInRole As Boolean = False
                ' First, figure out if user is in role (if there is a user)
                If userName IsNot Nothing Then
                    userInRole = Roles.IsUserInRole(userName, roleName)
                End If

                If showOnlyAssignedRolls = False OrElse userInRole = True Then
                    ' Getting usersInRole is only used for the count below
                    Dim usersInRole As String() = Roles.GetUsersInRole(roleName)
                    Dim rd As New RoleData()
                    rd.RoleName = roleName
                    rd.UserName = userName
                    rd.UserInRole = userInRole
                    rd.NumberOfUsersInRole = usersInRole.Length
                    roleList.Add(rd)
                End If
            Next

            ' FxCopy will give us a warning about returning a List rather than a Collection.
            ' We could copy the data, but not worth the trouble.
            Return roleList
        End Function

        ''' <summary>
        ''' Used for Inserting a new role.  Doesn't associate a user with a role.
        ''' This is not quite consistent with this object, but really what we want.
        ''' </summary>
        ''' <param name="RoleName">The Name of the role to insert</param>
        <DataObjectMethod(DataObjectMethodType.Insert, True)> _
        Public Shared Sub Insert(ByVal roleName As String)
            If Roles.RoleExists(roleName) = False Then
                Roles.CreateRole(roleName)
            End If
        End Sub

        ''' <summary>
        ''' Delete any given role while first removing any roles associated with existing users
        ''' </summary>
        ''' <param name="roleName">name of role to delete</param>
        <DataObjectMethod(DataObjectMethodType.Delete, True)> _
        Public Shared Sub Delete(ByVal roleName As String)
            ' remove this role from all users.  not sure if deleterole does this automagically
            Dim muc As MembershipUserCollection = Membership.GetAllUsers()
            Dim allUserNames As String() = New String(0) {}

            For Each mu As MembershipUser In muc
                If Roles.IsUserInRole(mu.UserName, roleName) = True Then
                    allUserNames(0) = mu.UserName
                    Roles.RemoveUsersFromRole(allUserNames, roleName)
                End If
            Next
            Roles.DeleteRole(roleName)
        End Sub
    End Class

    ''' <summary>
    ''' Dataobject class used as a base for the collection
    ''' </summary>
    Public Class RoleData

        ' Non normalized column which counts current number of users in a role
        Private m_numberOfUsersInRole As Integer
        Public Property NumberOfUsersInRole() As Integer
            Get
                Return m_numberOfUsersInRole
            End Get
            Set(ByVal value As Integer)
                m_numberOfUsersInRole = value
            End Set
        End Property

        Private m_roleName As String
        <DataObjectField(True)> _
        Public Property RoleName() As String
            Get
                Return m_roleName
            End Get
            Set(ByVal value As String)
                m_roleName = value
            End Set
        End Property

        Private m_userName As String
        Public Property UserName() As String
            Get
                Return m_userName
            End Get
            Set(ByVal value As String)
                m_userName = value
            End Set
        End Property

        Private m_userInRole As Boolean
        Public Property UserInRole() As Boolean
            Get
                Return m_userInRole
            End Get
            Set(ByVal value As Boolean)
                m_userInRole = value
            End Set
        End Property

    End Class

End Namespace
