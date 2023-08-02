<%
	c_home = 1
	c_show_no = r_call("c_show_no")
	if c_show_no = "" then
		c_show_no = 0
	else
		c_show_no = cint(c_show_no)
	end if
	c_check_no = r_call("c_check_no")
	if c_check_no = "" then
		c_check_no = 0
	else
		c_check_no = cint(c_check_no)
	end If



	sUsrAgent = UCase(Request.ServerVariables("HTTP_USER_AGENT"))

%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
		    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
				<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
				<meta name="format-detection" content="telephone=no">

        <title><%=homepage_name%></title>
        <link type="text/css" rel="stylesheet" href="/css/default.css"/>
        <!--<link type="text/css" rel="stylesheet" href="/css/swiper.css"/>-->

        <link type="text/css" rel="stylesheet" href="/css/swiper-bundle.min.css"/>
        <link type="text/css" rel="stylesheet" href="/css/style.css"/>
        <link type="text/css" rel="stylesheet" href="/css/responsive.css"/>
        <link type="text/css" rel="stylesheet" href="/css/magnific-popup.css"/>
				<link type="text/css" rel="stylesheet" href="/css/font.css"/>
				<link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/js/jquery-ui-1.31.2.js"></script>




<% If InStr(sUsrAgent, "ANDROID") > 0 or InStr(sUsrAgent, "IPAD") Or InStr(sUsrAgent, "IPHONE") Then %>


	<!-- AceCounter Mobile WebSite Gathering Script V.8.0.2019080601 -->
	<script language='javascript'>
		var _AceGID=(function(){var Inf=['festival.u300.kr','festival.u300.kr','AX2A93847','AM','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;if(_CI.join('.').indexOf(Inf[3])<0){ _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
		var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src='https:'+'//cr.acecounter.com/Mobile/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
	</script>
	<!-- AceCounter Mobile Gathering Script End -->


<%else%>


	<!-- AceCounter Log Gathering Script V.8.0.AMZ2019080601 -->
	<script language='javascript'>
		var _AceGID=(function(){var Inf=['gtb2.acecounter.com','8080','BI4A46095093741','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src ="https://"+ Inf[0] +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
		var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src='https:'+'//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
	</script>
	<!-- AceCounter Log Gathering Script End -->

<% End If %>





	
	
	<!-- Global site tag (gtag.js) - Google Ads: 325730501 -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=AW-325730501"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'AW-325730501');
	</script>




	<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/kas/static/kp.js"></script>
	<script type="text/javascript">
		  kakaoPixel('1479756979123012197').pageView('메인 [공통]');
	</script>






    </head>

    <body>
        <div class="container">
            <header id="headerArea">
                <div class="header__wrap">
                    <h1 class="logo">
                        <a href="/">
                            <div class="logo-txt">
                                 2023 학생 창업유망팀 300
                            </div>
                            <div class="logo-txt2">
                                네트워킹 데이
                            </div>
                        </a>
                    </h1>
                    <h2 class="hide">대메뉴</h2>
                    <nav class="gnb" id="gnb">
                        <ul class="main-menu dropdownmenu">
                        <%
				dim llop(7)
				dim llop_name(7)
				dim llop_sub_count(7)
				dim llop_sub(7,4,7)
				llop(1) = "/cms/show.asp?c_show_no=68&c_check_no=63&c_relation=217&c_relation2=359"
				llop(2) = "/cms/show.asp?c_show_no=70&c_check_no=64&c_relation=541&c_relation2=444"
				llop(3) = "/cms/process/event/list.asp?c_show_no=73&c_check_no=65&c_relation=428&c_relation2=565"
				llop(4) = "/cms/process/notice/list.asp?c_show_no=74&c_check_no=66&c_relation=792&c_relation2=521"
				llop(5) = "/cms/process/invest_2022/list.asp?c_show_no=170&c_check_no=108&c_relation=1022&c_relation2=1040"
				'llop(5) = "/cms/process/invest_2021/list.asp?c_show_no=109&c_check_no=108&c_relation=967&c_relation2=985"


				 
				 
				sql1 = "select c_name, c_no from tbl_menu where c_home = "& c_home &" and  c_use = 0 and c_up_no = 0 and c_order < 6 order by c_order asc "

				
				'Response.write sql1


				Set rs_mwnu1=CreateObject("ADODB.RecordSet")
				rs_mwnu1.Open sql1, dbCon, 1
				If rs_mwnu1.EOF Then 
				Else 	
				rt = 0
				Do Until rs_mwnu1.EOF  	
					rt = rt + 1
					llop_name(rt) = rs_mwnu1("c_name")
			%>
                            <li class="menu-item" >
                                <a href="<%=llop(rt)%>" <%if c_check_no = rs_mwnu1("c_no") then%>class="on"<%end if%>><%=rs_mwnu1("c_name")%></a>
                                <ul class="menu-sub">
                                	<%
					sql2 = "select a.* "
					sql2 = sql2 & ", ( select c_no   from tbl_menu where a.c_no = c_up_no and c_use = 0 and c_order = 1 ) as d_no  "
					sql2 = sql2 & ", ( select c_relation   from tbl_menu where a.c_no = c_up_no and c_use = 0 and c_order = 1 ) as d_relation "
					sql2 = sql2 & ", ( select c_relation2   from tbl_menu where a.c_no = c_up_no and c_use = 0 and c_order = 1 ) as d_relation2 "
					sql2 = sql2 & ", ( select c_type   from tbl_menu where a.c_no = c_up_no and c_use = 0 and c_order = 1 ) as d_type "
					sql2 = sql2 & ", ( select c_content   from tbl_menu where a.c_no = c_up_no and c_use = 0 and c_order = 1 ) as d_content "
					sql2 = sql2 & " from tbl_menu a where a.c_home = "& c_home &" and  a.c_use = 0 and a.c_up_no = "& rs_mwnu1("c_no") &" order by a.c_order asc "
					Set rs_mwnu2=CreateObject("ADODB.RecordSet")
					rs_mwnu2.Open sql2, dbCon, 1
					If rs_mwnu2.EOF Then 
					Else 	
					ck_p = 0
					Do Until rs_mwnu2.EOF  	
						llop_sub_count(rt) = llop_sub_count(rt) + 1
						ck_p = ck_p + 1					
						g_no =  rs_mwnu2("c_no")
						g_relation =  rs_mwnu2("c_relation")
						g_relation2 =  rs_mwnu2("c_relation2")
						g_up_no =  rs_mwnu2("c_up_no")
						g_type =  rs_mwnu2("c_type")
						g_content =  rs_mwnu2("c_content")
						
						if g_type = 0 then
							g_no =  rs_mwnu2("d_no")
							g_relation =  rs_mwnu2("d_relation")
							g_relation2 =  rs_mwnu2("d_relation2")
							g_up_no =  rs_mwnu2("c_no")
							g_type =  rs_mwnu2("d_type")
							g_content =  rs_mwnu2("d_content")
						end If

						'Response.write g_type & "<br>"


						if g_type = 1 then
							go_link = "/cms/show.asp?c_show_no=" & g_no & "&c_check_no=" & g_up_no & "&c_relation=" & g_relation & "&c_relation2=" &  g_relation2
							go_target = "_self"
						end if
						if g_type = 2 then
							go_link = "/cms/process/" & g_content & "/list.asp?c_show_no=" & g_no & "&c_check_no=" & g_up_no & "&c_relation=" & g_relation & "&c_relation2=" &  g_relation2
							go_target = "_self"
						end if
						if g_type = 3 then
							go_link = g_content
							go_target = "_self"
						end if
						if g_type = 4 then
							go_link = g_content
							go_target = "_blank"
						end if
						llop_sub(rt,1,ck_p) = go_link
						llop_sub(rt,2,ck_p) = go_target
						llop_sub(rt,3,ck_p) = rs_mwnu2("c_name")

						If replace(rs_mwnu2("c_name"),"<br>","")="2022년" Then
						
							go_link  = "/cms/process/invest_2022/list.asp?c_show_no=170&c_check_no=108&c_relation=1022&c_relation2=1040"

						End if



						If replace(rs_mwnu2("c_name"),"<br>","")="2021년" Then
						
							go_link  = "/cms/process/invest_2021/list.asp?c_show_no=109&c_check_no=108&c_relation=967&c_relation2=985" 

						End if
						
					%>
	                                    <li>
	                                        <a href="<%=go_link%>" target="<%=go_target%>" <%if c_show_no = rs_mwnu2("c_no") then%>style="color:#2D41BA"<%end if%>><%=replace(rs_mwnu2("c_name"),"<br>","")%></a>
	                                    </li>
	                                <%
	                        		rs_mwnu2.MoveNext
		        		Loop
				      	End If
					rs_mwnu2.Close
					Set rs_mwnu2=Nothing
		                        %> 
                                </ul>
                            </li>
                        <%
                        	rs_mwnu1.MoveNext
	        		Loop
			      	End If
				rs_mwnu1.Close
				Set rs_mwnu1=Nothing
                        %> 
                        </ul>
                    </nav>

                    <div class="header__menu">
                        <a class="home" href="/default_sub.asp">
                            <div class="home1"></div>
                        </a>
                        <div class="home2"></div>
					<%if session("session_no") = "" then%>
                        <a href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748">
														로그인
                            <div class="login"></div>
                        </a>

                        <a href="/cms/process/membership/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677">
														회원가입
                            <!--<div class="membership"></div>-->
                        </a>
                        <%else%>
                        
                            <div class="login" style="background:none;text-align:center;top:5px">
                            	<a class="member " href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748" title="정보보기"><%=session("session_name")%></a> 
                            	<!--<a href="/cms/process/login/logout.asp" title="로그아웃" style="font-size:10px;font-weight:600">로그아웃</a>-->
                            	<a href="/cms/process/login/logout.asp" title="로그아웃" style="">로그아웃</a>
														</div>

                        <a href="/cms/process/membership2/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677" title="정보변경">
                            <div class="membership" style="background:none;text-align:center;top:5px">정보변경</div>
                        </a>

						
								<%
								
								sql_m = "select (select c_content from tbl_puzzle where c_member_no = "& session("session_no") &" and c_year=2023)as check_guestbook, sum(c_fund) as c_sum from tbl_fund where c_year = 2023 and c_member_no = "& session("session_no") &" and c_use = 0 "
								Set rs_m=CreateObject("ADODB.RecordSet")
								rs_m.Open sql_m, dbCon, 1
								
								If rs_m.EOF Then
								else
									if isnull(rs_m("c_sum")) or rs_m("c_sum") = "" then
										c_sum = 0
									else
										c_sum = rs_m("c_sum")
									end if
								end if

								if session("session_jang") = "" Or session("session_jang") = "1" Or session("session_jang") = "2" Then
									if isnull(rs_m("check_guestbook")) or rs_m("check_guestbook") = "" then
										t_fund = 0
									else
										t_fund = 20000000
									end if
								End if

								rs_m.Close
								Set rs_m=Nothing  


								t_fund = t_fund - c_sum
								%>

												<div id="side_bar" class="side_bar">
													<div class="side_top">
														<p>나의 투자현황</p>
													</div>
													<div class="side_content">
														<div>
															<p>총 투자금액</p>
															<span class="total_side_invest"><%=c_sum%></span>
														</div>
														<div>
															<p>잔여금액</p>
															<span class="total_side_remaining"><%=t_fund%></span>
														</div>
													</div>
													<div class="btn_sideBar">
														<a class="side_up" href="#">
															<i class="fa-solid fa-caret-up "></i>
														</a>
														<a class="side_down" href="#">
															<i class="fa-solid fa-caret-down "></i>
														</a>
													</div>
												</div>
						<%end if%>
                    </div>

                    <a href="javascript:mobileMenuOpen()" class="mobile-btn mobile"></a>

                </div>
            </header>

            <nav class="mobile-menu">
                <div class="mobile-menu-wrap">

                    <a href="javascript:mobileMenuClose()" class="close-btn"></a>

                    <ul class="depth1">
                       <%for i = 1 to 4%>
                        <li>
                            <a href="#none" class="depth1-txt toggle"><%=llop_name(i)%></a>
                            <ul class="depth2">
                            	<%for j = 1 to llop_sub_count(i)%>
                                <li>
                                    <a href="<%=llop_sub(i,1,j)%>" target="<%=llop_sub(i,2,j)%>"><%=llop_sub(i,3,j)%></a>
                                </li>
                                <%next%>
                            </ul>
                        </li>
                        <%next%>
                        
                    </ul>

                    <div class="mobile__menu__info">
										<!--
                        <div class="menu-box">
                            <a href="/default_sub.asp">홈</a>
                        </div>
										-->
                        <%if session("session_no") = "" then%>
                        <div class="menu-box">
                            <a href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748">로그인</a>
                        </div>
                        <div class="menu-box">
                            <a href="/cms/process/membership/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677">회원가입</a>
                        </div>
                        <%else%>
                        <div class="menu-box">
                            <a href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748" title="정보보기"><%=session("session_name")%></a> 
                        </div>
                        <div class="menu-box">
                            <a href="/cms/process/membership2/list.asp?c_show_no=75&c_check_no=67&c_relation=828&c_relation2=677">정보변경</a>
                        </div>
                        <%end if%>
                    </div>
                </div>
            </nav>
