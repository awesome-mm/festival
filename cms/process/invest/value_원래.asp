<%
't_money : 총 투자 금액
'p_money : 지금 가능 총액
'p1_money : 현재팀에 대한 최소가능 금액
'p2_money : 현재팀에 대한 최대가능 금액

dim type_name(10)
type_name(1) = "도약(일반)"
type_name(2) = "도약(글로벌)"
type_name(3) = "성장1"
type_name(4) = "성장2"
type_name(5) = "성장3"
type_name(6) = "성장4"
type_name(7) = "성장5"
type_name(8) = "성장6"
type_name(9) = "성장(전문대)"
type_name(10) = "교육"



check_ok = 0

if session("session_no") <> "" or session("session_jang") = "2" Then

	if session("session_jang") = "" or session("session_jang") = "2" Then

		sql_s1 = "select c_no from tbl_puzzle where c_use = 0 and c_year = 2023 and c_member_no = "& session("session_no")
		'response.write sql_s1
		Set rs1=CreateObject("ADODB.RecordSet")
		rs1.Open sql_s1, dbCon, 1

		If rs1.EOF Then  
			check_ok = 1
		else
			sql_ss2 = "select c_fund,c_exp from tbl_fund where c_member_type = 1 and c_team_no = "&c_team_no&" and c_year = 2023 and c_use = 0 and c_member_no = "& session("session_no")
			Set rss2=CreateObject("ADODB.RecordSet")
			rss2.Open sql_ss2, dbCon, 1

			If rss2.EOF Then  
				check_ok = 3
				t_money = 20000000 '국민평가단
			
				sql_ss1 = "select sum(c_fund) as c_sum from tbl_fund where c_year = 2023 and c_use = 0 and c_member_no = "& session("session_no")
				Set rss1=CreateObject("ADODB.RecordSet")
				rss1.Open sql_ss1, dbCon, 1

				If rss1.EOF Then  
					t_sum = 0
				else
					t_sum = rss1("c_sum")
					if t_sum = "" or isnull(t_sum) then
						t_sum = 0
					end if
				end if
				rss1.Close
				Set rss1=Nothing
				p_money =  t_money - t_sum
				p1_money = 1000000
				p2_money = 5000000
				if p2_money > p_money then
					p2_money = p_money
				end if	
				'p2_money = 0
				if p2_money = 0 then
					check_ok = 4
				end if	
			else
				check_ok = 5
				past_fund = formatnumber(rss2("c_fund"),0)
				past_exp = rss2("c_exp")
			end if	

			rss2.Close
			Set rss2=Nothing

		end If

		rs1.Close
		Set rs1=Nothing

	end If


	if session("session_jang") = "1" then
		check_ok = 2	
	end If



	if session("session_jang") = "2" Then

		'도약은 교육에만 5000천만원 까지 1천만원 단위로
		if cint(session("session_team_type")) = 1  Then

			if rs("c_festival_type") = 8 then
				gogo = 1
			else
				check_ok = 6
				gog_text = type_name(8)
				gogo = 0
			end if	
			
		end If

		'성장1은 성장2에 5000까지만(1천단위) 도약에 5000까지만
		if cint(session("session_team_type")) = 2  Then

			if rs("c_festival_type") = 1 or  rs("c_festival_type") = 3 then
				gogo = 1
			else
				check_ok = 6
				gog_text = type_name(1) & ", " & type_name(3)
				gogo = 0
			end if	
			
		end If

		'성장2은 성장3에 5000까지만(1천단위) 도약에 5000까지만
		if cint(session("session_team_type")) = 3  Then

			if rs("c_festival_type") = 1 or  rs("c_festival_type") = 4 then
				gogo = 1
			else
				check_ok = 6
				gog_text = type_name(1) & ", " & type_name(4)
				gogo = 0
			end if		
			
		end If

		'성장3은 성장4에 5000까지만(1천단위) 도약에 5000까지만
		if cint(session("session_team_type")) = 4  Then

			if rs("c_festival_type") = 1 or  rs("c_festival_type") = 5 then
				gogo = 1
			else
				check_ok = 6
				gog_text = type_name(1) & ", " & type_name(5)
				gogo = 0
			end if	
			
		end If

		'성장4은 성장5에 5000까지만(1천단위) 도약에 5000까지만
		if cint(session("session_team_type")) = 5  Then

			if rs("c_festival_type") = 1 or  rs("c_festival_type") = 6 then
				gogo = 1
			else
				check_ok = 6
				gog_text = type_name(1) & ", " & type_name(6)
				gogo = 0
			end If
		
		end If

		'성장5은 성장6에 5000까지만(1천단위) 도약에 5000까지만
		if cint(session("session_team_type")) = 6  Then

			if rs("c_festival_type") = 1 or  rs("c_festival_type") = 7 then
				gogo = 1
			else
				check_ok = 6
				gog_text = type_name(1) & ", " & type_name(7)
				gogo = 0
			end if	
			
		end If

		'성장6은 성장1에 5000 만원 도약5000
		if cint(session("session_team_type")) = 7  Then

			if rs("c_festival_type") = 1 or  rs("c_festival_type") = 2 then
				gogo = 1
			else
				check_ok = 6
				gog_text = type_name(1) & ", " & type_name(2)
				gogo = 0
			end if		
			
		end If

		'교육은 성장1~6까지 5000만원까지
		if cint(session("session_team_type")) = 8  Then

			if rs("c_festival_type") = 2 or  rs("c_festival_type") = 3 or  rs("c_festival_type") = 4 or  rs("c_festival_type") = 5 or  rs("c_festival_type") = 6 or  rs("c_festival_type") = 7 then
				gogo = 1
			else
				check_ok = 6
				gog_text = type_name(2) & ", " & type_name(3) & ", " & type_name(4) & ", " & type_name(5) & ", " & type_name(6) & ", " & type_name(7)
				gogo = 0
			end if	
			
		end If



		if gogo = 1 Then

			sql_s1 = "select c_no from tbl_puzzle where c_use = 0 and c_year = 2023 and c_member_no = "& session("session_no")
			'response.write sql_s1
			Set rs2=CreateObject("ADODB.RecordSet")
			rs2.Open sql_s1, dbCon, 1

			If rs2.EOF Then  
				check_ok = 1
			else
					sql_ss2 = "select c_fund,c_exp from tbl_fund where c_member_type = 2 and c_team_no = "&c_team_no&" and c_year = 2023 and c_use = 0 and c_member_no = "& session("session_no")
					Set rss2=CreateObject("ADODB.RecordSet")
					rss2.Open sql_ss2, dbCon, 1

					If rss2.EOF Then 
						 
						check_ok = 3
						t_money = 50000000 '그룹평가단
						
						sql_ss1 = "select sum(c_fund) as c_sum from tbl_fund where c_team_type = "& rs("c_festival_type") &" and c_year = 2023 and c_use = 0 and c_member_no = "& session("session_no")
						Set rss1=CreateObject("ADODB.RecordSet")
						rss1.Open sql_ss1, dbCon, 1

						If rss1.EOF Then  
							t_sum = 0
						else
							t_sum = rss1("c_sum")
							if t_sum = "" or isnull(t_sum) then
								t_sum = 0
							end if
						end If

						rss1.Close
						Set rss1=Nothing

						p_money =  t_money - t_sum
						p1_money = 10000000
						p2_money = 50000000

						if p2_money > p_money then
							p2_money = p_money
						end if	

						'p2_money = 0
						money_info = " 현재 그룹에 "

						if p2_money = 0 then
							check_ok = 4
						end if	

					else
						check_ok = 5
						past_fund = formatnumber(rss2("c_fund"),0)
						past_exp = rss2("c_exp")
					end if	

					rss2.Close
					Set rss2=Nothing

			end If

			rs2.Close
			Set rs2=Nothing

		end If




	end If



end if
	
%>