<!-- #include virtual="/cms/sub_top.asp" -->
<%
	s_date = "2022-08-16 00:00"
	e_date = "2023-08-25 23:59"

	now_p=r_call("now_p")
	if now_p = "" then
		sql_p = "select distinct a.c_puzzle_no "
		sql_p = sql_p & " ,(select count(c_no) as my_no from tbl_puzzle where c_year = 2022 and c_use = 0 and c_puzzle_no = a.c_puzzle_no ) as my_no "
		sql_p = sql_p & " from tbl_puzzle a where a.c_year = 2022 and a.c_use = 0 order by a.c_puzzle_no"
		Set rs=CreateObject("ADODB.RecordSet")
		rs.Open sql_p, dbCon, 1
		If rs.EOF Then 
			now_p = 1
		else
			now_p = 0
			Do Until rs.EOF 
				if rs("my_no") < 625 and now_p = 0 then
					now_p = rs("c_puzzle_no")
				end if 	
			rs.MoveNext
		        Loop
		end if
		rs.Close
		Set rs=Nothing
		if now_p = 0 then
			now_p = 1
		end if
	else
		now_p = cint(now_p)
	end if
	
	t_count = 0
	
	sql_p = "select max(c_order) as p_count from tbl_puzzle where c_year = 2022 and  c_use = 0 and c_puzzle_no = "& now_p
	Set rs=CreateObject("ADODB.RecordSet")
	rs.Open sql_p, dbCon, 1


	'Response.write "sql_p:" & sql_p

	If rs.EOF Then 
	else
		t_count = rs("p_count")
	end if
	rs.Close
	Set rs=Nothing


	If IsNull(t_count) Then

		t_count = 0

	End If
	



	' Response.write "t_count:" & t_count

	'Response.write "세션장은:" & session("session_jang")
%>

		<div class="sub_title guest_book_title">
				<h2>퍼즐 방명록</h2>
		</div>



<!--
<div class="tab_menu2" >
	<ul>
		<li data-id="con1" <%if now_p = 1 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=1">퍼즐 No1</a>
		</li>

		<li data-id="con1" <%if now_p = 2 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=2">퍼즐 No2</a>
		</li>

		<li data-id="con1" <%if now_p = 3 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=3">퍼즐 No3</a>
		</li>

		<li data-id="con1" <%if now_p = 4 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=4">퍼즐 No4</a>
		</li>
		<li data-id="con1" <%if now_p = 5 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=5">퍼즐 No5</a>
		</li>

		<li data-id="con1" <%if now_p = 6 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=6">퍼즐 No6</a>
		</li>


		<li data-id="con1" <%if now_p = 7 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=7">퍼즐 No7</a>
		</li>

		<li data-id="con1" <%if now_p = 8 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=8">퍼즐 No8</a>
		</li>

		<li data-id="con1" <%if now_p = 9 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=9">퍼즐 No9</a>
		</li>

		<li data-id="con1" <%if now_p = 10 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=10">퍼즐 No10</a>
		</li>

		<li data-id="con1" <%if now_p = 11 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=11">퍼즐 No11</a>
		</li>

		<li data-id="con1" <%if now_p = 12 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=12">퍼즐 No12</a>
		</li>

		<li data-id="con1" <%if now_p = 13 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=13">퍼즐 No13</a>
		</li>

		<li data-id="con1" <%if now_p = 14 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=14">퍼즐 No14</a>
		</li>

		<li data-id="con3" <%if now_p = 15 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=15">퍼즐 No15</a>
		</li>

		<li data-id="con4" <%if now_p = 16 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=16">퍼즐 No16</a>
		</li>

		<li data-id="con4" <%if now_p = 17 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=17">퍼즐 No17</a>
		</li>

		<li data-id="con4" <%if now_p = 18 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=18">퍼즐 No18</a>
		</li>


		<li data-id="con4" <%if now_p = 19 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=19">퍼즐 No19</a>
		</li>


		<li data-id="con4" <%if now_p = 20 then%>class="on"<%end if%>>
			<a href="list.asp?<%=t_para%>&now_p=20">퍼즐 No20</a>
		</li>
	</ul>
</div>

-->

			<%
				ok_p = t_count
				no_p = 0
 			%>
		
<script>
	function tiptip(event,flag,xx,yy){
		note2_go("")
		if(flag == "1"){
			document.getElementById("note02").style.width="600px"
			note2_go('<iframe width="600px" height="340px" src="https://www.youtube.com/embed/ry7wOrXVV8w" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe>')
		}else if(flag == "2"){
			document.getElementById("note02").style.width="600px"
			note2_go('<iframe width="600px" height="340px" src="https://www.youtube.com/embed/WhbqAduoC5A" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe>')
		}else{
			document.getElementById("note02").style.width="300px"
			document.getElementById("exec").src="/cms/process/puzzle/box.asp?c_puzzle_no=<%=now_p%>&c_order=" + flag
		}
		 
		  var x = event.offsetX + xx * 24;
		  if(x>900){
		  	x = x - 350
		  }
		  var y = event.offsetY + yy * 13.72;
		   
		document.getElementById("note01").style.top = y + "px"
		document.getElementById("note01").style.left = x + "px"
		document.getElementById("note01").style.display = "block"
	}
	function note2_go(flag){
		document.getElementById("note02").innerHTML = flag; 
	}
	
</script>	     	

	<div class="visual">
		<section class="main__page__visual visual_box">
				<div class="swiper-container swiper-container2" >
					<div class="swiper_box" >
						<div style="position: relative;padding:0px; ">
							<div id="img_t" style="position:absolute ; top:0px; left:0px;z-index:2;padding:0px;">
								<table  cellpadding=0 cellspacing=0>
													<% for j = 1 to 25 %>
													<tr>
													<% for i = 1 to 25 %>
													<%
														no_p = no_p + 1
													%>

														<%if no_p > t_count then%>

															<td onclick="document.kdb.c_content.focus()" style="cursor:pointer;width:47px;height:26.5px;background-color: rgba(255,255,255,0.7);border-right:1px #ffffff solid;border-bottom:1px #ffffff solid;" onmouseover="this.style.backgroundColor='rgba(247,155,52,0.8)'" onmouseout="this.style.backgroundColor='rgba(255,255,255,0.7)'" title="방명록 쓰기"></td>
														<%else%>

															<td onclick="tiptip(event,'<%=no_p%>',<%=i%>,<%=j%>)" style="cursor:pointer;width:47px;height:26.5px;;border-right:1px #ffffff solid;border-bottom:1px #ffffff solid;"  onmouseover="this.style.backgroundColor='rgba(255,255,255,0.8)'" onmouseout="this.style.backgroundColor=''" title="이 위치에 있는 방명록 보기"></td>

														<%end if%>

													<%next%>
													</tr>
													<%next%>
								</table>
							</div>
							<div id="note01" class="modal">
								<div class="modal_top" >
									<!--<a href="#none" onclick="note2_go('');document.getElementById('note01').style.display = 'none'" style="background:#898989;color:#ffffff;font-weight:600">X</a>-->
									<p class="modal_title">Welcome To Festival</p>
									<a href="#none" onclick="note2_go('');document.getElementById('note01').style.display = 'none'">
											<img class="close_dtn" src="/images/close_btn.png">
									</a>
								</div>

								<div id="note02" class="modal_body"></div>
								</div>       
										<img src="/cms/process/puzzle/images/p<%=now_p%>.png" alt="이미지" >
								</div>

								<table class="pagination_group">
								<tr>
								
									<td ><a href="list.asp?<%=t_para%>&now_p=1"><div class="circle1" <%if now_p = 1 then%> style="background-color:#fff;" <%end if%>></div></a></td>
									<td ><a href="list.asp?<%=t_para%>&now_p=2"><div class="circle1" <%if now_p = 2 then%> style="background-color:#fff;" <%end if%>></div></a></td>
									<td ><a href="list.asp?<%=t_para%>&now_p=3"><div class="circle1" <%if now_p = 3 then%> style="background-color:#fff;" <%end if%>></div></a></td>
									<td ><a href="list.asp?<%=t_para%>&now_p=4"><div class="circle1" <%if now_p = 4 then%> style="background-color:#fff;" <%end if%>></div></a></td>

									<!--
											<td ><a href="list.asp?<%=t_para%>&now_p=5"><div class="circle1" <%if now_p = 5 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=6"><div class="circle1" <%if now_p = 6 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=7"><div class="circle1" <%if now_p = 7 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=8"><div class="circle1" <%if now_p = 8 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=9"><div class="circle1" <%if now_p = 9 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=10"><div class="circle1" <%if now_p = 10 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=11"><div class="circle1" <%if now_p = 11 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=12"><div class="circle1" <%if now_p = 12 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=13"><div class="circle1" <%if now_p = 13 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=14"><div class="circle1" <%if now_p = 14 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=15"><div class="circle1" <%if now_p = 15 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=16"><div class="circle1" <%if now_p = 16 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=17"><div class="circle1" <%if now_p = 17 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=18"><div class="circle1" <%if now_p = 18 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=19"><div class="circle1" <%if now_p = 19 then%> style="background-color:#000000;" <%end if%>></div></a></td>
											<td ><a href="list.asp?<%=t_para%>&now_p=20"><div class="circle1" <%if now_p = 20 then%> style="background-color:#000000;" <%end if%>></div></a></td>
									-->
									
								</tr>
								
								</table>

							</div> 
						</div>  
		</section>

		<section class="news_ticker sub_news_ticker">
			<div class="inner news_ticker_inner">
					<div id="add_value_div">
						<%
						first_no = 0
						a1=0
						
						a_period = 10
						
						a2 = a1 + a_period
						sql_p = "select t.* from ( select ROW_NUMBER() OVER (ORDER BY c_no desc) rnum, c_content, c_member_id, c_date, c_no from tbl_puzzle where c_year = 2022 and c_use = 0 and c_order > 2  and c_no > "& first_no &" )t where  rnum > "& a1 &" and rnum <= "& a2
				response.write sql_p
				Set rs=CreateObject("ADODB.RecordSet")
				rs.Open sql_p, dbCon, 1
				If rs.EOF Then 
				else
				klp = 0
				Do Until rs.EOF 
					klp = klp + 1
					if klp = 1 then
						first_no = rs("c_no")
					end if
				%>
									<div class="comment_area" style=" color: #fff;">
										<div class="user_profile">
											<img src="./images/profile_2.png" alt="">
										</div>
												<%
c_member_id = rs("c_member_id")
t_s_no = len(c_member_id)
c_member_id = left(c_member_id, t_s_no - 3)
for i = 1 to 3
  c_member_id = c_member_id & "*"
next
						%>	
											<dl class="book_comment">
												<dt>
													<%=c_member_id%> 
													<span class="formDate" data-date="<%=left(rs("c_date"),10)%>">
													<%=left(rs("c_date"),10)%>
													</span>
												</dt>
												<dd>
													<p>
														<%=replace(replace(rs("c_content"),"'",""""),chr(13)& chr(10)," ")%>
													</p>
												</dd>
											</dl>
										</div>
	                	<%
	                		 rs.MoveNext
	                	Loop
	                	end if
				rs.Close
				Set rs=Nothing
				%>
					</div>
			</div>
		</section>    
		<script>
			function add_value(){
				document.getElementById("exec").src = "add_value.asp?first_no="+ document.getElementById("first_no").value +"&s_no="+ document.getElementById("s_no").value +"&s_period="+ document.getElementById("s_period").value
			}
			  // 1년 전 , 11개월 전, 29일 전 까지 표시하기


	// const moreDateChage = (delay) => setTimeout(() => {
	// 	console.log('출력하기');
	// }, delay);

	// moreDateChage(3000)

	
	function dateChange(){
  var formDates = document.querySelectorAll(".formDate");


	for (let i = 0; i < formDates.length; i++) {
			var formDate = formDates[i];
			var DBDay = formDate.getAttribute("data-date"); // Get the original date value
			var todayObj = new Date(DBDay); // Current date and time
			var currentDate = new Date(); // Convert the original date value to a Date object

			var timeDifference = currentDate.getTime() - todayObj.getTime();
			var nBetweenCntDay = Math.floor(timeDifference / (1000 * 60 * 60 * 24));

			if (nBetweenCntDay < 0) {
				formDate.innerHTML = -nBetweenCntDay + "일 뒤 미래입니다.";
			} else if (nBetweenCntDay === 0) {
				formDate.innerHTML = "오늘";
			} else {
				var years = currentDate.getFullYear() - todayObj.getFullYear();
				var months = currentDate.getMonth() - todayObj.getMonth();
				var days = currentDate.getDate() - todayObj.getDate();

				if (days < 0) {
					months--;
					var daysInLastMonth = new Date(currentDate.getFullYear(), currentDate.getMonth(), 0).getDate();
					days = daysInLastMonth + days;
				}
				if (months < 0) {
					years--;
					months = months + 12;
				}
				if (years > 0) {
					formDate.innerHTML = years + "년 전";
				} else if (months > 0) {
					formDate.innerHTML = months + "개월 전";
				} else {
					formDate.innerHTML = days + "일 전";
				}
			}
		}
}
dateChange();
		</script>    
		<div class="btn_box_wrap">
				<div class="more_sch_txt">
						<a href="#none" onclick="add_value(); setTimeout(() => {dateChange(); console.log(1)}, 300);">
								댓글 더보기
						</a>
						<!-- <div class="triangle"></div> -->
				</div>
		</div>
	</div>

                 
	<input name="first_no" id="first_no" value="<%=first_no%>" type="hidden">      
	<input name="s_no" id="s_no" value="<%=a2%>" type="hidden">      
	<input name="s_period" id="s_period" value="<%=a_period%>" type="hidden">  
	

<%
	kkp = 0
	if isnull(session("session_no")) or session("session_no") = "" then
		kkp = 1
		place_t = "로그인을 먼저 해 주세요."
	else
	
		sql_m = "select c_no from tbl_puzzle where c_use = 0 and c_year = 2022 and c_member_no = " & session("session_no")
		Set rs_m=CreateObject("ADODB.RecordSet")
		rs_m.Open sql_m, dbCon, 1
		If rs_m.EOF Then 
			kkp = 2
			place_t = "방명록을 작성하세요."
		else
			kkp = 3
			place_t = "이미 방명록 작성하고 평가단이 되셨습니다."
		end if
		rs_m.Close
		Set rs_m=Nothing
		
	end if
%>
<%
	url = replace(replace("/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413","&","creesy"),"?","resoft")
%>
<script>
	function go_login(){
		if(confirm("로그인이 필요합니다.\n로그인으로 이동하시겠습니까?")){
			document.kdb.c_content.blur()
			location.href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748&url=<%=url%>"
		}else{
			document.kdb.c_content.blur()
		}
	}
	function gogo(){
		<%if kkp = 1 then%>
			go_login()
		<% end if%>
		<%if kkp = 3 then%>
			alert("회원님은 이미 방명록을 작성하셨습니다.\n회원에게 방명록 작성은 한번만 할 수 있습니다.")
			document.kdb.c_content.blur()
		<% end if%>
		<%if kkp = 2 then%>
			if( document.kdb.c_content.value == "" ){
				alert("내용을 작성하세요.")
				document.kdb.c_content.focus()
			}else{
				document.kdb.action = "insert_ok.asp"
				//document.kdb.target = "exec"
				document.kdb.method = "post"
				document.kdb.submit()
				
			}
		<% end if%>
	}
</script>
                
				<section>
						<form name="kdb">
							  <div class="guest_book" >
										<h2  style="text-align:center;">방명록 작성</h2>
											<div style="padding:20px 0; marin:0 auto; line-height:1.5">
												<ul class="guest_book_guide">
													<!--*<li>방명록 작성 기간이 아닙니다.</li>.-->
													<li>- 추천인 및 방명록 작성 기회는 회원에게 한번만 주어집니다.</li>
													<li>- 부적절한 방명록 작성 시 국민평가단 참여에 제한이 있을 수 있습니다.</li>
													<li>- 추천인 작성 시 추천인 아이디 정확히 작성 (오탈자 발생 시 추천 불인정)</li>
													<li>- 추천인이 없을 경우 공란으로 제출 (추후 추가 작성 불가)</li>
												</ul>
											</div>

											<div class="comment_write">
													<label for="c_recommend">추천인</label>
													<input class="pz_ip" id="c_recommend"  type="text" name="c_recommend" placeholder="추천인 아이디를 입력하세요." >
																<!-- input-div -->
													<label for="input-letter">방명록</label>
													<textarea id="input-letter" maxlength="500" cols="30" rows="10"  name="c_content" 
													placeholder="<%=place_t%>" onfocus="<%if kkp = 1 then%>go_login()<%end if%><%if kkp = 3 then%><%end if%>" ></textarea>
													<!--onfocus="<%if kkp = 1 then%>go_login()<%end if%><%if kkp = 3 then%>gogo()<%end if%>"-->
													<button type="button" class="btn_guest" onclick="gogo()">등록하기</button>
											</div>
								</div>
						 </form>
				 </section>

<iframe name="exec" id="exec" src="" style="display:none;width:600px;height:600px"></iframe>                
<!-- #include virtual="/cms/sub_bottom.asp" -->

<% if now() > cdate(e_date) then%>
	<script>
		$(".mem_wrapper").css('display', 'none');
	</script>
<% end if %>

<script>
$("#input-letter").on("propertychange change keyup paste input",function(){
      //  $(this)[0].style.height='auto';
      //  $(this).height( $(this).prop('scrollHeight'));     
    });

$(".input-div").on("propertychange change keyup paste input",function(){
      //  $(this)[0].style.height='auto';
      //  $(this).height( $(this).prop('scrollHeight'));     
    });
</script>
