<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Main -->
			<section id="main" class="wrapper style1">
				<header class="major">
					<h2>판매게시판</h2>
					<p></p>
				</header>
				<div class="container">
					<div class="row">
						<div class="4u">
							<section class = "category">
								<h2>카테고리</h2>
								<ul class="alt">
									<li class = "currentCategory"><a href="#" >전자기기</a></li>
									<li><a href="#">스포츠</a></li>
									<li><a href="#">가구</a></li>
									<li><a href="#">패션/잡화</a></li>
									<li><a href="#">취미</a></li>
								</ul>
							</section>
						</div>
						<div class="8u skel-cell-important">
							<section>
								<div class = "board">
						      <table >
						        <thead>
						          <th>카테고리</th>
						          <th id="title">제목</th>
						          <th>작성자</th>
						          <th>작성일</th>
						          <th>조회</th>
						        </thead>
						        <tbody>
						          <tr>
						            <td>전자기기</td>
						            <td><a href="../posting.jsp" class="subTitle">[덕진구/금암동] 전자레인지 빌려드려요</a></td>
						            <td>문현호</td>
						            <td>2020-11-13</td>
						            <td>20</td>
						          </tr>										
									 </tbody>
						      </table>
									<div class="paging">
										<a class = "currentPage" href="#">1</a>
										<a class = "" href="#">2</a>
										<a class = "" href="#">3</a>
										<a class = "" href="#">4</a>
										<a class = "" href="#">5</a>
									</div>
						    </div>
							</section>
						</div>
					</div>
				</div>
			</section>
</body>
</html>