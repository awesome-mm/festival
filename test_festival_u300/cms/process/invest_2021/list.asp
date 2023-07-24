﻿<!-- #include virtual="/cms/sub_top.asp" -->
<%
c_festival_type = r_call("c_festival_type")
s_text = r_call("s_text")
%>
<form name="kdb">
	  <section>
                    <div class="sub_title">
                        <h2>2021년</h2>
                    </div>
                    <div class="title_bn fs35">
                            <span class="font_style1">"</span>
                            <span>현재</span>
                            <span class="co590">282</span>
                            <span>개의 펀딩이 완료되었습니다.</span>
                            <span class="font_style1">"</span>
                        </div>
                </section>

                <section class="startup_list" name="go_tab">
                    <!-- <div class="inner"> -->
                    <div class="tab_menu">
                        <ul>

                            <li <%if c_festival_type = "" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>">전 체</a>
                            </li>
                            <li <%if c_festival_type = "7" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=7&">기술창업팀</a>
                            </li>
                            <li <%if c_festival_type = "1" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=1&">실전창업A팀</a>
                            </li>
                            <li <%if c_festival_type = "2" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=2&">실전창업B팀</a>
                            </li>
                            <li <%if c_festival_type = "3" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=3&">실전창업C팀</a>
                            </li>
                            <li <%if c_festival_type = "4" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=4&">실전창업D팀</a>
                            </li>
                            <li <%if c_festival_type = "5" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=5&">실전창업E팀</a>
                            </li>
                            <li <%if c_festival_type = "6" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=6&">실전창업F팀</a>
                            </li>
                            <li <%if c_festival_type = "8" then%>class="on"<%else%>class="off"<%end if%>>
                                <a href="list.asp?<%=t_para%>&c_festival_type=8&">예비창업팀</a>
                            </li>
                        </ul>

                    </div>
			
                    <div class="tab-select-outer">
                        <select class="tab_select" name="c_festival_type" onchange="location.href='list.asp?<%=t_para%>&c_festival_type=' + this.value">
                            <option value="" <%if c_festival_type = "" then%>selected<%end if%>>전 체</option>
                            <option value="7" <%if c_festival_type = "7" then%>selected<%end if%>>기술창업팀</option>
                            <option value="1" <%if c_festival_type = "1" then%>selected<%end if%>>실전창업팀A</option>
                            <option value="2" <%if c_festival_type = "2" then%>selected<%end if%>>실전창업팀B</option>
                            <option value="3" <%if c_festival_type = "3" then%>selected<%end if%>>실전창업팀C</option>
                            <option value="4" <%if c_festival_type = "4" then%>selected<%end if%>>실전창업팀D</option>
                            <option value="5" <%if c_festival_type = "5" then%>selected<%end if%>>실전창업팀E</option>
                            <option value="6" <%if c_festival_type = "6" then%>selected<%end if%>>실전창업팀F</option>
                            <option value="8" <%if c_festival_type = "8" then%>selected<%end if%>>예비창업팀</option>
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
		   
		    
		    <div class="btn_box3">
                        <div class="btn_box3_txt">
                            <a href="#none" onclick="exec.go_next()">
                                프로젝트 더보기
                            </a>
                        </div>
                        <!--<div class='triangle'></div>-->

                    </div>

                </section>
 </form>  
 

 <iframe id="exec" name="exec" src="" style="display:none;height:600px;width:600px"></iframe>

 
 <script>
 	document.kdb.action = "add_value.asp"
	document.kdb.method = "post"
	document.kdb.target = "exec"
	document.kdb.submit()
 </script>

<!-- #include virtual="/cms/sub_bottom.asp" -->
