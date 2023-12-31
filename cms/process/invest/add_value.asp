﻿<!-- #include virtual="/include/db/db_connect.asp" --> 
<% 
 	c_festival_type = r_call("c_festival_type")
 	s_text = r_call("s_text")
%>

<script> 
    var now_value = 0;
    var c_no = [];
    var c_item_name = [];
    var c_team_name = [];
    var c_thumbnail = [];
    var c_sum = [];
    var c_sum_rate = [];
    var c_sum_rate2 = [];

	/*뱃지배열 추가*/
	var invest_badge = [];

	/*팀별등급배열 추가*/
	var invest_grade = [];

	/*그래프바 속성배열*/
	var color_by_grade = [];
<%	

 	sql_d = "select b.c_item_name, a.c_team_name, b.c_thumbnail, a.c_no "
 	sql_d = sql_d & " ,(select sum(CAST(ISNULL(c_fund,0) AS BIGINT)) as c_sum from tbl_fund where c_team_no = a.c_no and c_festival_no = b.c_no and c_use = 0 ) as c_sum "
 	sql_d = sql_d & " from tbl_team a "
	sql_d = sql_d & " inner join tbl_festival_data b on b.c_team_no = a.c_no and b.c_year = 2023 and b.c_use = 0 "
 	sql_d = sql_d & " where a.c_project_no in (10,11,12,13,14) and a.c_use = 0 and a.c_festival = 1 and b.c_item_name <> '' "

 	if c_festival_type <> "" then
	 	sql_d = sql_d & " and a.c_festival_type = "& c_festival_type & " " 
	end if 

	if s_text <> "" then
	 	sql_d = sql_d & " and ( b.c_member_name like '%"& s_text & "%' or b.c_item_name like '%"& s_text & "%' or a.c_team_name like '%"& s_text & "%' ) " 
	end if 


	sql_d = sql_d & " order by newid() "
	
	// 'response.write sql_d


	Set rs=CreateObject("ADODB.RecordSet")
 

	rs.Open sql_d, dbCon, 1
	ai = 0 
	If rs.EOF Then  
        Else
        	 Do Until rs.EOF
			ai = ai + 1
			if isnull(rs("c_sum")) then
				c_sum = 0
				c_sum_rate = 0
				c_sum_rate2 = 0
			else			
				c_sum = formatnumber(rs("c_sum"),0)
				hkk = cdbl(rs("c_sum"))
				c_sum_rate = formatnumber(hkk / 1000000000 * 100)
				if c_sum_rate > 100 then
					c_sum_rate2 = 100
				else
					c_sum_rate2 = c_sum_rate
				end if
			end if
			%>
			
				c_no[<%=ai%>] = '<%=rs("c_no")%>'
				c_item_name[<%=ai%>] = '<%=replace(rs("c_item_name"),"'","""")%>'
				c_team_name[<%=ai%>] = '<%=replace(rs("c_team_name"),"'","""")%>'
				c_thumbnail[<%=ai%>] = '<%=replace(rs("c_thumbnail"),"'","""")%>'
				c_sum[<%=ai%>] = '<%=c_sum%>' 
				c_sum_rate[<%=ai%>] = '<%=c_sum_rate%>'
				c_sum_rate2[<%=ai%>] = '<%=c_sum_rate2%>'

				/*--------------뱃지-----------*/
				if (c_sum_rate[<%=ai%>] >= 25 && c_sum_rate[<%=ai%>] < 50){
					invest_badge[<%=ai%>] = ' <img src="/images/bronze.png" style="width:17px;height:19px;"> '
				}else if (c_sum_rate[<%=ai%>] >= 50 && c_sum_rate[<%=ai%>] < 75){
					invest_badge[<%=ai%>] = ' <img src="/images/bronze.png" style="width:17px;height:19px;"><img src="/images/silver.png" style="width:17px;height:19px;"> '
				}else if (c_sum_rate[<%=ai%>] >= 75 && c_sum_rate[<%=ai%>] < 100){
					invest_badge[<%=ai%>] = ' <img src="/images/bronze.png" style="width:17px;height:19px;"><img src="/images/silver.png" style="width:17px;height:19px;"><img src="/images/gold.png" style="width:17px;height:19px;"> '
				}else if  (c_sum_rate[<%=ai%>] >= 100){
					invest_badge[<%=ai%>] = ' <img src="/images/bronze.png" style="width:17px;height:19px;"><img src="/images/silver.png" style="width:17px;height:19px;"><img src="/images/gold.png" style="width:17px;height:19px;"><img src="/images/platinum.png" style="width:17px;height:19px;">'
				}else{
					invest_badge[<%=ai%>] =''
				}
				/*--------------뱃지-----------*/

				
				/*----------등급-----------*/
				if (c_sum_rate[<%=ai%>] <25){
					invest_grade[<%=ai%>] = 'iron'
				}else if (c_sum_rate[<%=ai%>] >= 25 && c_sum_rate[<%=ai%>] < 50){
					invest_grade[<%=ai%>] = 'bronze'
				}else if (c_sum_rate[<%=ai%>] >= 50 && c_sum_rate[<%=ai%>] < 75){
					invest_grade[<%=ai%>] = 'silver'
				}else if (c_sum_rate[<%=ai%>] >= 75 && c_sum_rate[<%=ai%>] < 100){
					invest_grade[<%=ai%>] = 'gold'
				}else if (c_sum_rate[<%=ai%>] >= 100){
					invest_grade[<%=ai%>] = 'patinum'
				}else{
					invest_grade[<%=ai%>] = 'abcd'
				}
				/*----------등급-----------*/

				/*---------게이지바 컬러-------*/
				if (c_sum_rate[<%=ai%>] < 25){
					color_by_grade[<%=ai%>] = 'gradient-iron'
				}else if (c_sum_rate[<%=ai%>] >= 25 && c_sum_rate[<%=ai%>] < 50){
					color_by_grade[<%=ai%>] = 'gradient-bronze'
				}else if (c_sum_rate[<%=ai%>] >= 50 && c_sum_rate[<%=ai%>] < 75){
					color_by_grade[<%=ai%>] = 'gradient-silver'
				}else if (c_sum_rate[<%=ai%>] >= 75 && c_sum_rate[<%=ai%>] < 100){
					color_by_grade[<%=ai%>] = 'gradient-gold'
				}else if (c_sum_rate[<%=ai%>] >= 100){
					color_by_grade[<%=ai%>] = 'gradient-platinum'
				}



			<% 
		        rs.MoveNext
	        Loop
      	End If
	rs.Close
	Set rs=Nothing
%>	


	function go_next(){
		if(now_value + 1 > <%=ai%>){
			'alert("자료가 없습니다.")'
		} else {
			var fragment = document.createDocumentFragment(); //가상의 엘리먼트
			var itemsAdded = 0;
			var itemsToAdd = 8; //추가할 아이템 개수
			t1 = 0
			for (var i = now_value + 1;  i <= now_value + itemsToAdd; i++) {
				if(c_team_name[i] != null){
					var content = '<a href="/cms/process/invest/view.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903&c_team_no='+ c_no[i] +'&c_festival_type=<%=c_festival_type%>&s_text=<%=s_text%>">	'
		                      +'       <div class="startup_info">	'
		                      +'           <div class="img-box" style="height:290px">	'
		                      +'               <img src="/upload/festival/'+ c_thumbnail[i] +'" alt="이미지" >	 '
		                      +'           </div>	'
		                      +'           <div class="info-box">	'
		                      +'               <div class="subject">	'
		                      +'                   '+ c_team_name[i] +' '
							  					+'										'+ invest_badge[i] +' '
		                      +'               </div>	'
		                      +'               <div class="content" style="height:40px;overflow: hidden;">	'
		                      +'                   '+ c_item_name[i] +'	'
		                      +'               </div>	'
													+'					  <div class="list_range_bar_rable">'
													+'						  <div class="label label1">'
													+'							  <span>Seed<span>'
													+'						  </div>'
													+'						  <div class="label label2">'
													+'							  <span>Series A<span>'
													+'						  </div>'
													+'						  <div class="label label3" >'
													+'							  <span>Series B<span>'
													+'						  </div>'
													+'						  <div class="label label4" >'
													+'							  <span>Series C<span>'
													+'						  </div>'
													+'						  <div class="label label5" >'
													+'							  <span>Pre<span><br>'
													+'							  <span>Unicorn<span>'
													+'						  </div>'
													+'					  </div>'
													+'				      <div class="list_range range_bar"> '
													+'								<div class="range_bar_width gauge_bar" style="width: '+ c_sum_rate2[i]+'%;">'
													+'									<div class="range_bar_ani '+color_by_grade[i]+'"></div>'
													+'								</div>'
													+'								<div class="info_item_line range_line_flex">'
													+'									<span class="range_line"></span>'
													+'									<span class="range_line"></span>'
													+'									<span class="range_line"></span>'
													+'									<span class="range_line"></span>'
													+'									<span class="range_line"></span>'
													+'								</div>'
													+'							</div>'
												  +'						   <div class="funding_price"> '
													+'                  <div class="dal">	'
													+'                        <span>'+ (c_sum_rate[i]*4) +'% 달성</span>'
													+'                  </div>	'
													+'                 <div class="mogip">	'
													+'                    <div class="mogip1">	'
													+'                        모집금액	'
													+'                   </div>	'
													+'                   <div class="mogip2">	'
													+'                       '+ c_sum[i] +'	'
													+'                       <span>	'
													+'                           원	'
													+'                       </span>	'
													+'                    </div>	'
													+'                  </div>	'
													+'							  </div>'
		                      +'             </div>	'
		                      +'          </div>	'
		                      +'  </a>	'

      var div = document.createElement('div');
      div.innerHTML = content;
      fragment.appendChild(div);
      itemsAdded++;
			}}

			parent.document.getElementById("data_insert").appendChild(fragment);
			now_value += itemsAdded;
		}
	}
	go_next()
</script>

<!-- #include virtual="/include/db/db_close.asp" --> 

	 