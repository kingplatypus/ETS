<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is 
        
        
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
    
    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        If (HttpContext.Current.Request.Url.ToString().ToLower().Contains("http://edtatschsupport.com")) Then


            HttpContext.Current.Response.Status = "301 Moved Permanently"

            HttpContext.Current.Response.AddHeader("Location", Request.Url.ToString().ToLower().Replace("http://edtatschsupport.com", "http://etsnetworksinc.com"))

        End If

        If (HttpContext.Current.Request.Url.ToString().ToLower().Contains("http://etsnetworksinc.com")) Then
            HttpContext.Current.Response.Status = "301 Moved Permanently"

           
            HttpContext.Current.Response.AddHeader("Location", Request.Url.ToString().ToLower().Replace("http://etsnetworksinc.com", "http://www.etsnetworksinc.com"))

        End If
        
 
       
    End Sub
       
</script>