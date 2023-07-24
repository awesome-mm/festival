<!-- #include virtual="/include/include.asp" -->
<!--#include virtual='/include/xml/class.xmldom.asp'-->
<%

FUNCTION STRIPTAGS(BYVAL HTMLDOC)
 SET REX = NEW REGEXP
 REX.PATTERN= "<[^>]+>"
 REX.GLOBAL = TRUE
 STRIPTAGS =REX.REPLACE(HTMLDOC,"")
END FUNCTION
 

'비석세스
c_name = "비석세스"

dim oDOM, url
url = "http://besuccess.com/feed/"


Set oDOM = new XMLDOMClass
with oDOM
  if .LoadHTTP(url) Then
   	s = .TagSelect("item") - 1
	for i = s to 0 step -1
		c_title = .TagText("title", i+1)
		c_date = .TagText("pubDate", i)
		c_content = .TagText("content:encoded", i)
		c_title = replace(c_title,"'","''")
		c_content = replace(c_content,"'","''")
		c_link = .TagText("link", i+1)
	
 
		t1 = split(c_content,"<img ")
		t2 = split(t1(1),"src=""")
		t3 = split(t2(1),"""")
		
		'response.write t3(0) & "<br><br>"
		'response.write c_link & "<br><br>"
		c_content = STRIPTAGS(c_content)
		'response.write c_content& "<br><br>"
		
		
		 strSQL="SELECT * FROM tbl_board where c_title = '" & c_title & "' and c_relation=3 and c_relation2=2 "
  		 Set tbl_board=CreateObject("ADODB.RecordSet")
		 tbl_board.Open strSQL, dbCon, adUseClient
		 If tbl_board.EOF Then
		 	strSql2 = "insert into tbl_board(c_relation,c_relation2,c_id,c_name,c_title,c_contents,c_date,c_files,c_image,c_link) values ("
		 	strSql2 = strSql2 & "3,2,'creesy','"& c_name &"','"& c_title &"','"& c_content &"',getdate(),'','"& t3(0) &"','"& c_link &"')"
		 	dbCon.Execute strSql2
		' response.write strSql2 & "<br><br>"
		 	strSql2 = "update tbl_board set c_ref=c_no where c_ref=0"
		 	dbCon.Execute strSQL2
		 	
		 end if
		 tbl_board.Close
		 Set tbl_board=Nothing
	next
   else
     	 Response.Write "XML을 읽어오는데 실패하였습니다."
   End if
end with
Set oDOM = Nothing
%>


<!-- #include virtual="/include/include_b.asp" -->