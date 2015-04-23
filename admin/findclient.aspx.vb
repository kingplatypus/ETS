
Partial Class admin_findclient
    Inherits System.Web.UI.Page



    Sub clientnamechanged()

        'MsgBox("GGGG")

        txtsearch.Text = txtsearch.Text.Replace("Client= ", "")
        
        'Dim splitsearch = Split(txtsearch.Text.Trim, ":")
        'txtsearch.Text = splitsearch(0)
        For Each item As ListItem In clientdd.Items

            Try

                Dim myitem = item.Text ' Split(item.Text, ":")

                If item.Text = txtsearch.Text Then ' splitsearch(0) Then
                    clientdd.SelectedValue = txtsearch.Text ' splitsearch(0)
                End If

                clientdd.SelectedValue = txtsearch.Text '  splitsearch(0).Trim
                clientddchanged()

            Catch ex As Exception
                messagelabel.Text = ex.ToString
            End Try

        Next
    End Sub


    Sub clientddbound()

        Dim newuser As String = Request.QueryString("usr")
        ' msglbl.Text = newuser
        If newuser = "" Then
            clientdd.Items.Add("Select Client")
            clientdd.SelectedValue = "Select Client"
            'cbacctsbound()
        Else

            clientdd.SelectedValue = newuser
            clientdd.Items.Add("Select Client")
            clientddchanged()

        End If
    End Sub
    Sub clientddchanged()

        'usersdatasource.SelectCommand = "SELECT * FROM [groups] WHERE groupname = '" & userdd.SelectedItem.Text & "';"
        'sellbl.Text = usersdatasource.SelectCommand
    End Sub
End Class
