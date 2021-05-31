<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록 페이지</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
body {
	padding-top: 56px;
	overflow-y: scroll;
}
</style>
<script>
	function registBoardContent() {
		$('#boardForm').find('input,textarea').each(function(index) {
			if(!this.value){
				this.focus();
				alert(this.name + "을/를 입력해주세요.");
				return false;
			} else {
				$('#boardForm').trigger("submit");
			}
		});
	}
</script>
</head>
<body>
	<%@include file="../includes/nav.jsp"%>
	<main class="container p-3">
		<form id="boardForm" class="row g-3" action="/board/register"
			method="post">
			<div class="mb-3">
				<label for="ex02Title" class="form-label">제목</label> <input
					type="text" class="form-control" id="formTitle" name="title"
					placeholder="제목을 입력해주세요.">
			</div>
			<div class="mb-3">
				<label for="ex02Writer" class="form-label">작성자</label> <input
					type="text" class="form-control" id="formWriter" name="writer"
					placeholder="작성자를 입력해주세요.">
			</div>
			<div class="mb-3">
				<label for="ex02Content" class="form-label">내용</label>
				<textarea class="form-control" id="formContent" name="content"
					rows="3" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<div class="col-12">
				<button type="button" class="btn btn-primary"
					onclick="registBoardContent();">등록</button>
			</div>
		</form>
	</main>
</body>
</html>