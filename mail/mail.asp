
<%
  Set objConfig = Server.CreateObject("CDO.Configuration")
  Set objMessage = Server.CreateObject("CDO.Message")
  title = request("c_title")       
  mailcontents = request("c_content")       
  to_mail = request("to_mail")
  t_goto = request("goto")
  alert_text = request("alert_text")
  
  ' 메일 서버 세팅   
  Set Flds = objConfig.Fields 
  Flds("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.cafe24.com" ' 메일서버 IP
  Flds("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587 ' 포트번호
  Flds("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 ' cdoSendUsingPort
  Flds("http://schemas.microsoft.com/cdo/configuration/smtpaccountname") = "applyhub@resoft.co.kr" ' 계정이름
  Flds("http://schemas.microsoft.com/cdo/configuration/sendemailaddress") = "applyhub@resoft.co.kr"
  Flds("http://schemas.microsoft.com/cdo/configuration/smtpuserreplyemailaddress")= "applyhub@resoft.co.kr"
  Flds("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'cdoBasic
  Flds("http://schemas.microsoft.com/cdo/configuration/sendusername") = "applyhub@resoft.co.kr" ' 계정ID
  Flds("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "sbasbaA01!" ' 비밀번호
  Flds.Update





  ' 발송할 내용 세팅
  Set objMessage.Configuration = objConfig
  objMessage.BodyPart.Charset = "utf-8"
  objMessage.From = "applyhub@resoft.co.kr"
  objMessage.To = to_mail
 'objMessage.CC = "참조 주소"  
  objMessage.Subject = title
  objMessage.HtmlBody = mailcontents
  objMessage.fields.update
  objMessage.Send ' 발송

  Set objMessage = Nothing
  Set objConfig = Nothing
%>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<%if alert_text <> "" then%>

		<form name="t1" action="/mail/mail_ok.asp" method="post">

			<input name="alert_text" value="<%=alert_text%>" type="hidden">
		</form>		
	<script>
		document.t1.submit()
	</script>
<%end if%>
	<script>
<%if t_goto <> "" then%>
		parent.location.href="<%=t_goto%>"
<%end if%>
	</script>
</body>
</html>
