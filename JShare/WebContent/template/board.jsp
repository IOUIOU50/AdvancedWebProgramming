<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" %>
<%@ page import = "controller.Database" %>
<%@ page import = "controller.BoardController" %>
<%
	BoardController board = new BoardController();
		
	ResultSet category = board.categoryList();
	
	ResultSet result = (ResultSet)request.getAttribute("list");	
	int totalList = (int)request.getAttribute("totalList");	
%>
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
																	
									<li><a href="board" >전체</a></li>
									<% while(category.next()){ %>										
									<li><a href="board?category=<%= category.getString("category_id") %>" ><%= category.getString("category_name") %></a></li>
									<%} %>								
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
						        <% while(result.next()) {%>
						          <tr>
						            <td><%= result.getString("category_name") %></td>
						            <td><a href="posting.jsp?id=<%= result.getString("post_id")%>" class="subTitle"><%= result.getString("post_title") %></a></td>
						            <td><%= result.getString("user_id") %></td>
						            <td><%= result.getString("post_date") %></td>
						            <td><%= result.getString("post_hit") %></td>
						          </tr>										
						         <% } %>
									 </tbody>
									  
						      </table>
									<div class="paging">
									<% for(int i = 1; i<=totalList; i++) {%>
									<% int pagees = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")): 1; %>
										<% if(i == pagees){ %>
										<a class = "currentPage" href="board?page=<%= i %> <% if(request.getParameter("category") !=null) %><%="&category="+request.getParameter("category") %>"><%= i %></a>
										<%}else{ %>
										<a href="board?page=<%= i %><% if(request.getParameter("category") !=null) %><%="&category="+request.getParameter("category") %>"><%= i %></a>
										<%} %>
									<% } %>
									</div>
						    </div>
							</section>
						</div>
					</div>
				</div>
			</section>			

<script>
function searchParam(key){
	const params = new URLSearchParams(location.search);
	if(params.has(key)){
		const param = params.get(key);
		return param;
	}else{
		return null;
	}														
}

var li = document.getElementsByClassName("alt")[0].children;
var result = searchParam('category');

for(var i =0; i<li.length; i++){
	if(result != null){
		if(li[i].getAttribute('href') == result){
			li[i].setAttribute('class','currentCategory');							
		}										
	}else{
		li[0].setAttribute('class','currentCategory');
	}
}				
</script>