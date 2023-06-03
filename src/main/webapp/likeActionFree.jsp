<%@ page import="bbs.BbsDAO" %>

<%
  // BbsDAO 인스턴스 생성
  BbsDAO bbsDAO = new BbsDAO();

  // bbsID 가져오기
  String bbsIDStr = request.getParameter("bbsID");
  int bbsID = Integer.parseInt(bbsIDStr); // 문자열을 int 타입으로 변환

  // 좋아요 수 증가
  bbsDAO.incrementLikeCount(bbsID);
%>

<!-- 좋아요 버튼을 눌렀을 때의 처리 후, 해당 게시물로 이동 -->
<script>
  window.location.href = 'viewFree.jsp?bbsID=<%= bbsID %>';
</script>
