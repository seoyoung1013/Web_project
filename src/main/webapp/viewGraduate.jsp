<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<%@ page import="bbs.Complain"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>순천향대 청원 사이트</title>
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

	int pageNumber = 1;
	// pageNumber는 URL에서 가져온다.
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	BbsDAO bbsDAO = new BbsDAO();
	Complain bbs = bbsDAO.getBbs(bbsID);
	bbsDAO.increasecount(bbsID);
	
	
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않는 글입니다.')");
		script.println("location.href = 'complain.jsp'");
		script.println("</script>");
	}
	
	%>
	<nav class="navbar navbar-default">
		<%
		if (userID == null) {
		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false" style="font-size: 16px;">접속하기<span
					class="caret"></span></a>
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
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp"> <img
				src="images/mainlogo.jpg" alt="순천향대학교 청원게시판"></a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="complain.jsp" class="menu-item">민원게시판</a></li>
				<li><a href="free.jsp" class="menu-item">자유게시판</a></li>
				<li><a href="PR.jsp" class="menu-item">홍보게시판</a></li>
				<li><a href="Study.jsp" class="menu-item">스터디게시판</a></li>
				<li><a href="Graduate.jsp" class="menu-item">졸업생게시판</a></li>
			</ul>
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
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 11)%></td>
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
		"<br>")%>
						</td>
					</tr>

					<br>
					
					<a href="Graduate.jsp" class="btn btn-primary">목록</a>
					<%
					if (userID != null && userID.equals(bbs.getUserID())) {
					%>
					<a href="updateGraduate.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')"
						href="deleteActionGraduate.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
					<%
					}
					%>
				
				<form action="likeActionGraduate.jsp" method="post">
					<input type="hidden" name="bbsID" value="<%=bbsID%>">
					<button type="submit" class="btn btn-primary" id="likeButton">♥</button>
				</form>
		
				</tbody>
			</table>
			<form method="post" action="commentAction.jsp?bbsID=<%=bbsID%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<%-- 홀,짝 행 구분 --%>
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeeee; text-align: CENTER;">댓글</th>
						</tr>
					</thead>
					<tbody>
						<%
						CommentDAO commentDAO = new CommentDAO();
						ArrayList<Comment> list = commentDAO.getList(bbsID);
						for (int i = list.size() - 1; i >= 0; i--) {
						%>
						<tr>
							<td style="text-align: left;"><%=list.get(i).getCommentText()%></td>
							<td style="text-align: CENTER;"><%=list.get(i).getCommentDate()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=list.get(i).getUserID()%></td>
							<td colspan="2"></td>
							<td align="right">
								<%
								if (list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)) {
								%> <a type="button"
								onclick="nwindow(<%=bbsID%>,<%=list.get(i).getCommentID()%>)"
								class="btn btn-sm">수정</a> <a
								onclick="return confirm('정말로 삭제하시겠습니까?')"
								href="commentDeleteAction.jsp?bbsID=<%=bbsID%>&commentID=<%=list.get(i).getCommentID()%>"
								class="btn btn-sm">삭제</a> <%
								 }
								 %>
							</td>
						</tr>
						<%
						}
						%>
						<td><textarea type="text" class="form-control"
								placeholder="댓글을 입력하세요." name="commentText" maxlength="2048"></textarea></td>
						<td style="text-align: left;"></td>
						<tr>
							<td colspan="3"><input type="file" name="fileName"></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-success pull-right"
					value="댓글 입력">
			</form>


		</div>
	</div>

	</tbody>
	</table>



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
                  xhr.open('POST', 'likeActionGraduate.jsp', true);
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
	<script type="text/javascript">
		function nwindow(bbsID, commentID) {
			window.name = "commentParant";
			var url = "commentUpdate.jsp?bbsID=" + bbsID + "&commentID="
					+ commentID;
			window.open(url, "", "width=600,height=230,left=300");
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>