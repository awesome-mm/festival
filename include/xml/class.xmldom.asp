<%
Class XMLDOMClass
   Private m_DOM ' XMLDOM 객체

 

   ' ---------------------- 생성자 -----------------------
   Private Sub Class_Initialize()
      Set m_DOM = Server.CreateObject("Microsoft.XMLDOM")
   End Sub
 
   ' ---------------------- 소멸자 -----------------------
   Private Sub Class_Terminate()
      Set m_DOM = Nothing
   End Sub

 

   ' ------------------- Property Get --------------------
   Public Property Get TagText(tagName, index)
      Dim Nodes
 
      Set Nodes = m_DOM.getElementsByTagName(tagName)
      TagText = Nodes(index).Text
      Set Nodes = Nothing
   End Property
 
   Public Property Get Nodes(tagName)
      Set Nodes = m_DOM.getElementsByTagName(tagName)
   End Property
 
   ' ------------------- 원격 XML 읽기 --------------------
   Public Function LoadHTTP(url)
      with m_DOM
         .async = False ' 동기식 호출
         .setProperty "ServerHTTPRequest", True ' HTTP로 XML 데이터 가져옴
   
         LoadHTTP = .Load(url)
      end with  
   End Function

   Public Property Get TagSelect(tagName)
   	Dim Nodes
   	Set Nodes = m_DOM.getElementsByTagName(tagName)
   	TagSelect = Nodes.length
   	Set Nodes = Nothing
   End Property



   ' ------------------- XML 파일 읽기 --------------------
   Public Function Load(file)
      with m_DOM
         .async = False ' 동기식 호출
   
         Load = .Load( Server.MapPath(file) )
      end with
   End Function
End Class
%>

 