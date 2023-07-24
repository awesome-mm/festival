<%
		 

		Function ViewPage (fpage,findex,tblArg,search_t,intPageSize,get_par)
			
			strSQL="SELECT c_no FROM "& tblArg &" WHERE c_no = c_no "&search_t
			'Response.Write strSQL
			Set tbl_clsBP=CreateObject("ADODB.RecordSet")
			tbl_clsBP.Open strSQL, dbCon, 1
				recCount=tbl_clsBP.Recordcount
			tbl_clsBP.Close
			Set tbl_clsBP=Nothing
		'Response.Write recCount
			ftot = recCount
			pnoArg = findex
			If recCount>0 Then
				 
				pgCount= - INT(- (recCount/pnoArg))
			 
				iCount=(Int((fpage-1)/intPageSize))*intPageSize+1
				pCount=1
					 
					If iCount = 1 Then	
					Else
					%>
						<li class="control left">
		                                    <a href="<%=Request.ServerVariables("path_info")%>?<%=get_par%>&page=1" class="first"></a>
		                                    <a href="<%=Request.ServerVariables("path_info")%>?<%=get_par%>&page=<%=iCount - 1%>" class="prev"></a>
		                                </li>
					<%
					End If					
				Do Until (iCount>pgCount) Or (pCount>10) Or ((iCount - 1) * findex = ftot)
					If cint(fpage) = cint(iCount) Then
						%>	
						 <li>
						<a href="#none" class="num current"class="num"><%=iCount%></a>
						 </li>
						<%
					Else
						%>
						 <li>	
						<a href="<%=Request.ServerVariables("path_info")%>?<%=get_par%>&page=<%=iCount%>" class="num"><%=iCount%></a>
						 </li>
						<%
					End If
					iCount=iCount+1
					pCount=pCount+1
				Loop
				 //iCount = iCount - 1
					If iCount =< pgCount Then	
	 				%>
						<li class="control right">
		                                    <a href="<%=Request.ServerVariables("path_info")%>?<%=get_par%>&page=<%=iCount%>" class="next"></a>
		                                    <a href="<%=Request.ServerVariables("path_info")%>?<%=get_par%>&page=<%=pgCount%>" class="last"></a>
		                                </li>
					<%
					Else	
					End If	
					Response.Write ""
			End If

		End Function
		 
%>