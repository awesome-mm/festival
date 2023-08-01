<!-- #include virtual="/cms/sub_top.asp" -->
<%if session("session_no") = "" or isnull(session("session_no")) then
	url = replace(replace("/cms/process/myinvest/list.asp?c_show_no=72&c_check_no=64&c_relation=253&c_relation2=126","&","creesy"),"?","resoft")
%>
 	<script>
 		alert("로그인 후 이용가능 합니다.\n로그인으로 이동합니다.")
 		location.href="/cms/process/login/list.asp?c_show_no=76&c_check_no=67&c_relation=734&c_relation2=748"
 	</script>
<%else%>
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
 
	   <section>
                    <div class="sub_title my_invest_title">
                        <h2>투자내역</h2>

                    </div>

                    <div class="my_invest_information">
                        <div class="my_invest_wrap my_investment_details" style="width:100%">
                            <div class="my_invest2">
                                <div class="my_invest1">
                                    <img src="/images/icon_money.png">
                                </div>
                                <div class="mi_1">
                                    <span>나의 현재 투자 가능 금액</span><br>
                                    <span class="sp1"><%=formatnumber(t_fund,0)%></span>
                                    <span class="sp2">원</span>
                                </div>
                            </div>

                            <div class="my_invest4">
                                <div class="my_invest3">
                                    <img src="/images/icon_team_money.png">
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
									color_by_grade = "gradient-iron"

								elseif rate_t >= 25 AND rate_t < 50 then
									invest_grade = "bronze"
									color_by_grade = "gradient-bronze"

								elseif rate_t >= 50 AND rate_t < 75 then
									invest_grade = "silver"
									color_by_grade = "gradient-silver"

								elseif rate_t >= 75 AND rate_t < 100 then
									invest_grade = "gold"
									color_by_grade = "gradient-gold"

								elseif rate_t >= 100 then
									invest_grade = "platinum"
									color_by_grade = "gradient-platinum"

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

													<!--------------------------뱃지S-------------------------------->
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
													<!--------------------------뱃지E-------------------------------->
												</div>
												<div class="content" >
														<%=rs_m("c_item_name")%>
												</div>
																						<div class="list_range_bar_rable">
																							<div class="label label1">
																								<span>Seed<span>
																							</div>
																							<div class="label label2">
																								<span>Series A<span>
																							</div>
																							<div class="label label3" >
																								<span>Series B<span>
																							</div>
																							<div class="label label4" >
																								<span>Series C<span>
																							</div>
																							<div class="label label5" >
																								<span>Pre<span><br>
																								<span>Unicorn<span>
																							</div>
																						</div>
		
																						<div class="list_range range_bar">
																							<div class="range_bar_width gauge_bar" style="width:<%=rate_t2%>%;">
																								<div class="range_bar_ani <%=color_by_grade%>" id="abbb"></div>
																							</div>
																							<div class="info_item_line range_line_flex">
																								<span class="range_line"></span>
																								<span class="range_line"></span>
																								<span class="range_line"></span>
																								<span class="range_line"></span>
																								<span class="range_line"></span>
																							</div>
																						</div>

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
