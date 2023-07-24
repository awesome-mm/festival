<!-- #include virtual="/include/db/db_connect.asp" -->

<html>
  <head>
    <title></title>
     
  </head>
  <body>
  <%
	c_email = r_call("c_email")

	c_pass = r_call("c_pass")
	c_name = r_call("c_name")
	 
	c_phone2 = r_call("c_phone2")
	c_recommend = r_call("c_recommend")
	 
	  
			strSQL="update tbl_member set c_name='"& c_name&"' " 
			if c_pass <> "" then
				strSQL= strSQL & " ,c_pass=UPPER(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('md5' , HashBytes('sha1' , '"& c_pass &"'))), 3 , 32)) "
			end if
			strSQL= strSQL & " ,c_email='"& c_email &"'   ,c_phone2='"& c_phone2&"',c_recommend='"& c_recommend &"' ,c_pass2 = 0 where c_no = " & session("session_no")
			'response.write strSQL
			dbCon.Execute strSQL
			 
			%>
		 	<script language="javascript">
					alert("수정되었습니다. ");		
					parent.location.href= "/cms/process/membership2/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677"
		    	</script>
			<%
		 	session("session_name") = c_name
		 	 
%>
<!-- #include virtual="/include/db/db_close.asp" -->
