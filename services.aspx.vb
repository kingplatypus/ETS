
Partial Class services
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        Dim usr As System.Web.Security.MembershipUser
        usr = System.Web.Security.Membership.GetUser()
        If usr Is Nothing Then

            DetailsView1.Rows(1).Visible = False
            uploadpnl.Visible = "false"

            Dim h1 As New HtmlMeta()
            Dim h2 As New HtmlMeta()


            Dim head As HtmlHead = CType(Page.Header, HtmlHead)
            h1.Name = "Keywords"
            h2.Name = "Description"

            Dim mydesc As Label = DetailsView1.FindControl("label1")
            Dim lblkeywords As Label = DetailsView1.FindControl("lblkeywords")
            Dim lbltitle As Label = DetailsView1.FindControl("lbltitle")
            h2.Content = "Welcome to ETS Networks! " & Left(StripHtml(mydesc.Text, False), 150)
            h1.Content = lblkeywords.Text
            Page.Title = "ETS Networks | " & lbltitle.Text
            head.Controls.Add(h2)
            head.Controls.Add(h1)
        Else
            DetailsView1.BackColor = Drawing.Color.Bisque
            DetailsView1.Fields(1).Visible = True
            DetailsView1.GridLines = GridLines.Both
            uploadpnl.Visible = "true"


        End If


    End Sub



    Sub Upload(ByVal Source As Object, ByVal e As EventArgs)

        ' Dim picdd As DropDownList = DetailsView1.FindControl("picdd")


        If FileUpload1.HasFile Then


            Try
                Dim directoryPath As String = "~/img/services"
                Dim di As New System.IO.DirectoryInfo(Server.MapPath(directoryPath))

                FileUpload1.SaveAs(di.ToString & "\" & FileUpload1.FileName)
                infolbl.Text = "File name: " & _
                   FileUpload1.PostedFile.FileName & "<br>" & _
                   "File Size: " & _
                   FileUpload1.PostedFile.ContentLength & " kb<br>" & _
                   "Content type: " & _
                   FileUpload1.PostedFile.ContentType

                ' picdd.DataBind()
                '     DetailsView1.DataBind()
                'Server.Transfer("userdetails.aspx?uname=" & uname)


            Catch ex As Exception
                infolbl.Text = "ERROR: " & ex.Message.ToString()
            End Try
        Else
            infolbl.Text = "You have not specified a file."
        End If

        'dd.DataBind()


    End Sub

    Sub detailsbound()

        'fills the dropdowns for the product pics
        If detailsview1.CurrentMode = DetailsViewMode.Edit Then
            ' Dim pic As Label = DetailsView1.FindControl("piclbl")

            Dim picdd As DropDownList = detailsview1.FindControl("picdd")
            Dim piclbl As Label = detailsview1.FindControl("piclbl")

            '  picdd.Items.Add("(Select Picture)")
            Dim directoryPath As String = "~/img/services"
            Dim di As New System.IO.DirectoryInfo(Server.MapPath(directoryPath))
            Dim fiArr As System.IO.FileInfo() = di.GetFiles()
            Dim fi As System.IO.FileInfo

            'If Not IsPostBack Then
            For Each fi In fiArr
                picdd.Items.Add(fi.Name)

            Next fi
            picdd.SelectedValue = piclbl.Text.ToString.Trim

        End If




    End Sub



    Public Shared Function StripHtml(ByVal html As String, ByVal allowHarmlessTags As Boolean) As String
        If html Is Nothing OrElse html = String.Empty Then
            Return String.Empty
        End If
        If allowHarmlessTags Then
            Return System.Text.RegularExpressions.Regex.Replace(html, "", String.Empty)
        End If
        Return System.Text.RegularExpressions.Regex.Replace(html, "<[^>]*>", String.Empty)
    End Function

End Class
