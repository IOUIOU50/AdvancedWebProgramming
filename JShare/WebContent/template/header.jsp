<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<title>Header</title>
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-xlarge.css" />
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</noscript>
<style>
a {
	text-decoration: none;
}

input[type="submit"] {
	font-family: FontAwesome;
	position: absolute;
	z-index: 1;
	top: 9px;
	right: 75%;
	font-size: 12px;
	background: #629DD1;
}
</style>
</head>
<body id="top">

	<!-- Header -->
	<header id="header" class="skel-layers-fixed">
		<h1>
			<a href="index.html.jsp">JSharing</a>
		</h1>
		<nav id="nav">
			<ul>
				<li>
					<form action="board">
						<input type="text" name="search" class="search" maxlength="5">
						<input type="submit" value="" />
					</form>
				</li>
				<li><a href="index.html.jsp">홈</a></li>
				<li><a href="board">거래게시판</a></li>
				<li><a href="Write.jsp">셰어링하기</a></li>
				<li><a href="#">사용자신고</a></li>
				<li><a href="#">고객센터</a></li>
				<% if(session.getAttribute("id") == null){ %>
				<li><a href="login.html" class="button special">로그인</a>
				<% } else
				{%>
						<li><a href="logout_ok.jsp" class="button special">로그아웃</a></li>
				<%}
				%>
			</ul>
		</nav>
	</header>
</body>
</html>
