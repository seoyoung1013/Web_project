<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="comment" class="comment.Comment" scope="page" />
<jsp:setProperty name="comment" property="commentText" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>순천향대 청원 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			int bbsID = 0;
			if (request.getParameter("bbsID") != null) {
				bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}

			if (bbsID == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
			}
			if (comment.getCommentText() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				CommentDAO commentDAO = new CommentDAO();
				int result = commentDAO.write(comment.getCommentText(), userID, bbsID);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글 쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='view.jsp'");
					script.println("</script>");
				}

			}
		}
	%>
</body>
</html>