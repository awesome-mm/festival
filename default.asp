
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

    

    
// 	if(document.getElementById("Pop").styleswiper-control.display=="none"){


// 	   document.getElementById("Pop").style.display='inline'


// 	}else{


// 	   document.getElementById("Pop").style.display='none'

// 	}

//}

</script> 

<!-- <div class="container">  -->
<!--     <div class="popup-wrap" id="agreePopup">  -->
<!--         <div class="popup"> -->
<!--             <div class="popup-head">	 -->
<!--                 <span class="head-title">이벤트공지</span> -->
<!--             </div> -->
<!--             <div class="popup-body">	 -->
<!--                 <div class="body-content"> -->
<!--                      -->
<!--                     <div class="body-titlebox"> -->
<!--                         <h1>로고투표</h1> -->
<!--                     </div> --> 
<!--                     <a href = "/cms/process/event2/list.asp?c_show_no=110&c_check_no=65&c_relation=968&c_relation2=986"> -->
<!--                     <img src="/images/top2.png" style="width:100%;height:auto;"> -->
<!--                     </div> -->
<!--                     </a> -->
<!--             </div> -->
<!--             <div class="popup-foot">  -->
<!--                 <a href = "/cms/process/event2/list.asp?c_show_no=110&c_check_no=65&c_relation=968&c_relation2=986"> -->
<!--                 <span class="pop-btn confirm" id="confirm">확인하기</span> -->
<!--                 </a> -->
<!--  -->
<!--                 <a href="javascript:todayClose('agreePopup', 1);" class="pop-btn close">하루닫기</a> -->
<!--  -->
<!--                 <a href="javascript:modalClose();" class="pop-btn">닫기</a> -->
<!--                  -->
<!--                 <span class="pop-btn close" id="close">창 닫기</span> --> 
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->

<!-- <body onload="ViewLayer();"> -->

<div class="wrapper main_wrapper">

    <div class="visual main_visual">
        <section class="main__page__visual">

            <div class="visual_subject">
                    <span class="vs1">
                        네트워킹 데이
                    </span>
                    <span class="vs2">
                        방명록
                    </span>
                    <a class="more" href="/cms/process/puzzle/list.asp?c_show_no=69&c_check_no=63&c_relation=879&c_relation2=413">더보기<i class="fa-solid fa-chevron-right"></i></a>
            </div>
 

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
                c_member_id = left(c_member_id, t_s_no - 3)
                
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


                </div>

        </section>


    </div>

    <section class="investment_area" style="text-align:center;">
        <div class="total_invest_rolling">
            <h3>총 투자금액</h3>
            <p id="total_investment" data-value="1000000000">1000000000</p>
            <span>원</span>
        </div>
        <div class="total_team_rollingd">
            <h3>모의투자 참여 인원</h3>
            <p id="total_team" data-value="300">350</p>
            <span>팀</span>
        </div>
    </section>

<script>
    var total_investment= document.querySelector('#total_investment').dataset['value'];
    var total_team= document.querySelector('#total_team').dataset['value'];
    console.log(total_investment)
    $({ val : 0 }).animate({ val : total_investment }, {
    duration: 2000,
    step: function() {
        var num = numberWithCommas(Math.floor(this.val));
        $("#total_investment").text(num);
    },
    complete: function() {
        var num = numberWithCommas(Math.floor(this.val));
        $("#total_investment").text(num);
    }
    });
    
    $({ val : 0 }).animate({ val : total_team }, {
    duration: 2000,
    step: function() {
        var num = numberWithCommas(Math.floor(this.val));
        $("#total_team").text(num);
    },
    complete: function() {
        var num = numberWithCommas(Math.floor(this.val));
        $("#total_team").text(num);
    }
    });

// 3자리마다 , 찍기
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
</script>

                 <section class="ytp">
                 <h3><span>네트워킹 데이</span> 소개영상</h3>
                 <p class="fastival_subtitle">2023 학생 창업유망팀 300 네트워킹 대회 </p>
           <!--         <div class="ytp_wrap">
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

                    </div>-->

					<div class="ytp_wrap">
                        <div class="video1">
                            <div class="video_container video_box1">
                                <div class="imgPart">
                                    <a class="popup-youtube" href="https://www.youtube.com/watch?v=1zjhNgoT_W8">
                                        <img src="./images/youtube_video1.jpg" alt="침착맨 유튜브 홍보영상">
                                        <i class="fa-brands fa-youtube"></i>
                                    </a>
                                </div>

                               <!-- <iframe width="100%" height="100%"
                                 src="https://www.youtube.com/embed/1zjhNgoT_W8" 
								 title="당신의 소년... 아니 당신의 창업팀에 지금 투표하세요! [시즌4 ep.8]" 
                                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen="allowfullscreen"></iframe>-->
                            </div>
                            <div class="video_text video_text1">
                                <h4>당신의 창업팀에 지금 투표하세요!</h4>
                                <p>
                                미래의 대기업은 당신의 손에서<br>
                                지금 바로 학생들의 창업아이템을 평가해주세요<br>
                                투표하고 푸짐한 상품 받아가는 거 잊지말기! 
                                </p>
                            </div>
                        </div>

                        <div class="video2">                            
                            <div class="video_container video_box2">

                                <div class="imgPart">
                                    <a class="popup-youtube" href="https://www.youtube.com/watch?v=nJFMWIY8ugU">
                                        <img src="./images/youtube_video2.jpg" alt="모의투자대회 홍보영상">
                                        <i class="fa-brands fa-youtube"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="video_text video_text2">
                                        <h4>학생 창업유망팀 300 페스티벌 홍보영상</h4>
                                        <p>
                                        손해 볼 일 1도 없는 모의투자대회 국민평가단<br>
                                        내 손으로 최고의 학생 창업팀을 뽑고 역대급 경품의 주인이 되어보세요!
                                        </p>
                            </div>
                               <!-- <iframe width="100%" height="100%"
                                 src="https://www.youtube.com/embed/nJFMWIY8ugU" title="학생 창업유망팀 300 페스티벌 홍보영상 (Full ver.)" frameborder="0"
                                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen="allowfullscreen"></iframe>
                            -->

                        </div>
                    </div>

                </section>

                <section class="mid_box">

                    <div class="mid_con">
                        <div class="u300_bn">
                            <img id="over_768" src="/images/mid_bn_desk_2.png">
                            <img id="under_768" src="/images/mid_u300_mb2_creesy2_2023.png">
                            <a class="guide_btn guide_btn_mobile" title="대회안내로 이동하기" href="/cms/show.asp?c_show_no=68&c_check_no=63&c_relation=217&c_relation2=359">
                                대회안내
                            </a>
                        </div>

                        <div class="fes_info tac">

                            <div class="">
                                <p class="ls3 guide_title hidden">
                                    대한민국 최대 학생창업 경진대회
                                </p>
                                <p class=" guide_sub_title">
                                    2023 학생 창업유망팀 300
                                </p>
                                <div class="mgt30 tac co0d fs20">2023.08.16 ~ 2023.08.25</div>

                                <div class="fes_info_box dib mgt30">
                                    <!--
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
                                    -->
                                    <a class="guide_btn" title="대회안내로 이동하기" href="/cms/show.asp?c_show_no=68&c_check_no=63&c_relation=217&c_relation2=359">
                                        대회안내
                                    </a>
                                </div>
                            </div>

                            <div class="dflex mgt40">
                                <div class="hando1  dflex ">
                                    <div class="dflex">
                                    <!--
                                        <div class="dib"><img src="/images/ic_fes1.png"></div>
                                    -->
                                    <div class="dib"><img width="52px" src="/images/icon_fest1.png"></div>
                                        <div class="mgl20 tal mgt5">
                                            <span class="co666 fs14">1개 기업당 투자한도</span><br>
                                            <span class="fs50 co9000 fs45">5,000,000</span>
                                            <span class="fs20 co9000">원</span>
                                        </div>
                                    </div>

                                    <div class="dflex ">
                                    <!--
                                        <div class="dib"><img src="/images/ic_fes2.png"></div>
                                    -->
                                    <div class="dib"><img width="52px" src="/images/icon_fest2.png"></div>
                                        <div class="mgl20 tal mgt5">
                                            <span class="co666 fs14">투자가능 기업수</span><br>
                                            <span class="fs50 co9000 fs45">283</span>
                                            <span class="fs20 co9000">기업</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="hando2  dflex justi_al">
                                    <div class="dflex">
                                    <!--
                                        <div class="dib"><img src="/images/ic_fes3.png"></div>
                                    -->
                                    <div class="dib"><img width="70px" src="/images/icon_fest3.png"></div>
                                        <div class="mgl20 tal mgt5">
                                            <span class="cofff fs14">모의투자금 총 한도</span><br>
                                            <span class="fs50 cofd3 fs45">20,000,000</span>
                                            <span class="fs20 cofff">원</span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </section>
<%
c_festival_type = r_call("c_festival_type")
s_text = r_call("s_text")
%>                
<form name="kdb">                
                 <section class="startup_list" id="go_tab">
                    <!-- <div class="inner"> -->
                    <div class="tab_menu">
                        <ul>

                            <li <%if c_festival_type = "" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?">전 체</a>
                            </li>

							<li <%if c_festival_type = "1" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=1">도약(일반)</a>
                            </li>

							<li <%if c_festival_type = "2" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=2">도약(유학생)</a>
                            </li>

                            <li <%if c_festival_type = "3" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=3">성장1</a>
                            </li>

                            <li <%if c_festival_type = "4" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=4">성장2</a>
                            </li>

                            <li <%if c_festival_type = "5" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=5">성장3</a>
                            </li>

                            <li <%if c_festival_type = "6" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=6">성장4</a>
                            </li>

                            <li <%if c_festival_type = "7" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=7">성장5</a>
                            </li>

							<li <%if c_festival_type = "8" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=8">성장6</a>
                            </li>

							<li <%if c_festival_type = "9" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=9">성장(전문대)</a>
                            </li>

                            <li <%if c_festival_type = "10" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=10">교육</a>
                            </li>
                            


                            <!--<li <%if c_festival_type = "" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?#go_tab">전 체</a>
                            </li>

							<li <%if c_festival_type = "1" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=1#go_tab">도약<span>(일반)</span></a>
                            </li>

                            <li <%if c_festival_type = "2" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=2#go_tab">도약<span>(유학생)</span></a>
                            </li>

                            <li <%if c_festival_type = "3" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=3#go_tab">성장<span>(일반)</span></a>
                            </li>

                            <li <%if c_festival_type = "4" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=4#go_tab">성장<span>(전문대)</span></a>
                            </li>

                            <li  <%if c_festival_type = "5" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="default.asp?c_festival_type=5#go_tab">교육</a>
                            </li>-->
                            <!--<a href="default.asp?#go_tab&c_festival_type=1" >교육</a>-->

                        </ul>

                    </div>
			
                    <div class="tab-select-outer">
                        <select class="tab_select" name="c_festival_type" onchange="location.href='default.asp?c_festival_type=' + this.value" onclick="saveScrollPosition(); " >

                            <option value=""  <%if c_festival_type = "" then%>selected<%end if%>>전 체</option>

      
<!--                  
                            <option value="1"  <%if c_festival_type = "1" then%>selected<%end if%>>도약(일반)</option>
                            <option value="2"  <%if c_festival_type = "2" then%>selected<%end if%>>도약(유학생)</option>
                            <option value="3"  <%if c_festival_type = "3" then%>selected<%end if%>>성장(일반)</option>
                            <option value="4"  <%if c_festival_type = "4" then%>selected<%end if%>>성장(전문대)</option>
                            <option value="4"  <%if c_festival_type = "5" then%>selected<%end if%>>교육</option>
-->

                            <option value="1" <%if c_festival_type = "1" then%>selected<%end if%>>도약(일반)</option>
                            <option value="2" <%if c_festival_type = "2" then%>selected<%end if%>>도약(유학생)</option>
                            <option value="3" <%if c_festival_type = "3" then%>selected<%end if%>>성장1</option>
                            <option value="4" <%if c_festival_type = "4" then%>selected<%end if%>>성장2</option>
                            <option value="5" <%if c_festival_type = "5" then%>selected<%end if%>>성장3</option>
                            <option value="6" <%if c_festival_type = "6" then%>selected<%end if%>>성장4</option>
                            <option value="7" <%if c_festival_type = "7" then%>selected<%end if%>>성장5</option>
							<option value="8" <%if c_festival_type = "8" then%>selected<%end if%>>성장6</option>
							<option value="9" <%if c_festival_type = "9" then%>selected<%end if%>>성장(전문)</option>
                            <option value="10" <%if c_festival_type = "10" then%>selected<%end if%>>교육</option> 

                        </select>
                    </div>
			<script>
				function s_search(){
					if(document.kdb.s_text.value == ""){
						alert("키워드를 입력해 주세요.")
						document.kdb.s_text.focuse()
					}else{
						document.kdb.action = "default.asp"
						document.kdb.method = "post"
						document.kdb.target = "_self"
						document.kdb.submit()
                        history.scrollRestoration = "auto";

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
                            onkeyup="if (window.event.keyCode == 13) {s_search(); saveScrollPosition();}">
                        <label for="keyword" class="keyword_label">검색</label>

                        
                        <button type="button" class="btn  search_btn" onclick="s_search(); saveScrollPosition();">
                                <!-- <img src="/images/search.png" alt=""> -->
                            <img src="/images/search2.png" alt="">
                            <span class="hidden">검색<span>
                        </button>
                        

                    </div>

                    <div id="tab01" class="conBox on">
                        <div class="startup_box" id="data_insert">
                            
                       
                        </div>
                    </div>

                    <!-- <div class="btn_box3"> <div class="btn_box3_txt"> <a href="#"> 참여팀 프로젝트 더
                    보기 </a> </div> <div class='triangle'></div> </div> -->

                    <!-- <div class="more_sch" style="background: url('/images/more_over.png') no-repeat center">-->
                    <div class="more_sch" >
                        <div class="more_sch_txt">
                            <a href="#none" onclick="exec2.go_next()" >
                            	<div color="#ffffff">
                                프로젝트 더보기
                                </div>
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


  // 24시간 기준 쿠키 설정하기  
  // 만료 후 클릭한 시간까지 쿠키 설정  
  function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
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

//   포스트잇 애니메이션 효과


    $(document).ready(function() {
        console.log('로딩끝')

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
        // setInterval(() => {
        //     const movingElements = document.querySelectorAll(".movingElement");
        //     movingElements.forEach(element => {
        //         element.style.opacity = "0"
        //     });
        //     postItAnimation()
        // }, 10000);
        
        // console.log('함수실행')

    });



    // 이벤트팝업
    // 창열기  
//   function todayOpen(winName) {
//     var blnCookie = getCookie(winName);
//     var obj = eval("window." + winName);
//     console.log(blnCookie);
//     console.log(obj);
//     if (!blnCookie) {
//       obj.style.display = "block";
//     } else {
      
//       obj.style.display = "none";
//     }
//   }
//    todayOpen('agreePopup');

// 창닫기  
//   function todayClose(winName, expiredays) {
//     setCookie(winName, "expire", expiredays);
//     var obj = eval("window." + winName);
//     obj.style.display = "none";
//   }


</script>




<!--#include virtual="/include/include_b.asp"-->
 