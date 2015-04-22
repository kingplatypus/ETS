
Partial Class Contact
    Inherits System.Web.UI.Page



    Sub mailit()

        Dim obj As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient
        Dim Mailmsg As New System.Net.Mail.MailMessage

        Dim MessageLabel As Label = DetailsView1.FindControl("MessageLabel")
        Dim infolbl As Label = DetailsView1.FindControl("infolbl")


        Mailmsg.To.Clear()



        Mailmsg.To.Add(New System.Net.Mail.MailAddress("<wes@etsnetworksinc.com>"))
        ' Mailmsg.To.Add(New System.Net.Mail.MailAddress("<info@nitroux.com>"))

        Mailmsg.From = New System.Net.Mail.MailAddress("<info@nitroux.com>")


        Mailmsg.Subject = "Someone has contacted you via ETSNetworksInc.com!"

        Try
            Dim mname As TextBox = DetailsView1.FindControl("contactname")
            Dim mbody As TextBox = DetailsView1.FindControl("contactmessage")
            Dim mmail As TextBox = DetailsView1.FindControl("contactemail")
            Dim mphone As TextBox = DetailsView1.FindControl("contactphone")
            msgsentlbl.Text = "<center>Thank You For Contacting ETS Networks " & mname.Text & "!<br>An email message has been sent on your behalf. <br>  We will respond as soon as possible!</center>"
            DetailsView1.Visible = "false"
            infolbl.Visible = "false"

            Mailmsg.Body = "name: " & mname.Text & " <br>email: " & mmail.Text & " <br>phone: " & mphone.Text & "<br><br> " & mbody.Text
            Mailmsg.Body += "<BR><BR><h6>*please do not reply to this email.*</h6>"


            Mailmsg.IsBodyHtml = True
            Mailmsg.Priority = Net.Mail.MailPriority.High

            obj.Send(Mailmsg)

        Catch ex As Exception
            'Response.Write("Error: " & ex.ToString())
            msgsentlbl.Text = ex.ToString
        End Try


    End Sub


End Class
