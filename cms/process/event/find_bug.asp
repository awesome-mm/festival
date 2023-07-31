<!--#include virtual="/include/db/db_connect.asp"-->
<%
'벌레1
c_member_no=request.form("c_member_no")
bug_column = request.form("bug_column")
sql_bug_update = "update tbl_bug_event set "& bug_column &" = 1, c_date = getdate() where c_member_no="&c_member_no&""
dbCon.Execute sql_bug_update

session("session_c_bug1")=1
%>

