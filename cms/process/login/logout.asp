<!-- #include virtual="/include/db/db_connect.asp" -->
<html>
  <head>
    <title></title>
     
  </head>
  <body>
  <%
  	 
	 	a_name = session("session_name")
		session("session_no") = ""
		session("session_id") = ""
		session("session_name") = ""
		session("session_team_type") = ""
		session("session_jang") = ""
%>
<script>
	alert("<%=a_name%>님 로그아웃 되었습니다.")
	location.href="/"
</script>

<!-- #include virtual="/include/db/db_close.asp" -->