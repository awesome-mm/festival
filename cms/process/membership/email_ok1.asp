<!-- #include virtual="/include/db/db_connect.asp" -->

<html>
  <head>
    <title></title>
     
  </head>
  <body>
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
  <%
  	 
	c_email = r_call("c_email")
	 
	sql = "select c_id,c_out from tbl_member where c_email = '"&  c_email &"' and c_id <> '' "
	Set tbl_board=CreateObject("ADODB.RecordSet")
	tbl_board.Open sql, dbCon, 1

	If tbl_board.EOF Then

	Randomize  
	num = cint(Rnd*10000) + 999

	
	strSQL="delete from tbl_member where c_id = '' and c_email =  '"& c_email &"' "
	'response.write strSQL
	dbCon.Execute strSQL
	
	strSQL="insert into tbl_member (c_id,c_email,c_email_license) values('','"& c_email &"',"& num &")"
	'response.write strSQL
	dbCon.Execute strSQL
	
	 
%>

		<form name="smsform" action="http://biz.xonda.net/biz/biz_newV2/SMSASP_WEBV4_s.asp" method="post" accept-charset="EUC-KR"> 
			<input type="text" name="send_number" value="0221562295">					
			<input type="text" name="receive_number" value="<%=c_email%>">
			<input type="text" name="biz_id" value="creesy">
			<input type="text" name="smskey" value="XONDA_MNW52AY6EV">						
			<input type="text" name="return_url" value="http://festival.u300.or.kr/mail/ok.asp">
			<textarea name="sms_contents" cols="16" rows="5">휴대폰 인증번호 : <%=num%> - 온라인창업교육플랫폼</textarea>	
		
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
		 	parent.email1();
			sendSMS()
		 </script>
  
    
   <%
	
	else
		if tbl_board("c_out") = 0 then
		c_id1 = left(tbl_board("c_id"),3)
		c_id2 = len(tbl_board("c_id")) - 3
		c_id = c_id1
		for i = 1 to c_id2
			c_id = c_id & "*"	
		next		
		
		
	%>
	<script>
		alert("이미 가입 된 휴대폰 번호입니다.\n사용 아이디는 <%=c_id%> 입니다..")
		parent.email_ok4()
	</script>
	<%
		else
	%>
	<script>
		alert("기존 탈퇴회원의 휴대폰 번호입니다.\n이 번호로 회원가입은 2021년 8월15일 이후 가능합니다.")
		parent.email_ok4()
	</script>
	<%

		end if
	end if
	
	tbl_board.Close
	Set tbl_board=Nothing

%>
<!-- #include virtual="/include/db/db_close.asp" -->
