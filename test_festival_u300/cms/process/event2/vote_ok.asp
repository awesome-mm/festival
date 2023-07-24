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
	alert("로그인 후 투표가 가능합니다.")
	history.back();
</script> 
<%	 
  	 Else



  	 	   	logo_vote = r_call("logo_vote")


			'response.write logo_vote
			'Response.End



			
			c_member_no = session("session_no")

			
		 
		 
			sql_ss2 = "select c_no from tbl_vote where c_member_no = "& c_member_no
		 	Set rss2=CreateObject("ADODB.RecordSet")
			rss2.Open sql_ss2, dbCon, 1

			If rss2.EOF Then  
			

				in_sql = "insert into tbl_vote (c_member_no,logo_vote,c_date) values ("
				in_sql = in_sql & c_member_no &",'"& logo_vote &"',getdate())"

				'response.write in_sql
				'Response.End

				dbCon.Execute in_sql



				'순위를 뽑기위해...
				logo_vote_list = split(logo_vote, ",")

				for i = 0 to ubound(logo_vote_list)

					vote_count = logo_vote_list(i)
					vote_count = TRIM(vote_count)


					in_sql1 = "insert into tbl_vote_count (c_member_no,vote_count,c_date) values ("
					in_sql1 = in_sql1 & c_member_no &","& vote_count &",getdate())"


					'response.write in_sql1 & "<br>"
			


					dbCon.Execute in_sql1
				   
				next

					'Response.End

%>
<script>
	alert("투표가 정상적으로 처리 되었습니다.")
	location.href="/cms/process/event2/list.asp?c_show_no=110&c_check_no=65&c_relation=968&c_relation2=986"
</script>
 <%	
 			else
%>
<script>
	alert("이미 투표를 하셨습니다.")
	location.href="/cms/process/event2/list.asp?c_show_no=110&c_check_no=65&c_relation=968&c_relation2=986"
</script>
 <%	 			
 			end if	
			rss2.Close
			Set rss2=Nothing
 	end if
 %>
<!-- #include virtual="/include/db/db_close.asp" -->
