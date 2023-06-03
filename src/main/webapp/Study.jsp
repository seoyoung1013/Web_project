<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Study"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
<%
	String userID =null;
	if(session.getAttribute("userID")!=null){
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber")!=null){
		pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
  <nav class="navbar navbar-default">
  		<%
  			if(userID ==null){
  		%>
	  		<ul class="nav navbar-nav navbar-right">
	  			<li class="dropdown">
	  				<a href="#" class="dropdown-toggle" 
		  				data-toggle="dropdown" role="button" aria-haspopup="true"
		  				aria-expanded="false">접속하기<span class="caret"></span></a>
	  				<ul class="dropdown-menu">
	  				  <li><a href="login.jsp">로그인</a></li>
	  				  <li><a href="join.jsp">회원가입</a></li>
	  				</ul>
	  			</li>
	  		</ul>
  		<%
  			} else{
  		%>
  		<ul class="nav navbar-nav navbar-right">
	  			<li class="dropdown">
	  				<a href="#" class="dropdown-toggle" 
		  				data-toggle="dropdown" role="button" aria-haspopup="true"
		  				aria-expanded="false">회원관리<span class="caret"></span></a>
	  				<ul class="dropdown-menu">
	  				  <li><a href="logoutAction.jsp">로그아웃</a></li>
	  				</ul>
	  			</li>
	  		</ul>
  		<%
  			}
  		%>
  		<div class="navbar-header">
  		<button type="button" class="navbar-toggle collapsed"
  			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
  			aria-expanded="false">
  			<span class="icon-bar"></span>	
  			<span class="icon-bar"></span>	
  			<span class="icon-bar"></span>	
  		</button>
  		<a class="navbar-brand" href="main.jsp">
  		<img src="images/mainlogo.jpg" alt="순천향대학교 청원게시판" ></a>
  	</div>
  	<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
  		<ul class="nav navbar-nav">
  			<li><a href="complain.jsp" class="menu-item">민원게시판</a></li>
  			<li><a href="free.jsp" class="menu-item">자유게시판</a></li>
  			<li><a href="PR.jsp" class="menu-item">홍보게시판</a></li>
  			<li><a href="Study.jsp" class="menu-item">스터디게시판</a></li>
  			<li><a href="Graduate.jsp" class="menu-item">졸업생게시판</a></li>
  		</ul>
  	</div>
  </nav>
  <br>
	
		<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					BbsDAO bbsBestDAO = new BbsDAO();
					                    ArrayList<Study> best_list = bbsBestDAO.Study_getBestList(pageNumber);
					                    int best_startNumber = (pageNumber - 1) * 10 + 1; // 시작 번호 계산
					                    for (int i = 0; i < best_list.size(); i++) {
					%>
					<tr>
						<td><a href="viewStudy.jsp?bbsID=<%= best_list.get(i).getBbsID() %>">
						<%= best_list.get(i).getBbsTitle() %></a></td>
						<td><%= best_list.get(i).getUserID() %></td>
						<td><%= best_list.get(i).getBbsDate() %></td>
						<td><%= best_list.get(i).getBbsCount() %></td>
						
					</tr>
					<%      
                     }
                %>
				</tbody>
			</table>			
		</div>
	</div>
	
	
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					BbsDAO bbsDAO = new BbsDAO();
					                    ArrayList<Study> list = bbsDAO.Study_getList(pageNumber);
					                    int startNumber = (pageNumber - 1) * 10 + 1; // 시작 번호 계산
					                    for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= startNumber + i %></td>
						<td><a href="viewStudy.jsp?bbsID=<%= list.get(i).getBbsID() %>">
						<%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate() %></td>
					</tr>
					<%      
                     }
                %>
				</tbody>
			</table>
			<% 
            if (pageNumber != 1) {
        %>
			<a href="Study.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arrow-left">이전</a>
			<%
            } if (bbsDAO.nextPage(pageNumber + 1)) {
        %>
			<a href="Study.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arrow-left">다음</a>
			<%
            }
        %>
			<a href="writeStudy.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>