<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="model.*" %>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = (BbsDTO)request.getAttribute("dto");
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>homepage</title>
  <meta charset="utf-8">
  <script>
	function update(bbsno) {
		//alert(bbsno);
		let url = 'update.do?bbsno='+bbsno;
		location.href = url;
	}
	function del(bbsno) {
		//alert(bbsno);
		let url = 'delete.do?bbsno='+bbsno;
		location.href = url;
	}
	function reply(bbsno) {
		//alert(bbsno);
		let url = 'reply.do?bbsno='+bbsno;
		location.href = url;
	}
</script>
</head>
<body> 
<div class="container">
<h1>조회</h1>
<div class = "panel panel-default">
	<div class="panel-heading">작성자</div>
	<div class="panel-body"><%=dto.getWname()%></div>
	<div class="panel-heading">제목</div>
	<div class="panel-body"><%=dto.getTitle()%></div>
	<div class="panel-heading">내용</div>
	<div class="panel-body" style='height:150px'>내용입니다.<%=dto.getContent() %></div>
	<div class="panel-heading">조회수</div>
	<div class="panel-body"><%=dto.getViewcnt()%></div>
	<div class="panel-heading">등록일</div>
	<div class="panel-body"><%=dto.getWdate()%></div>
</div>
<div>
	<button onclick="location.href=create.do">등록</button>
	<button onclick="update('<%=bbsno%>')">수정</button>
	<button onclick="del('<%=bbsno%>')">삭제</button>
	<button onclick="reply('<%=bbsno%>')">답변</button>
	<button onclick="location.href='list.do'">목록</button>
</div>
</div>
</body> 
</html> 