<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>네이버 로그인</title>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<!--

Client ID	
bPpAWcop7K8qGtN3g0ue -> VPp7EwcJ_iOx110hG4kD
Client Secret	
gS9mNRLKA_
재발급
-->
  <div id="naver_id_login"></div>
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("VPp7EwcJ_iOx110hG4kD", "http://festival.u300.kr/naver2.asp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 4,50);
  	naver_id_login.setDomain("YOUR_SERVICE_URL");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
</html>