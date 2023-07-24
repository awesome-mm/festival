<!-- #include virtual="/include/db/db_connect.asp" -->

<html>
  <head>
    <title></title>
     
  </head>



	<!-- Global site tag (gtag.js) - Google Ads: 325730501 -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=AW-325730501"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'AW-325730501');
	</script>


	<script>
	  gtag('event', 'conversion', {'send_to': 'AW-325730501/ZYPqCODd3dEDEMWBqZsB'});
	</script>

	<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/kas/static/kp.js"></script>
	<script type="text/javascript">
		  kakaoPixel('1479756979123012197').pageView();
		  kakaoPixel('1479756979123012197').completeRegistration('회원가입 전환');
	</script>




<% If InStr(sUsrAgent, "ANDROID") > 0 or InStr(sUsrAgent, "IPAD") Or InStr(sUsrAgent, "IPHONE") Then %>


	


	<!-- This script is for AceCounter Mobile START -->
	<script language='javascript'>
	var m_id = '';      // 로그인 - 회원아이디
	var m_ag = 0;     // 로그인 - 회원의 나이
	var m_mr = '';     // 로그인 - 회원의 결혼여부 ('single' , 'married' )
	var m_gd = '';     // 로그인 - 회원의 성별 ('man' , 'woman')

	var m_skey = '';   // 내부검색어

	var m_jn = '';       // 회원가입('join'), 회원탈퇴('withdraw') 
	var m_jid = '';      // 회원가입 - 회원아이디

	var m_ud1 = '';    // 사용자 정의변수 1 ( 1 ~ 10 정수값)
	var m_ud2 = '';    // 사용자 정의변수 2 ( 1 ~ 10 정수값)
	var m_ud3 = '';    // 사용자 정의변수 3 ( 1 ~ 10 정수값)

	</script>
	<!-- AceCounter END -->


<%else%>


	
	<!-- This script is for AceCounter START -->
	<script language='javascript'>
	var _id = '';        // 로그인 - 회원아이디
	var _ag = 0;       // 로그인 - 회원의 나이
	var _mr = '';       // 로그인 - 회원의 결혼여부 ('single' , 'married' )
	var _gd = '';       // 로그인 - 회원의 성별 ('man' , 'woman')

	var _skey = '';    // 내부검색어

	var _jn = '';        //  회원가입( 'join'), 회원탈퇴('withdraw' ) 
	var _jid = '';       //  회원가입 - 회원아이디

	var _ud1 = '';     // 사용자 정의변수 1 ( 1 ~ 10 정수값)
	var _ud2 = '';     // 사용자 정의변수 2 ( 1 ~ 10 정수값)
	var _ud3 = '';     // 사용자 정의변수 3 ( 1 ~ 10 정수값)
	</script>
	<!-- AceCounter END -->

<% End If %>



  <body>
  <%
  	 
	c_festival = r_call("c_festival")
	c_recommend = r_call("c_recommend")
	c_id = r_call("c_id")
	c_pass = r_call("c_pass")
	c_name = r_call("c_name")
	c_phone = r_call("c_phone")
	c_email = r_call("c_email")
	c_email_license = r_call("c_email_licente")
	c_phone2 = r_call("c_phone2")
	c_add = r_call("c_add")
	c_cafe = r_call("c_cafe")
	c_teach = r_call("c_teach")
	c_sosok = r_call("c_sosok")
	c_position = r_call("c_position")
	c_ex1 = r_call("c_ex1")
	c_ex2 = r_call("c_ex2")
	c_ex3 = r_call("c_ex3")
	if c_teach = "" then
		c_teach = "0"
	end if
	if c_ex1 = "" then
		c_ex1 = "0"
	end if
	if c_ex2 = "" then
		c_ex2 = "0"
	end if
	if c_ex3 = "" then
		c_ex3 = "0"
	end if
	sql = "select c_no from tbl_member where c_id = '"&  c_id &"'"
	  Set tbl_board=CreateObject("ADODB.RecordSet")
	tbl_board.Open sql, dbCon, 1

	If tbl_board.EOF Then
		
		sql2 = "select c_no from tbl_member where c_id = '' and  c_email = '"& c_email &"' and c_email_license = "& c_email_license &" "
		Set tbl_board2=CreateObject("ADODB.RecordSet")
		tbl_board2.Open sql2, dbCon, 1
		If tbl_board2.EOF Then
		%>
		<script>
			alert("잘못 된 접속입니다..")
			parent.location.href="/"
		</script>
		<%
		else
			strSQL="update tbl_member set c_id= '"& c_id &"',c_pass=UPPER(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('md5' , HashBytes('sha1' , '"& c_pass &"'))), 3 , 32)),c_name='"& c_name&"',c_phone='"& c_phone&"',c_phone2='"& c_phone2&"',c_add='"& c_add&"',c_cafe="& c_cafe &",c_date=getdate(), c_email_license=1,c_teach = "& c_teach &", c_sosok='"& c_sosok&"', c_position='"& c_position&"', c_ex1="& c_ex1 &", c_ex2="& c_ex2 &", c_ex3="& c_ex3 &", c_festival="& c_festival &", c_recommend='"& c_recommend &"' where c_no = " & tbl_board2("c_no")
			'response.write strSQL
			dbCon.Execute strSQL
			%>
		 	<script language="javascript">
					alert("가입되었습니다. \n로그인 하시면 많은 정보를 이용할 수 있습니다. ");		
					parent.location.href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748"
		    	</script>
			<%
		end if
		tbl_board2.Close
		Set tbl_board2=Nothing

	else
	%>
	<script>
		alert("사용할 수 없는 아이디입니다.")
		parent.go_focus("c_id")
	</script>
	<%
	end if
	
	tbl_board.Close
	Set tbl_board=Nothing

%><!-- #include virtual="/include/db/db_close.asp" -->
