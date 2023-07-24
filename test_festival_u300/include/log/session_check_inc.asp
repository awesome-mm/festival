<%
	'////////////////////////////////////////////////////////
	'//																										'//
	'//			경고 : 반드시 파일의 시작에 써주세요!!!!			'//
	'//																										'//
	'////////////////////////////////////////////////////////
	if Session("session_level") = "" then
		plpop = -1
	else
		plpop = cint(Session("session_level"))
	end if
	
	If plpop >= check_level Then	%>
		
	<%else%>

		<html>
		  <head>
		    <title>Get TV</title>
		    <link rel="stylesheet" type="text/css" href="/include/css/gettv.css">
		  </head>
		  <body>
			<script language=javascript>
			<%		if Session("session_level") = "" then %>
					alert ('이페이지는 사용할 수 없습니다. 로그인을 해주세요.\n\n 로그인 페이지로 이동합니다.');
					location.href="/ndmi_cms_iba/show/show.asp?call_category_no=22"
			<%		else%>
					alert ('페이지에 대한 권한이 없습니다. \n\n 앞으로 이동합니다.');
					parent.history.back();
			<%		end if%>
				
			</script>
		  </body>
		</html>	

<%	
		Response.End
	End If	
%>