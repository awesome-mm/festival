﻿<!-- #include virtual="/cms/sub_top.asp" -->
<%if session("session_no") = "" or isnull(session("session_no")) then
	url = replace(replace("/cms/process/membership2/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677","&","creesy"),"?","resoft")
%>
		<script>
 		alert("로그인 후 이용 가능합니다")
 		location.href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748&url=<%=url%>"
 	</script>
<%else%>
<%	
		sql2 = "select * from tbl_member where c_no = " & session("session_no")
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
	
%> 
<script>
	function go_focus(flag){
		if(flag == "c_id"){
			document.kdb.c_id.focus()
		}
	}
	function go(){
		if(document.kdb.c_pass.value != "" && ( document.kdb.c_pass.value.length < 6 || document.kdb.c_pass.value.length > 20 )){
			alert("비밀번호는 6자리 이상 20자리 이하만 사용 가능합니다.")
			document.kdb.c_pass.focus()
		}else if(document.kdb.c_pass.value != "" && (document.kdb.c_pass2.value == "" )){
			alert("비밀번호확인을 입력해 주세요.")
			document.kdb.c_pass2.focus()
		}else if(document.kdb.c_pass.value != "" && ( document.kdb.c_pass2.value != document.kdb.c_pass.value )){
			alert("비밀번호와 비밀번호확인이 다릅니다.")
			document.kdb.c_pass2.focus()
		}else if(document.kdb.c_name.value == ""){
			alert("이름을 입력해 주세요.")
			document.kdb.c_name.focus()
		}else if(document.kdb.c_phone2.value == ""){
			alert("이메일 주소를 입력해 주세요.")
			document.kdb.c_phone2.focus()
		}else{
			document.kdb.method = "post"
			document.kdb.target = "exec"
			document.kdb.action = "insert_member_ok.asp"
			 document.kdb.submit()
		}
	}
    function email_ok2(){
        if(document.kdb.c_email_licente.value == ""){
            alert("인증번호를 입력해 주세요.")
            document.kdb.c_email_licente.focus()
        }else{
            document.kdb.method = "post"
            document.kdb.target = "exec"
            document.kdb.action = "email_ok2.asp"
            document.kdb.submit()
        }
    }
    function email_ok3(){
        if(confirm("인증을 다시할 경우 기존 인증 상태는 지워집니다.\n다시 인증 하시겠습니까?")){
            document.getElementById("email11").style.display = "block"
            document.getElementById("email22").style.display = "none"
            document.getElementById("email33").style.display = "none"
            document.kdb.c_email.value = ""
            document.kdb.c_email_licente.value = ""
            document.kdb.email_ok.value = "0"
        }
    }
</script>
  
 	<form name="kdb">
	  <section>
            <div class="mem_wrapper2">
                    <div class="login_title">
                        <h2>회원정보수정</h2>
                    </div>
                    <div class="member_box">

                        <div class="id_info">
                            <div class="input_st" style="float:none;text-align:left">
                                 <label for="c_id">아이디</label>
                                 <input type="text" name="c_id" id="c_id" value="<%=tbl_board2("c_id")%>" disabled>
                            </div>
                        </div>


                        <div class="id_info">
                            <div class="input_st" style="float:none;text-align:left">
                                <label for="c_pass">비밀번호</label>
                                <input 
                                    type="password"
                                    name="c_pass"
                                    id="c_pass"
                                    placeholder="비밀번호를 입력하세요(6자 이상 숫자 + 영소문자)"
                                    onfocus=""
                                    required
                                    >
                            </div>

                            <div class="input_st" style="float:none;text-align:left">
                                <label for="c_pass2">비밀번호 확인</label>
                                <input type="password" id="c_pass2" name="c_pass2" placeholder="비밀번호를 한번 더 입력하세요" onfocus="" required >
                            </div>
                        </div>

                        <div class="use_term mgt53">
                            <!--<img src="/images/v.png"-->
                            
                        </div>

<!--
                        <div class="hp_box"  id="email11">
                            <div class="hp input_st">
                                <label for="c_email">휴대전화</label>
                                <input type="text" id="c_email" name="c_email" value="" disabled>
                            </div>
                        </div>
-->
                        <div class="hp_box"  id="email22" style="">
                            <div class="hp hp_verify">
                                <p>휴대전화</p>
                                <div class="phone_number_box">
                                    <b id="rr"><%=tbl_board2("c_email")%></b>
                                </div>
                                <button type="button" class="btn phone_btn" onclick="email_ok3()" >다른 휴대폰 번호로 인증하기</button>
                            </div>
                            <div class="hp input_st" >
                                <label for="c_email_licente">인증번호</label>
                                <input type="number" id="c_email_licente" name="c_email_licente" placeholder="인증번호를 입력하세요." onfocus=""  >
                                <button type="button" class="btn phone_btn" onclick="email_ok2()">인증확인</button>
                            </div>
                        </div>


                        <div class="input_name_box">
                            <div class="input_name input_st" style="float:none;text-align:left">
                                <label for="c_name">이름</label>
                                <input type="text" id="c_name" name="c_name" value="<%=tbl_board2("c_name")%>">
                            </div>
                            <div class="input_emal input_st" style="float:none;text-align:left">
                                <label for="email">이메일</label>
                                <input type="email" id="email" name="c_phone2" value="<%=tbl_board2("c_phone2")%>" >
                            </div>
                        </div>


                        <div class="recomm_id_box" >
                            <div class="recomm_id input_st">
                                <label for="c_recommend">추천인 아이디</label>
                                <input type="text" name="c_recommend" id="c_recommend" value="<%=tbl_board2("c_recommend")%>" placeholder="추천인 아이디를 입력하세요." onfocus="">
                            </div>
                        </div>
                    </div>
                </div>

            </section>

            <div class="mgt20 join_btn_box">
                <a href="/" class="btn join_btn join_btn_gray" >취소</a>
                <button type="button" class="btn join_btn" onclick="go()">정보변경</button>
            </div>

	</form>            
<iframe name="exec" id="exec" src="" width=0 height=0></iframe>            
<%end if
	tbl_board2.Close
	Set tbl_board2=Nothing
	%>
<%end if%>
<!-- #include virtual="/cms/sub_bottom.asp" -->