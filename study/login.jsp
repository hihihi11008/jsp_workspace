<%@ page contentType="text/html;charset=utf-8"%>
<%
	//request와 response 객체 이용한 로그인 처리 
	//클라이언트가 전송한 id,pass 파라미터를 받아와 처리해보자 !!
	
	//request객체를 이용하면, 클라이언트의 요청을 처리할 수 있다 
	String id=request.getParameter("id");//클라이언트가 요청시 전송한 파라미터값을 얻는 메서드 
								//매개변수로는 파라미터 변수명을 명시 , 만일 html을 이용할 경우엔 
								//컴포넌트에 부여된 name값을 명시 

	String pass=request.getParameter("pass");

	out.print("현재 클라이언트의 요청 방식은 " +request.getMethod());
	out.print("<br>");
	out.print("클라이언트가 전송한 id는 "+id);
	out.print("<br>");
	out.print("클라이언트가 전송한 pass는 "+pass);
%>	
