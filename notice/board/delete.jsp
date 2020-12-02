<%@page contentType="text/html;charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="db.DBManager"%>
<%@ include file="/inc/lib.jsp"%>
<%
	String notice_id = request.getParameter("notice_id");

	String sql ="delete from notice where notice_id="+notice_id;
	//삭제 후 완료메시지 보여죽 list로 넘어가기 

	PreparedStatement pstmt = null;
	Connection con = null;
	DBManager dbManager = new DBManager();

	con = dbManager.getConnection();
	pstmt = con.prepareStatement(sql);

	int result = pstmt.executeUpdate();

	if(result==0){
		out.print(getMsgBack("삭제실패"));
	}else{
		out.print(getMsgURL("삭제성공", "/board/list.jsp"));
	}

%>