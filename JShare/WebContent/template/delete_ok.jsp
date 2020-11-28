<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="controller.DBConnection"%>

<%
int idx = Integer.parseInt(request.getParameter("id"));
String username = request.getParameter("username");
Class.forName("com.mysql.jdbc.Driver");

if(session.getAttribute("id") == null){
	System.out.println("session is null");
	out.println("<script>alert('삭제 권한이 없습니다. 로그인이 필요합니다.');location.href='login.html';</script>");
}


else if(!session.getAttribute("id").equals(username)){
	out.println("<script>alert('삭제 권한이 없습니다.');window.history.back();</script>");
} else{

try {
	Connection conn = new DBConnection("jsharing_integrated").connect();
	String sql = "DELETE FROM post WHERE post_id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setInt(1, idx);
	pstmt.executeUpdate();
%>
<script language=javascript>
	self.window.alert("해당 글을 삭제하였습니다.");
	location.href = "board";
</script>

<%
pstmt.close();
conn.close();
}catch (SQLException e) {
out.println(e.toString());
}
}
%>