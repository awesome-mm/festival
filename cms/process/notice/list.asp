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
	     <div>
                    <div class="sub_title">
                        <h2>공지사항</h2>
                    </div>

                    <div class="event">
			<script>
				function s_search(f){
					if(document.s_s.s_field.value == ""){
						alert("검색항목을 선택하세요.")
					//}else if(document.s_s.s_text.value == ""){
					//	alert("키워드를 입력하세요.")
					}else if(f.keyCode == 13){
						document.s_s.action = "list.asp?<%=t_para%>&c_relation3=<%=c_relation3%>"
						document.s_s.method = "post"
						document.s_s.submit()
					}else{
						document.s_s.action = "list.asp?<%=t_para%>&c_relation3=<%=c_relation3%>"
						document.s_s.method = "post"
						document.s_s.submit()
					}
				}
			</script>
                        <div class="sort_box">
                        <form name="s_s">
                           <input name="s_field" value="all" type="hidden">
													 <input
                                type="text"
                                id="keyword"
                                name="s_text"
                                value="<%=s_text%>"
                                placeholder="키워드를 입력하세요"
                                maxlength="20"
                                class="input_wrap"
                                onkeyup="s_search(this.form)">
														<label for="keyword" class="keyword_label">검색</label>


                        <button type="button" class="btn  search_btn" onclick="s_search();">
                                <!-- <img src="/images/search.png" alt=""> -->
                            <img src="/images/search2.png" alt="">
														<span class="hidden">검색<span>
                        </button>

                        </form>
                        </div>

                        <div class="table_box">
                            <table>
                                <thead>
                                    <th>제 목</th>
                                    <th>작성일자</th>
                                </thead>
                                <tbody>
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
		        intPageSize=10
		
		        tbl_board.MoveFirst
		        tbl_board.PageSize=intPageSize
		        tbl_board.AbsolutePage=intPage
		
		        strRecCount=tbl_board.RecordCount-((intPage-1)*intPageSize)
		        intRecCount=1
		        Do Until tbl_board.EOF or intRecCount>intPageSize
			%>
	                            <tr>
																	<td class="td1">
																			<a href="view.asp?<%=get_par%>&c_no=<%=tbl_board("c_no")%>">
																				<%=tbl_board("c_title")%>
																			</a>
																	</td>
																	<td class="td2">
																			<%=left(tbl_board("c_date"),10)%>
																	</td>
															</tr>
 			<%
		          tbl_board.MoveNext
		          strRecCount=strRecCount-1
		          intRecCount=intRecCount+1
		        Loop
		
		      End If
			tbl_board.Close
			Set tbl_board=Nothing
			%>

                                </tbody>
                            </table>

                        </div>

                        <article class="paging">
                            <ul style="text-align:center;">
                           			<% ViewPage intPage,intPageSize,"tbl_board",search_t,10,get_par%>
                            </ul>
                        </article>

                    </div>

                </div>
            </div>
<!-- #include virtual="/cms/sub_bottom.asp" -->
