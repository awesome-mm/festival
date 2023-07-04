<!-- #include virtual="/include/db/db_connect.asp" -->

<html>
  <head>
    <title></title>
     
  </head>
  <body>
  <%
			c_naver = r_call("c_naver")
			strSQL="update tbl_member set c_naver= '"& c_naver &"'  where c_no = " & session("session_no")
			'response.write strSQL
			dbCon.Execute strSQL
%>
<script>
	alert("<%=session("session_id")%>계정을 네이버계정과 연동 했습니다.\n이 후에는 네이버를 통해서 로그인 가능합니다.")
	location.href="/"
</script>
<!-- #include virtual="/include/db/db_close.asp" -->
