<!-- #include virtual="/include/db/db_connect.asp" --> 
 				<script>
 				 parent.document.getElementById("add_value_div").innerHTML = parent.document.getElementById("add_value_div").innerHTML  +  ''<%
                        	first_no = r_call("first_no")
                        	a1=cint(r_call("s_no"))
                        	a_period = cint(r_call("s_period"))
                        	a2 = a1 + a_period
                        	sql_p = "select t.* from ( select ROW_NUMBER() OVER (ORDER BY c_no desc) rnum, c_content, c_member_id, c_date, c_no from tbl_puzzle where c_year = 2022 and c_use = 0 and c_order > 2  and c_no <= "& first_no &" )t where  rnum > "& a1 &" and rnum <= "& a2
				Set rs=CreateObject("ADODB.RecordSet")
				rs.Open sql_p, dbCon, 1
				If rs.EOF Then 
				%>
					alert("자료가 더이상 없습니다.")
				<%
				else
				klp = 0
				Do Until rs.EOF 
					klp = klp + 1
					if klp = 1 then
						first_no = rs("c_no")
					end if
				%>+ '         <div  class="news_ticker_content" style="" > '
	                          + '                   <div  style="float:left;padding-right:20px;line-height:150%" > '
	                          + '                  	<font color="#FB914B" size="1">●</font>&nbsp; '
	                          + '                      <font color="#fff"> '
	                          + '                        <%=replace(replace(rs("c_content"),"'",""""),chr(13)& chr(10)," ")%> '
	                          + '                       </font> '<%
                                            	c_member_id = left(rs("c_member_id"),3)
						t_s_no = len(rs("c_member_id")) - 3
						for i = 1 to t_s_no
							c_member_id = c_member_id & "*"
						next
				%>+'		<nobr> '
				  +'		&nbsp;&nbsp;&nbsp;&nbsp;'
				  +'  		<font color="#FF9017"> / </font>'
                                  +'               <font color="#898989">'
                                  +'                	<%=c_member_id%>'
                                  +'                </font>'
                                  +'                <font color="#FF9017"> / </font>'
                                  +'                <font color="#898989">'
                                  +'                	<%=left(rs("c_date"),10)%>'
                                  +'                </font>'
				  +'		</nobr>'
	                          + '                   </div> '
	                          + '           </div>  '<%
	                		 rs.MoveNext
	                	Loop
	                	end if
				rs.Close
				Set rs=Nothing
				%>+ '';
				 parent.document.getElementById("first_no").value=<%=first_no%>;
				 parent.document.getElementById("s_no").value=<%=a2 - 1%>;
		 		</script>
﻿<!-- #include virtual="/include/db/db_close.asp" --> 
	 