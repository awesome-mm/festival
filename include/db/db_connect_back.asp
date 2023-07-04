<% Response.CharSet = "UTF-8" %>
<%

  strCon="Provider=SQLOLEDB.1;Persist Security Info=False;User ID=new_u300;PWD=koefA01!;Initial Catalog=new_u300;Data Source=175.126.62.160" 
  Set dbCon=CreateObject("ADODB.Connection")
  dbCon.Open strCon
  



function r_call(param)

	r_call = Request(param)
	r_call = replace(r_call,"&","&#38")
	'r_call = replace(r_call,"#","&#35")
	r_call = replace(r_call,";","&#59")
	r_call = replace(r_call,"'","''")	
	r_call = replace(r_call,"<","&#60")
	r_call = replace(r_call,">","&#62")
	r_call = replace(r_call,"=","&#61")
	r_call = replace(r_call,"sql","")
	r_call = replace(r_call,"[+]","&#43")
	r_call = replace(r_call,"""","&#34")	

end function

function up_call(param)

	up_call = uploadform(param)
	up_call = replace(up_call,"&","&#38")
	'up_call = replace(up_call,"#","&#35")
	up_call = replace(up_call,";","&#59")
	up_call = replace(up_call,"'","''")	
	up_call = replace(up_call,"<","&#60")
	up_call = replace(up_call,">","&#62")
	up_call = replace(up_call,"=","&#61")
	up_call = replace(up_call,"sql","")
	up_call = replace(up_call,"[+]","&#43")
	up_call = replace(up_call,"""","&#34")	

end function

%>