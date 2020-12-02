<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%!
	//선언부 영역: 멤버변수와 멤버 메서드를 정의하는 영역 
	String url = "jdbc:mariadb://localhost:3306/db1202";
	String user = "root";
	String pass = "1234";

%>

<%
	//클라이언트가 저송한 파라미터를 받아서 mysql에 넣을 예정이므로, 
	//별도의 디자인 코드는 필요하지 않음. 
	out.print("이 페이지에서 클라이언트가 전송한 파라미터들을, 데이터베이스 넣을 예정");

	//파라미터가 영문이 아닌경우 꺠진다.. 따라서 파라미터를 대상으로 한 인코딩을 원하는 언어로 지정하면된다 
	//파라미터를 받기전에 지정 
	request.setCharacterEncoding("utf-8");//한국어,중국어, 아랍어 등등 전세계모든언어가 깨지지 않는다

	//jsp가 지원하는 내장객체 중, request객체를 이용하여 클라이언트의 전송 파라미터를 받아보자 
	String author = request.getParameter("author");//작성자
	String title = request.getParameter("title");//제목
	String content = request.getParameter("content");//내용

	out.print("전송한 author : " + author);
	out.print("전송한 title : " + title);
	out.print("전송한 content : " + content);

	//mysql insert를 진행한다 
	//드라이버 로드, 접속, 쿼리, 닫기 
	Class.forName("org.mariadb.jdbc.Driver");
	out.print("드라이버 로드 성공");

	Connection con = null;
	PreparedStatement pstmt=null;

	con = DriverManager.getConnection(url, user, pass);
	if(con==null){
		%>
	<script>
		alert("접속실패");
		history.back();
	</script>
<%
		}else{
%>
	<script>
		alert("접속성공");
	</script>
<%
		String sql = "insert into notice(author, title, content) values(?,?,?)";
		
		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, author);
		pstmt.setString(2, title);
		pstmt.setString(3, content);

		int result=pstmt.executeUpdate();

		if(result==0){
%>
	<script>
		alert("등록실패");
		history.back();
	</script>
<%
		}else{
%>
	<script>
		alert("등록성공");
		location.href="/board/list.jsp"; //list.jsp를 요청해야한다 
	</script>

<%
		}
	}
	//db에 연동에 사용된 모든 객체 닫기 
	if(pstmt!=null){
		pstmt.close();
	}
	if(con!=null){
		con.close();
	}
%>
