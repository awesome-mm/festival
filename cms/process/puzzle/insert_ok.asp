<!-- #include virtual="/include/db/db_connect.asp" -->
<!-- #include virtual="/include/const/const.asp" -->

<html>
  <head>
    <title></title>
     
  </head>
  <body>


 <script>
	//alert("서비스 점검 중 입니다.")
	//history.back();
</script> 



  <%
  	 if isnull(session("session_no")) or session("session_no") = "" then
  	 %>
 <script>
	alert("잘못 된 접속입니다.")
</script> 
<%	 
  	 else
  	 	sql_m = "select c_no from tbl_puzzle where c_year = 2023 and c_use = 0 and c_member_no = "& session("session_no")

  	 	Set rs_m=CreateObject("ADODB.RecordSet")

  	 	rs_m.Open sql_m, dbCon, 1

		If rs_m.EOF Then 
		 
			c_content = r_call("c_content")


			'현대 퍼즐 c_puzzle_no 구함
			sql=" select max(c_puzzle_no) as c_puzzle_no from tbl_puzzle where c_year = 2023 and c_use = 0 "
			set rs1=dbCon.execute(sql)



			now_c_puzzle_no = rs1("c_puzzle_no")

		 

		 	sql_p = "select t.* from (select distinct a.c_puzzle_no "
			sql_p = sql_p & " ,(select max(c_order) as my_no from tbl_puzzle where c_year = 2023 and c_use = 0 and c_puzzle_no = a.c_puzzle_no ) as my_no "
			sql_p = sql_p & " from tbl_puzzle a where a.c_year = 2023 and a.c_use = 0 and a.c_puzzle_no='"&now_c_puzzle_no&"' ) t where t.my_no < 626 order by t.c_puzzle_no"


			'Response.write sql_p
			'Response.End

			Set rs=CreateObject("ADODB.RecordSet")
			rs.Open sql_p, dbCon, 1

			If rs.EOF Then 


			Else

				now_p = rs("c_puzzle_no")
				my_order = rs("my_no") + 1

			end if
			rs.Close
			Set rs=Nothing



			if my_order > 625 Then

				now_p = now_c_puzzle_no + 1

				my_order = 3

			end If


			'Response.write now_p
			'Response.End


			
			my_garo = fix(my_order / 50) + 1

			my_sero = my_order - fix(my_order / 50)		


			'session_team_type 은 c_festival_type 과 같음 즉 session_team_type 1=도약 , 성장1(서울) = 2 ~~~  교육=8



			'팀장 session_jang=2
			if session("session_jang") = "2" Then

			'	if cint(session("session_team_type")) = 1 then
			'		my_point = 20000000
			'		point_info = "참여 포인트 2천만원을 받았습니다."
			'	end If

				if   cint(session("session_team_type")) = 1 or cint(session("session_team_type")) = 2 Or cint(session("session_team_type")) = 3 Or cint(session("session_team_type")) = 4 or cint(session("session_team_type")) = 5 Or cint(session("session_team_type")) = 6 Or cint(session("session_team_type")) = 7 Or cint(session("session_team_type")) = 8 Or cint(session("session_team_type")) = 9 Or cint(session("session_team_type")) = 10 Then

					my_point = 20000000
					point_info = "참여 포인트 2천만원을 받았습니다."

				end If


	'			if cint(session("session_team_type")) = 8 then
	'				my_point = 300000000
	'				point_info = "참여 포인트 3억원을 받았습니다."
	'			end If


			end If


			if session("session_jang") = "1" then
				my_point = 0
				point_info = "페스티벌 참가팀의 팀원은 평가 참여가 불가능합니다."
			end If



			
			if session("session_jang") = "" Then
				
				my_point = 20000000
				point_info = "참여 포인트 2천만원을 받았습니다."
				
			end if
			


			
			in_sql = "insert into tbl_puzzle (c_year,c_puzzle_no,c_order,c_garo,c_sero,c_member_no,c_member_id,c_content,c_point,c_use,c_date) values ("
			in_sql = in_sql & "2023" &","& now_p &","& my_order &","& my_garo &","& my_sero  &","& session("session_no") &",'"& session("session_id")  &"','"& c_content &"',"
			in_sql = in_sql & my_point &",0,getdate())"

			'response.write in_sql

			dbCon.Execute in_sql




			'추천인 업데이트

			c_recommend = r_call("c_recommend")

			If c_recommend <> "" And session("session_id") <> c_recommend  then

				strSQL="update tbl_member set c_recommend = '"& c_recommend &"', festival_recommend_date = getdate(), recommend_year='2023' where c_no = " & session("session_no")
				
				'response.write strSQL

				dbCon.Execute strSQL



				'strSQL1="update tbl_member set festival_recommend_date = getdate() where c_id = '"& c_recommend &"' "
				
				'response.write strSQL1
				'Response.End


				'dbCon.Execute strSQL1


			end If



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

		end If


		rs_m.Close
		Set rs_m=Nothing


 	end if
 %>
<!-- #include virtual="/include/db/db_close.asp" -->
