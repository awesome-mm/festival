﻿<!-- #include virtual="/cms/sub_top.asp" -->

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
                                <a href="list.asp?<%=t_para%>&c_festival_type=3">성장(서울)</a>
                            </li>

                            <li <%if c_festival_tpye = "4" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=4">성장(인천경기)</a>
                            </li>

                            <li <%if c_festival_tpye = "5" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=5">성장(충청권)</a>
                            </li>

                            <li <%if c_festival_tpye = "6" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=6">성장(호남제주권)</a>
                            </li>

                            <li <%if c_festival_tpye = "7" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=7">성장(대경강원권)</a>
                            </li>

							<li <%if c_festival_tpye = "8" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=8">성장(동남권)</a>
                            </li>

                            <li <%if c_festival_tpye = "9" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=9">성장(전문대)</a>
                            </li>

                            <li <%if c_festival_tpye = "10" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=10">교육</a>
                            </li>
                            
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
                                <img src="/images/search3.png" alt="">
                            </button>
                        

                    </div>

                    <div id="tab01" class="conBox on">
                        <div class="startup_box" id="data_insert">
                            
                    
                        </div>
                    </div>
    
                        <div class="more_sch_txt" id="test_div1">
                            <a href="#none" onclick="exec.go_next(); ">
                                프로젝트 더보기
                            </a>
                        </div>

                </section>

</form>



 <iframe id="exec" name="exec" src="" style="display:none;height:600px;width:600px" ></iframe>


<script>
 	document.kdb.action = "add_value.asp"
	document.kdb.method = "post"
	document.kdb.target = "exec"
	document.kdb.submit();
</script>


<!-- #include virtual="/cms/sub_bottom.asp" -->
