<!-- #include virtual="/include/db/db_connect.asp" --> 
<%
	c_puzzle_no=r_call("c_puzzle_no")
	c_order=r_call("c_order")
	 
		sql_p = "select c_content, c_member_id, c_date from tbl_puzzle where c_year = 2021 and c_use = 0 and c_puzzle_no = "& c_puzzle_no &" and c_order = "& c_order
		Set rs=CreateObject("ADODB.RecordSet")
		rs.Open sql_p, dbCon, 1
		If rs.EOF Then 
		else
			c_member_id = left(rs("C_member_id"),3)
			t_s_no = len(rs("C_member_id")) - 3
			for i = 1 to t_s_no
				c_member_id = c_member_id & "*"
			next			
			
			t1 = replace(replace(rs("c_content"),"'",""""),chr(13)& chr(10),"<br />") & "<div style=""width:300px;text-align:right;padding-top:5px""><font color=#565656>" & c_member_id & " / " & left(rs("c_date"),10) & "</font></div>"
		%>
		
		<script>
			parent.note2_go('<%=t1%>')
		</script>
		<%			 
		end if
		rs.Close
		Set rs=Nothing
		 
%>
﻿<!-- #include virtual="/include/db/db_close.asp" --> 
	 