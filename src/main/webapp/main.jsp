<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css?a">
<link rel="stylesheet" href="css/custom.css">
<title>순천향대학교 청원게시판</title>
</head>
<body>
<%
	String userID =null;
	if(session.getAttribute("userID")!=null){
		userID = (String) session.getAttribute("userID");
	}
%>
  <nav class="navbar navbar-default" >
  		<%
  			if(userID ==null){
  		%>
	  		<ul class="nav navbar-nav navbar-right">
	  			<li class="dropdown">
	  				<a href="#" class="dropdown-toggle" 
		  				data-toggle="dropdown" role="button" aria-haspopup="true"
		  				aria-expanded="false" style="font-size: 16px;">접속하기<span class="caret"></span></a>
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
  	</div>
  </nav>
  <div class="container-fluid">
  	<div id="myCarousel" class="carousel slide" data-ride="corousel">
  		<ol class="carousel-indicators">
  			<li data-target="#myCarousel" data-slide-to="0" class="activer"></li>
  			<li data-target="#myCarousel" data-slide-to="1" ></li>
  			<li data-target="#myCarousel" data-slide-to="2" ></li>
  		</ol>
  		<div class="carousel-inner">
  			<div class="item active">
  				<img src="images/main_1.jpg">
  			</div>
  			<div class="item">
  				<img src="images/main_2.jpg">
  			</div>
  			<div class="item">
  				<img src="images/main_3.jpg">
  			</div>
  		</div>
  		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
  			<span class="glyphicon glyphicon-chevron-left"></span>
  		</a>
  		<a class="right carousel-control" href="#myCarousel" data-slide="next">
  			<span class="glyphicon glyphicon-chevron-right"></span>
  		</a>
  	</div>
  </div>
  <div class="container">
            <div class="row">
                <div class="col-md-3">
                	<img src="images/메모장.jpg" alt="test" class="img-responsive">
                	 	<div class="carousel-caption">
                	 		<h2>민원/제안</h2><br>
                   				 <p><a class="btn btn-secondary" href="#" role="button" style="font-size: 18px;">#생활불편</a></p>
                   				 <p><a class="btn btn-secondary" href="#" role="button" style="font-size: 18px;">#의사소통<br><br></a></p>
                	 	</div>
                </div>
                <div class="col-md-3">
                	<img src="images/메모장.jpg" alt="test" class="img-responsive">
                		<div class="carousel-caption">
                	 		<h2>게시 요청</h2><br>
                   				 <p><a class="btn btn-secondary" href="#" role="button" style="font-size: 18px;">#동아리게시요청</a></p>
                   				 <p><a class="btn btn-secondary" href="#" role="button" style="font-size: 16px;">#공모전/대외활동<br>게시요청</a></p>
                	 	</div>
                </div>
                <div class="col-md-3">
                	<img src="images/메모장.jpg" alt="test" class="img-responsive">
                		<div class="carousel-caption">
                	 		<h2>스터디모집</h2>
                   				 <p><a class="btn btn-secondary" href="#" role="button"style="font-size: 16px;">#학과스터디</a></p>
                   				 <p><a class="btn btn-secondary" href="#" role="button"style="font-size: 16px;">#프로그래밍</a></p>
                   				 <p><a class="btn btn-secondary" href="#" role="button"style="font-size: 16px;">#어학</a></p>
                	 	</div>
                </div>
                <div class="col-md-3">
                	<img src="images/메모장.jpg" alt="test" class="img-responsive">
                		<div class="carousel-caption">
                			<h2>전화안내</h2><br>
                   				 <p style="font-size: 15px;">학생지원팀<br>&#40;Tel&#41;041-530-1034</p>
                   				 <p style="font-size: 15px;">SRC센터 교육지원팀<br>&#40;Tel&#41;041-530-1759</p><br>
                	 	</div>
                </div>
            </div>
        </div>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <footer class="container-fluid" style="background-color: #9E9E9E; height: 100px; padding: 20px;">
        <p>개인정보방침</p>
        <p>[31538]충남 아산시 순천향로 22 | 우편사서함: 충남 아산시 시민로422 아산우체국사서함32 | TEL : 041-530-1114 | FAX : 041-542-4615 
    </footer>
</body>
</html>