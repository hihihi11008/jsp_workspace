<%/*----------------------------------------------
JSP란 Java Server Page (자바가 서버에서 실행되는 형태)

JSP문서의 구성 요소 
1.지시영역 @ 지시어를 사용하여 현재 페이지에 대한 인코딩, 임포트, 파일형식 등 설정 정보를 선언하는 영역 
			(page 지시자, include 지시자 등의 지시자를 지원함)
2.선언부 :(!표시한 영역) 멤버변수와 멤버메서드를 작성할 수 있는 영역 
3.스크립틀릿
4.표현식 : out.print() 의 단축표현식 = 으로 데체가능 

------------------------------------------------*/
%>
<%@ page contentType="text/html;charset=utf-8"%>
<%!
	//멤버 메서드 정의 
	public String getMsg(){
		return "hi";
	}
%>
<%
	/*자바의 로직을 작성
	기존의 javaSE 코드를 작성하면 됨 
	*/
	/*
	for(int i=1; i<10;i++){
   		out.print("jsp 실행결과를 출력");
	}
	*/
	out.print(getMsg());
%>
<%=getMsg()%>