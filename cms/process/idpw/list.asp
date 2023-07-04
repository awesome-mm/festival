<!-- #include virtual="/cms/sub_top.asp" -->
<script>
	function go_focus(flag){
		if(flag == "c_id"){
			document.kdb.c_id.focus()
		}
	}
	function go(){
		if(document.kdb.c_name.value == ""){
			alert("이름을 입력해 주세요.")
			document.kdb.c_name.focus()
		}else if(document.kdb.c_email.value == ""){
			alert("휴대폰 번호를 입력해 주세요.")
			document.kdb.c_email.focus()
		}else{
			if(confirm('입력하신 휴대폰 번호로 아이디 정보가 문자로 발송됩니다.')){
			document.kdb.method = "post"
			document.kdb.target = "exec"
			document.kdb.action = "login_ok.asp?<%=t_para%>"
			document.kdb.submit()
			alert('휴대전화로 아이디 정보가 문자 발송되었습니다')
			}
		}
	}
	function go2(){
		if(document.kdb.c_name.value == ""){
			alert("이름을 입력해 주세요.")
			document.kdb.c_name.focus()
		}else if(document.kdb.c_email.value == ""){
			alert("휴대폰 번호를 입력해 주세요.")
			document.kdb.c_email.focus()
		}else{
			if(confirm('입력하신 휴대폰 번호로 임시비밀번호가 문자로 발송됩니다. \n기존의 비밀번호는 임시비밀번호로 변경됩니다.')){
			document.kdb.method = "post"
			document.kdb.target = "exec"
			document.kdb.action = "login_ok2.asp?<%=t_para%>"
			document.kdb.submit()
			alert('휴대전화로 임시비밀번호가 문자 발송되었습니다')
			}
		}
	}	
</script>
 <%
 	url = request("url")
 %>
 <form name="kdb">
	  <div class="mem_wrapper">
                        <div class="inner">
													<div class="title3">
														<div>
																<div class="diagonal"></div>
														</div>
														<div>
																<span class="co666">ID • PW 찾기</span>
														</div>
													</div>

                            <div class="idpw_sch_tb_box">
															<p  style="color:#ff9000;">신청시 등록한 정보를 입력하세요.</p>
                                <table class="idpw_sch_tb" >
                                    <tr>
                                        <td colspan="2">
                                            <input type="text" name="c_name" placeholder="이름을 입력하세요." onfocus="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="number" name="c_email" placeholder="휴대폰 번호를 입력하세요." onfocus="" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                        </td>
                                    </tr>
                                    <tr>
																			<td>
																					<div style="text-align: center;" class="btn id_find" onclick="go()">아이디 찾기</div>
																			</td>
																			<td>
																					<div class="btn pw_find"  onclick="go2()">비밀번호 찾기</div>
																			</td>
                                    </tr>
                                </table>

                            </div>

                        </div>

                    </div>

</form>
 
 
<iframe name="exec" id="exec" src="" width=0 height=0></iframe>
<!-- #include virtual="/cms/sub_bottom.asp" -->
