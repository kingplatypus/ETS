
Partial Class my404
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        Response.AddHeader("REFRESH", "10;URL=http://www.blackdome.com/default.aspx")
    End Sub
End Class
