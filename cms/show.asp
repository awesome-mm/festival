<!--#include virtual="/cms/sub_top.asp"-->
<%
	add_file=r_call("add_file")
	if add_file = "" then
		get_page="/cms/contents/" & now_content 
	else
		get_page="/cms/contents/" & add_file 
	end if
	server.execute(get_page) 
%>
<!--#include virtual="/cms/sub_bottom.asp"-->
 