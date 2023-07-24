
<!--#include virtual="/include/include.asp"-->
<!--#include virtual="/include/frame/head.asp"-->



<!--
 <Div id="Pop" style="position:absolute; left:100px; top:100px; width:100px; height:100px; z-index:10000;display:none;"> 
 	<a href="javascript:ViewLayer();"> 
 		 <img src="/cms/process/event2/img/top.png" style="width:100%;height:auto;">
 	</a> 

 </Div>  -->



<script> 

//  function ViewLayer(){

    

    
// 	if(document.getElementById("Pop").style.display=="none"){


// 	   document.getElementById("Pop").style.display='inline'


// 	}else{


// 	   document.getElementById("Pop").style.display='none'

// 	}

//}

</script> 

<div class="container"> 
    <div class="popup-wrap" id="agreePopup"> 
        <div class="popup">
            <div class="popup-head">	
                <span class="head-title">이벤트공지</span>
            </div>
            <div class="popup-body">	
                <div class="body-content">
                    <!--
                    <div class="body-titlebox">
                        <h1>로고투표</h1>
                    </div> -->
                    <a href = "/cms/process/event2/list.asp?c_show_no=110&c_check_no=65&c_relation=968&c_relation2=986">
                    <img src="/images/top2.png" style="width:100%;height:auto;">
                    </div>
                    </a>
            </div>
            <div class="popup-foot"> 
                <a href = "/cms/process/event2/list.asp?c_show_no=110&c_check_no=65&c_relation=968&c_relation2=986">
                <span class="pop-btn confirm" id="confirm">확인하기</span>
                </a>

                <a href="javascript:todayClose('agreePopup', 1);" class="pop-btn close">하루닫기</a>

                <a href="javascript:modalClose();" class="pop-btn">닫기</a>
                <!--
                <span class="pop-btn close" id="close">창 닫기</span> -->
            </div>
        </div>
    </div>
</div>

<!--
<body onload="ViewLayer();"> -->

<div class="wrapper">
<%
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
				if rs("my_no") < 5000 and now_p = 0 then
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
	
	sql_p = "select max(c_order) as p_count from tbl_puzzle where c_year = 2022 and c_use = 0 and c_puzzle_no = "& now_p
	Set rs=CreateObject("ADODB.RecordSet")
	rs.Open sql_p, dbCon, 1

	If rs.EOF Then 
		
	else
		t_count = rs("p_count")
	end if
	rs.Close
	Set rs=Nothing
	
	next_p = now_p + 1
	if next_p > 6 then
		next_p = 1
	end if
	prev_p = now_p - 1
	if prev_p = 0 then
		prev_p = 6
	end If


	
	If IsNull(t_count) Then

		t_count = 0

	End if

	

	'Response.write "77777777777=" & t_count

%>
<%
                    	 ok_p = t_count
                    	 no_p = 0
 			%>   
                <section class="main__page__visual">

                    <div class="visual_subject">
                        <a href="/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413">
                            <span class="vs1">
                                페스티벌
                            </span>
                            <span class="vs2">
                                방명록
                            </span>
                        </a>

                        <div class="more">
                            <a href="/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413">+ 더 보기</a>
                        </div>
                    </div>
 <script>
	function tiptip(event,flag,xx,yy){
		note2_go("")
		if(flag == "1"){
			document.getElementById("note02").style.width="600px"
			note2_go('<iframe width="600px" height="340px" src="https://www.youtube.com/embed/WvjAxDutiD0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe>')
		}else if(flag == "2"){
			document.getElementById("note02").style.width="600px"
			note2_go('<iframe width="600px" height="340px" src="https://www.youtube.com/embed/IVotGflw-Jc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe>')
		}else{
			document.getElementById("note02").style.width="300px"
			document.getElementById("exec").src="/cms/process/puzzle/box.asp?c_puzzle_no=<%=now_p%>&c_order=" + flag
		}
		 
		  var x = event.offsetX + xx * 19;
		  if(x>900){
		  	x = x - 350
		  }
		  var y = event.offsetY + yy * 11;
		   
		document.getElementById("note01").style.top = y + "px"
		document.getElementById("note01").style.left = x + "px"
		document.getElementById("note01").style.display = "block"
	}
	function note2_go(flag){
		document.getElementById("note02").innerHTML = flag; 
	}
	
</script>
                    <div class="swiper-container" style="padding-top:20px">
                        <div class="swiper-control">
                            <a href="#none" onclick="location.href='default_sub.asp?now_p=<%=prev_p%>'" class="prev-btn"></a>
                        </div>
    			<div style="padding:50px;background:#ffffff; padding-left:150px"  >
                             <div style="position: relative;padding:0px">
                     		<div id="img_t" style="position:absolute ; top:0px; left:0px;z-index:2;padding:0px;">

				<table  cellpadding=0 cellspacing=0>

					<% for j = 1 to 25 %>
					
						<tr>

						<% for i = 1 to 25 %>
						<%
							no_p = no_p + 1
						%>

							 <%if no_p > t_count then%>

								<td onclick="location.href='/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413'" style="cursor:pointer;width:39px;height:<%if j <25 then%>22<%else%>23<%end if%>px;background-color: rgba(255,255,255,0.7);border-right:1px #ffffff solid;border-bottom:1px #ffffff solid;" onmouseover="this.style.backgroundColor='rgba(247,155,52,0.8)'" onmouseout="this.style.backgroundColor='rgba(255,255,255,0.7)'" title="방명록 쓰기"></td>
							
							<%else%>

								<td onclick="tiptip(event,'<%=no_p%>',<%=i%>,<%=j%>)" style="cursor:pointer;width:39px;height:<%if j <25 then%>22<%else%>23<%end if%>px;"  onmouseover="this.style.backgroundColor='rgba(255,255,255,0.8)'" onmouseout="this.style.backgroundColor=''" title="이 위치에 있는 방명록 보기"></td>

							<%end if%>

						<%next%>

						</tr>

					<%next%>

				</table>
				</div>
				<div id="note01" style="position: absolute; top:0px; left:0px;z-index:30;padding:10px;padding-top:0px;padding-right:0px;border:1px #efefef solid;display:none;background:rgba(255,255,255,0.8)">
					<div style="text-align:right;height:20px;font-size:14px;padding-top:0px;padding-right:0px">
						<a href="#none" onclick="note2_go('');document.getElementById('note01').style.display = 'none'" style="background:#898989;color:#ffffff;font-weight:600">X</a>
					</div>

					<div id="note02" style="font-size:14px;padding-right:10px;width:300px;line-height:150%"></div>

	            </div>   
                        	 
                        	<img src="/cms/process/puzzle/images/p<%=now_p%>.png" alt="이미지" style="width:1000px">
				</div> 
                        </div>
    			<div class="swiper-control">
                            <a  href="#none" onclick="location.href='default_sub.asp?now_p=<%=next_p%>'" class="next-btn"></a>
                        </div>
                    </div>
                </section>

                <section class="news_ticker">
                    <div class="inner">

                        <div id="multilines">
                            <div class="guest_book1">
                                <ul class="newsticker dot">
                                <%
                                sql_p = "select   top(20) c_content, c_member_id, c_date, c_no from tbl_puzzle where c_year = 2022 and c_use = 0 and c_order > 2 order by c_no desc "
				Set rs=CreateObject("ADODB.RecordSet")
				rs.Open sql_p, dbCon, 1
				If rs.EOF Then 
				else
				klp = 0
				Do Until rs.EOF or klp = 10
					klp = klp + 1
				%>
                                    <li>
                                        <a href="/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413">
                                            <div class="gb_subject">
                                                 &nbsp;<%=replace(replace(rs("c_content"),"'",""""),chr(13)& chr(10)," ")%>
                                            </div>
                                            <div class="gb_id">
                                            	<%
                                            	c_member_id = left(rs("c_member_id"),3)
						t_s_no = len(rs("c_member_id")) - 3
						if t_s_no > 6 then
							t_s_no = 6
						end if
						for i = 1 to t_s_no
							c_member_id = c_member_id & "*"
						next
						%>	
                                                <%=c_member_id%>
                                            </div>
                                            <div class="gb_date">
                                               <%=left(rs("c_date"),10)%>
                                            </div>
                                        </a>

                                    </li>
                                 <%
                                rs.MoveNext
	                	Loop
                                %>    
                                </ul>
                            </div>

                            <div class="guest_book2">
                                <ul class="newsticker dot">
                                <%		
                                	 
                                	Do Until rs.EOF 
					klp = klp + 1
				%>
                                    <li>
                                        <a href="/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413">
                                            <div class="gb_subject">
                                                 &nbsp;<%=replace(replace(rs("c_content"),"'",""""),chr(13)& chr(10)," ")%>

                                            </div>
                                            <div class="gb_id">
                                              <%
                                            	c_member_id = left(rs("c_member_id"),3)
						t_s_no = len(rs("c_member_id")) - 3
						if t_s_no > 6 then
							t_s_no = 6
						end if
						for i = 1 to t_s_no
							c_member_id = c_member_id & "*"
						next
						%>	
                                               <%=c_member_id%>
                                            </div>
                                            <div class="gb_date">
                                                  <%=left(rs("c_date"),10)%>
                                            </div>
                                        </a>
                                    </li>
                                  <%
                                rs.MoveNext
	                	Loop
	                	end if
	                	rs.Close
				Set rs=Nothing
                                %>   
                                </ul>
                            </div>
                        </div>

                        <div class="news_button">
                            <div class="up">
                                <button id="next-button">
                                    <img src="/images/term_up.png">
                                </button>
                            </div>
                            <div class="down">
                                <button id="prev-button">
                                    <img src="/images/term_down.png">
                                </button>
                            </div>
                        </div>

                    </div>
                </section>
                 <section class="ytp">
                    <div class="ytp_wrap">
                       <div class="video1">
                            <div class="video_container">
                                <iframe width="100%" height="100%"
                                src="https://www.youtube.com/embed/ry7wOrXVV8w" 
                                frameborder="0"
                                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen="allowfullscreen"></iframe>
                            </div>
                        </div>

                        <div class="video2">
                            <div class="video_container">
                                <iframe width="100%" height="100%"
                                src="https://www.youtube.com/embed/WhbqAduoC5A" 
                                frameborder="0" 
                                allow="accelerometer; autoplay; encrypted-media;  gyroscope; picture-in-picture" 
                                allowfullscreen></iframe>
                            </div>
                        </div>

                    </div>

					<div class="ytp_wrap">
                        <div class="video1">
                            <div class="video_container">
                                <iframe width="100%" height="100%"
                                 src="https://www.youtube.com/embed/pFShDYqNI0c" frameborder="0"
                                 title="2022 학생 창업유망팀 300 페스티벌 홍보영상 (15초 ver.)" 
                                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen="allowfullscreen"></iframe>
                            </div>
                        </div>

                        <div class="video2">
                            <div class="video_container">
                                <iframe width="100%" height="100%"
                                 src="https://www.youtube.com/embed/nJFMWIY8ugU" title="2022 학생 창업유망팀 300 페스티벌 홍보영상 (Full ver.)" frameborder="0"
                                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen="allowfullscreen"></iframe>
                            </div>
                        </div>
                    </div>

                </section>

                <section class="mid_box">

                    <div class="mid_con">
                        <div class="u300_bn">
                            <img id="over_768" src="/images/mid_bn_desk.png">
                            <a href="/cms/show.asp?c_show_no=68&c_check_no=63&c_relation=217&c_relation2=359">
                                <img id="under_768" src="/images/mid_u300_mb2_creesy2_2022.png">
                            </a>
                        </div>

                        <div class="fes_info tac">

                            <div class="">
                                <p class="fs35 cofff ls3">
                                    대한민국 최대 학생창업 경진대회
                                </p>
                                <p class="fs50 cofff mgt10">
                                    2022 학생 창업유망팀 300
                                </p>
                                <div class="mgt35 tac co0d fs30">2022.08.16 ~ 2022.08.25</div>

                                <div class="fes_info_box dib mgt30">
                                    <div class="box250 dtc vam ">
                                        <div class="box25 dflex dib">
                                            <div class="mgt3 mgl2 cofff">?</div>
                                        </div>
                                        <span class="mg5 fs25 vam">
                                            <a class="co9000" href="/cms/show.asp?c_show_no=68&c_check_no=63&c_relation=217&c_relation2=359">
                                                대회안내
                                            </a>

                                        </span>

                                    </div>
                                </div>
                            </div>

                            <div class="dflex mgt40">
                                <div class="hando1 mg10 dflex ">
                                    <div class="dflex">
                                        <div class="dib"><img src="/images/ic_fes1.png"></div>
                                        <div class="mgl20 tal mgt5">
                                            <span class="co666">기업당 투자한도</span><br>
                                            <span class="fs50 co9000 fs45">5,000,000</span>
                                            <span class="fs35 co333">원</span>
                                        </div>
                                    </div>

                                    <div class="dflex ">
                                        <div class="dib"><img src="/images/ic_fes2.png"></div>
                                        <div class="mgl20 tal mgt5">
                                            <span class="co666">투자가능 기업수</span><br>
                                            <span class="fs50 co9000 fs45">282</span>
                                            <span class="fs35 co333">기업</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="hando2 mg10 dflex justi_al">
                                    <div class="dflex">
                                        <div class="dib"><img src="/images/ic_fes3.png"></div>
                                        <div class="mgl20 tal mgt5">
                                            <span class="cofff">모의투자금 총 한도</span><br>
                                            <span class="fs50 co9000 fs45">20,000,000</span>
                                            <span class="fs35 cofff">원</span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </section>
<%
c_festival_tpye = r_call("c_festival_type")
s_text = r_call("s_text")
%>                
<form name="kdb">                
                 <section class="startup_list" id="go_tab">
                    <!-- <div class="inner"> -->
                    <div class="tab_menu">
                        <ul>




							<li style="width:11%;" <%if c_festival_tpye = "" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default_sub.asp?c_festival_type=">전 체</a>
                            </li>

							<li style="width:11%;" <%if c_festival_tpye = "1" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default_sub.asp?c_festival_type=1">도약</a>
                            </li>

                            <li style="width:11%;" <%if c_festival_tpye = "2" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default_sub.asp?c_festival_type=2">성장1</a>
                            </li>

                            <li style="width:11%;" <%if c_festival_tpye = "3" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default_sub.asp?c_festival_type=3">성장2</a>
                            </li>

                            <li style="width:11%;" <%if c_festival_tpye = "4" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default_sub.asp?c_festival_type=4">성장3</a>
                            </li>

                            <li style="width:11%;" <%if c_festival_tpye = "5" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default_sub.asp?c_festival_type=5">성장4</a>
                            </li>

                            <li style="width:11%;" <%if c_festival_tpye = "6" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default_sub.asp?c_festival_type=6">성장5</a>
                            </li>

							<li style="width:11%;" <%if c_festival_tpye = "7" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default_sub.asp?c_festival_type=7">성장6</a>
                            </li>

                            <li style="width:11%;" <%if c_festival_tpye = "8" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default_sub.asp?c_festival_type=8">교육</a>
                            </li>



                        </ul>

                    </div>
			
                    <div class="tab-select-outer">
                        <select class="tab_select" name="c_festival_type" onchange="location.href='default_sub.asp?c_festival_type=' + this.value">

                            <option value="" <%if c_festival_tpye = "" then%>selected<%end if%>>전 체</option>

                        

							<option value="1" <%if c_festival_tpye = "1" then%>selected<%end if%>>도약</option>
                            <option value="2" <%if c_festival_tpye = "2" then%>selected<%end if%>>성장1</option>
                            <option value="3" <%if c_festival_tpye = "3" then%>selected<%end if%>>성장2</option>
                            <option value="4" <%if c_festival_tpye = "4" then%>selected<%end if%>>성장3</option>
                            <option value="5" <%if c_festival_tpye = "5" then%>selected<%end if%>>성장4</option>
                            <option value="6" <%if c_festival_tpye = "6" then%>selected<%end if%>>성장5</option>
							<option value="7" <%if c_festival_tpye = "7" then%>selected<%end if%>>성장6</option>
                            <option value="8" <%if c_festival_tpye = "8" then%>selected<%end if%>>교육</option>

                        </select>
                    </div>
			<script>
				function s_search(){
					if(document.kdb.s_text.value == ""){
						alert("키워드를 입력해 주세요.")
						document.kdb.s_text.focuse()
					}else{
						document.kdb.action = "default_sub.asp"
						document.kdb.method = "post"
						document.kdb.target = "_self"
						document.kdb.submit()
					}
				}
			</script>
                    <div class="sort_box">
                        <input 
                            name="s_text"
                            type="text"
                            id="keyword"
                            value="<%=s_text%>"
                            placeholder="키워드를 입력하세요"
                            maxlength="20"
                            class="input_wrap"
                            onkeyup="if (window.event.keyCode == 13) {s_search();}">

                        
                            <button type="button" class="btn gray small" onclick="s_search()">
                                <img src="/images/search.png" alt="">
                                <img src="/images/search2.png" alt="">
                                검 색</button>
                        

                    </div>

                    <div id="tab01" class="conBox on">
                        <div class="startup_box" id="data_insert">
                            
                       
                        </div>
                    </div>

                    <!-- <div class="btn_box3"> <div class="btn_box3_txt"> <a href="#"> 참여팀 프로젝트 더
                    보기 </a> </div> <div class='triangle'></div> </div> -->

                    <div class="more_sch" style="background: url('/images/more_over.png') no-repeat center">
                        <div class="more_sch_txt">
                            <a href="#none" onclick="exec2.go_next()" >
                            	<font color="#ffffff">
                                참여팀 프로젝트 더보기
                                </font>
                            </a>
                        </div>
                    </div>

                </section>
</form>
            </div>
<iframe name="exec2" id="exec2" src="" style="display:none;width:0px;height:0px"></iframe>   
<script>
 	document.kdb.action = "/cms/process/invest/add_value.asp"
	document.kdb.method = "post"
	document.kdb.target = "exec2"
	document.kdb.submit()
 </script>             
 
<iframe name="exec" id="exec" src="" style="display:none;width:0px;height:0px"></iframe>                
                
<!--#include virtual="/include/frame/bottom.asp"-->
<script>
	// function ViewLayer(){
    //       $("#popup").css('display','flex').hide().fadeIn();
    // }

    function modalClose(){
        $("#agreePopup").fadeOut(); //페이드아웃 효과
    }

  

	$(function() {
		
			$("#confirm").click(function(){
				modalClose(); 
				//컨펌 이벤트 처리
			});
		
		  
            $("#modal-open").click(function(){        
                $("#popup").css('display','flex').hide().fadeIn();
                 
            });

			$("#close").click(function(){
				modalClose(); 
			});
		
	});


    // 이벤트팝업

   todayOpen('agreePopup');
  // 창열기  
  function todayOpen(winName) {
    var blnCookie = getCookie(winName);
    var obj = eval("window." + winName);
    console.log(blnCookie);
    if (!blnCookie) {
      obj.style.display = "block";
    } else {
      
      obj.style.display = "none";
    }

    
  }

      // 창닫기  
  function todayClose(winName, expiredays) {
    setCookie(winName, "expire", expiredays);
    var obj = eval("window." + winName);
    obj.style.display = "none";
  }
    // 쿠키 가져오기  
  function getCookie(name) {
    var nameOfCookie = name + "=";
    var x = 0;
    while (x <= document.cookie.length) {
      var y = (x + nameOfCookie.length);
      if (document.cookie.substring(x, y) == nameOfCookie) {
        if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
          endOfCookie = document.cookie.length;
        return unescape(document.cookie.substring(y, endOfCookie));
      }
      x = document.cookie.indexOf(" ", x) + 1;
      if (x == 0)
        break;
    }
    return "";
  }

  // 24시간 기준 쿠키 설정하기  
  // 만료 후 클릭한 시간까지 쿠키 설정  
  function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
  }


</script>
<!--#include virtual="/include/include_b.asp"-->
 