
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim usr As System.Web.Security.MembershipUser
        usr = System.Web.Security.Membership.GetUser()
        If usr Is Nothing Then
            loginlnk.Visible = True
            loginstatus1.Visible = False
            adminlnk.Visible = False
        Else
            loginlnk.Visible = False
            loginstatus1.Visible = True

        End If

    End Sub

End Class

