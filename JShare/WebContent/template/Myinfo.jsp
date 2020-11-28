<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/losse.dtd">
<% request.setCharacterEncoding("UTF-8"); %>

<!-- usebean은 필요한걸로 교체 -->
<jsp:useBean id="addr" class="jsp.member.model.AddrBean"/>
<jsp:setProperty name="addr" property="*"/>
<jsp:useBean id="am" class="jsp.member.model.AddrManager" scope="application"/>
<%
am.add(addr);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>my page</title>
<style>
table {
				width: 500px;
			}
</style>

</head>
<body>
<center>
<H2>회원 정보</H2>
<table border=1 cellspacing="1" cellpadding="5">

<!-- 값 불러오는 함수는 로그인한 세션을 이용해서 user_id로 db레코드 검색 후 가져오기 -->
<tr>
	<td>아이디</td>
	<td align=center><%=addr.getStnum() %></td>
</tr>

<tr>
	<td>이 름</td>
	<td align=center><jsp:getProperty property="username" name="addr"/></td>
</tr>

<tr>
	<td>이메일</td>
	<td align=center><%=addr.getEmail() %></td>
</tr>

<tr>
	<td width=100 >전화번호</td>
	<td align=center><%=addr.getTel() %></td>
</tr>

	
</table>

<HR>

<!-- <button id="TransactionHistoryViewBtn" class="btn btn-warning" onclick="location='TempHistory.jsp'">거래 내역</button></tr>-->
<a href="TempHistory.jsp">거래 내역</a>
<!-- 거래내역페이지랑 연동해야 함 -->

</center>
</body>
</html>