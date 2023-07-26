<%
' Generate HTML data
Dim htmlData
htmlData = "This is plain text data returned from getData.asp."

' Set the content type to HTML
Response.ContentType = "text/html"
' Output the HTML data
Response.Write htmlData
%>