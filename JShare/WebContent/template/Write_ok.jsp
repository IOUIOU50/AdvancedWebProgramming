<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Date"%>
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
Date postingDate = new Date();
StringBuilder dateBuilder = null;



// 데이터베이스 연결관련정보를 문자열로 선언
String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/jsharing_integrated?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

try {
	// JDBC 드라이버 로드
	Class.forName(jdbc_driver);

	// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
	conn = DriverManager.getConnection(jdbc_url, "root", "5079");

	// Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
	String sql = "insert into post(post_title, category_id, post_price, post_period, post_context, post_date, post_photo, user_id) values(?, ?, ?, ?, ?, ?, ?, ?)";

	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("title")); //get Title
	
	
	int category = Integer.parseInt(request.getParameter("category"));
	
	pstmt.setInt(2, category); //get category
	
	
	pstmt.setInt(3, Integer.parseInt(request.getParameter("price"))); //get price
	
    //get period 
    String st = request.getParameter("period");    
	pstmt.setDate(4, java.sql.Date.valueOf(st));
	dateBuilder = null;
	
	//get context
	pstmt.setString(5, request.getParameter("context"));
	pstmt.setDate(6, new java.sql.Date(postingDate.getTime()));

	
	//get photo
	InputStream inputStream = null;
	Part filePart = request.getPart("file");
	if(filePart != null){
		inputStream = filePart.getInputStream();
	}
	pstmt.setBlob(7, inputStream);
	
	pstmt.setString(8, (String)session.getAttribute("id"));

	// title이 존재할 경우 sql query문 수행.
	if (request.getParameter("title") != null) {
		pstmt.executeUpdate();
	}
} catch (Exception e) {
	System.out.println(e);
}
%>
<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "board";
</script>
