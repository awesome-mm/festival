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
	       <div class="mem_wrapper">
												<div class="login_title main_login_title">
													<h2>이벤트</h2>
												</div>


                    <div class="notice_detail" >

                        <!-- 
                        <div class=" mgt30 mg10 pdt40 fs21 col666" style="padding-bottom:30px;max-width: 1418px;border-top:1px solid #f18a2e;;border-bottom:1px solid #f18a2e;">
                            <div style="padding-left:30px;min-height:200px">
                                    <%=tbl_board("c_contents")%>
                            </div>
                             
                        </div > -->

						<div class="mgt30 mg10 pdt40 fs21 " style="padding-bottom:30px;border-top:1px solid #2D41BA;;border-bottom:1px solid #2D41BA;">
<!--                             <div style="padding-left:30px;min-height:200px"> -->
							         <%=tbl_board("c_contents")%>
                             
                        </div >

<%
          
      End If
	tbl_board.Close
	Set tbl_board=Nothing
%>	

                        <div class="board_list">

                            

                        </div>

                        <div class="btn_box mgt50">
                            <div class="btn_box_txt">
                                <a href="list.asp?<%=get_par%>&page=<%=intPage%>">목록으로</a>
                            </div>
                        </div>

                    </div>

                </div>
<!-- #include virtual="/cms/sub_bottom.asp" -->
