<!-- #include virtual="/cms/sub_top.asp" -->
<%
	s_date = "2023-07-16 00:00"
	e_date = "2023-08-19 23:59"

	now_p=r_call("now_p")
	if now_p = "" then
		sql_p = "select distinct a.c_puzzle_no "
		sql_p = sql_p & " ,(select count(c_no) as my_no from tbl_puzzle where c_year = 2023 and c_use = 0 and c_puzzle_no = a.c_puzzle_no ) as my_no "
		sql_p = sql_p & " from tbl_puzzle a where a.c_year = 2023 and a.c_use = 0 order by a.c_puzzle_no"
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
	
	sql_p = "select max(c_order) as p_count from tbl_puzzle where c_year = 2023 and  c_use = 0 and c_puzzle_no = "& now_p
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
				<h2>네트워킹 데이 방명록</h2>
		</div>


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

			<section class="postit_wrapper">
			
<!-- db연결하고 데이터 뽑아서 사용하는 로직-->
        <div class=" movingElement_box postit_box">
<%
            strSQL="select top 20 * from (select top 100 * from tbl_puzzle where c_year = 2023 and c_use = 0 order by c_no desc) as aa order by newid()"
            Set tbl_board=CreateObject("ADODB.RecordSet")
            tbl_board.Open strSQL, dbCon, 1
            If tbl_board.EOF Then
            else
            i=0
                Do Until tbl_board.EOF
                
                c_member_id = tbl_board("c_member_id")
                t_s_no = len(c_member_id)
                c_member_id = left(c_member_id, t_s_no - 2)
                
                c_member_id = c_member_id & "**"
                


                %>
                <div id="draggable<%=i%>" class="movingElement postit_content">
                    <div hrdf="#" class="deleteButton"><i class="fa-solid fa-xmark"></i></div>
                    <p><%=tbl_board("c_content")%></p>
                    <div class="postit_bt">
                        <p><%=c_member_id%> </p>
                        <p><%=left(tbl_board("c_date"),10)%></p>
                    </div>
                </div>
            <%
            i= i+1
                tbl_board.movenext
                Loop
            End if
            tbl_board.Close
            Set tbl_board=Nothing
%>
<script>
    $(document).ready(function() {
        // console.log('로딩끝')

        function postItAnimation() {
            // Get the box containing the moving elements
            const movingElementBox = document.querySelector(".movingElement_box");
            const movingElements = movingElementBox.querySelectorAll(".movingElement");

            // Function to update CSS top and left values
            function updatePosition(element, topValue, leftValue) {
            element.style.top = `${topValue}%`;
            element.style.left = `${leftValue}%`;
            }

            // Function to generate random values for top and left
            function getRandomPosition() {
            const randomTop = Math.floor(Math.random() * 70) + 1; // Adjust the range based on box height (400px - element height 50px)
            const randomLeft = Math.floor(Math.random() * 85) + 1; // Adjust the range based on box width (400px - element width 50px)
            return { topValue: randomTop, leftValue: randomLeft };
            }

            // Function to animate the movement for each moving element
            function animateMovement(index) {
            if (index >= movingElements.length) {
                return; // All elements are displayed, stop recursion
            }
            

            const movingElement = movingElements[index];
            const deleteButton = movingElement.querySelector(".deleteButton");

            // Attach click event listener to delete button
            deleteButton.addEventListener("click", () => {
                // Hide the element by reducing opacity to 0
                movingElement.style.opacity = 0;
                // After a delay of 500ms (transition duration), set display to none
                setTimeout(() => {
                movingElement.style.display = "none";
                }, 500);
            });

            const { topValue, leftValue } = getRandomPosition();
            updatePosition(movingElement, topValue, leftValue);
            movingElement.style.opacity = "1"; // Display the element

            // Call the next element after a delay of 100ms
            setTimeout(() => {
                animateMovement(index + 1);
            }, 100);
            }

            // Call the function to start the animation for each moving element
            animateMovement(0);

            let movingElementLength = $(".movingElement").length;
            
            $(function () {
            for (let i = 0; i < movingElementLength; i++) {
                $("#draggable" + i).draggable();
            }
            });
        }
        postItAnimation()

// 무한루프 다시 뿌려주는 효과
        setInterval(() => {
            const movingElements = document.querySelectorAll(".movingElement");
            movingElements.forEach(element => {
                element.style.opacity = "0"
            });
            postItAnimation()
        }, 10000);
        
        // console.log('함수실행')

    });

</script>

                </div>
			</section>

		<section class="news_ticker sub_news_ticker">
			<div class="inner news_ticker_inner">
					<div id="add_value_div">
						<%
						first_no = 0
						a1=0
						
						a_period = 4
						
						a2 = a1 + a_period

						'sql_p = "select top 4 c_content,  t.* from ( select ROW_NUMBER() OVER (ORDER BY c_no desc) rnum, c_content, c_member_id, c_date, c_no from tbl_puzzle where c_year = 2023 and c_use = 0  ) t order by c_no desc" 
		sql_p = "select t.* from ( select ROW_NUMBER() OVER (ORDER BY c_no desc) rnum, c_content, c_member_id, c_date, c_no from tbl_puzzle where c_year = 2023 and c_use = 0   and c_no > "& first_no &" )t where  rnum > "& a1 &" and rnum <= "& a2				
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
									<div class="comment_area" >
										<div class="user_profile">
											<img src="./images/profile_2.png" alt="">
										</div>
												<%
c_member_id = rs("c_member_id")
t_s_no = len(c_member_id)
c_member_id = left(c_member_id, t_s_no - 2)
c_member_id = c_member_id & "**"
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
			<div class="btn_box_wrap">
				<div class="more_sch_txt">
						<a href="#none" onclick="add_value(); setTimeout(() => {dateChange(); console.log(1)}, 300);">
								댓글 더보기
						</a>
						<!-- <div class="triangle"></div> -->
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

                 
	<input name="first_no" id="first_no" value="<%=first_no%>" type="hidden">      
	<input name="s_no" id="s_no" value="<%=a2%>" type="hidden">      
	<input name="s_period" id="s_period" value="<%=a_period%>" type="hidden">  
	

<%
	kkp = 0
	if isnull(session("session_no")) or session("session_no") = "" then
		kkp = 1
		place_t = "로그인을 먼저 해 주세요."
	else
	
		sql_m = "select c_no from tbl_puzzle where c_use = 0 and c_year = 2023 and c_member_no = " & session("session_no")
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
                
				<section class="guest_book_bottom">
						<form name="kdb" class="guest_book">
							  <div>
										<h2>방명록 작성</h2>
											<div style="padding:20px 0; line-height:1.5">
												<ul class="guest_book_guide">
													<!--*<li>방명록 작성 기간이 아닙니다.</li>.-->
													<li>추천인 및 방명록 작성 기회는 회원에게 한번만 주어집니다.</li>
													<li>부적절한 방명록 작성 시 국민평가단 참여에 제한이 있을 수 있습니다.</li>
													<li>추천인 작성 시 추천인 아이디 정확히 작성 (오탈자 발생 시 추천 불인정)</li>
													<li>추천인이 없을 경우 공란으로 제출 (추후 추가 작성 불가)</li>
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
						 <div class="allWrap">     
								<div class="tabBox">
										<p class="tab-link current" data-tab="tab-1">추천인 랭킹</p>
										<p class="tab-link"  data-tab="tab-2">내가 쓴 방명록</p>
								</div>
								<div  id="tab-1" class="tab-content current">
									<p>ranking</p>
									<div class="ranking_box">
										<div class="ranking_top">
											<p>순위</p>
											<p>닉네임</p>
											<p>추천 수</p>
										</div>
										<ul class="ranking_list">

										
<%
	  strSQL = "select top 10 recom, c_id , * from ( SELECT a.* "
	  strSQL = strSQL & " ,(select count(c_no) as recom from tbl_member where c_recommend = a.c_id and festival_recommend_date > '2023-07-05' and recommend_year='2023') as recom "
	  strSQL = strSQL & " FROM tbl_member a WHERE a.c_no= c_no  ) t where t.recom > 0   order by t.recom desc  "

	 'response.write strSQL

	  Set tbl_board=CreateObject("ADODB.RecordSet")
	tbl_board.Open strSQL, dbCon, 1

%>  
<%    If tbl_board.EOF Then  %>
<!--
          <tr height=40>
            <td colspan=15 align=center> 등록된 회원 없습니다.</td>
          </tr>
-->
<%
      Else

			ipok = 0
        Do Until tbl_board.EOF  
		

					c_member_id = tbl_board("c_id")
					t_s_no = len(c_member_id)
					c_member_id = left(c_member_id, t_s_no - 2)
					
					c_member_id = c_member_id & "**"

%>

											<li class="ranking_item">
												<span>
													<span class="rank"><%=ipok%></span>
												</span>
												<span class="ranking_id"><%=c_member_id %></span>
												<p>
													<span class="like_icon"></span>
													<%=tbl_board("recom")%>
												</p>
											</li>
											
<%
					ipok = ipok + 1
          tbl_board.MoveNext
           
        Loop

      End If
		tbl_board.Close
	      Set tbl_board=Nothing
%>
										</ul>
									</div>
								</div>

<%
						dim post_content
						post_id = ""
						post_date = ""
						
						if isnull(session("session_no")) or session("session_no") = "" then
								
								post_content = "로그인을 먼저 해 주세요."
								else

								sql_check_reader =  "select * from tbl_puzzle where c_member_no =" &session("session_no")& "and c_year=2023"

								Set abcde=CreateObject("ADODB.RecordSet")
								abcde.Open sql_check_reader, dbCon, 1

											If abcde.EOF Then  
												post_content = "아직 작성하신 방명록이 없습니다."
												else
												post_content = abcde("c_content")
												post_id = abcde("c_member_id")
												post_date = abcde("c_date") 
											' response.write my_team_no
											end if
											abcde.Close
											Set abcde=Nothing	
						end if
%>
								<div  id="tab-2" class="tab-content">
									<div class="my_movingElement postit_content">
											<p><%=post_content%></p>
											<div class="postit_bt">
													<p><%=post_id%></p>
													<p><%=left(post_date,10)%></p>
											</div>
											<div class="pin_image"></div>	
									</div>
								</div>
						</div>
<%
												
%>

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

	$(".tab-link").click(function () {
    var tab_id = $(this).attr("data-tab");

    $(".tab-link").removeClass("current");
    $(".tab-content").removeClass("current");

    $(this).addClass("current");
    $("#" + tab_id).addClass("current");
  });


</script>
