<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>JSharing</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-xlarge.css" />
		</noscript>
		<style>
		a{
		 text-decoration : none;
		}
		input[type="submit"]{
			font-family : FontAwesome;
			position : absolute;
			z-index: 1;
			top : 9px;
			right : 75%;
			font-size : 12px;
			background: #629DD1;
		}

		</style>
	</head>
	<body id="top">
		<jsp:include page = "header.html"/>				
		<jsp:include page = "main.html"/>
		<jsp:include page = "footer.html"/>
	</body>
</html>