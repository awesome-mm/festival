<!--#include virtual="/include/db/db_connect.asp"-->
<%
'벌레1
c_member_no=request.form("c_member_no")
bug_column = request.form("bug_column")
sql_bug_update = "update tbl_bug_event set "& bug_column &" = 1, c_date = getdate() where c_member_no="&c_member_no&""
dbCon.Execute sql_bug_update

if bug_column = "c_bug3" then
    session("session_c_bug3")=1

elseif bug_column = "c_bug4" then
    session("session_c_bug4")=1

elseif bug_column = "c_bug5" then
    session("session_c_bug5")=1
end if
%>

