﻿<!-- #include virtual="/cms/sub_top.asp" -->
<%if session("session_no") = "" or isnull(session("session_no")) then
	url = replace(replace("/cms/process/myinvest/list.asp?c_show_no=72&c_check_no=64&c_relation=253&c_relation2=126","&","creesy"),"?","resoft")
%>
 	<script>
 		alert("로그인 후 이용가능 합니다.\n로그인으로 이동합니다.")
 		location.href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748"
 	</script>
<%else%>
 	 	<%
 	 	my_invest = 0
 	 	sql_m = "select sum(c_fund) as c_sum from tbl_fund where c_year = 2023 and c_member_no = "& session("session_no") &" and c_use = 0 "
 	 	Set rs_m=CreateObject("ADODB.RecordSet")
		rs_m.Open sql_m, dbCon, 1
		If rs_m.EOF Then 
			my_invest = 0
		else
			if isnull(rs_m("c_sum")) or rs_m("c_sum") = "" then
				c_sum = 0
			else
				c_sum = rs_m("c_sum")
			end if
		end if
		rs_m.Close
		Set rs_m=Nothing  
		

		if session("session_jang") = "" Or session("session_jang") = "1" Then
			t_fund = 20000000
		Else
			t_fund = 50000000
		End if


		if session("session_jang") = "1" then
			t_fund = 0
		end If


		if session("session_jang") = "2" Then

			if cint(session("session_team_type")) = 1  then
				t_fund = 50000000
			end If

			if cint(session("session_team_type")) = 2 Or cint(session("session_team_type")) = 3 Or cint(session("session_team_type")) = 4 or cint(session("session_team_type")) = 5 Or cint(session("session_team_type")) = 6 Or cint(session("session_team_type")) = 7  then
				t_fund = 100000000
			end If

			if cint(session("session_team_type")) = 8  then
				t_fund = 300000000
			end If

		end if
		
		t_fund = t_fund - c_sum

 	 	%>
 
	   <section>
                    <div class="sub_title my_invest_title">
                        <h2>투자내역</h2>

                    </div>

                    <div class="my_invest_information">
                        <div class="my_invest_wrap my_investment_details" style="width:100%">
                            <div class="my_invest2">
                                <div class="my_invest1">
                                    <img src="/images/icon_my_invest1.png">
                                </div>
                                <div class="mi_1">
                                    <span>나의 현재 투자 가능 금액</span><br>
                                    <span class="sp1"><%=formatnumber(t_fund,0)%></span>
                                    <span class="sp2">원</span>
                                </div>
                            </div>

                            <div class="my_invest4">
                                <div class="my_invest3">
                                    <img src="/images/icon_tot_invest.png">
                                </div>
                                <div class="mi_2">
                                    <span>나의 현재 총 투자 금액</span><br>
                                    <span class="sp1"><%=formatnumber(c_sum,0)%></span>
                                    <span class="sp2">원</span>
                                </div>

                            </div>

                        </div>

                    </div>

                </section>

                  <section>
                    <!-- <div class="inner"> -->

                    <div class="my_invest_info">
                        <div class="startup_box">
                        	<%
                        	
                        	sql_m = "select a.c_fund, b.c_thumbnail, c.c_team_name, b.c_item_name,a.c_team_no "
                        	sql_m = sql_m & ", (select sum(CAST(ISNULL(c_fund,0) AS BIGINT)) as c_sum from tbl_fund where c_year = 2023 and c_use = 0 and c_team_no = a.c_team_no ) as sumsum  "
                        	sql_m = sql_m & " from tbl_fund a "
                        	sql_m = sql_m & " inner join tbl_festival_data b on b.c_no = a.c_festival_no "
                        	sql_m = sql_m & " inner join tbl_team c on c.c_no = a.c_team_no "
                        	sql_m = sql_m & " where a.c_year = 2023 and a.c_member_no = "& session("session_no") &" and a.c_use = 0 "
				Set rs_m=CreateObject("ADODB.RecordSet")
				rs_m.Open sql_m, dbCon, 1
				If rs_m.EOF Then 
					 
				else
					iso = 0
				 	Do Until rs_m.EOF
						iso = iso + 1
                        	%>
							<%
							hkk = cdbl(rs_m("sumsum"))
								rate_t = ( hkk / 1000000000 ) * 100
								if rate_t > 100 then
									rate_t2 = 100
								else
									rate_t2 = rate_t
								end if

								if rate_t >= 0 AND rate_t < 25 then
									invest_grade = "iron"
									color_by_grade = "#615866"

								elseif rate_t >= 25 AND rate_t < 50 then
									invest_grade = "bronze"
									color_by_grade = "#B97A57"

								elseif rate_t >= 50 AND rate_t < 75 then
									invest_grade = "silver"
									color_by_grade = "#C3C3C3"

								elseif rate_t >= 75 AND rate_t < 100 then
									invest_grade = "gold"
									color_by_grade = "#FFC90E"

								elseif rate_t >= 100 then
									invest_grade = "platinum"
									color_by_grade = "#4DFEFF"

								end if
								%>
		                            <a href="view.asp?c_show_no=72&c_check_no=64&c_relation=253&c_relation2=126&c_team_no=<%=rs_m("c_team_no")%>">
		                                <div class="startup_info">
		                                    <div class="img-box" style="height:290px">
		                                        <img src="/upload/festival/<%=rs_m("c_thumbnail")%>" style="max-width:340px;max-height:290px" alt="이미지">
		                                    </div>
		                                    <div class="info-box">
		                                        <div class="subject">

		                                            <%=rs_m("c_team_name")%>

													<!--------------------------뱃지-------------------------------->
													<%if invest_grade <> "iron" then%>
														<%if invest_grade ="bronze" then%>
															<img src="/images/bronze.png" style="width:12px;height:19px;">

														<%elseif invest_grade ="silver" then%>
															<img src="/images/bronze.png" style="width:12px;height:19px;">
															<img src="/images/silver.png" style="width:12px;height:19px;">

														<%elseif invest_grade ="gold"   then%>
															<img src="/images/bronze.png" style="width:12px;height:19px;">
															<img src="/images/silver.png" style="width:12px;height:19px;">
															<img src="/images/gold.png" style="width:12px;height:19px;">

														<%elseif invest_grade ="platinum" then%>
															<img src="/images/bronze.png" style="width:12px;height:19px;">
															<img src="/images/silver.png" style="width:12px;height:19px;">
															<img src="/images/gold.png" style="width:12px;height:19px;">
															<img src="/images/platinum.png" style="width:12px;height:19px;">
														<%end if%>
													<%end if%>
													<!--------------------------뱃지-------------------------------->
		                                        </div>
		                                        <div class="content" >
		                                             <%=rs_m("c_item_name")%>
		                                        </div>
		
		                                        <div class="line">
		                                            <span class="gh_1" style="width:<%=rate_t2%>%; background:<%=color_by_grade%>"></span>
		                                        </div>
																						<!--
		                                        <div class="dal">
		                                            <div class="dal1">
		                                                달성률
		                                            </div>
		                                            <div class="dal2">
		                                            	 
		                                                <%=formatnumber(rate_t,2)%>
		                                                <span>
		                                                    %
		                                                </span>
		                                            </div>
		
		                                        </div>
		                                        <div class="mogip">
		                                            <div class="mogip1">
		                                                모집금액
		                                            </div>
		                                            <div class="mogip2">
		
		                                                <%=formatnumber(hkk,0)%>
		                                                <span>
		                                                    원
		                                                </span>
		                                            </div>
		                                        </div>
																						-->

																						<div class="funding_price"> 
																							<div class="dal"> 
																								<span><%=formatnumber(rate_t,2)*4%>% 달성</span>
																							</div> 
																							<div class="mogip"> 
																								<div class="mogip1"> 
																									모집금액 
																								</div> 
																								<div class="mogip2"> 
																									<%=formatnumber(hkk,0)%> 
																									<span> 
																										원 
																										</span> 
																								</div> 
																							</div> 
																						</div>
		
		                                    </div>
		                                    <div class="my_invest_amt">
		                                        <div class="my1">
		                                            <span>
		                                                나의 투자금액
		                                            </span>
		                                        </div>
		                                        <div class="my1">
		                                            <span>
		                                                <%=formatnumber(rs_m("c_fund"),0)%> 원
		                                            </span>
		                                        </div>
		                                    </div>
		                                </div>
		                            </a>
                            <%	
                            			if iso  = 4 then
                            				iso = 0
                            			end if
                            		rs_m.MoveNext
				   Loop
                            	end if
				rs_m.Close
				Set rs_m=Nothing  %>
                            	<% if iso < 4 then %>
                            		<%for i = iso + 1 to 4%>
                            		 <div class="startup_info"></div>
                            		<%next%>
                            	<%end if%> 
                       </div>
                     </div>
		</section>
<%end if%>
<!-- #include virtual="/cms/sub_bottom.asp" -->
