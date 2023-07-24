<!--#include virtual="/include/include.asp"-->
<!--#include virtual="/include/frame/head.asp"-->
<%
	c_show_no = r_call("c_show_no")
	c_check_no = r_call("c_check_no")
	c_relation = r_call("c_relation")
	c_relation2 = r_call("c_relation2")
	if c_show_no = "" or c_check_no = "" or c_relation = "" or c_relation2 = ""  then
%>
	<script>
		alert("잘못 된 선택입니다.")
		location.href="/"
	</script>
<%		
	else
		t_para = "c_show_no=" & c_show_no & "&c_check_no=" & c_check_no & "&c_relation=" & c_relation & "&c_relation2=" & c_relation2
		sql_show = "select * from tbl_menu where c_no = "& c_show_no &" and c_up_no = " & c_check_no & " and c_relation = " & c_relation & " and c_relation2 = " & c_relation2 & " "
		Set rs_show=CreateObject("ADODB.RecordSet")
		rs_show.Open sql_show, dbCon, 1
		If rs_show.EOF Then 
%>
	<script>
		alert("잘못 된 선택입니다.")
		location.href="/"
	</script>
<%
		Else 	
			now_no = rs_show("c_no")
			now_title = rs_show("c_name")
			now_level = rs_show("c_level")
			now_content = rs_show("c_content")
			now_up_no = rs_show("c_up_no")
		end if
		rs_show.Close
		Set rs_show=Nothing 
%>
  <div class="wrapper">