<%
	Function ViewPage2 (fpage,findex,tblArg,search_t,intPageSize,get_par)
			
			strSQL="SELECT count(*) as tt FROM "& tblArg &" "&search_t
			'Response.Write strSQL
			Set tbl_clsBP=CreateObject("ADODB.RecordSet")
			'Response.Write strSQL
			tbl_clsBP.Open strSQL, dbCon, 1
				recCount=tbl_clsBP("tt")
			tbl_clsBP.Close
			Set tbl_clsBP=Nothing
			recCount = clng(recCount)
			'Response.Write recCount
			ftot = recCount
			pnoArg = findex
			If recCount>0 Then
				'pgCount=Int(recCount/pnoArg) + 1
				pgCount= - INT(- (recCount/pnoArg))
			'Response.Write pgCount
				iCount=(Int((fpage-1)/intPageSize))*intPageSize+1
				pCount=1
					Response.Write "<table border=0  cellspacing=0 cellpadding=0><tr>"
					If iCount = 1 Then	
					Else
						Response.Write "<td style='padding=0,0,0,0'><a  href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=1""><<</a>&nbsp;</td> "
						Response.Write "<td style='padding=0,0,0,0'><a  href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=" &iCount - 1 &"""><</a>&nbsp;</td> "
					End If					
				Do Until (iCount>pgCount) Or (pCount>10) Or ((iCount - 1) * findex = ftot)
					If cint(fpage) = cint(iCount) Then	
						Response.Write "<td style='padding=0,0,0,0' valign=top>&nbsp;<font color=##4D9ACF size=2><b>"&iCount & "&nbsp;</td>"
					Else
						Response.Write "<td style='padding=0,0,0,0' valign=top>&nbsp;<a  href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=" &iCount &""">" &iCount &"</a>&nbsp;</td> "
					End If
					iCount=iCount+1
					pCount=pCount+1
				Loop
				 //iCount = iCount - 1
					If iCount =< pgCount Then	
	
						Response.Write "<td style='padding=0,4,0,4'>&nbsp;<a  href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=" &iCount&""">></a></td>"
						Response.Write "<td style='padding=0,4,0,0'>&nbsp;<a  href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=" &pgCount&""">>></a></td>"
					Else	
					End If	
					Response.Write "</tr></table>"
			End If

		End Function
		
		Function ViewPage3 (fpage,findex,tblArg,search_t,intPageSize,get_par)
			
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
				'pgCount=Int(recCount/pnoArg) + 1
				pgCount= - INT(- (recCount/pnoArg))
			'Response.Write pgCount
				iCount=(Int((fpage-1)/intPageSize))*intPageSize+1
				pCount=1
					Response.Write "<span class='all'>Page "& fpage &" of "& pgCount &"</span>"
					If iCount = 1 Then	
					Else
						Response.Write "<a class='inactive' href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=1"">&lt;&lt;</a> "
						Response.Write "<a class='inactive' href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=" &iCount - 1 &""">&lt;</a> "
					End If					
				Do Until (iCount>pgCount) Or (pCount>10) Or ((iCount - 1) * findex = ftot)
					If cint(fpage) = cint(iCount) Then	
						Response.Write "<span class='current'>"&iCount & "</span>"
					Else
						Response.Write "<a class='inactive'  href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=" &iCount &""">" &iCount &"</a>"
					End If
					iCount=iCount+1
					pCount=pCount+1
				Loop
				 //iCount = iCount - 1
					If iCount =< pgCount Then	
	
						Response.Write "<a class='inactive' href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=" &iCount&""">&gt;</a>"
						Response.Write "<a class='inactive' href=""" &Request.ServerVariables("path_info") &"?"& get_par &"&page=" &pgCount&""">&gt;&gt;</a>"
					Else	
					End If	
					Response.Write ""
			End If

		End Function
%>