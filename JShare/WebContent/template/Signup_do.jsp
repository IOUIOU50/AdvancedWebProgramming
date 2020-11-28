<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="controller.DBConnection"%>
<!DOCTYPE html>

<% 
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");%>
<%
//db에 한글 들어가게하는 함수
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
System.out.println(name);
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String email = request.getParameter("email");
String phone_num = request.getParameter("phone_num");

if(name.equals("")){
	System.out.println("name is null");
	out.println("<script>alert('이름을 적어주세요');window.history.back();</script>");
}
else if(id.equals("")){
	System.out.println("name is null");
	out.println("<script>alert('아이디를 적어주세요');window.history.back();</script>");
	
} 
else if(pw.equals("")){
	System.out.println("name is null");
	out.println("<script>alert('비밀번호를 적어주세요');window.history.back();</script>");
}
else if(email.equals("")){
	System.out.println("name is null");
	out.println("<script>alert('이메일을 적어주세요');window.history.back();</script>");
}
else if(phone_num.equals("")){
	System.out.println("name is null");
	out.println("<script>alert('전화번호를 적어주세요');window.history.back();</script>");
}
else{
try
{
	Class.forName("com.mysql.jdbc.Driver");
	
	String DB_URL = "jdbc:mysql://localhost:3306/jsharing?useUnicode=true&characterEncoding=utf8";
	Connection conn = new DBConnection("jsharing_integrated").connect();
	
	//DB아이디 비번 바꿔야함
	String sql = "INSERT INTO user(user_id, user_email, user_pw, uers_name, date, phone_number) VALUES(?, ?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, email);
	pstmt.setString(3, pw);
	pstmt.setString(4, name);
	pstmt.setString(5, sf.format(nowTime));
	pstmt.setString(6, phone_num);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	%>
	<script>
		self.window.alert("회원가입이 완료되었습니다.");
		location.href = "index.html.jsp";
	</script>
	<%
}

catch(ClassNotFoundException e){
	out.println(e);
}
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