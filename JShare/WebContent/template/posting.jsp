<%@ page language="java" trimDirectiveWhitespaces="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.DecimalFormat"%>
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
String strPrice = null;

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
      DecimalFormat df = new DecimalFormat("\u00A4 #,###");
      strPrice = df.format(price);
      period = rs.getDate(4);
      context = rs.getString(5);
      userId = rs.getString(6);
      postDate = rs.getDate(7);      
      hit = rs.getInt(9);

      //get Image   

   }
   hit++;
   sql = "UPDATE post SET post_hit=" + hit + " where post_id=" + idx;
   stmt.executeUpdate(sql);
   rs.close();
   stmt.close();
   conn.close();

} catch (SQLException e) {
}
System.out.println("1. 여기까지는 무사통과");
%>
<html>
<head>
<title>게시판</title>
<style>
img {
	display: block;
	margin: auto;

}

.table {
	margin: auto;
	width: 80%;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<table>
		<tr>
			<td>

				<table class="table">
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="100">글번호</td>
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
						<td width="319"><%=userId%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">작성일</td>
						<td width="319"><%=postDate%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="100">대여가격</td>
						<td width="319"><%=strPrice%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
											<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="100">대여기간</td>
						<td width="319"><%=period%>까지</td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
						
					</tr>

					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">제목</td>
						<td width="319"><%=title%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">

						<td colspan="4"><img src="view_test.jsp?id=<%=idx%>"
							alt="사진이 없습니다." height="300px"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" height="200" style="font-weight: bold"><%=context%></td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2"><input type=button value="글쓰기"
							OnClick="window.location='Write.jsp'"> <input type=button
							value="목록" OnClick="window.location='board'"> <input
							type=button value="수정"
							OnClick="window.location='modify.jsp?id=<%=idx%>'"> <input
							type=button value="삭제"
							OnClick="window.location='delete_ok.jsp?id=<%=idx%>&username=<%=userId%>'">
						<td width="0">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>


