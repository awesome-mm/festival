<!-- #include virtual="/cms/sub_top.asp" -->
<%
	 
	s_field = r_call("s_field")
	s_text = r_call("s_text")
%>
		<%
			
			get_par = t_para & "&c_relation3=" & c_relation3
			search_t = " and c_relation = "& c_relation &" and c_relation2 = " & c_relation2
			if s_field <> "" then
				get_par = get_par & "&s_field=" & s_field
			end if 
			if s_text <> "" then
				get_par = get_par & "&s_text=" & s_text
			end if 
			if  s_text <> "" then
				if s_field = "all" then
					search_t = search_t & " and ( c_contents like '%"& s_text &"%' or c_title like '%"& s_text &"%'  ) "
				else
					search_t = search_t & " and  ( " & s_field & " like '%"& s_text &"%' ) "
				end if	
			end if
		%>
			<!--벌레1 S-->
			<%if (session("session_c_bug1") <> "") AND session("session_c_bug1") = 0 then%>
			<%total_find_bug = session("session_c_bug1") + session("session_c_bug2") + session("session_c_bug3") + session("session_c_bug4") + session("session_c_bug5")%>
				<input id="bug_member_no" type="hidden" value="<%=session("session_no")%>">
				<input id="total_find_bug" type="hidden" value="<%=total_find_bug%>">
				<div style="width:200px; position : absolute; top:20%; left:10%">
					<a href="#none" onclick="find_bug();">
						<img id="bug_column" name = "c_bug1" src="/images/bugIMG1.png" style=" max-width:100%">
					</a>
				</div>
				<script>
					function find_bug(){
						let c_member_no = document.querySelector("#bug_member_no").value
						let total_find_bug = document.querySelector("#total_find_bug").value
						total_find_bug = parseInt(total_find_bug)+1
						bug_column = document.getElementById("bug_column").getAttribute('name');
						
						//alert("total_find_bug = "+total_find_bug +"\n"+"bug_column = "+ bug_column)
						
						$.ajax({
							type: "POST",
							url: "find_bug.asp",
							data: "c_member_no="+c_member_no+"&bug_column="+bug_column,
							cache: false,
							success: function(msg){
								alert("이스터에그 이벤트 벌레 " + total_find_bug +" / 5 마리 찾으셨습니다.\n전부 찾으신 경우 이벤트에 자동 응모됩니다.");
								document.querySelector("#bug_column").style.display="none";
								
							}
						});
						
					}
				</script>
			<%End if%>
			<!--벌레1 E-->

	    <div class="event_wrapper" style=";height:auto">
												<div class="sub_title">
														<h2>이벤트</h2>
												</div>

                        <div class="event" style=";padding-bottom:0px;height:auto">


                            <div class="event_wrap" style="padding-top:0px;height:auto">
                            <%
			 strSQL="SELECT * FROM tbl_board WHERE c_no=c_no "& search_t &"  ORDER BY c_no desc"             
			'response.write strSQL
		 	 Set tbl_board=CreateObject("ADODB.RecordSet")
			tbl_board.Open strSQL, dbCon, 1
			intPage=r_call("page")
			If intPage="" Then
				intPage=1
			End If
			If tbl_board.EOF Then  
			 
		        Else
		        intPageSize=300
		
		        tbl_board.MoveFirst
		        tbl_board.PageSize=intPageSize
		        tbl_board.AbsolutePage=intPage
		
		        strRecCount=tbl_board.RecordCount-((intPage-1)*intPageSize)
		        intRecCount=1
		        tbo = 0
		        Do Until tbl_board.EOF or intRecCount>intPageSize
		        	tbo = tbo + 1
			%>
                                <div class="event_box n1" style="padding:0px;background:#ffffff;height:auto">
                               		<a href="view.asp?<%=get_par%>&c_no=<%=tbl_board("c_no")%>" title="<%=tbl_board("C_title")%>">
                                     <img src="/upload/<%=tbl_board("c_files")%>" style="width:100%">
                                     </a>
                                </div>
			<%
				if tbo = 3 then
					tbo = 0
				end if
		          tbl_board.MoveNext
		          strRecCount=strRecCount-1
		          intRecCount=intRecCount+1
		        Loop
		
		      End If
			tbl_board.Close
			Set tbl_board=Nothing
			%>     
			 
				<%if tbo > 0 then
					l1 = 3 - tbo
					for i = 1 to l1
				%>
				<div class="event_box n1" style="padding:0px;background:#ffffff">
                                     
                                </div>
				<%
					next
				end if%>                 
                            </div>
<!--
                            <div class="btn_box mgt70 txt_ar">
                                <div class="btn_box_txt">
                                    이벤트 목록 가기
                                </div>
                            </div>

                        </div>
-->
                    </div>
                </div>


<!-- #include virtual="/cms/sub_bottom.asp" -->
