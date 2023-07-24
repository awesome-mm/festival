<!-- #include virtual="/include/db/db_connect.asp" -->

<html>
  <head>
  <meta charset="utf-8">

    <title></title>
     
  </head>
  <body>
  <%
  	 
	c_email = r_call("c_email")
	c_email_licente = r_call("c_email_licente")
	 
	sql = "select c_id from tbl_member where c_email = '"&  c_email &"' and c_email_license = '" & c_email_licente & "' and c_id = '' "
	Set tbl_board=CreateObject("ADODB.RecordSet")
	tbl_board.Open sql, dbCon, 1
'response.write sql
	If tbl_board.EOF Then
 
%>
 	<script>
		alert("인증번호가 맞지 않습니다.\n인증번호를 확인해 주세요")
	</script>
    
   <%
	
	else
		 
	%>
 	<script>
		alert("인증되었습니다.\n회원가입을 계속 진행해 주세요.")
		parent.email2();
	</script>
    
   <%
	
	end if
	
	tbl_board.Close
	Set tbl_board=Nothing

%>
<!-- #include virtual="/include/db/db_close.asp" -->
