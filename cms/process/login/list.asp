<!-- #include virtual="/cms/sub_top.asp" -->
<%if session("session_no") = "" or isnull(session("session_no")) then%>
<script>
	var setCookie = function(name, value, exp) {
		var date = new Date();
		date.setTime(date.getTime() + exp*24*60*60*1000);
		document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
	};
	var getCookie = function(name) {
		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value? value[2] : null;
	};

	function go_focus(flag){
		if(flag == "c_id"){
			document.kdb.c_id.focus()
		}
	}
	function go(){
		if(document.kdb.c_id.value == ""){
			alert("아이디를 입력해 주세요.")
			document.kdb.c_id.focus()
		}else if(document.kdb.c_pass.value == ""){
			alert("비밀번호를 입력해 주세요.")
			document.kdb.c_pass.focus()
		}else{
			if(document.kdb.id_save.checked == true){
				setCookie("save_id",document.kdb.c_id.value, 2);
			}else{
				setCookie("save_id","", 2);
			}
			document.kdb.method = "post"
			document.kdb.target = "_self"
			document.kdb.action = "login_ok.asp?<%=t_para%>"
			document.kdb.submit()

		}
	}
	function enterkey() {
	        if (window.event.keyCode == 13) {
	             go();
	        }
	}
</script>
 <%
 	url = request("url")
 %>
<form name="kdb"  onsubmit="return false;">
	<input name="url" type="hidden" value="<%=url%>">
		 
	   <div class="mem_wrapper">
                   
                        <div class="title3">
                        <div>
                            <div class="diagonal"></div>
                        </div>
                        <div>
                            <span class="co666">로그인</span>
                        </div>
                    	</div>
                        <div class="idpw">
                            <div class="input_st2">
                                <input type="text" name="c_id" placeholder="아이디를 입력하세요." onfocus="">
                            </div>
                            <div class="input_st2">
                                <input  onkeyup="enterkey();"  type="password" name="c_pass" placeholder="비밀번호를 입력하세요." onfocus="">
                            </div>
                        </div>

                        <div class="idpw_save_sch">
                            <div class="check2">
                                <input style="zoom:1.5" lass="checkbox" type="checkbox" name="id_save" id="id_save" value="1">
																<label for="id_save">아이디 저장</label>
                            </div>
                        </div>

												<div class="login_btn_box">
														<div class="login_btn"  onclick="go()">
																로그인
														</div>
												</div>
												<div class="join_and_find">
															<a href="/cms/process/membership/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677">
	                                <span class="no_mem2">
	                                    회원가입
	                                </span>
	                            </a>
	                            <span class="no_mem1">
	                                또는
	                            </span>
															<a href="/cms/process/idpw/list.asp?c_show_no=77&c_check_no=67&c_relation=936&c_relation2=264">
																	<span class="no_mem2">
																			아이디 ・ 비밀번호 찾기
																	</span>
															</a>

			    							</div>

												<div class="line4"></div>
                        <div style="text-align:center">SNS 계정 연결은 로그인 후 가능합니다.</div>
                        <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
                        <div class="ka_na">
                            <div >
                                    <a id="kakao-login-btn"></a>
  				    <div id="result"></div>
					<script type="text/javascript">
					Kakao.init('eb04491fab3a13ae1e74344e1441958c');
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
					          //alert(id)
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
		<div class="naver_box" >
		<div id="naver_id_login" width="220px"></div>
		<script type="text/javascript">
			var naver_id_login = new naver_id_login("bPpAWcop7K8qGtN3g0ue", "http://festival.u300.or.kr/cms/process/login/naver.asp");
			var state = naver_id_login.getUniqState();
			naver_id_login.setButton("green", 4,50);
			naver_id_login.setDomain("YOUR_SERVICE_URL");
			naver_id_login.setState(state);
			naver_id_login.setPopup();
			naver_id_login.init_naver_id_login();
		</script>
					</div>
                             
                        </div>
                        
 			<div>
                           

                        </div>

                        
               </div>
	<script>
		document.kdb.c_id.value = getCookie("save_id");
		if(document.kdb.c_id.value == ""){
			document.kdb.id_save.checked = false
		}else{
			document.kdb.id_save.checked = true
		}
	</script>
<script>
	function kakao(){
		document.kdb.action="kakao_ok.asp?<%=t_para%>"
		document.kdb.method="post"
		document.kdb.target="_self"
		document.kdb.submit()
	}
</script>	
<script>
	function naver(flag){
		document.kdb.c_naver.value = flag
		document.kdb.action="naver_ok.asp?<%=t_para%>"
		document.kdb.method="post"
		document.kdb.target="_self"
		document.kdb.submit()
	}
</script>	
	<input name="c_kakao" value="" type="hidden">
	<input name="c_naver" value="" type="hidden">	
</form>
<%else%>
	  <div class="mem_wrapper">
                   
                    <div class="login_title">
                        <h2>회원정보</h2>
                    </div>
                            <div class="member_info" >
                                <span>아이디 :</span>  
                                <%=session("session_id")%>
                                <br />
                                <span>이름 :</span>  
                                <%=session("session_name")%>
 <%		
 		sns = 0
 		sql = "select * "
		sql = sql & " from tbl_member  where c_no = "&  session("session_no") &"  "
		'response.write sql
		  Set tbl_board=CreateObject("ADODB.RecordSet")
		tbl_board.Open sql, dbCon, 1
		If tbl_board.EOF Then
			session("session_no") = ""
			session("session_id") = ""
			session("session_name") = ""
			session("session_team_type") = ""
			session("session_jang") = ""
		%>
		<script>
			alert("로그인이 필요합니다")		
			location.href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748"
		</script>
		<%
		else
			if (isnull(tbl_board("c_kakao")) or tbl_board("c_kakao") = "" ) and  (isnull(tbl_board("c_naver")) or tbl_board("c_naver") = "" ) then
				sns = 1
			end if 
		%>
			<br />
			 <span>연락처 :</span>  
                         010-****-<%=right(tbl_board("c_email"),4)%>
		<%
		end if
		tbl_board.Close
		Set tbl_board=Nothing 
 %>
                        </div>
														<div class="login_btn_group" >
																	<a class="no_mem2" href="/cms/process/membership2/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677">
																			회원정보 변경
																	</a>
																	<a class="no_mem2" href="logout.asp">
																			로그아웃
																	</a>
																	<% 'if sns = 1 then%>
																	<a class="no_mem2" href="/cms/process/login/sns/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748">
																			SNS 연동하기
																	</a>
																	<%'end if%>
															</div>
	 </div>
 <%end if%>
 
<!-- #include virtual="/cms/sub_bottom.asp" -->
