<!-- #include virtual="/include/db/db_connect.asp" --> 
<% 
 	c_festival_type = r_call("c_festival_type")
 	s_text = r_call("s_text")
%>

<script> 
	var now_value = 0
	
	var c_no = new Array(); 
	var c_item_name = new Array(); 
	var c_team_name = new Array(); 
	var c_thumbnail = new Array(); 
	var c_sum = new Array(); 
	var c_sum_rate = new Array(); 
	var c_sum_rate2 = new Array(); 
	 
<%	

 	sql_d = "select b.c_item_name, a.c_team_name, b.c_thumbnail, a.c_no "
 	sql_d = sql_d & " ,(select sum(CAST(ISNULL(c_fund,0) AS BIGINT)) as c_sum from tbl_fund where c_team_no = a.c_no and c_festival_no = b.c_no and c_use = 0 ) as c_sum "
 	sql_d = sql_d & " from tbl_team a "
	sql_d = sql_d & " inner join tbl_festival_data b on b.c_team_no = a.c_no and b.c_year = 2022 and b.c_use = 0 "
 	sql_d = sql_d & " where a.c_project_no in (7,8,9) and a.c_use = 0 and a.c_festival = 1 and b.c_item_name <> '' "

 	if c_festival_type <> "" then
	 	sql_d = sql_d & " and a.c_festival_type = "& c_festival_type & " " 
	end if 

	if s_text <> "" then
	 	sql_d = sql_d & " and ( b.c_member_name like '%"& s_text & "%' or b.c_item_name like '%"& s_text & "%' or a.c_team_name like '%"& s_text & "%' ) " 
	end if 


	sql_d = sql_d & " order by newid() "

	// 'response.write sql_d'

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
			else			
				c_sum = formatnumber(rs("c_sum"),0)
				hkk = cdbl(rs("c_sum"))
				c_sum_rate = formatnumber(hkk / 50000000 * 100 , 0)
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
			let_go = parent.document.getElementById("data_insert").innerHTML;
			t1 = 0
			for (var i = now_value + 1; i < now_value + 9 ; i++) {
					if(c_team_name[i] != null){
					t1 = t1 + 1
					let_go = let_go +'<a href="/cms/process/invest/view.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903&c_team_no='+ c_no[i] + '&c_festival_type=<%=c_festival_type%>&s_text=<%=s_text%>">	'
		                      +'       <div class="startup_info">	'
		                      +'           <div class="img-box" style="height:220px">	'
		                      +'               <img src="/upload/festival/'+ c_thumbnail[i] +'" alt="이미지" >	'
		                      +'           </div>	'
		                      +'           <div class="info-box">	'
		                      +'               <div class="subject">	'
		                      +'                   '+ c_team_name[i] +' '
		                      +'               </div>	'
		                      +'               <div class="content" style="height:40px;overflow: hidden;">	'
		                      +'                   '+ c_item_name[i] +'	'
		                      +'               </div>	'
		                      +'               <div class="line">	'
		                      +'                   <span class="gh_1" style="width:'+ c_sum_rate2[i] +'%"></span>	'
		                      +'               </div>	'
												  +'						   <div class="funding_price"> '
													+'                  <div class="dal">	'
													+'                        <span>'+ c_sum_rate[i] +'% 달성</span>'
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
		                        if(t1 == 4){
		                        	t1 = 0
		                        }
				 }
				//if(c_team_name[i] != null){
				// 	t1 = t1 + 1
				// 	let_go = let_go +'<a href="/cms/process/invest/view.asp?c_show_no=71&c_check_no=64&c_relation=809&c_relation2=903&c_team_no='+ c_no[i] + '&c_festival_type=<%=c_festival_type%>&s_text=<%=s_text%>">	'
		    //                   +'       <div class="startup_info">	'
		    //                   +'           <div class="img-box" style="height:220px">	'
		    //                   +'               <img src="/upload/festival/'+ c_thumbnail[i] +'" alt="이미지" style="max-width: 380px;">	'
		    //                   +'           </div>	'
		    //                   +'           <div class="info-box">	'
		    //                   +'               <div class="subject">	'
		    //                   +'                   '+ c_team_name[i] +' '
		    //                   +'               </div>	'
		    //                   +'               <div class="content" style="height:40px;overflow: hidden;">	'
		    //                   +'                   '+ c_item_name[i] +'	'
		    //                   +'               </div>	'
		    //                   +'               <div class="line">	'
		    //                   +'                   <span class="gh_1" style="width:'+ c_sum_rate2[i] +'%"></span>	'
		    //                   +'               </div>	'
				// 									+'								<div class=""> '
				// 									+'                <div class="dal">	'
				// 									+'                    <div class="dal1">	'
				// 									+'                        달성률	'
				// 									+'                    </div>	'
				// 									+'                    <div class="dal2">	'
				// 									+'                        '+ c_sum_rate[i] +'	'
				// 									+'                        <span>	'
				// 									+'                            %	'
				// 									+'                        </span>	'
				// 									+'                    </div>	'
				// 									+'               </div>	'
				// 									+'                <div class="mogip">	'
				// 									+'                    <div class="mogip1">	'
				// 									+'                        모집금액	'
				// 									+'                   </div>	'
				// 									+'                   <div class="mogip2">	'
				// 									+'                       '+ c_sum[i] +'	'
				// 									+'                       <span>	'
				// 									+'                           원	'
				// 									+'                       </span>	'
				// 									+'                   </div>	'
				// 									+'               </div>	'
				// 									+'							</div>'
		    //                   +'          </div>	'
		    //                   +'      </div>	'
		    //                   +'  </a>	'
		    //                     if(t1 == 4){
		    //                     	t1 = 0
		    //                     }
				//  }
				s1 = i;
			} 
			if(t1 > 0){
				for (var i = 1; i < 4 - t1 + 1 ; i++) {
					let_go = let_go  + '<div class="startup_info"></div>'
				}
			}   
			parent.document.getElementById("data_insert").innerHTML = let_go;
			now_value = s1;
		}
	}
	go_next()
</script>
<!-- #include virtual="/include/db/db_close.asp" --> 

	 