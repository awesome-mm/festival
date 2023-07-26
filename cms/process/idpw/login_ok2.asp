<!-- #include virtual="/include/db/db_connect.asp" -->
  <%
 Function rndNum(lenNum)
    num = ""
    For i = 1 to lenNum
        Randomize                '//랜덤을 초기화 한다.
        num = num & CInt(Rnd*9)    '//랜덤 숫자를 만든다. 
    Next
    rndNum = num
End Function
  
	c_id = r_call("c_id")
	c_name = r_call("c_name")
	c_email = r_call("c_email")
	 
	sql = "select a.*   from tbl_member a where  a.c_name = '"& c_name &"' and c_email = '"+ c_email +"' and c_pass <> ''"
	  Set tbl_board=CreateObject("ADODB.RecordSet")
	tbl_board.Open sql, dbCon, 1

	If tbl_board.EOF Then
 
%>

   <script language="javascript">
			alert("입력하신 정보의 신청정보가 없습니다.\n정보를 확인해 주세요");		
   </script>
    
   <%
	
	else
		c_pass = rndNum(10)
		sql2 = "update tbl_member set c_pass2 =1, c_pass = UPPER(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('md5' , HashBytes('sha1' , '"& c_pass &"'))), 3 , 32)) where c_no = " & tbl_board("c_no") 
		dbCon.Execute sql2	 	 
	 			'c_pass1 = left(tbl_board("c_pass"),4)
				'c_pass2 = len(tbl_board("c_pass")) - 4
				'c_pass = c_pass1
				'for i = 1 to c_pass2
				'	c_pass = c_pass & "*"	
				'next	


			 	 
			%>
<script type="text/javascript">
	function sendSMS(){
	  try{
		document.charset = "euc-kr";
	  }catch(ex){
		document.characterSet = 'euc-kr';
	  }
	  document.smsform.submit();
	  try{
		document.charset = "UTF-8";
	  }catch(ex){
		document.characterSet = 'UTF-8';
	  }
	}
	</script>
			<form name="smsform" action="http://biz.xonda.net/biz/biz_newV2/SMSASP_WEBV4_s.asp" method="post" accept-charset="EUC-KR"> 
				<input type="text" name="send_number" value="0221562295">					
				<input type="text" name="receive_number" value="<%=c_email%>">
				<input type="text" name="biz_id" value="creesy">
				<input type="text" name="smskey" value="XONDA_MNW52AY6EV">						
				<input type="text" name="return_url" value="http://festival.u300.kr/mail/ok_pass.asp">
				<textarea name="sms_contents" cols="16" rows="5">임시비밀번호는 <%=c_pass%> 입니다. - 온라인창업교육플랫폼</textarea>	
				<input type="text" name="reserved_flag" value="false">		
				<input type="text" name="reserved_year" value="">		
				<input type="text" name="reserved_month" value="">		
				<input type="text" name="reserved_day" value="">					
				<input type="text" name="reserved_hour" value="">				
				<input type="text" name="reserved_minute" value="">				
				<input type="text" name="usrdata1" value="a">							 
				<input type="text" name="usrdata2" value="b">						 
				<input type="text" name="usrdata3" value="c">							 
				<input type="button" value="보내기" onclick="sendSMS()">
			
			</form>
		 <script language="javascript">
		 	sendSMS()
		 </script>
			
			 
		<%
	 	 
	end if
	
	tbl_board.Close
	Set tbl_board=Nothing

%><!-- #include virtual="/include/db/db_close.asp" -->