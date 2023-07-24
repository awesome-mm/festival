<!-- #include virtual="/cms/sub_top.asp" -->
<%
	now_p=r_call("now_p")
	if now_p = "" then
		sql_p = "select distinct a.c_puzzle_no "
		sql_p = sql_p & " ,(select count(c_no) as my_no from tbl_puzzle where c_year = 2021 and c_use = 0 and c_puzzle_no = a.c_puzzle_no ) as my_no "
		sql_p = sql_p & " from tbl_puzzle a where a.c_year = 2021 and a.c_use = 0 order by a.c_puzzle_no"
		Set rs=CreateObject("ADODB.RecordSet")
		rs.Open sql_p, dbCon, 1
		If rs.EOF Then 
			now_p = 1
		else
			now_p = 0
			Do Until rs.EOF 
				if rs("my_no") < 2500 and now_p = 0 then
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

 

                </section>

                 <section class="news_ticker">
                    <div class="inner">
                        <div id="add_value_div" style="padding-left:100px;padding-right:100px;padding-top:40px;">
                        	<%
                        	first_no = 0
                        	a1=0
                        	
                        	a_period = 10
                        	
                        	a2 = a1 + a_period
                        	sql_p = "select t.* from ( select ROW_NUMBER() OVER (ORDER BY c_no desc) rnum, c_content, c_member_id, c_date, c_no from tbl_puzzle where c_year = 2021 and c_use = 0 and c_order > 2  and c_no > "& first_no &" )t where  rnum > "& a1 &" and rnum <= "& a2
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
	
		sql_m = "select c_no from tbl_puzzle where c_use = 0 and c_year = 2021 and c_member_no = " & session("session_no")
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
