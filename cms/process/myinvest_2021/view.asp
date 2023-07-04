<!-- #include virtual="/cms/sub_top.asp" -->
<%
	s_date = "2021-08-04 00:00"
	e_date = "2021-08-15 23:59"
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
		alert("잘못 된 접1속입니다")
		location.href= "/"
	</script>
<%	
	else
	sql_d = " select a.c_festival_type, a.c_no, b.c_no as c_festival_no, a.c_team_name, b.c_member_name, b.c_item_name,b.c_main_type,c_main, b.c_information "
	sql_d = sql_d & " ,(select sum(CAST(ISNULL(c_fund,0) AS BIGINT)) as c_sum from tbl_fund where c_team_no = a.c_no and c_festival_no = b.c_no and c_use = 0 ) as c_sum "
 	sql_d = sql_d & "  from tbl_team a inner join tbl_festival_data b on b.c_team_no = a.c_no and b.c_use = 0 and b.c_year = 2021 "
	sql_d = sql_d & " where a.c_no = "& c_team_no &" and a.c_use = 0 and a.c_project_no in (5,6) and a.c_festival = 1 "  
	'response.write sql_d
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
﻿<!-- #include virtual="/cms/process/invest/value.asp" -->
<%

			if isnull(rs("c_sum")) then
				c_sum = 0
				c_sum_rate = 0
				c_sum_rate_bar = 0
			else			
				c_sum = formatnumber(rs("c_sum"),0)
				hkk = cdbl(rs("c_sum"))
				c_sum_rate = formatnumber(hkk / 50000000 * 100)
				c_sum_rate_bar = fix(hkk / 50000000 * 100)
				if c_sum_rate_bar > 100 then
					c_sum_rate_bar = 100
				end if
			end if
%>

<form name="kdb">
	  <div class="wrapper">
	  	 <section style="">
                    <div class="title3">
                        <div>
                            <div class="diagonal"></div>
                        </div>
                        <div>
                            <span class="co666">나의</span>
                            <span class="co590">투자내역</span>
                        </div>
                    </div>
                </section>
                <section class="sub_title" >
                    <div class="title_wrap"  >
                        <div class="title1"  style="margin: 5rem auto 0rem;max-width:60%;line-height:150%;word-break:keep-all">
                           <font color=#FF9017>"</font> <%=rs("c_item_name")%> <font color=#FF9017>"</font>			
                            
                        </div>
                        <div class="title2">
                            <%=rs("c_team_name")%>
                        </div>
                    </div>
                </section>

                <section class="sub_intro">
                    <div class="ytp_wrap2">
                    		<%if rs("c_main_type") = 0 then%>
                            		<img src="/upload/festival/<%=rs("c_main")%>" style="width:100%;max-width:943px;max-height:529px">
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
                            참가팀 정보
                            <span class="team_name">
                                <%=rs("c_team_name")%>
                            </span>
                        </div>

                        <div class="amt_txt">
                            모집금액
                        </div >
                        <div class="amt1">
                            <%=c_sum%>
                            <span>원</span>
                        </div>
                        <div class="achiev_txt">
                            달성률
                        </div>
                        <div class="achiev">
                            <span class="achiev_no"><%=c_sum_rate%></span>
                            <span class="achive_pro">%</span>
                        </div>
                        <div class="line2">
                            <span class="gh_2" style="width:<%=c_sum_rate_bar%>%"></span>
                        </div>
                        <div class="goal_amt">
                            <span>목표금액 50,000,000원</span>
                        </div>
                        <div class="end">
                            <p>마감일</p>
                        </div>
                        <div class="end1">
                            <%if now() < cdate(s_date) then%>
                            	<span class="sp1">대기중</span>
                            <%else%>
	                            <%if now() > cdate(e_date) then%>
	                            	<span class="sp1">투자 종료</span>
	                            <%else%>
	                            	<span class="sp1">투자 진행중</span>
	                            <%end if%>
                            <%end if%>
                            <span class="sp2">
                                2021-08-15 24:00 까지
                            </span>
                        </div>
                        <div class="tag">
                            <span>
                                
                            </span>
                        </div>
                        <div class="fd_end">
                            <a href="#">
                                <div class="fd_end_bt" style="width:160px">
                            <%if now() < cdate(s_date) then%>
                            	<span>펀딩대기</span>
                            <%else%>
	                            <%if now() > cdate(e_date) then%>
	                            	<span>펀딩마감</span>
	                            <%else%>
	                            	<span>펀딩진행</span>
	                            <%end if%>
                            <%end if%>
                                    
                                </div>
                            </a>
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

                            <div class="like_bt">
                                <span id="heart">
                                    <a onclick='setCookie("like_<%=c_team_no%>","ok", 30);'><i id="c_heart" class="fa fa-heart-o"></i></a>
                                </span>
                            </div>
<script>
	 
	if(getCookie("like_<%=c_team_no%>") == "ok"){
		document.getElementById("heart").innerHTML = '<a onclick="setCookie(\'like_<%=c_team_no%>\',\'no\', 30);"><i id="c_heart" class="fa fa-heart"></i></a>'
	}else{
		document.getElementById("heart").innerHTML = '<a onclick="setCookie(\'like_<%=c_team_no%>\',\'ok\', 30);"><i id="c_heart" class="fa fa-heart-o"></i></a>'
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
  

                            <div class="share_bt" style="width:280px;vertical-align:middle">
                                  <span >
                                <a href="" onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;">
                                <img src="/images/sns1.gif" title="facebook" class="sharebtn_custom" style="width: 32px;">
                                </a>
                                <a href="" onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;">
                                <img src="/images/sns2.gif" title="twitter" class="sharebtn_custom" style="width: 32px;">
                                </a> 
                                <a href="" onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;">
                                <img src="/images/sns3.gif" title="KAKAO" class="sharebtn_custom" style="width: 32px;">
                                </a> 
                                <a href="" onclick="window.open(url_combine_naver, '', 'scrollbars=no, width=600, height=600'); return false;">
                                <img src="/images/sns4.gif" title="Naver" class="sharebtn_custom" style="width: 32px;">
                                </a>
                                <a href="" onclick="window.open(url_combine_band, '', 'scrollbars=no, width=584, height=635'); return false;">
                                <img src="/images/sns5.gif" title="band" class="sharebtn_custom" style="width: 32px;">
                                </a>
                              </span>
                            </div>
                        </div>
                    </div>

                    <!-- </div> -->

                    <!-- </div> -->

                </section>

                <section>
                <%if isnull(session("session_no")) or  session("session_no") = "" then
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
				            학생창업유망팀 300 페스티벌 <font color=red>참가팀의 팀원은 모의 투자에 참여할 수 없습니다</font>..<br>
		                            주변에 많이 알려 많은 투자를 받을 수 있게 응원해 주세요.!
		                        </div>
	                    	</div>
                 	<%end if%>
                 	<%if check_ok = 1 then%>
                 		<div class="login_bn">
		                        <div class="login_bn_txt">
		
		                            <font color=red>방명록 작성</font>을 해야만 <font color=red>투자 포인트</font>를 받을 수 있습니다.<br>
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
                 	<%if check_ok = 3 then%>
                 		<div class="my_invest">

		                        <div class="my_invest_wrap">
		
		                            <div class="my_invest2">
		                                <div class="my_invest1">
		                                    <img src="/images/icon_my_invest1.png">
		                                </div>
		                                <div class="mi_1">
		                                    <span>나의 <%=money_info%> 투자 가능 금액</span><br>
		                                    <span class="sp1"><%=formatnumber(p_money,0)%></span>
		                                    <span class="sp2">원</span>
		                                </div>
		                            </div>
		
		                            <div class="my_invest4">
		                                <div class="my_invest3">
		                                    <img src="/images/icon_my_invest2.png">
		                                </div>
		                                <div>
		                                    <span><%=rs("c_team_name")%> 팀에 투자 가능 금액</span><br>
		                                    <span class="sp1"><%=formatnumber(p2_money,0)%></span>
		                                    <span class="sp2">원</span>
		                                </div>
		
		                            </div>
		
		                        </div>
					<input name="c_team_no" value="<%=c_team_no%>" type="hidden">
					<input name="c_festival_no" value="<%=rs("c_festival_no")%>" type="hidden">
					<input name="c_year" value="2021" type="hidden">
					<input name="c_team_type" value="<%=rs("c_festival_type")%>" type="hidden">
					<script>
						function fund1(){
							if(document.kdb.c_exp.value == ""){
								alert("이 팀을 위해서 응원글을 꼭 써 주세요.")
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
		                        <div class="invest_selector">
		                            <span class="sp0">투자희망금액</span>
		                            <select class="is_select" name="c_fund">
		                                <%for i = p1_money to p2_money step p1_money%>
		                                <option value="<%=i%>" <%if i = p1_money then%>selected<%end if%>>
		                                    <%=formatnumber(i,0)%>원
		                                </option>
		                                <%next%>
		                            </select>
		                        </div>
		
		
		                        <div class="invest_go">
		                            <div class="cheering">
		                                <span>응원하기</span>
		
		                            </div>
		
		                            <input type="text" name="c_exp" placeholder="" onfocus="">
		                            <input href="#none" type="button" value="투자 하기" onclick="<%if now() > cdate(s_date) and now() < cdate(e_date) then%>fund1()<%else%>alert('투자가능 기간은 <%=s_date%> ~ <%=e_date%>입니다.')<%end if%>" ></input>
		                            <!--<a href="#none" onclick="fund1()">.</a>-->
		                        </div>
		
		                    </div>
		                    <iframe name="exec" id="exec" src="" width="600px" height="600px" style="display:none"></iframe>
                 	<%end if%>
                 	<%if check_ok = 4 then%>
                 		<div class="login_bn">
		                        <div class="login_bn_txt">
		
		                            회원님은 이미 <font color=red>투자금액을 소진</font>하여 더 이상 투자가 불가능 합니다.<br>
		                            그동안 투자에 참여해 주셔서 감사합니다.
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
		                        <div class="login_bn_txt" style="padding:30px">
		
		                            회원님은 이 팀에 <font color=red> <%=past_fund%></font>원을 이미 투자하였습니다..<br>
		                            응원글<br />
		                            <span style="font-size:16px">
		                            "<%=past_exp%>"
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
		                        <div class="login_bn_txt" style="padding:30px">
		
		                            회원님은 참가팀의 팀장이기 떄문에 <font color=red>평가 대상 팀만 모의투자</font>가 가능합니다.<br>
		                            모의 투자 가능한 그룹은 "<font color=red> <%=gog_text%> </font>" 입니다
		                        </div>
		                        <div class="login_box">
		                            <div class="login_bt">
		                                <a href="/cms/process/invest/list.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903" >
		                                   팀 목록 가기
		                                </a>
		                            </div>
		                        </div>
		                 </div>
                 	<%end if%>
                 <%end if%>   
                </section>

                <section class="tab2">
                    <div class="line3"></div>
                    <div class="tab_menu2">
                        <ul class="tab2">
                            <li data-id="con1"	 class="on">
                                <a href="#none">Team Story</a>
                            </li>

                            <li data-id="con2">
                                <a href="#none">국민평가의견</a>

                            </li>
                            <li data-id="con3">
                                <a href="#none">상호평가의견</a>

                            </li>
                            <li data-id="con4">
                                <a href="#none">전문가평가의견</a>
                            </li>
                        </ul>

                        <div id="con1" class="conBox1 on"">
                          
                            <div   style="text-align:left;width:100%;line-height:130%;padding-top:50px;padding-bottom:50px;">
                            	 <center>
	                            <div   style="text-align:left;width:90%;max-width:1100px;line-height:130%;padding:30px;background:#ffffff">
	                                <p>
	                                <%if c_team_no = "2937" then%>
	                                	<center>
	                                	비공개
	                                	</center>
	                                <%else%>
	                                <%=rs("c_information")%>	
	                                <%end if%>	
	                                </p>
	                            </div>
	                           </center>
                            </div>
                        </div>
                        <div id="con2" class="conBox1">
                        	<%
                        	fund_number = 0
                        	fund_price = 0
                        	sql_d = "select count(c_no) as f_n, sum(CAST(ISNULL(c_fund,0) AS BIGINT)) as f_p from tbl_fund where c_year = 2021 and c_team_no = "& c_team_no &" and c_use = 0 and c_member_type = 1"
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
                            </div>
                            <div class="con2_reply">
                                <table>
                                    <tbody>
				 <%
                        	sql_d = "select top(5) a.c_date,a.c_exp, b.c_id from tbl_fund a inner join tbl_member b on b.c_no = a.c_member_no and c_use = 0 where a.c_year = 2021 and a.c_team_no = "& c_team_no &" and a.c_use = 0 and a.c_member_type = 1 order by newid()"
                        	Set rs_d=CreateObject("ADODB.RecordSet")
				rs_d.Open sql_d, dbCon, 1
				If rs_d.EOF Then  
				else
				 Do Until rs_d.EOF
				 %>
                                        <tr class="reply_row">
                                            <td class="reply_icon" rowspan="2">
                                                <img src="/images/reply_icon_pro.png">
                                            </td>
                                            <td class="txt_al">
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
                                            <td class="txt_al">
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
				<%
                        	fund_number = 0
                        	fund_price = 0
                        	sql_d = "select count(c_no) as f_n, sum(c_fund) as f_p from tbl_fund where c_year = 2021 and c_team_no = "& c_team_no &" and c_use = 0 and c_member_type = 2"
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
                                    <span class="con2_act">개</span>
                                </span>
                                가 있습니다.
                            </div>
                            <div class="con2_reply">
                               	 
                                <table>
                                    <tbody>
					
                                        <%
	                        	sql_d = "select top(5) a.c_date,a.c_exp, b.c_id from tbl_fund a inner join tbl_member b on b.c_no = a.c_member_no and c_use = 0 where a.c_year = 2021 and a.c_team_no = "& c_team_no &" and a.c_use = 0 and a.c_member_type = 2 order by newid()"
	                        	Set rs_d=CreateObject("ADODB.RecordSet")
					rs_d.Open sql_d, dbCon, 1
					If rs_d.EOF Then  
					else
					 Do Until rs_d.EOF
					 %>
	                                        <tr class="reply_row">
	                                            <td class="reply_icon" rowspan="2">
	                                                <img src="/images/reply_icon_pro.png">
	                                            </td>
	                                            <td class="txt_al">
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
	                                            <td class="txt_al">
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

                                        <tr class="reply_row">
                                            <td class="reply_icon" rowspan="2">
                                                <img src="/images/reply_icon.png">
                                            </td>
                                            <td class="txt_al">
                                                <span class="reply_name">최**</span>
                                                <span class="reply_date2">2021-08-01
                                                </span>

                                            </td>
                                            -->
                                            <!-- <td rowspan="2" class="reply_date"> 2021-08-01 </td> -->
                                         <!--
                                        </tr>
                                        <tr>
                                            <td class="txt_al">
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
                        	sql_d = "select count(c_no) as f_n, sum(c_fund) as f_p from tbl_fund where c_year = 2021 and c_team_no = "& c_team_no &" and c_use = 0 and c_member_type = 3"
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
	                        	sql_d = "select top(5) a.c_date,a.c_exp, b.c_name from tbl_fund a inner join tbl_temp_tester b on b.c_no = a.c_member_no  where a.c_year = 2021 and a.c_team_no = "& c_team_no &" and a.c_use = 0 and a.c_member_type = 3 order by newid()"
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
	                                                <img src="/images/reply_icon_pro.png">
	                                            </td>
	                                            <td class="txt_al">
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
	                                            <td class="txt_al">
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
                                                <img src="/images/reply_icon.png">
                                            </td>
                                            <td class="txt_al">
                                                <span class="reply_name">최**</span>
                                                <span class="reply_date2">2021-08-01
                                                </span>

                                            </td>
                                            -->
                                            <!-- <td rowspan="2" class="reply_date"> 2021-08-01 </td> -->
                                        <!--
                                        </tr>
                                        <tr>
                                            <td class="txt_al">
                                                감사합니다. 실전창업6팀도 열심히 해서 좋은 결과 가져오길 바랍니다.
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
				-->
                            </div>
                        </div>
			<div class="btn_box mgt70">
                                    <div class="btn_box_txt">
                                        <a href="list.asp?<%=t_para%>">
                                           나의 투자내역 가기
                                        </a>
                                    </div>
                                
                                </div>
                    </div>

                </section>

                <!-- <section class="tab2"> <div class="a"> </div> </section> -->

            </div>
</form>
<%
	end if
	rs.Close
	Set rs=Nothing
	end if
%>
<!-- #include virtual="/cms/sub_bottom.asp" -->
