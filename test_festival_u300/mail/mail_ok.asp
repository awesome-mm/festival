 
<html>
  <head>
  <meta charset="utf-8">
    <title></title>
     
  </head>
  <body>
  <%
  	  alert_text = request("alert_text")
 %>
<% if alert_text  <> "" then%>
<script>
	alert("<%=alert_text %>")
</script>
<%end if%>
</body>
</html>
