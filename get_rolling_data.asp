<!-- #include virtual="/include/db/db_connect.asp" --> 
<%
str_total_sum = " select count(distinct c_member_no) as total_sum_population ,sum(convert(bigint,c_fund))as total_sum_fund from tbl_fund where c_year=2023"
Set rolling_section = dbCon.Execute(str_total_sum)

Dim total_sum_fund, total_sum_population
If rolling_section.EOF Then
    total_sum_fund = 0
    total_sum_population = 0
Else
    total_sum_fund = rolling_section("total_sum_fund")
    total_sum_population = rolling_section("total_sum_population")
End If

rolling_section.Close
Set rolling_section = Nothing

' Create a JSON object to send back as the response
Dim responseData
responseData = "{ ""total_sum_fund"": " & total_sum_fund & ", ""total_sum_population"": " & total_sum_population & " }"


' Set the response content type as JSON
Response.ContentType = "application/json"
Response.Write responseData
%>
<!-- #include virtual="/include/db/db_close.asp" --> 