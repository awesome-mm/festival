<!-- #include virtual="/cms/sub_top.asp" -->
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
	
	sql_p = "select max(c_order) as p_count from tbl_puzzle where c_use = 0 and c_puzzle_no = "& now_p
	Set rs=CreateObject("ADODB.RecordSet")
	rs.Open sql_p, dbCon, 1

	If rs.EOF Then 
	else
		t_count = rs("p_count")
	end if
	rs.Close
	Set rs=Nothing
%>
	<section class="main__page__visual">
		<div class="title3">
                        <div>
                            <div class="diagonal"></div>
                        </div>
                        <div>
                            <span class="co666">퍼즐</span>
                            <span class="co590">방명록</span>
                        </div>
                    </div>
                    
                    <div class="line3"></div>

<!--                    
		<div class="line3"></div>
-->
                    <div class="tab_menu2">
                        <ul>
                            <li data-id="con1" <%if now_p = 1 then%>class="on"<%end if%>>
                                <a href="list.asp?<%=t_para%>&now_p=1">퍼즐 No1</a>
                            </li>

                            <li data-id="con2" <%if now_p = 2 then%>class="on"<%end if%>>
                                <a href="list.asp?<%=t_para%>&now_p=2">퍼즐 No2</a>
                            </li>

                            <li data-id="con3" <%if now_p = 3 then%>class="on"<%end if%>>
                                <a href="list.asp?<%=t_para%>&now_p=3">퍼즐 No3</a>
                            </li>

                            <li data-id="con4" <%if now_p = 4 then%>class="on"<%end if%>>
                                <a href="list.asp?<%=t_para%>&now_p=4">퍼즐 No4</a>
                            </li>
                            <li data-id="con4" <%if now_p = 4 then%>class="on"<%end if%>>
                                <a href="list.asp?<%=t_para%>&now_p=5">퍼즐 No5</a>
                            </li>
                            <li data-id="con4" <%if now_p = 4 then%>class="on"<%end if%>>
                                <a href="list.asp?<%=t_para%>&now_p=6">퍼즐 No6</a>
                            </li>
<!--
                            <li data-id="con5">
                                <a href="#">퍼즐 No5</a>
                            </li>
-->   
                        </ul>

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
			note2_go('<iframe width="600px" height="340px" src="https://www.youtube.com/embed/WvjAxDutiD0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe>')
		}else if(flag == "2"){
			document.getElementById("note02").style.width="600px"
			note2_go('<iframe width="600px" height="340px" src="https://www.youtube.com/embed/IVotGflw-Jc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="allowfullscreen"></iframe>')
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
                     <div style="padding:50px;background:#efefef; padding-left:172px"  >
                       
                        	<div style="position: relative;padding:0px">
                     		<div id="img_t" style="position:absolute ; top:0px; left:0px;z-index:2;padding:0px;">
				<table  cellpadding=0 cellspacing=0>
				<% for j = 1 to 50%>
				<tr>
				<% for i = 1 to 50%>
				<%
					no_p = no_p + 1
				 %>
					 <%if no_p > t_count then%>
						<td onclick="document.kdb.c_content.focus()" style="cursor:pointer;width:23px;height:12.72px;background-color: rgba(255,255,255,0.7);border-right:1px #ffffff solid;border-bottom:1px #ffffff solid;" onmouseover="this.style.backgroundColor='rgba(247,155,52,0.8)'" onmouseout="this.style.backgroundColor='rgba(255,255,255,0.7)'" title="방명록 쓰기"></td>
					<%else%>
						<td onclick="tiptip(event,'<%=no_p%>',<%=i%>,<%=j%>)" style="cursor:pointer;width:24px;height:13.72px;"  onmouseover="this.style.backgroundColor='rgba(255,255,255,0.8)'" onmouseout="this.style.backgroundColor=''" title="이 위치에 있는 방명록 보기"></td>
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
					<div id="note02" style="font-size:14px;padding-right:10px;width:300px;line-height:150%">
					</div>
	            		</div>   
                        	 
                        	<img src="/cms/process/puzzle/images/p<%=now_p%>.png" alt="이미지" style="width:1200px">
				</div> 
                        
			</div> 
            		

                </section>

                 <section class="news_ticker">
                    <div class="inner">
                        <div id="add_value_div" style="padding-left:100px;padding-right:100px;padding-top:40px;">
                        	<%
                        	first_no = 0
                        	a1=0
                        	
                        	a_period = 10
                        	
                        	a2 = a1 + a_period
                        	sql_p = "select t.* from ( select ROW_NUMBER() OVER (ORDER BY c_no desc) rnum, c_content, c_member_id, c_date, c_no from tbl_puzzle where c_year = 2022 and c_use = 0 and c_order > 2  and c_no > "& first_no &" )t where  rnum > "& a1 &" and rnum <= "& a2
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
                                     <div style="padding:15px;padding-top:30px"> 
                                            <div  style="float:left;padding-right:20px;line-height:150%" >
                                            	<font color="#FB914B" size="1">●</font>&nbsp;
                                                <font color="#656565">
                                                 <%=replace(replace(rs("c_content"),"'",""""),chr(13)& chr(10)," ")%>
                                                </font>
                                                <%
                                            	c_member_id = left(rs("c_member_id"),3)
						t_s_no = len(rs("c_member_id")) - 3
						for i = 1 to t_s_no
							c_member_id = c_member_id & "*"
						next
						%>	
						<nobr>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<font color="#FF9017"> / </font>
                                                <font color="#898989">
                                                	<%=c_member_id%>
                                                </font>
                                                <font color="#FF9017"> / </font>
                                                <font color="#898989">
                                                	<%=left(rs("c_date"),10)%>
                                                </font>
						</nobr>
                                            </div>
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
                <input name="first_no" id="first_no" value="<%=first_no%>" type="hidden">      
                <input name="s_no" id="s_no" value="<%=a2%>" type="hidden">      
                <input name="s_period" id="s_period" value="<%=a_period%>" type="hidden">  
                
                <script>
                	function add_value(){
                		document.getElementById("exec").src = "add_value.asp?first_no="+ document.getElementById("first_no").value +"&s_no="+ document.getElementById("s_no").value +"&s_period="+ document.getElementById("s_period").value
                	}
                </script>    
                <div class="btn_box_wrap">
                    <div class="btn_box3">
                        <div class="btn_box3_txt">
                            <a href="#none" onclick="add_value()">
                                더 보기
                            </a>
                        </div>
                        <div class="triangle"></div>

                    </div>

                </div>
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
				document.kdb.target = "exec"
				document.kdb.method = "post"
				document.kdb.submit()
				
			}
		<% end if%>
	}
</script>
                
          <section>
          	<form name="kdb">
                <div class="mem_wrapper" style="padding:100px;padding-bottom:100px">
                	<div class="use_term">
                            <img src="/images/v.png">
                            <span style="font-weight:600">방명록 작성하고 국민평가단 참여하기</span>
                        </div>
			<div class="comment_write">
                            <textarea  name="c_content" placeholder="<%=place_t%>" onfocus="<%if kkp = 1 then%>go_login()<%end if%><%if kkp = 3 then%>gogo()<%end if%>" style="text-align:left"></textarea>
			    <button type="button" class="btn gray small" onclick="gogo()" style="height:74px">등록하기</button>
			     	<div style="text-align:left;padding:20px;line-height:150%">
					<font color=red>
						* 방명록 작성 기회는 회원에게 한번만 주어집니다.<br />
						* 부적절한 방명록 작성 시 국민평가단 참여에 제한이 있을 수 있습니다.
					</font>
				</div>
                        </div>
                </div>
                </form>
          </section>

<iframe name="exec" id="exec" src="" style="display:none;width:600px;height:600px"></iframe>                
<!-- #include virtual="/cms/sub_bottom.asp" -->
