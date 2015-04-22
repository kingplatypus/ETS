
Partial Class theblog
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try


            Dim usr As System.Web.Security.MembershipUser
            usr = System.Web.Security.Membership.GetUser()
            If usr Is Nothing Then


                'addblog.Visible = False
                'uploadpnl.Visible = False

            Else


            End If


        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    'Sub Upload(ByVal Source As Object, ByVal e As EventArgs)

    '    Dim picdd As DropDownList = addblog.FindControl("picdd")


    '    If FileUpload1.HasFile Then


    '        Try
    '            Dim directoryPath As String = "~/img/blog"
    '            Dim di As New System.IO.DirectoryInfo(Server.MapPath(directoryPath))
    '            Dim fname As String = FileUpload1.FileName.Replace(" ", "_")
    '            FileUpload1.SaveAs(Server.MapPath(directoryPath) & "\" & fname)
    '            infolbl.Text = "File name: " & _
    '               FileUpload1.PostedFile.FileName & "<br>" & _
    '               "File Size: " & _
    '               FileUpload1.PostedFile.ContentLength & " kb<br>" & _
    '               "Content type: " & _
    '               FileUpload1.PostedFile.ContentType


    '            addblog.DataBind()

    '        Catch ex As Exception
    '            infolbl.Text = "ERROR: " & ex.Message.ToString()
    '        End Try
    '    Else
    '        infolbl.Text = "You have not specified a file."
    '    End If
    'End Sub


    'Sub addblogbound()
    '    Dim picdd As DropDownList = addblog.FindControl("picdd")
    '    Dim directoryPath As String = "~/img/blog"
    '    Dim dirInfo As New IO.DirectoryInfo(Server.MapPath(directoryPath))
    '    Dim fileList() As IO.FileInfo = dirInfo.GetFiles()


    '    For Each fi In dirInfo.GetFiles
    '        picdd.Items.Add(fi.Name)
    '    Next
    'End Sub

    'Sub changerow(ByVal sender As Object, ByVal e As System.EventArgs)

    '    Try

    '        Dim btnedit As Button = TryCast(sender, Button)
    '        Dim row As GridViewRow = DirectCast(btnedit.NamingContainer, GridViewRow)

    '        '    bloggrid.EditIndex = row.RowIndex

    '    Catch ex As Exception
    '        ' msglbl.Text = ex.ToString
    '    End Try


    'End Sub

    'Sub bloginserting()

    '    Dim thedate As Date = Date.Now
    '    blogdatasource.InsertParameters.Add("thedate", thedate)

    'End Sub

    'Sub blogdeleting()

    'End Sub


    'Sub blogrowbound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

    '    If e.Row.RowType = DataControlRowType.DataRow Then

    '        Dim chkimg As CheckBox = e.Row.FindControl("chkimg")
    '        Dim myimg As Image = e.Row.FindControl("myimg")
    '        Dim imglbl As Label = e.Row.FindControl("imglbl")

    '        If chkimg.Checked = True Then
    '            myimg.Visible = False
    '        Else
    '            myimg.Visible = True
    '            myimg.ImageUrl = "~/img/blog/" & imglbl.Text
    '        End If


    '        Dim picdd As DropDownList = e.Row.FindControl("picdd")
    '        Dim directoryPath As String = "~/img/blog"
    '        Dim dirInfo As New IO.DirectoryInfo(Server.MapPath(directoryPath))
    '        Dim fileList() As IO.FileInfo = dirInfo.GetFiles()


    '        For Each fi In dirInfo.GetFiles
    '            picdd.Items.Add(fi.Name)
    '        Next

    '        picdd.SelectedValue = imglbl.Text

    '        Dim usr As System.Web.Security.MembershipUser
    '        usr = System.Web.Security.Membership.GetUser()
    '        Dim btnedit As Button = e.Row.FindControl("btnedit")
    '        Dim btndel As Button = e.Row.FindControl("btndel")
    '        If usr Is Nothing Then


    '            btnedit.Visible = False
    '            btndel.Visible = False
    '        Else

    '            btnedit.Visible = True
    '            btndel.Visible = True

    '        End If
    '    End If

    'End Sub


    'Sub blogrowupdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs)


    '    Dim index As Integer = Convert.ToInt32(e.RowIndex)
    '    Dim row As GridViewRow = bloggrid.Rows(index)

    '    Dim picdd As DropDownList = CType(row.FindControl("picdd"), DropDownList)

    '    blogdatasource.UpdateParameters.Clear()
    '    blogdatasource.UpdateParameters.Add("pic", picdd.SelectedValue.ToString)

    'End Sub
End Class
