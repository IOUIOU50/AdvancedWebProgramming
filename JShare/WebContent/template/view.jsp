<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost/jsharing_integrated?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
String id = "root";
String pass = "5079";
int idx = Integer.parseInt(request.getParameter("id"));

// int pg = Integer.parseInt(request.getParameter("pg"));
String post_title = null;
String category_id= null;
String memo = null;
String time = null;
int hit = 0;

try {

	Connection conn = DriverManager.getConnection(url, id, pass);
	Statement stmt = conn.createStatement();

	String sql = "SELECT post_title, category_id, post_price, post_period, post_context, user_id, post_date, post_photo, post_hit FROM post WHERE post_id=" + idx;
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()) {
		post_title = rs.getString(1);
		category_id = rs.getString(2);

		memo = rs.getString(3);
		time = rs.getString(4);
		hit = rs.getInt(5);
		hit++;
		
		sql = "UPDATE post SET post_hit=" + hit + 1 + " where post_id=" + idx;
		stmt.executeUpdate(sql);
		rs.close();
		stmt.close();
		conn.close();
	}} catch (SQLException e) {
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글</title>
</head>

<body>

	<jsp:include page="header.jsp" />
	<table>
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr
						style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
						<td width="5"><img src="img/table_left.gif" width="5"
							height="30" /></td>
						<td>내 용</td>
						<td width="5"><img src="img/table_right.gif" width="5"
							height="30" /></td>
					</tr>
				</table>
				<table width="413">
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">글번호</td>
						<td width="319"><%=idx%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">조회수</td>
						<td width="319"><%=hit%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">이름</td>
						<td width="319"><%=post_title%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">작성일</td>
						<td width="319"><%=time%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">제목</td>
						<td width="319"><%=post_title%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0"></td>
						<td width="399" colspan="2" height="200"><%=memo%>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
					<!-- 					<tr align="center"> -->
					<!-- 						<td width="0">&nbsp;</td> -->
					<!-- 						<td colspan="2" width="399"><input type=button value="글쓰기" -->
					<!-- 							OnClick="window.location='Write.jsp'"> <input type=button -->
					<%-- 							value="목록" OnClick="window.location='list.jsp?pg=<%=pg%>'"> --%>

					<!-- 							<input type=button value="수정" -->
					<%-- 							OnClick="window.location='modify.jsp?idx=<%=idx%>&pg=<%=pg%>'"> --%>
					<!-- 							<input type=button value="삭제" -->
					<%-- 							OnClick="window.location='delete.jsp?idx=<%=idx%>&pg=<%=pg%>'"> --%>
					<!-- 						<td width="0">&nbsp;</td> -->
					<!-- 					</tr> -->
				</table>
			</td>
		</tr>
	</table>
	<jsp:include page="footer.html" />
</body>
</html>