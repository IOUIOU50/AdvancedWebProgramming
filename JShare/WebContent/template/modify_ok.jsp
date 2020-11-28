<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="controller.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost/jsharing_integrated?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String id = "root";
String pass = "5079";
String user_id = "";
int idx = 0;
PreparedStatement pstmt = null;

try {
	request.setCharacterEncoding("euc-kr");
	System.out.println(request.getParameter("id"));
	System.out.println(request.getParameter("id").getClass());

	idx = Integer.parseInt(request.getParameter("id"));
	String title = request.getParameter("title");
	java.sql.Date period = java.sql.Date.valueOf(request.getParameter("period"));
	int price = Integer.parseInt(request.getParameter("price"));
	String context = request.getParameter("context");

	Connection conn = new DBConnection("jsharing_integrated").connect();

	String sql = "UPDATE post SET post_TITLE=?, post_context=?, post_period=?, post_price=? WHERE post_id=?";

	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, title);
	pstmt.setString(2, context);
	pstmt.setDate(3, period);
	pstmt.setInt(4, price);
	pstmt.setInt(5, idx);
	
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();

} catch (SQLException e) {
	out.println(e.toString());
}
%>
<script language=javascript>
	self.window.alert("글이 수정되었습니다.");
					  	location.href="board";
</script>