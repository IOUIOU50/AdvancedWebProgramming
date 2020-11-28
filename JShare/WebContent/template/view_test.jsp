<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
   int idx = Integer.parseInt(request.getParameter("id"));
Connection conn = null;
Statement stmt = null;

// 데이터베이스 연결관련정보를 문자열로 선언
String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/jsharing_integrated?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

String title = null;
String category = null;
int price = 0;
java.util.Date period = null;
String context = null;
String userId = null;
java.util.Date postDate = null;
OutputStream o = null;
int hit = 0;

//fields for load image
Blob image = null;
byte[] imgData = null;

try {
   // JDBC 드라이버 로드
   Class.forName(jdbc_driver);

   // 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
   conn = DriverManager.getConnection(jdbc_url, "root", "5079");
   stmt = conn.createStatement();

   String sql = "SELECT post_title, category_id, post_price, post_period, post_context, user_id, post_date, post_photo, post_hit FROM post WHERE post_id="+ idx;
   ResultSet rs = stmt.executeQuery(sql);
   if (rs.next()) {
      title = rs.getString(1);
      category = rs.getString(2);
      price = rs.getInt(3);
      period = rs.getDate(4);
      context = rs.getString(5);
      userId = rs.getString(6);
      postDate = rs.getDate(7);
      image = rs.getBlob(8);
      hit = rs.getInt(9);

      //get Image
      if (image != null) {
	   imgData = image.getBytes(1, (int) image.length());
	   response.setContentType("image/gif");
	   o = response.getOutputStream();	   	  
	   o.write(imgData);
	   o.flush();
	   o.close();
	   response.getOutputStream().flush();
	   response.getOutputStream().close();
      }     

   }
  

} catch (SQLException e) {
}
%>


