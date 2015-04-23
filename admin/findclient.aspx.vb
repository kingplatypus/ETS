
Partial Class admin_findclient
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then
            ticketpnl.Visible = False
        End If

        
      


    End Sub


    Sub clientnamechanged()

        'MsgBox("GGGG")

        txtsearch.Text = txtsearch.Text.Replace("Client= ", "")
        
        Dim splitsearch = Split(txtsearch.Text.Trim, ":")
        'txtsearch.Text = splitsearch(0)
        For Each item As ListItem In clientdd.Items

            Try

                Dim myitem = Split(item.Text, ": ")

                If item.Text = splitsearch(1) Then
                    clientdd.SelectedValue = splitsearch(1)
                Else
                    ' clientdd.SelectedItem.Text = "Select Client"
                End If

                clientdd.SelectedValue = splitsearch(1).Trim


                clientddchanged()
                txtsearch.Text = splitsearch(0)


                If clientdd.SelectedItem.Text = "Select Client" Then
                    ticketpnl.Visible = False
                Else
                    ticketpnl.Visible = True
                End If

          
            Catch ex As Exception
                ticketpnl.Visible = False
                clientdd.SelectedItem.Text = "Select Client"
                messagelabel.Text = "Client not found." & "<BR><BR>" & ex.ToString
                ' MsgBox(ex.ToString)
                ' Response.Redirect("findclient.aspx")
            End Try

        Next
    End Sub


    Sub clientddbound()

        Dim newuser As String = Request.QueryString("usr")
        ' msglbl.Text = newuser

        clientdd.Items.Add("Select Client")
        clientdd.SelectedItem.Text = "Select Client:"

       


    End Sub
    Sub clientddchanged()

        txtsearch.Text = clientdd.SelectedItem.Text
        ticketpnl.Visible = True
       

        'usersdatasource.SelectCommand = "SELECT * FROM [groups] WHERE groupname = '" & userdd.SelectedItem.Text & "';"
        'sellbl.Text = usersdatasource.SelectCommand
    End Sub



    Sub ticketinserting()


        Dim id As String = Request.QueryString("id")
        Dim contactdate As TextBox = AddContact.FindControl("txtcontactdate")
        Dim dateentered = Date.Now
        Dim contactperson = Page.User.Identity.Name
        Dim notes As TextBox = AddContact.FindControl("txtnotes")


        ticketdatasource.InsertParameters("clientid").DefaultValue = id
        ticketdatasource.InsertParameters("contactdate").DefaultValue = contactdate.Text
        ticketdatasource.InsertParameters("dateentered").DefaultValue = dateentered
        ticketdatasource.InsertParameters("contactperson").DefaultValue = contactperson
        ticketdatasource.InsertParameters("notes").DefaultValue = notes.Text




    End Sub
    Sub ticketinserted()

        Ticketgrid.DataBind()


    End Sub

End Class
