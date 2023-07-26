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
  	 	sql_m = "select c_no from tbl_puzzle where c_year = 2022 and c_use = 0 and c_member_no = "& session("session_no")
  	 	Set rs_m=CreateObject("ADODB.RecordSet")
  	 	rs_m.Open sql_m, dbCon, 1
		If rs_m.EOF Then 
		 
			c_content = r_call("c_content")
		 
		 	sql_p = "select t.* from (select distinct a.c_puzzle_no "
			sql_p = sql_p & " ,(select max(c_order) as my_no from tbl_puzzle where c_year = 2022 and c_use = 0 and c_puzzle_no = a.c_puzzle_no ) as my_no "
			sql_p = sql_p & " from tbl_puzzle a where a.c_year = 2022 and a.c_use = 0 ) t where t.my_no < 2500 order by t.c_puzzle_no"
			Set rs=CreateObject("ADODB.RecordSet")
			rs.Open sql_p, dbCon, 1
			If rs.EOF Then 
			else
				now_p = rs("c_puzzle_no")
				my_order = rs("my_no") + 1
			end if
			rs.Close
			Set rs=Nothing
			if my_order > 2500 then
				now_p = now_p + 1
				my_order = 3
			end if
			
			my_garo = fix(my_order / 50) + 1
			my_sero = my_order - fix(my_order / 50)		
	
			if session("session_jang") = "2" then
				if cint(session("session_team_type")) <= 6 then
					my_point = 100000000
					point_info = "참여 포인트 1억원(2그룹,그룹당 5천만원)을 받았습니다."
				end if
				if cint(session("session_team_type")) = 7 then
					my_point = 50000000
					point_info = "참여 포인트 5천만원(1그룹)을 받았습니다."
				end if
				if cint(session("session_team_type")) = 8 then
					my_point = 350000000
					point_info = "참여 포인트 3억5천만원(7그룹, 그룹당 5천만원)을 받았습니다."
				end if
			end if
			if session("session_jang") = "1" then
				my_point = 0
				point_info = "페스티벌 참가팀의 팀원은 평가 참여가 불가능합니다."
			end if
			if session("session_jang") = "" then
				my_point = 20000000
				point_info = "참여 포인트 20,000,000원을 받았습니다."
			end if
			
			
			in_sql = "insert into tbl_puzzle (c_year,c_puzzle_no,c_order,c_garo,c_sero,c_member_no,c_member_id,c_content,c_point,c_use,c_date) values ("
			in_sql = in_sql & "2022" &","& now_p &","& my_order &","& my_garo &","& my_sero  &","& session("session_no") &",'"& session("session_id")  &"','"& c_content &"',"
			in_sql = in_sql & my_point &",0,getdate())"
			response.write in_sql
			dbCon.Execute in_sql
%>
<script>
	alert("방명록을 등록했습니다.\n<%=point_info%>")
	parent.location.href="/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413"
</script>
 <%	
 		else
 %>
 <script>
	alert("이미 방명록을 작성 했습니다.")
	parent.location.href="/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413"
</script> 
<%	 
		end if
		rs_m.Close
		Set rs_m=Nothing
 	end if
 %>
<!-- #include virtual="/include/db/db_close.asp" -->
