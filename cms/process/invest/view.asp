<!-- #include virtual="/cms/sub_top.asp" -->
<%
	s_date = "2023-07-24 00:00"
	e_date = "2023-08-18 23:59"





	sUsrAgent = UCase(Request.ServerVariables("HTTP_USER_AGENT"))






	%>
	<%
	c_festival_type = r_call("c_festival_type")
	s_text = r_call("s_text")
	c_team_no = r_call("c_team_no")
	%>
	<%
	if c_team_no = "" then
	%>
	<script>
		alert("잘못 된 접속입니다")
		location.href= "/"
	</script>
	<%	
	else
	sql_d = " select a.c_festival_type, a.c_no, b.c_no as c_festival_no, a.c_team_name, b.c_member_name, b.c_item_name,b.c_main_type,c_main, b.c_information "
	sql_d = sql_d & " ,(select sum(CAST(ISNULL(c_fund,0) AS BIGINT)) as c_sum  from tbl_fund where c_team_no = a.c_no and c_festival_no = b.c_no and c_use = 0 ) as c_sum "
 	sql_d = sql_d & "  from tbl_team a inner join tbl_festival_data b on b.c_team_no = a.c_no and b.c_use = 0 and b.c_year = '2023' "
	sql_d = sql_d & " where a.c_no = "& c_team_no &" and a.c_use = 0 and a.c_project_no in (10,11,12,13,14) and a.c_festival = 1 " 

	'response.write c_team_no
	'response.write sql_d
	'Response.End


	Set rs=CreateObject("ADODB.RecordSet")
	rs.Open sql_d, dbCon, 1
		
	If rs.EOF Then  
	%>
	<script>
		alert("잘못 된 접속입니다2")
		location.href= "/"
	</script>
	<%	
	else
	%>

	<!-- #include virtual="/cms/process/invest/value.asp" -->
	<%

	invest_grade ="iron"

			if isnull(rs("c_sum")) then
				c_sum = 0
				c_sum_rate = 0
				c_sum_rate_bar = 0
			else			
				c_sum = formatnumber(rs("c_sum"),0)
				hkk = cdbl(rs("c_sum"))
				'c_sum_rate = formatnumber(hkk / 50000000 * 100 , 0)
				'c_sum_rate_bar = fix(hkk / 50000000 * 100)
				c_sum_rate = formatnumber(hkk / 1000000000 * 100 )
				c_sum_rate_bar = fix(hkk / 1000000000 * 100)
				if c_sum_rate_bar > 100 then
					c_sum_rate_bar = 100
				end if

				if c_sum_rate_bar >= 0 AND c_sum_rate_bar < 25 then
					invest_grade = "iron"

				elseif c_sum_rate_bar >= 25 AND c_sum_rate_bar < 50 then
					invest_grade = "bronze"

				elseif c_sum_rate_bar >= 50 AND c_sum_rate_bar < 75 then
					invest_grade = "silver"

				elseif c_sum_rate_bar >= 75 AND c_sum_rate_bar < 100 then
					invest_grade = "gold"

				elseif c_sum_rate_bar >= 100 then
					invest_grade = "platinum"

				end if

			end if
	%>
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
	</script>

			
	<!----------벌레3,4,5--------->
			<%if (session("session_c_bug3") <> "" AND session("session_c_bug4") <> "" AND session("session_c_bug5") <> "") AND (session("session_c_bug3")=0 OR session("session_c_bug4")=0 OR session("session_c_bug5")=0) then%>
			<%total_find_bug = session("session_c_bug1") + session("session_c_bug2") + session("session_c_bug3") + session("session_c_bug4") + session("session_c_bug5")%>
			<input id="bug_member_no" type="hidden" value="<%=session("session_no")%>">
			<input id="total_find_bug" type="hidden" value="<%=total_find_bug%>">
			<input id ="bug_random_number" type="hidden" style="">
			<!--
			<input  type="text" value = "세션c_bug3 = <%=session("session_c_bug3")%>">
			<input  type="text" value = "세션c_bug4 = <%=session("session_c_bug4")%>">
			<input  type="text" value = "세션c_bug5 = <%=session("session_c_bug5")%>">
			-->
			<div style="width:200px; position : absolute; bottom:40%; right:20%">
				<a href="#none" onclick="find_bug();" >
					<img id="bug_column" <%if session("session_c_bug3") = 0 then %> 
											name="c_bug3" src="/images/bugIMG3.png" 
										<%elseif session("session_c_bug3") = 1 AND session("session_c_bug4") = 0 then%> 
											name="c_bug4" src="/images/bugIMG4.png" 
										<%elseif session("session_c_bug4") = 1 AND session("session_c_bug5") = 0 then%> 
											name="c_bug5" src="/images/bugIMG5.png" 
										<%end if%> 
										style="max-width:100%; display:;">
				</a>
			</div>
			<script>
			(function rand(){
				var bug_random_number = document.querySelector("#bug_random_number");
				var random_num = Math.random();
				random_num = Math.floor(random_num*10);
				bug_random_number.value=random_num;
				if(bug_random_number.value == "1" || bug_random_number.value == "2" ){
					document.querySelector("#bug_column").style.display="block";
				}
			})();

			function find_bug(){
				let c_member_no = document.querySelector("#bug_member_no").value
				let total_find_bug = document.querySelector("#total_find_bug").value
				total_find_bug = parseInt(total_find_bug)+1
				bug_column = document.getElementById("bug_column").getAttribute('name');
				
				//alert("total_find_bug = "+total_find_bug +"\n"+"bug_column = "+ bug_column)
				
				$.ajax({
					type: "POST",
					url: "find_bug.asp",
					data: "c_member_no="+c_member_no+"&bug_column="+bug_column,
					cache: false,
					success: function(msg){
						alert("이스터에그 이벤트 벌레 " + total_find_bug +" / 5 마리 찾으셨습니다.\n전부 찾으신 경우 이벤트에 자동 응모됩니다.!");
						document.querySelector("#bug_column").style.display="none";
						
					}
				});
				
			}
			</script>
			<%end if%>
			<!----------벌레3,4,5----------->
	<form name="kdb" >
		<div class="blue">
		
			<div class="invest_bg">
				<div class="sub_title_view">
						<h2>투자하기</h2>
				</div>
					
				<section class="sub_intro">
					<div class="ytp_wrap2">
							<%if rs("c_main_type") = 0 then%>
									<!--<img src="/upload/festival/<%=rs("c_main")%>" style="width:100%;max-width:943px;max-height:529px">-->
									<img src="/upload/festival/<%=rs("c_main")%>" style="width:100%; max-width:700px; max-height:400px;">
								<% else
									t1 = split(rs("c_main"),"/")
								%>
						<div class="video3">
								
								<iframe
									width="100%"
									height="100%"
									src="https://www.youtube.com/embed/<%=t1(ubound(t1))%>"
									frameborder="0"
									allow="encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen="allowfullscreen"></iframe>
								
							
						</div>
							<%end if%>
					</div>

					<div class="intro_txt">
						<div class="team_info">
									<b>참가팀 정보</b>
								<span class="team_name">
									<%=rs("c_team_name")%>
								</span>
								<!--------------------------뱃지-------------------------------->
								<%if invest_grade <> "iron" then%>
									<%if invest_grade ="bronze" then%>
										<img src="/images/bronze.png" style="max-width:100%; height:auto;">

									<%elseif invest_grade ="silver" then%>
										<img src="/images/bronze.png" style="max-width:100%; height:auto;">
										<img src="/images/silver.png" style="max-width:100%; height:auto;">

									<%elseif invest_grade ="gold"   then%>
										<img src="/images/bronze.png" style="max-width:100%; height:auto;">
										<img src="/images/silver.png" style="max-width:100%; height:auto;">
										<img src="/images/gold.png" style="max-width:100%; height:auto;">

									<%elseif invest_grade ="platinum" then%>
										<img src="/images/bronze.png" style="max-width:100%; height:auto;">
										<img src="/images/silver.png" style="max-width:100%; height:auto;">
										<img src="/images/gold.png" style="max-width:100%; height:auto;">
										<img src="/images/platinum.png" style="max-width:100%; height:auto;">
									<%end if%>
								<%end if%>
								<!--------------------------뱃지-------------------------------->
									<h3><%=rs("c_item_name")%></h3>
							</span>
						</div>
						<div class="achiev_txt">
							<p>달성률</p>
							<span class="achiev_no"><%=c_sum_rate*4%></span>
							<span class="achive_pro">%</span>
						</div>

						<div class="amt_txt">
							<p>모집금액</p>
							<span class="amt_price"><%=c_sum%></span>
							<span class="amt_won">원</span>
						</div >
						<!---------게이지----------->
						<input id="invest_grade" type="hidden" value="<%=invest_grade%>">

						<div class="range_bar">
							<div class="range_bar_width gauge_bar"  style=" width:<%=c_sum_rate_bar%>%;">
								<div class="range_bar_ani"></div>
							</div>
							<div class="range_line_flex">
								<span class="range_line"></span>
								<span class="range_line"></span>
								<span class="range_line"></span>
								<span class="range_line"></span>
								<span class="range_line"></span>
							</div>
						</div>

						<div class="range_bar_arrow_flex" >
							<img src="/images/invest_arrow.png" alt="">
							<img src="/images/invest_arrow.png" alt="">
							<img src="/images/invest_arrow.png" alt="">
							<img src="/images/invest_arrow.png" alt="">
							<img src="/images/invest_arrow.png" alt="">
						</div>


						<div class="range_bar_rable">
								<div class="label label1">
									<span>Seed<span>
								</div>

								<div class="label label2">
									<span>Series A<span>
									<br>
									<span>2.5억<span>
								</div>
								<div class="label label3" >
									<span>Series B<span>
									<br>
									<span>5억<span>
								</div>
								<div class="label label4" >
									<span>Series C<span>
									<br>
									<span>7.5억<span>
								</div>
								<div class="label label5" >
									<span>Pre-Unicorn<span>
									<br>
									<span>10억<span>
								</div>


						 </div>




						<script>
						$(document).ready(function(){
							let gauge_bar = $(".gauge_bar");
							let invest_grade = $("#invest_grade");

							let gauge_value = invest_grade.val();
							console.log(gauge_value)
							console.log(invest_grade)

							
							if (gauge_value === "iron"){
								gauge_bar.children('.range_bar_ani').addClass("gradient-iron");
							}else if (gauge_value === "bronze"){
								gauge_bar.children('.range_bar_ani').addClass("gradient-bronze");
							}else if (gauge_value === "silver"){
								gauge_bar.children('.range_bar_ani').addClass("gradient-silver");
							}else if (gauge_value === "gold"){
								gauge_bar.children('.range_bar_ani').addClass("gradient-gold");
							}else if (gauge_value === "platinum"){
								gauge_bar.children('.range_bar_ani').addClass("gradient-platinum");
							}

						})
						</script>

						<div class="funding_state_box"style="margin-top : 60px;">
							<p>마감일</p>
							<span class="date">
									2023-08-18 24:00 까지
							</span>

							<div class="funding_state">
									<%if now() < cdate(s_date) then%>
										<span class="state_pending">대기중</span>
									<%else%>
										<%if now() > cdate(e_date) then%>
											<span class="state_end">투자 종료</span>
										<%else%>
											<span class="state_ongoing">투자 진행중</span>
										<%end if%>
									<%end if%>
							</div>
						</div>

														<div class="fd_btn_group">
															<div class="fd_end">
																<div class="fd_top">
																	<a href="#">
																			<div class="fd_end_bt" >
																	<%if now() < cdate(s_date) then%>
																		<span class="state_pending">펀딩대기</span>
																	<%else%>
																		<%if now() > cdate(e_date) then%>
																			<span class="state_end">펀딩마감</span>
																		<%else%>
																		<!--
																			<span class="state_ongoing" onclick="<%if now() > cdate(s_date) and now() < cdate(e_date) then%>fund1()<%else%>alert('투자가능 기간은 <%=s_date%> ~ <%=e_date%>입니다.')<%end if%>">펀딩진행</span>
																		-->
																			<span class="state_ongoing">펀딩진행</span>
																		<%end if%>
																	<%end if%>
																	</a>
																</div>
															</div>



															<div class="like_bt">
																	<span id="heart">
																			<a onclick='setCookie("like_<%=c_team_no%>","ok", 30);'><i id="c_heart" class="fa fa-heart"></i></a>
																	</span>
															</div>
														</div>
														<div class="sns_gruop">
															<div class="share_bt" >
																<span >
																	<a href="" onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;">
																		<img src="/images/sns1_2.png" title="facebook" class="sharebtn_custom" >
																	</a>
																	<a href="" onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;">
																		<img src="/images/sns2_2.png" title="twitter" class="sharebtn_custom" >
																	</a> 
																	<a href="" onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;">
																		<img src="/images/sns3_2.png" title="kakao" class="sharebtn_custom" >
																	</a> 
																	<a href="" onclick="window.open(url_combine_naver, '', 'scrollbars=no, width=600, height=600'); return false;">
																		<img src="/images/sns4_2.png" title="Naver" class="sharebtn_custom" >
																	</a>
																	<a href="" onclick="window.open(url_combine_band, '', 'scrollbars=no, width=584, height=635'); return false;">
																		<img src="/images/sns5_2.png" title="Naver_band" class="sharebtn_custom" >
																	</a>
																</span>
															</div>
														</div>
													</div>
											</div>
				</section>
		</div>

	<!--
						<div class="not_invest_period">
							<div class="login_bn">
									<div class="login_bn_txt">
										<span>
											모의 투자 기간이 아닙니다.
										</span>
									</div>
							</div>
						</div>
	-->


	<script>
	if(getCookie("like_<%=c_team_no%>") == "ok"){
		document.getElementById("heart").innerHTML = '<a onclick="setCookie(\'like_<%=c_team_no%>\',\'no\', 30);"><i id="c_heart" class="fa fa-heart"></i></a>'
	}else{
		document.getElementById("heart").innerHTML = '<a onclick="setCookie(\'like_<%=c_team_no%>\',\'ok\', 30);"><i id="c_heart" class="fa fa-heart"></i></a>'
	}
	</script>

	<script type="text/javascript">
	function clip(){
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("주소가 복사되었습니다.")
	}

	</script>
	<script type="text/javascript" async> 
	var url_default_ks = "https://story.kakao.com/share?url="; 
	var url_default_fb = "https://www.facebook.com/sharer/sharer.php?u="; 
	var url_default_tw_txt = "https://twitter.com/intent/tweet?text="; 
	var url_default_tw_url = "&url="; 
	var url_default_band = "http://band.us/plugin/share?body="; 
	var url_route_band = "&route="; 
	var url_default_naver = "http://share.naver.com/web/shareView.nhn?url="; 
	var title_default_naver = "&title="; 
	var url_this_page = location.href; 
	var title_this_page = document.title; 
	var url_combine_ks = url_default_ks + url_this_page; 
	var url_combine_fb = url_default_fb + url_this_page; 
	var url_combine_tw = url_default_tw_txt + document.title + url_default_tw_url + url_this_page; 
	var url_combine_band = url_default_band + encodeURI(url_this_page)+ '%0A' + encodeURI(title_this_page)+'%0A' + '&route=tistory.com'; 
	var url_combine_naver = url_default_naver + encodeURI(url_this_page) + title_default_naver + encodeURI(title_this_page); 
	</script>

	<%
	'check_ok 정의 1=방명록 작성, 2=팀원은 모의 투자에 참여할 수 없습니다.., 3=투자하기, 4=투자금액을 소진하여 , 5=회원님은 이 팀에 원을 이미 투자하였습니다.., 6=회원님은 참가팀의 팀장이기 떄문에 평가 대상 팀만 모의투자가 가능합니다.

	'check_ok 3일 경우 테스트 하기

	' check_ok = 3

	p1_money = 1000000

	p2_money = 5000000




	' response.write check_ok


	' response.write session("session_jang")

	' response.write session("session_team_type")




	%>


				<section class="invest_guide_area">
					<%if isnull(session("session_no")) or  session("session_no") = "" Or  session("session_no") = "2" then
						url = replace(replace("/cms/process/invest/view.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903&c_team_no=" & c_team_no,"&","creesy"),"?","resoft")
					%>



						<div class="login_bn">
							<div class="login_bn_txt">

								로그인을 하시고 성장가능성 있는 기업에<br>
								모의 투자하시고, 푸짐한 상품도 받아가세요!
							</div>
							<div class="login_box">
								<div class="login_bt">
									<a href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748&url=<%=url%>" >
										로그인
									</a>
								</div>

								<div class="mem_bt">
									<a href="/cms/process/membership/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677" >
										회원가입
									</a>
								</div>
							</div>
						</div>


						<%else%>




						<%if check_ok = 2 then%>
							<div class="login_bn">
									<div class="login_bn_txt">
										학생창업유망팀 300 페스티벌 참가팀의 팀원은 모의 투자에 참여할 수 없습니다.<br>
										주변에 많이 알려 많은 투자를 받을 수 있게 응원해 주세요.!
									</div>
								</div>
						<%end if%>


						<%if check_ok = 1 then%>
							<div class="login_bn">
									<div class="login_bn_txt">
			
										방명록 작성을 해야만 투자 포인트를 받을 수 있습니다.<br>
										방명록 작성하여 모의 투자에 참여해 주세요.!
									</div>
									<div class="login_box">
										<div class="login_bt">
											<a href="/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413" >
												방명록 작성
											</a>
										</div>
									</div>
								</div>
						<%end if%>

							<%
					'		sql_check_reader =  "select * from tbl_team_member where c_member_no =" &session("session_no") &" and c_project_no in (10,11,12,13,14)"
							sql_check_reader = "select a.* from tbl_team a inner join tbl_festival_data b on a.c_no = b.c_team_no where a.c_project_no in (10,11,12,13,14) and a.c_use = 0 and a.c_festival = 1 and  a.c_member_no =" &session("session_no")&" and b.c_year=2023   "

'	response.write  " session_no -> "&session("session_no")   '45663
'		response.write " c_team_no -> "& c_team_no  				'4418
'	response.write " sql_check_reader -> "& sql_check_reader
'	Response.End
								Set abcde=CreateObject("ADODB.RecordSet")
								abcde.Open sql_check_reader, dbCon, 1

								
											If abcde.EOF Then  
													my_team_no = 0000
													else
													my_team_no = abcde("c_no")
											end if
											' response.write my_team_no
											abcde.Close
											Set abcde=Nothing				
							%>
							<input id="my_team_no" name="my_team_no" type="hidden" value="<%=my_team_no%>">

							<input id="c_team_no" name="c_team_no1" type="hidden" value="<%=c_team_no%>">
							

						<%if check_ok = 3 then%>

						<script>
							let my_team_no = document.querySelector('#my_team_no')
							let c_team_no = document.querySelector('#c_team_no')

							function fund1(){
								if(document.kdb.c_exp.value == ""){
									alert("이 팀을 위해서 응원글을 꼭 써 주세요.")
									document.kdb.c_exp.focus()
								}else if(my_team_no.value === c_team_no.value ){
									alert("본인 팀에는 투자를 진행할 수 없습니다.")
									document.kdb.c_exp.focus()
								}else{

									if(confirm("투자하시면 삭제가 불가능 합니다.\n이 팀에 모의투자를 하시겠습니까?")){
										document.kdb.action = "fund_ok.asp"
										document.kdb.method = "post"
										document.kdb.target="exec"
										document.kdb.submit()
									}else{
									
									}
								}
							}
						</script>

							<div>
								<input name="c_team_no" value="<%=c_team_no%>" type="hidden">
								<input name="c_festival_no" value="<%=rs("c_festival_no")%>" type="hidden">
								<input name="c_year" value="2023" type="hidden">
								<input name="c_team_type" value="<%=rs("c_festival_type")%>" type="hidden">
							</div>

						<div class="invest_area funding_area">
								<p class="team_name"><%=rs("c_team_name")%> </p>
								<div class="my_invest">
										<div class="my_invest_wrap">
											<div class="my_invest2">
												<div class="my_invest1">
													<img src="/images/icon_money.png">
												</div>
												<div class="mi_1">
													<span>나의 <%=money_info%> 투자 가능 금액</span><br>
													<span class="sp1"><%=formatnumber(p_money,0)%></span>
													<span class="sp2">원</span>
												</div>
											</div>
											<div class="my_invest4">
												<div class="my_invest3">
													<img src="/images/icon_team_money.png">
												</div>
												<div class="team_investable">
													<span><b>한팀당</b><br>최대 1회 투자 가능 금액</span><br>
													<span class="sp1"><%=formatnumber(p2_money,0)%></span>
													<span class="sp2">원</span>
												</div>
											</div>
										</div>
<%if p2_money > p_money   then  

p2_money = p_money

%>
										<div class="fund_formbox">
											<div class="invest_selector">
												<label for="c_fund" class="sp0">투자 희망금액</label>
												<select id="c_fund" class="is_select" name="c_fund">
													<%for i = p1_money to p2_money step p1_money%>
														<option value="<%=i%>" <%if i = p1_money then%>selected <%end if%>>
															<%=formatnumber(i,0)%>원
														</option>
													<%next%>
												</select>
											</div>
<%else %>
										<div class="fund_formbox">
											<div class="invest_selector">
												<label for="c_fund" class="sp0">투자 희망금액</label>
												<select id="c_fund" class="is_select" name="c_fund">
													<%for i = p1_money to p2_money step p1_money%>
														<option value="<%=i%>" <%if i = p1_money then%>selected <%end if%>>
															<%=formatnumber(i,0)%>원
														</option>
													<%next%>
												</select>
											</div>
					<%end if%>
											<div class="invest_go">
												<label class="cheering" for="c_exp">응원하기</label>
												<textarea name="c_exp" id="c_exp" cols="30" rows="10" placeholder="응원글을 작성해주세요"></textarea>
												<input href="#none" type="button" value="투자 하기" onclick="<%if now() > cdate(s_date) and now() < cdate(e_date) then%>fund1()<%else%>alert('투자가능 기간은 <%=s_date%> ~ <%=e_date%>입니다.')<%end if%>" >
												<!--<a href="#none" onclick="fund1()">.</a>-->
											</div>
										</div>
									</div>
								</div>
								<iframe name="exec" id="exec" src="" width="600px" height="600px" style="display:none"></iframe>
						<%end if%>

						<%if check_ok = 4 then%>
							<div class="login_bn">
									<div class="login_bn_txt">

										<%if session("session_jang") = "" or session("session_jang") = "2" Then%>

											회원님은 이미 투자금액을 모두 소진 하였습니다.<br>
										
										<%end if%>
										
										
									</div>
									<div class="login_box">
										<div class="login_bt">
											<a href="/cms/process/myinvest/list.asp?c_show_no=72&c_check_no=64&c_relation=253&c_relation2=126" >
												나의 투자 내역 확인하기
											</a>
										</div>
									</div>
							</div>
						<%end if%>


						<%if check_ok = 5 then%>
							<div class="login_bn">
									<div class="login_bn_txt" style="">
			
										회원님은 이 팀에  <%=past_fund%>원을 이미 투자하였습니다.<br>
										<span style="font-size:16px">
										응원글  "<%=past_exp%>"
										</span>
									</div>
									<div class="login_box">
										<div class="login_bt">
											<a href="/cms/process/myinvest/list.asp?c_show_no=72&c_check_no=64&c_relation=253&c_relation2=126" >
												나의 투자 내역 확인하기
											</a>
										</div>
									</div>
							</div>
						<%end if%>


						<%if check_ok = 6 then%>

							<div class="login_bn">
									<div class="login_bn_txt" style="">

										회원님은 참가팀의 팀장이기 떄문에 평가 대상 팀만 모의투자가 가능합니다.
										회원님의 모의 투자 가능한 그룹은 " <%=gog_text%> " 입니다
										
									</div>
									<!--
									<div class="login_box">
										<div class="login_bt">
											<a href="/cms/process/invest/list.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903" >
												팀 목록 가기
											</a>
										</div>
									</div>
									-->
									<div class="more_sch_box" style="">
											<div class="more_sch_txt">
													<a href="/cms/process/invest/list.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903" title="팀 목록 가기">팀 목록 가기</a>
											</div>
									</div>
							</div>

						<%end if%>


					<%end if%> 


				</section>

				<section class="tab2">
					<div class="tab_menu2">
						<ul class="tab2 invest_view_tab">
							<li data-id="con1"	 class="on">
								<a href="#none">Team Story</a>
							</li>

							<li data-id="con2">
								<a href="#none">평가의견</a>

							</li>
						<!--	<li data-id="con3"style="display:none;" >
								<a href="#none">상호평가의견</a>

							</li>
							<li data-id="con4" style="display:none;">
								<a href="#none">전문가평가의견</a>
							</li> -->
						</ul>

						<div id="con1" class="conBox1 on">
						
							<div style="text-align:left;width:100%;line-height:130%;padding-top:50px;padding-bottom:50px;">

							<div style="text-align:center;">

								

								<%If InStr(sUsrAgent, "ANDROID") > 0 Or InStr(sUsrAgent, "IPAD") Or InStr(sUsrAgent, "IPHONE") Then%>

									<div style="text-align:left;width:90%;max-width:90%;height:auto;background:#ffffff; margin: 0 auto;">

								<%Else%>

									<div style="text-align:left;width:90%;max-width:1100px;line-height:130%;padding:30px;background:#ffffff; margin: 0 auto;">

								<%end if%>


								<%
								c_information = rs("c_information")

								c_information = Replace(c_information, "<img", "<img style='width:100%;'")
								%>

									<p>

									
										<!--<p><img style="width:100%;" src="/upload/festival/u300_festival_editor(4891).jpg" style="width:840px;"><br></p>-->


										<%=c_information%>

									</p>

								</div>

	                           </div>
                            </div>
                        </div>
                        <div id="con2" class="conBox1">
                        	<%
                        	fund_number = 0
                        	fund_price = 0
                        	'sql_d = "select count(c_no) as f_n, sum(CAST(ISNULL(c_fund,0) AS BIGINT)) as f_p from tbl_fund where c_year = 2022 and c_team_no = "& c_team_no &" and c_use = 0 and c_member_type = 1"
                        	sql_d = "select count(c_no) as f_n, sum(CAST(ISNULL(c_fund,0) AS BIGINT)) as f_p from tbl_fund where c_year = 2023 and c_team_no = "& c_team_no &" and c_use = 0 "
                        	Set rs_d=CreateObject("ADODB.RecordSet")

				rs_d.Open sql_d, dbCon, 1
				If rs_d.EOF Then  
								fund_number = 0
								fund_price = 0
				else
					fund_number = rs_d("f_n")
								fund_price = rs_d("f_p")
								if isnull(fund_number) then
									fund_number = 0
								end if
								if isnull(fund_price) then
									fund_price = 0
								end if
				end if
				'response.write c_team_no
				rs_d.Close
				Set rs_d=Nothing
							%>
							<div class="con2_bn">

	<!--
								현재
								<span class="con2_no">
									<%=formatnumber(fund_number,0)%>
									<span class="con2_act">명</span>
								</span>
								의 투자자가
								<span class="con2_no">
										<%=formatnumber(fund_price,0)%>
									<span class="con2_act">원</span>
								</span>
								을 투자하였습니다.
	-->
								
																현재
																<span class="con2_no">
									<%=formatnumber(fund_number,0)%>
									<span class="con2_act">명이</span>
								</span>
								투자하였습니다.
                            </div>
                            <div class="con2_reply">
                                <table>
                                    <tbody>
				 <%
                        	'sql_d = "select   a.c_date,a.c_exp, b.c_id from tbl_fund a inner join tbl_member b on b.c_no = a.c_member_no and c_use = 0 where a.c_year = 2022 and a.c_team_no = "& c_team_no &" and a.c_use = 0 and a.c_member_type = 1 order by newid()"
													sql_d = "select a.c_date,a.c_exp, b.c_id from tbl_fund a inner join tbl_member b on b.c_no = a.c_member_no and c_use = 0 where a.c_year = 2023 and a.c_team_no = "& c_team_no &" and a.c_use = 0 order by a.c_date desc"
                        	Set rs_d=CreateObject("ADODB.RecordSet")

				rs_d.Open sql_d, dbCon, 1
				If rs_d.EOF Then  
				else
					Do Until rs_d.EOF
					%>
					
										<tr class="reply_row">
											<td class="reply_icon" rowspan="2">
												<!-- <img src="/images/reply_icon_pro.png"> 	-->
																								<img src="/images/profile.png">
											</td>
											<td class="txt_al txt_username">
												<span class="reply_id">
													<%
													tr = left(rs_d("c_id"),3)
													for i = 4 to len(rs_d("c_id"))
														tr = tr & "*"
													next
													%>
													<%=tr%>
												</span>
													<!--
													<span class="reply_name">최**</span>
												<span class="con2_amt">3,000,000</span>원
												-->
											</td>
											<td rowspan="2" class="reply_date">
												<%=left(rs_d("c_date"),10)%>
											</td>
										</tr>
										<tr>
											<td class="txt_al txt_review">
												<%=rs_d("c_exp")%>
											</td>
										</tr>
									<%
					rs_d.MoveNext
					Loop
				end if
				rs_d.Close
				Set rs_d=Nothing
							%>
						
									</tbody>
								</table>

							</div>
				
						</div>
						<!--상호평가의견 -->
				<%
        fund_number = 0
        fund_price = 0
        sql_d = "select count(c_no) as f_n, sum(c_fund) as f_p from tbl_fund where c_year = 2023 and c_team_no = "& c_team_no &" and c_use = 0 and c_member_type = 2"
        Set rs_d=CreateObject("ADODB.RecordSet")

				rs_d.Open sql_d, dbCon, 1
				If rs_d.EOF Then  
								fund_number = 0
								fund_price = 0
				else
					fund_number = rs_d("f_n")
								fund_price = rs_d("f_p")
								if isnull(fund_number) then
									fund_number = 0
								end if
								if isnull(fund_price) then
									fund_price = 0
								end if
				end if
				rs_d.Close
				Set rs_d=Nothing
							%>
						<div id="con3" class="conBox1">
							<div class="con2_bn">
								상호평가의견이
								<span class="con2_no">
									<%=formatnumber(fund_number,0)%>
								</span>
								개가 있습니다.
							</div>
							<div class="con2_reply">
									
								<table>
									<tbody>
					

                      <%
          sql_d = "select   a.c_date,a.c_exp, b.c_id from tbl_fund a inner join tbl_member b on b.c_no = a.c_member_no and c_use = 0 where a.c_year = 2023 and a.c_team_no = "& c_team_no &" and a.c_use = 0 and a.c_member_type = 2 order by newid()"
          Set rs_d=CreateObject("ADODB.RecordSet")

					rs_d.Open sql_d, dbCon, 1
					If rs_d.EOF Then  
					else
						Do Until rs_d.EOF
						%>

																					<tr class="reply_row">
											<td class="reply_icon" rowspan="2">
												<!-- <img src="/images/reply_icon_pro.png"> 	-->
																								<img src="/images/profile.png">
											</td>
											<td class="txt_al txt_username">
												<span class="reply_id">
													<%
													tr = left(rs_d("c_id"),3)
													for i = 4 to len(rs_d("c_id"))
														tr = tr & "*"
													next
													%>
													<%=tr%>
												</span>
													<!--
													<span class="reply_name">최**</span>
												<span class="con2_amt">3,000,000</span>원
												-->
											</td>
											<td rowspan="2" class="reply_date">
												<%=left(rs_d("c_date"),10)%>
											</td>
										</tr>
										<tr>
											<td class="txt_al txt_review">
												<%=rs_d("c_exp")%>
											</td>
										</tr>

										<%
						rs_d.MoveNext
						Loop
					end if
					rs_d.Close
					Set rs_d=Nothing
								%>
					
									</tbody>
								</table>
				<!--
								<div class="comment_write">
									<form onsubmit="return false">
										<textarea name="comment" placeholder="글에 대한 문의 및 댓글을 입력해주세요." onfocus=""></textarea>
										<button type="button" class="btn gray small" onclick="">댓글 등록</button>
									</form>
								</div>

								<table class="repl">
									<tbody>

										<tr class="reply_row txt_username">
																						<td class="reply_icon" rowspan="2">
																								<img src="/images/profile.png">
																						</td>
                                            <td class="txt_al ">
                                                <span class="reply_name">최**</span>
                                                <span class="reply_date2">2021-08-01
                                                </span>

                                            </td>
                                            -->
                                            <!-- <td rowspan="2" class="reply_date"> 2021-08-01 </td> -->
                                         <!--
                                        </tr>
                                        <tr>
                                            <td class="txt_al txt_review">
                                                열심히 해서 좋은 결과 가져오길 바랍니다.
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
				 -->
                            </div>
                        </div>

                        <div id="con4" class="conBox1">
                        <%
                        	fund_number = 0
                        	fund_price = 0
                        	sql_d = "select count(c_no) as f_n, sum(c_fund) as f_p from tbl_fund where c_year = 2023 and c_team_no = "& c_team_no &" and c_use = 0 and c_member_type = 3"
                        	Set rs_d=CreateObject("ADODB.RecordSet")

				rs_d.Open sql_d, dbCon, 1
				If rs_d.EOF Then  
								fund_number = 0
								fund_price = 0
				else
					fund_number = rs_d("f_n")
								fund_price = rs_d("f_p")
								if isnull(fund_number) then
									fund_number = 0
								end if
								if isnull(fund_price) then
									fund_price = 0
								end if
				end if
				rs_d.Close
				Set rs_d=Nothing
							%>
							<div class="con2_bn">
								전문가 평가의견이
								<span class="con2_no">
									<%=formatnumber(fund_number,0)%>
									<span class="con2_act">개</span>
								</span>
								가 있습니다.
							</div>
							<div class="con2_reply">
							
								<table>
									<tbody>
					<%
	                        	sql_d = "select   a.c_date,a.c_exp, b.c_name from tbl_fund a inner join tbl_temp_tester b on b.c_no = a.c_member_no  where a.c_year = 2023 and a.c_team_no = "& c_team_no &" and a.c_use = 0 and a.c_member_type = 3 order by newid()"
	                        	Set rs_d=CreateObject("ADODB.RecordSet")
					rs_d.Open sql_d, dbCon, 1
					If rs_d.EOF Then  
					else
					ikkop = 0
						Do Until rs_d.EOF
						ikkop=ikkop + 1
						%>
											<tr class="reply_row">
												<td class="reply_icon" rowspan="2">
													<!-- <img src="/images/reply_icon_pro.png">-->
																									<img src="/images/profile.png">
												</td>
												<td class="txt_al txt_username">
													<span class="reply_id">
														<%
														'tr = left(rs_d("c_name"),2)
														'for i = 3 to len(rs_d("c_id"))
														'	tr = tr & "*"
														'next
														%>
														전문가 <%=ikkop%>
													</span>
														<!--
														<span class="reply_name">최**</span>
													<span class="con2_amt">3,000,000</span>원
													-->
												</td>
												<td rowspan="2" class="reply_date">
													<%=left(rs_d("c_date"),10)%>
												</td>
											</tr>
											<tr>
												<td class="txt_al txt_review">
													<%=rs_d("c_exp")%>
												</td>
											</tr>
										<%
						rs_d.MoveNext
						Loop
					end if
					rs_d.Close
					Set rs_d=Nothing
								%>

									</tbody>
								</table>
				<!--
								<div class="comment_write">
									<form onsubmit="return false">
										<textarea name="comment" placeholder="글에 대한 문의 및 댓글을 입력해주세요." onfocus=""></textarea>
										<button type="button" class="btn gray small" onclick="">댓글등록</button>
									</form>
								</div>

								<table class="repl">
									<tbody>

										<tr class="reply_row">
												<td class="reply_icon" rowspan="2">
																									<img src="/images/profile.png">
												</td>
											<td class="txt_al txt_username">
												<span class="reply_name">최**</span>
												<span class="reply_date2">2021-08-01
												</span>

											</td>
											-->
											<!-- <td rowspan="2" class="reply_date"> 2021-08-01 </td> -->
										<!--
										</tr>
										<tr>
											<td class="txt_al txt_review">
												감사합니다. 실전창업6팀도 열심히 해서 좋은 결과 가져오길 바랍니다.
											</td>
										</tr>

									</tbody>
								</table>
				-->
							</div>
						</div>


			<!--
				<div class="btn_box mgt70">
					<div class="btn_box_txt">
						<a href="list.asp?<%=t_para%>&c_festival_type=<%=c_festival_type%>&s_text=<%=s_text%>">
							팀 목록 가기
						</a>
					</div>
				</div>
			-->
				
				</div>
				
				<div class="more_sch_box" style="">
						<div class="more_sch_txt">
								<a href="list.asp?<%=t_para%>&c_festival_type=<%=c_festival_type%>&s_text=<%=s_text%>" title="팀 목록 가기">팀 목록 가기</a>
						</div>
				</div>

				<!-----------------랜덤팀 10개 이동S---------------->

				<div class="recommend_area">
					<p>다른 인기 아이템들도 살펴보세요!</p>

					<div class="recommend_list"> 
						<% 
							strSQL="select top 10 a.* from tbl_team a inner join tbl_festival_data b on a.c_no = b.c_team_no where a.c_project_no in (10,11,12,13,14) and a.c_use = 0 and a.c_festival = 1 and b.c_year=2023 and b.c_item_name is not null and b.c_thumbnail is not null and b.c_main is not null and b.c_information is not null  order by newid()"

							'response.write strSQL
							Set tbl_board=CreateObject("ADODB.RecordSet")
							tbl_board.Open strSQL, dbCon, 1
							If tbl_board.EOF Then
							else
								Do Until tbl_board.EOF
						%>
									<div class="recommend_item">
										<a href="/cms/process/invest/view.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903&c_team_no=<%=tbl_board("c_no")%>&c_festival_type=<%=c_festival_type%>&s_text=<%=s_text%>">
											<!--운영에반영후 팀로고가없는애들은 팀명도 같이출력되도록-->
											<%if tbl_board("c_logo") = "" then%>
												<span><%=tbl_board("c_team_name")%></span>
												<img src="/images/logo3.png" style="width:100px">
												<!--<img src="/images/seoul/logo3.png" style="width:80px;height:80px;">-->

											<%else%>
												<span><%=tbl_board("c_team_name")%></span>
												<!--<img src="/images/logo3.png" style="width:80px;height:80px;">-->
												<img src="/upload/<%=tbl_board("c_logo")%>" style="width:100px">
											<%end if%>
										</a>
									</div>
						<%		
								tbl_board.MoveNext
								Loop
							End If
							tbl_board.Close
							Set tbl_board=Nothing
						%>
					</div>
				</div>
				<!-----------------랜덤팀 10개 이동E---------------->
				</section>
				
	<!--              <section class="tab2"> <div class="a"> </div> </section> -->

			</div>
	</form>
	<%
	end if
	rs.Close
	Set rs=Nothing
	end if
	%>

	<!-- #include virtual="/cms/sub_bottom.asp" -->
