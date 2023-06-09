<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
  <nav class="navbar navbar-default">
     <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
           data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
           aria-expanded="false">
           <span class="icon-bar"></span>   
           <span class="icon-bar"></span>   
           <span class="icon-bar"></span>   
        </button>
       	<a class="navbar-brand" href="main.jsp" >
  		<img src="images/mainlogo.jpg" alt="순천향대학교 청원게시판" ></a>
  	</div>
  	<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
  		<ul class="nav navbar-nav" >
  			<li><a href="complain.jsp" class="menu-item">민원게시판</a></li>
  			<li><a href="free.jsp" class="menu-item">자유게시판</a></li>
  			<li><a href="PR.jsp" class="menu-item">홍보게시판</a></li>
  			<li><a href="Study.jsp" class="menu-item">스터디게시판</a></li>
  			<li><a href="Graduate.jsp" class="menu-item">졸업생게시판</a></li>
  		</ul>
        <ul class="nav navbar-nav navbar-right">
           <li class="dropdown">
              <a href="#" class="dropdown-toggle" 
                 data-toggle="dropdown" role="button" aria-haspopup="true"
                 aria-expanded="false">접속하기<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="active"><a href="login.jsp">로그인</a></li>
                <li><a href="join.jsp">회원가입</a></li>
              </ul>
           </li>
        </ul>
     </div>
  </nav>
<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbot" style="padding-top: 20px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="학번"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary"> <input type="radio"
								name="userGender" autocomplete="off" value="남자">남자
							</label> <label class="btn btn-primary"> <input type="radio"
								name="userGender" autocomplete="off" value="여자">여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일"
							name="userEmail" maxlength="50">
					</div>

					<input type="submit" class="btn-btn-primary form-control"
						value="회원가입">
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
  
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>