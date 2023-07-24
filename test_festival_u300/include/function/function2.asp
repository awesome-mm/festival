<%
		Function paging_c (fpage,findex,ftot,ffunc1,ffunc2)

			recCount = ftot
			pnoArg = findex
			pgCount=Int(recCount/pnoArg) + 1
			If recCount>0 Then
				iCount=(Int((fpage-1)/10))*10+1
				pCount=1
					If icount = 1 Then	
					Else
						Response.Write "<a href='javascript:"& ffunc1 & iCount - 1 & ffunc2&"'>[이전]</a>"
					End If					
				Do Until (iCount>pgCount) Or (pCount>10) Or ((iCount - 1) * findex = ftot)
					If cint(fpage) = cint(iCount) Then	
						Response.Write iCount
					Else
						Response.Write "<a href='javascript:"& ffunc1 & iCount & ffunc2&"'>[" &iCount &"]</a>"
					End If
					iCount=iCount+1
					pCount=pCount+1
				Loop
					If iCount < pgCount Then	
	
						Response.Write "<a href='javascript:"& ffunc1 & iCount  & ffunc2&"'>[다음]</a>"
					Else	
					End If	
			End If

		End Function

%>