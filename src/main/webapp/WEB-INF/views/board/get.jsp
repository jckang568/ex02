<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 조회 페이지</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
body {
	padding-top: 56px;
	overflow-y: scroll;
}
</style>
</head>
<body>
	<%@include file="../includes/nav.jsp"%>
	<main class="container p-3">
		<form id="boardForm" class="row g-3" action="/board/register"
			method="post">
			<div class="mb-3">
				<label for="ex02Title" class="form-label">제목</label> <input
					type="text" class="form-control" readonly="readonly"
					value='<c:out value="${board.title}"/>'>
			</div>
			<div class="mb-3">
				<label for="ex02Writer" class="form-label">작성자</label> <input
					type="text" class="form-control" readonly="readonly"
					value='<c:out value="${board.writer}"/>'>
			</div>
			<div class="mb-3">
				<label for="ex02Content" class="form-label">내용</label>
				<textarea class="form-control" rows="3" readonly="readonly"><c:out
						value="${board.content}" /></textarea>
			</div>
			<div class="col-12">
				<button type="button" class="btn btn-secondary"
					onclick='location.href="/board/modify?bno=<c:out value='${board.bno}'/>"'>수정</button>
				<button type="button" class="btn btn-primary"
					onclick='location.href="/board/list"'>목록</button>
			</div>
		</form>
	</main>
</body>
</html>