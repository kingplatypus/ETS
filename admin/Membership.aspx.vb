

Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class _Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

        ' Grab first username and load roles below
        If Not IsPostBack Then
            FindFirstUserName()
        End If

        If Not Request.IsAuthenticated Then
            Response.Redirect("../default.aspx")

        End If

    End Sub

    ''' <summary>
    ''' Used to retrieve the first user that would normally be processed
    ''' by the Membership List
    ''' </summary>
    Private Sub FindFirstUserName()
        Dim muc As MembershipUserCollection = Membership.GetAllUsers()
        For Each mu As MembershipUser In muc
            ' Just grab the first name then break out of loop
            Dim userName As String = mu.UserName
            '  ObjectDataSourceRoleObject.SelectParameters("UserName").DefaultValue = userName
            Exit For
        Next
    End Sub


    Protected Sub GridViewMembershipUser_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)

        '  LabelInsertMessage.Text = ""

        Dim gv As GridView = DirectCast(sender, GridView)

        ' cover case where there is no current user
        If Membership.GetUser() IsNot Nothing Then
            ' ObjectDataSourceRoleObject.SelectParameters("UserName").DefaultValue = Membership.GetUser().UserName
            'ObjectDataSourceRoleObject.SelectParameters("ShowOnlyAssignedRolls").DefaultValue = "true"
        End If

        'GridViewRole.DataBind()
    End Sub


    Protected Sub ToggleInRole_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Grab text from button and parse, not so elegant, but gets the job done
        Dim bt As Button = DirectCast(sender, Button)
        Dim buttonText As String = bt.Text

        Dim seps As Char() = New Char(0) {}
        seps(0) = " "c
        Dim buttonTextArray As String() = buttonText.Split(seps)
        Dim roleName As String = buttonTextArray(4)
        Dim userName As String = buttonTextArray(1)
        Dim whatToDo As String = buttonTextArray(0)
        Dim userNameArray As String() = New String(0) {}
        userNameArray(0) = userName
        ' Need to do this because RemoveUserFromRole requires string array.
        If whatToDo.StartsWith("Un") Then
            ' need to remove assignment of this role to this user
            Roles.RemoveUsersFromRole(userNameArray, roleName)
        Else
            Roles.AddUserToRole(userName, roleName)
        End If
        ' GridViewRole.DataBind()
    End Sub

    Protected Sub ButtonNewUser_Click(ByVal sender As Object, ByVal e As EventArgs)
        'if (TextBoxUserName.Text.Length > 0 && TextBoxPassword.Text.Length > 0)
        '{

        ' CheckboxApproval.Checked = True
        'ObjectDataSourceMembershipUser.InsertParameters("UserName").DefaultValue = TextBoxUserName.Text


        'ObjectDataSourceMembershipUser.InsertParameters("password").DefaultValue = TextBoxPassword.Text
        'ObjectDataSourceMembershipUser.InsertParameters("passwordQuestion").DefaultValue = TextBoxPasswordQuestion.Text
        'ObjectDataSourceMembershipUser.InsertParameters("passwordAnswer").DefaultValue = TextBoxPasswordAnswer.Text
        'ObjectDataSourceMembershipUser.InsertParameters("email").DefaultValue = TextBoxEmail.Text
        'ObjectDataSourceMembershipUser.InsertParameters("isApproved").DefaultValue = CheckboxApproval.Checked 'If(CheckboxApproval.Checked = True, "true", "false")

        'ObjectDataSourceMembershipUser.Insert()
        GridViewMemberUser.DataBind()

        '   TextBoxUserName.Text = ""
        '  TextBoxPassword.Text = ""
        ' TextBoxEmail.Text = ""
        ' TextBoxPasswordAnswer.Text = ""
        'TextBoxPasswordQuestion.Text = ""
        '}
        'CheckboxApproval.Checked = True
        'GridViewMemberUser.DataBind()

    End Sub

    Protected Sub GridViewMembership_RowDeleted(ByVal sender As Object, ByVal e As GridViewDeletedEventArgs)
        FindFirstUserName()
        ' Current user is deleted so need to select a new user as current
        ' update roll lists to reflect new counts
        'GridViewRole.DataBind()

    End Sub


    Protected Function ShowNumberUsersInRole(ByVal numUsersInRole As Integer) As String
        Dim result As String
        result = "Number of Users In Role: " & numUsersInRole.ToString()
        Return result
    End Function

    Protected Function ShowInRoleStatus(ByVal userName As String, ByVal roleName As String) As String
        Dim result As String

        If userName Is Nothing Or roleName Is Nothing Then
            Return "No UserName Specified"
        End If

        If Roles.IsUserInRole(userName, roleName) = True Then
            result = ("Unassign " & userName & " From Role ") + roleName
        Else
            result = ("Assign " & userName & " To Role ") + roleName
        End If

        Return result
    End Function


    Protected Sub ItemInserted(ByVal sender As Object, ByVal e As ObjectDataSourceStatusEventArgs)
        Response.Write("iteminserted")
        GridViewMemberUser.DataBind()
    End Sub
    Protected Sub DetailsView1_PageIndexChanging(ByVal sender As Object, ByVal e As DetailsViewPageEventArgs)

    End Sub
    Protected Sub ObjectDataSourceMembershipUser_Inserted(ByVal sender As Object, ByVal e As ObjectDataSourceStatusEventArgs)
        If e.Exception IsNot Nothing Then
            '  LabelInsertMessage.Text = e.Exception.InnerException.Message & " Insert Failed"
            '  LabelInsertMessage.ForeColor = System.Drawing.Color.Red

            e.ExceptionHandled = True
        Else

            GridViewMemberUser.DataBind()


            ' LabelInsertMessage.Text = "Member " & TextBoxUserName.Text & " User Added Successfully."
            'LabelInsertMessage.ForeColor = System.Drawing.Color.Green
        End If
    End Sub

End Class
