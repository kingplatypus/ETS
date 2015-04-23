<%@ WebService Language="VB" Class="findclient" %>


Imports System
Imports System.Collections.Generic
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Data.SqlTypes
Imports System.Web.Script.Services
Imports System.Web
Imports System.Collections
Imports System.Collections.Specialized
Imports System.Web.Services.Protocols
Imports System.Data

<WebService(Namespace:="http://www.etsnetworksinc.com/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
 <System.Web.Script.Services.ScriptService()> _
  <Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class findclient
    Inherits System.Web.Services.WebService

    'prefixText is the text that the user enters into the textbox
    <WebMethod()> <System.Web.Script.Services.ScriptMethod()> _
    Public Function findclient(ByVal prefixText As String, ByVal count As Integer) As String()

        Dim C As New Data.SqlClient.SqlConnection(Web.Configuration.WebConfigurationManager.ConnectionStrings("etsConnectionString").ConnectionString)

        Dim cmd As New Data.SqlClient.SqlCommand()
        Dim sa() As String
        Dim dt As New Data.DataTable
        
        Try
            C.Open()

            With cmd
              .CommandText = "SELECT DISTINCT [clientname] FROM [clients] WHERE [clientname] LIKE '%" & prefixText & "%' "
               
                .Connection = C
                .Parameters.Add("@Value", SqlDbType.NVarChar, 255).Value = prefixText

                Dim da As New Data.SqlClient.SqlDataAdapter(cmd)
                da.Fill(dt)
                ReDim sa(dt.Rows.Count - 1)
                sa(0) = "Search String: " & prefixText
                For i As Int32 = 0 To dt.Rows.Count - 1
                    sa(i) = (dt.Rows(i)(0)) '& vbCrLf '& "Groupname= " & (dt.Rows(i)(1))
                Next
            End With
                        
        Catch
            ReDim sa(0)
            sa(0) = (Err.Description)
            ' ds = Nothing
        Finally
            C.Close()
            C.Dispose()
            cmd.Dispose()
        End Try
        
        Return sa
    End Function

    
    
    
    
    
    
    
    
End Class


