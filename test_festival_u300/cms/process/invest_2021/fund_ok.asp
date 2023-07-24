<!-- #include virtual="/include/db/db_connect.asp" -->
<!-- #include virtual="/include/const/const.asp" -->

<html>
  <head>
    <title></title>
     
  </head>
  <body>
  <%
  	 if isnull(session("session_no")) or session("session_no") = "" then
  	 %>
 <script>
	alert("잘못 된 접속입니다.")
</script> 
<%	 
  	 else
  	 	   	c_team_no = r_call("c_team_no")
		 	c_festival_no = r_call("c_festival_no")
		 	c_year = r_call("c_year")
		 	c_team_type = r_call("c_team_type")
		 	c_fund = r_call("c_fund")
		 	c_exp = r_call("c_exp")
		 
			sql_ss2 = "select c_no from tbl_fund where c_team_no = "&c_team_no&" and c_year = "& c_year &" and c_use = 0 and c_member_no = "& session("session_no")
		 	Set rss2=CreateObject("ADODB.RecordSet")
			rss2.Open sql_ss2, dbCon, 1
			If rss2.EOF Then  
			
		 	 	if session("session_jang") = "" then
		 	 		c_member_type = 1
		 	 	end if
		 	 	if session("session_jang") = "2" then
		 	 		c_member_type = 2
		 	 	end if
			
			
				in_sql = "insert into tbl_fund (c_team_no,c_festival_no,c_member_type,c_member_no,c_fund,c_exp,c_use,c_date,c_year,c_team_type) values ("
				in_sql = in_sql & c_team_no &","& c_festival_no &","& c_member_type &","& session("session_no") &","& c_fund  &",'"& c_exp &"',0,getdate(),"& c_year  &","& c_team_type &")"
				'response.write in_sql
				dbCon.Execute in_sql
%>
<script>
	alert("<%=formatnumber(c_fund,0)%>원을 모의투자 하였습니다.")
	parent.location.href="/cms/process/invest/view.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903&c_team_no=<%=c_team_no%>"
</script>
 <%	
 			else
%>
<script>
	alert("이미 모의투자를 하셨습니다.")
	parent.location.href="/cms/process/invest/view.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903&c_team_no=<%=c_team_no%>&c_festival_type=&s_text="
</script>
 <%	 			
 			end if	
			rss2.Close
			Set rss2=Nothing
 	end if
 %>
<!-- #include virtual="/include/db/db_close.asp" -->
