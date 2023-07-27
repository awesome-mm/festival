<!-- #include virtual="/cms/sub_top.asp" -->

<%


c_festival_tpye = r_call("c_festival_type")

s_text = r_call("s_text")

%>

<form name="kdb">
                    <div class="sub_title">
                        <h2>투자하기</h2>
                    </div>
                    <div class="title_bn fs35" style="display:none;">
						<span class="font_style1">"</span>
						<span>현재</span>
						<span class="co590">282</span>
						<span>개의 펀딩이 진행중 입니다.</span>
						<span class="font_style1">"</span>
					</div>
                </section>

                <section class="startup_list" name="go_tab">
                    <!-- <div class="inner"> -->
                    <div class="tab_menu" >
                        <ul>

                        
                            <li <%if c_festival_tpye = "" then%>class="on"<%else%>class="off"<%end if%>>
                               <a href="list.asp?<%=t_para%>"> 전체</a>
                            </li>

                            <li <%if c_festival_tpye = "1" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=1">도약(일반)</a>
                            </li>

                            <li <%if c_festival_tpye = "2" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=2">도약(유학생)</a>
                            </li>

                            <li <%if c_festival_tpye = "3" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=3">성장1</a>
                            </li>

                            <li <%if c_festival_tpye = "4" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=4">성장2</a>
                            </li>

                            <li <%if c_festival_tpye = "5" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=5">성장3</a>
                            </li>

                            <li <%if c_festival_tpye = "6" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=6">성장4</a>
                            </li>

                            <li <%if c_festival_tpye = "7" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=7">성장5</a>
                            </li>

							<li <%if c_festival_tpye = "8" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=8">성장6</a>
                            </li>

                            <li <%if c_festival_tpye = "9" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=9">성장(전문대)</a>
                            </li>

                            <li <%if c_festival_tpye = "10" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=10">교육</a>
                            </li>
                            
<!--
                            <li <%if c_festival_tpye = "" then%>class="on"<%else%>class="off"<%end if%>>
                               <a href="list.asp?<%=t_para%>"> 전체</a>
                            </li>

                            <li <%if c_festival_tpye = "1" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=1">도약<span>(일반)</span></a>
                            </li>

                            <li <%if c_festival_tpye = "2" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=2">도약<span>(유학생)</span></a>
                            </li>

                            <li <%if c_festival_tpye = "3" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=3">성장<span>(일반)</span></a>
                            </li>

                            <li <%if c_festival_tpye = "4" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=4">성장<span>(전문대)</span></a>
                            </li>

                            <li <%if c_festival_tpye = "5" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=5">교육</a>
                            </li>
-->
                        </ul>

                    </div>
			
                    <div class="tab-select-outer">
                        <select class="tab_select" name="c_festival_type" onchange="location.href='list.asp?<%=t_para%>&c_festival_type=' + this.value">
                            <option value="" <%if c_festival_tpye = "" then%>selected<%end if%>>전 체</option>
                            <option value="1" <%if c_festival_tpye = "1" then%>selected<%end if%>>도약(일반)</option>
                            <option value="2" <%if c_festival_tpye = "2" then%>selected<%end if%>>도약(유학생)</option>
                            <option value="3" <%if c_festival_tpye = "3" then%>selected<%end if%>>성장1</option>
                            <option value="4" <%if c_festival_tpye = "4" then%>selected<%end if%>>성장2</option>
                            <option value="5" <%if c_festival_tpye = "5" then%>selected<%end if%>>성장3</option>
                            <option value="6" <%if c_festival_tpye = "6" then%>selected<%end if%>>성장4</option>
                            <option value="7" <%if c_festival_tpye = "7" then%>selected<%end if%>>성장5</option>
							<option value="8" <%if c_festival_tpye = "8" then%>selected<%end if%>>성장6</option>
							<option value="9" <%if c_festival_tpye = "9" then%>selected<%end if%>>성장(전문)</option>
                            <option value="10" <%if c_festival_tpye = "10" then%>selected<%end if%>>교육</option>
                        </select>
                    </div>
			<script>

				function s_search(){
					if(document.kdb.s_text.value == ""){
						alert("키워드를 입력해 주세요.")
						document.kdb.s_text.focuse()
					}else{
						document.kdb.action = "list.asp?<%=t_para%>"
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
                        <label for="keyword" class="keyword_label">검색</label>

                        
                            <!--<button type="button" class="btn gray small" onclick="s_search()">-->
                            
                            <button type="button" class="btn search_btn" onclick="s_search()">
                                <!--<img src="/images/search.png" alt="">-->
                                <img src="/images/search2.png" alt="">
                            </button>
                        

                    </div>

                    <div id="tab01" class="conBox on">
                        <div class="startup_box" id="data_insert">
                            
                    
                        </div>
                    </div>


                    <!-- </div> -->
		   
                        <!--asp if문으로 세션아이디가 벌레1이미지 찾은경우-->
                        <!--
                        <div class="more_sch_txt" id="test_div1">
                            <a href="#none" onclick="exec.go_next(); ">
                                프로젝트 더보기
                            </a>
                        </div>
                        -->
                        <!--asp if문으로 세션아이디가 벌레1이미지 찾지않은경우-->
                        <div class="more_sch_txt" id="test_div1">
                            <a href="#none" onclick="bug1_plus(); exec.go_next(); ">
                                프로젝트 더보기
                            </a>
                        </div>
                        <!--<div class='triangle'></div>-->


                </section>

 </form>

 <div id ="bug1_section" style="display : none;">벌레1</div>
 <input id ="bug1_input" type="hidden" value="0">
 <img id="bug_img1" src="/images/bugIMG1.png" style="display:none;">
<script>
	/*cms/process/invest/list.asp 프로젝트더보기버튼3번 눌르면 벌레1 출현*/
	function bug1_plus(){
        let bug1 = document.getElementById('bug1_input');
        let bug_section = document.getElementById('bug_section');
        let bug1_click = parseInt(bug1.value);
        bug1_click += 1
        bug1.value = String(bug1_click);
        if (bug1_input.value == "3"){
            document.querySelector("#bug_img1").style.display="block";
        }
		if(bug1_input.value != "3"){
			document.querySelector("#bug_img1").style.display="none";
		}
	}
</script>


 <iframe id="exec" name="exec" src="" style="display:none;height:600px;width:600px" ></iframe>


 <script>
 	document.kdb.action = "add_value.asp"
	document.kdb.method = "post"
	document.kdb.target = "exec"
	document.kdb.submit();
 </script>


<!-- #include virtual="/cms/sub_bottom.asp" -->
