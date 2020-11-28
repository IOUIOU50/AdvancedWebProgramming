<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Date"%>
<%@page import="controller.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("EUC-KR");
%>

<%
	// 데이터베이스 연결관련 변수 선언
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String id = request.getParameter("id");
String pw = request.getParameter("pw");

System.out.println("id : "+id);
System.out.println("pw : "+pw);
/* 	DB설정
	1. 아래의 databaseName을 본인의 DB이름으로 바꾼다.
	2. controller.DBConnection에가서 아이디와 비밀번호를 설정해준다.*/

String databaseName = "jsharing_integrated";
//***************여기 각자의 DB설정값을 넣어주면 됨******************

String jdbc_driver = "com.mysql.jdbc.Driver";

try {
	// JDBC 드라이버 로드
	Class.forName(jdbc_driver);

	// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
	conn = new DBConnection(databaseName).connect();

	// Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
	String sql = "SELECT * FROM user WHERE user_id = ?";

	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, id);  //get Title

	rs = pstmt.executeQuery();
	// 결과가 존재한다면 실행
	if (rs.next()) {
		if (rs.getString(1).equals(pw)) {
			session.setAttribute("id", id);
			out.println("<script>location.href='index.html.jsp';</script>");// 패스워드 일치한다면 실행
		} else
			out.println("<script>alert('비밀번호가 일치하지 않습니다.');location.href='login.html';</script>");
	}
	else{
		out.println("<script>alert('등록된 사용자가 없습니다.'); location.href='login.html';</script>");	
	}
	

} catch (Exception e) {
	e.printStackTrace();
}

%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>