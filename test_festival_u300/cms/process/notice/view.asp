<!-- #include virtual="/cms/sub_top.asp" -->
<%
 
	s_field = r_call("s_field")
	s_text = r_call("s_text")

%>
<%
	 
	c_no = r_call("c_no")
	
	sql = "update tbl_board set c_click=c_click + 1 where c_no = " & c_no
	dbCon.Execute sql
	
	get_par = t_para & "&c_relation3=" & c_relation3
	search_t = "and c_relation = "& c_relation &" and c_relation2 = "& c_relation2
			if s_field <> "" then
				get_par = get_par & "&s_field=" & s_field
			end if 
			if s_text <> "" then
				get_par = get_par & "&s_text=" & s_text
			end if 
	 

	 strSQL="SELECT * FROM tbl_board WHERE c_no=c_no "& search_t &"  and c_no  = "& c_no &"  "             
 	 Set tbl_board=CreateObject("ADODB.RecordSet")
	tbl_board.Open strSQL, dbCon, 1
	intPage=r_call("page")
	If intPage="" Then
		intPage=1
	End If
	If tbl_board.EOF Then  %>
	<script>
		alert("잘못 된 선택입니다.")
		history.back()
	</script>
<%
      Else
     
%>
	       <div class="notice_area">
                    <div class="sub_title">
                        <h2>공지사항</h2>
                    </div>


                    <div class="notice_detail">

                        <div class="notice_tit">
                            <span>공지</span> <%=tbl_board("c_title") %>

                        </div>
												<div class="notice_tit2 pdt20">
													<span ><%=tbl_board("c_name")%></span>
													<span ><%=tbl_board("c_date")%></span>
												</div>

                        <div class="notice_cont mgt30 pdt40 col666" style="max-width: 1200px;">
                            <div style="min-height:200px">
                                    <%=tbl_board("c_contents")%>
                            </div>
                            <%if tbl_board("c_files") <> "" then%>
							<div style="border-top:1px solid #cdcdcd;padding-top:10px;padding-bottom:10px;font-size:18px;">
                                    첨부파일 : 
                                   					 <%if tbl_board("c_files") <> "" then
										a_file = split(tbl_board("c_files"),"|")
									%>
										<% for i = 0 to ubound(a_file) %>
											<%if a_file(i) <> "" then%>
											<img src="http://www.u300.or.kr/images/file.gif" width="30px" alt="file"> <a href="/upload/<%=a_file(i)%>" target="_blank"><%=a_file(i)%></a> <br>
											<%end if%>
										<%next%>
									
									<%end if%>
                            </div>
                            <%end if%> 
                        </div >

<%
          
      End If
	tbl_board.Close
	Set tbl_board=Nothing
%>	

                      <!--  <div class="board_list">

                            

                        		</div>-->

 
										<div class="more_sch" >
                        <div class="more_sch_txt">
                             <a href="list.asp?<%=get_par%>&page=<%=intPage%>">목록보기</a>
                        </div>
                    </div>

                    </div>

                </div>
<!-- #include virtual="/cms/sub_bottom.asp" -->
