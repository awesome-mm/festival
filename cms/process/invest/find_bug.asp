<!--#include virtual="/include/db/db_connect.asp"-->
<%
c_member_no=request.form("c_member_no")
sql_bug_update = "update tbl_bug_event set c_bug1 = 1, c_date = getdate() where c_member_no="&c_member_no & ""
dbCon.Execute sql_bug_update

session("session_c_bug1")=1
%>

