<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Complain"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale"="1">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("history.back()");
		script.println("</script>");
	}
	BbsDAO bbsDAO = new BbsDAO();
	Complain bbs = bbsDAO.getBbs(bbsID);
	bbsDAO.increasecount(bbsID);
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
			}
			%>

		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">게시판
							글보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserID()%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
		+ bbs.getBbsDate().substring(14, 16) + "분 "%></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td colspan="2"><%=bbs.getBbsCount()%></td>
					</tr>
					<tr>
						<td>좋아요</td>
						<td colspan="2"><%=bbs.getBbsLike_count()%></td>
					</tr>

					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></td>
					</tr>
				</tbody>
			</table>

			<div class="container">
				<div class="row">
					<div class="col">
						<a href="complain.jsp" class="btn btn-primary">목록</a>
					</div>
					
					
					<div class="col text-right">
						<form action="likeAction.jsp" method="post">
							<input type="hidden" name="bbsID" value="<%=bbsID%>">
							<button type="submit" class="btn btn-primary" id="likeButton">♥</button>
						</form>
					</div>
				</div>
			</div>

			<script>
				  document.querySelector('#likeButton').addEventListener('click', function() {
				    if (this.classList.contains('liked')) {
				      // 좋아요 취소
				      this.classList.remove('liked');
				      this.disabled = true;
				      this.style.backgroundColor = '';
				      // 좋아요 취소 요청을 서버에 전송
				      var xhr = new XMLHttpRequest();
				      xhr.open('POST', 'unlikeAction.jsp', true);
				      xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				      xhr.onreadystatechange = function() {
				        if (xhr.readyState === 4 && xhr.status === 200) {
				          // 서버 응답이 성공적으로 완료될 경우 동작
				          // 여기에 추가 동작을 구현
				          // 예: 좋아요 수 업데이트, UI 변경 등
				          var newLikeCount = parseInt(xhr.responseText);
				          document.querySelector('#likeButton').innerHTML = '♥ ';
				          document.querySelector('#likeButton').disabled = false;
				          document.querySelector('#likeButton').classList.remove('liked'); // 좋아요 버튼 클래스 변경
				        }
				      };
				      xhr.send('bbsID=<%=bbsID%>&cancel=true');
				    } else {
				      // 좋아요 추가
				      this.classList.add('liked');
				      this.disabled = true;
				      this.style.backgroundColor = 'red';
				      // 좋아요 추가 요청을 서버에 전송
				      var xhr = new XMLHttpRequest();
				      xhr.open('POST', 'likeAction.jsp', true);
				      xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				      xhr.onreadystatechange = function() {
				        if (xhr.readyState === 4 && xhr.status === 200) {
				          // 서버 응답이 성공적으로 완료될 경우 동작
				          // 여기에 추가 동작을 구현
				          // 예: 좋아요 수 업데이트, UI 변경 등
				          var newLikeCount = parseInt(xhr.responseText);
				          document.querySelector('#likeButton').innerHTML = '♡ ';
				          document.querySelector('#likeButton').disabled = false;
				          document.querySelector('#likeButton').classList.add('liked'); // 좋아요 버튼 클래스 변경
				        }
				      };
				      xhr.send('bbsID=<%=bbsID%>
								&cancel=false');
													}
												});
			</script>


			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<!-- 테이블 내용 생략 -->
			</table>

			<%
			if (userID != null && userID.equals(bbs.getUserID())) {
			%>
			<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
			<%
			}
			%>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>