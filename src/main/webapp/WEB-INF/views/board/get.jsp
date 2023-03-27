<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width" charset="UTF-8"/>
    <title>글 조회 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery-3.6.0.min.js"></script>
    <script>
        function buttonClicked(e) {
            if ($(e).attr('aria-label') == 'remove') {
                $('#operForm').attr("method", "post");
                $('#operForm').attr('action', '/board/remove').trigger("submit");
            }
        }
        $(function () {
            var operForm = $('#operForm');
            $('button[data-oper="modify"]').on('click', function (e) {
                operForm.trigger("submit");
            });
            $('button[data-oper="list"]').on('click', function (e) {
                operForm.find("#bno").remove();
                operForm.attr("action", "/board/list").trigger("submit");
            });
        });
    </script>
</head>
<body>
<%@include file="../includes/nav.jsp" %>
<main class="container p-3 mt-3">
    <div class="mb-3">
        <h2>글 상세 페이지</h2>
    </div>
    <form id="boardForm" class="row g-3" action="/board/register"
          method="post">
        <div class="mb-3">
            <label for="ex02Bno" class="form-label">글 번호</label>
            <input type="text" class="form-control" id="formBno" name="bno" readonly="readonly"
                   value='<c:out value="${board.bno}"/>'>
        </div>
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
                    value="${board.content}"/></textarea>
        </div>
        <div class="col-12">
            <button type="button" data-oper="modify" class="btn btn-secondary">수정</button>
            <button type="button" data-oper="delete" class="btn btn-danger" aria-label="remove" onclick='buttonClicked(this);'>삭제</button>
            <button type="button" data-oper="list" class="btn btn-primary">목록</button>
        </div>
    </form>
    <form id="operForm" action="/board/modify" method="get">
        <input type="hidden" id="bno" name="bno" value="<c:out value='${board.bno}'/>">
        <input type="hidden" id="pageNum" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
        <input type="hidden" id="amount" name="amount" value="<c:out value='${cri.amount}'/>">
    </form>
</main>
</body>
</html>