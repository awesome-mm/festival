<!-- #include virtual="/cms/sub_top.asp" -->
<%if session("session_no") = "" or isnull(session("session_no")) then
	url = replace(replace("/cms/process/login/sns/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748","&","creesy"),"?","resoft")
%>
 	<script>
 		alert("SNS 계정 연결은 ID/PW 로그인 후 가능합니다")
 		location.href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748&url=<%=url%>"
 	</script>
<%else%>
<script>
	 
</script>
 <form name="kdb"  onsubmit="return false;">
 	<div class="mem_wrapper">
                   
												<div class="login_title">
													<h2>로그인 SNS 연결</h2>
												</div>
                        <div class="idpw">
                            <div class="input_st2" style="line-height:150%; font-size:24px; margin:30px 0;">
                                <span style="color:#2D2BB1;">SNS 연결 아이디</span>  
                                <%=session("session_id")%>
                             	<!--
                             	<br />
                                 <font color="#2D2BB1">이름</font>  
                                <%=session("session_name")%>
                                -->
                            </div>
                        </div>
			 <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
                        <div class="ka_na sns_linkbox">
                            <div  >
                                    <a id="kakao-login-btn"></a>
  				    <div id="result"></div>
					<script type="text/javascript">
					Kakao.init('f806ade37dcf63bd988072416fd02c05');
					console.log(Kakao.isInitialized());
					
					  Kakao.Auth.createLoginButton({
					    container: '#kakao-login-btn',
					    success: function(authObj) {
					      Kakao.API.request({
					        url: '/v2/user/me',
					        success: function(result) {
					          $('#result').append(result);
					          id = result.id
					          connected_at = result.connected_at
					          kakao_account = result.kakao_account
					          document.kdb.c_kakao.value = id
					          kakao() 
					        },
					        fail: function(error) {
					          alert(
					            'login success, but failed to request user information: ' +
					              JSON.stringify(error)
					          )
					        },
					      })
					    },
					    fail: function(err) {
					      alert('failed to login: ' + JSON.stringify(err))
					    },
					  })
					</script>
                            </div>
                            <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
                            <div style="padding-left:50px">
                                 <div id="naver_id_login"></div>
                                 <script type="text/javascript">
				  	var naver_id_login = new naver_id_login("VPp7EwcJ_iOx110hG4kD", "http://festival.u300.kr/cms/process/login/sns/naver.asp");
				  	var state = naver_id_login.getUniqState();
				  	naver_id_login.setButton("green", 4,50);
				  	naver_id_login.setDomain("YOUR_SERVICE_URL");
				  	naver_id_login.setState(state);
				  	naver_id_login.setPopup();
				  	naver_id_login.init_naver_id_login();
				  </script>
                            </div>
                             
                        </div>
	</div>
<script>
	function kakao(){
		document.kdb.action="kakao.asp"
		document.kdb.method="post"
		document.kdb.target="_self"
		document.kdb.submit()
	}
</script>	
<script>
	function naver(flag){
		document.kdb.c_naver.value = flag
		document.kdb.action="naver_ok.asp"
		document.kdb.method="post"
		document.kdb.target="_self"
		document.kdb.submit()
	}
</script>	
	<input name="c_kakao" value="" type="hidden">
	<input name="c_naver" value="" type="hidden">
</form>
 <%end if%>
 
<!-- #include virtual="/cms/sub_bottom.asp" -->
