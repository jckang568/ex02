<%--
  Created by IntelliJ IDEA.
  User: jckang
  Date: 2021-05-31
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>

<%--@elvariable id="board" type="com.jckang.ex02.domain.BoardVO"--%>
<%--@elvariable id="cri" type="com.jckang.ex02.domain.Criteria"--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width" charset="UTF-8"/>
    <title>글 수정 페이지</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>

    <script>
        function modifyBoardContent() {
            let emptyFlag = Boolean(true);
            let boardForm = jQuery('#boardForm');
            boardForm.find('input, textarea').each(function (index) {
                if (!this.value) {
                    this.focus();
                    alert(this.placeholder);
                    emptyFlag = false;
                    return false;
                }
            });
            if (emptyFlag) {
                boardForm.trigger("submit");
            }
        }
    </script>
</head>
<body>
<%@include file="../includes/nav.jsp" %>
<main class="container p-3 mt-3">
    <div class="mb-3">
        <h2>글 수정 페이지</h2>
    </div>
    <form id="boardForm" class="row g-3" action="<c:out value="/board/modify"/>" method="post">
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
        <div class="mb-3">
            <label for="formBno" class="form-label">글 번호</label>
            <input type="text" class="form-control" id="formBno" name="bno" readonly="readonly"
                   value='<c:out value="${board.bno}"/>'>
        </div>
        <div class="mb-3">
            <label for="formTitle" class="form-label">제목</label>
            <input type="text" class="form-control" id="formTitle" name="title" placeholder="제목을 입력해주세요."
                   value='<c:out value="${board.title}"/>'>
        </div>
        <div class="mb-3">
            <label for="formWriter" class="form-label">작성자</label>
            <input type="text" class="form-control" id="formWriter" name="writer" placeholder="작성자를 입력해주세요."
                   value='<c:out value="${board.writer}"/>'>
        </div>
        <div class="mb-3">
            <label for="formContent" class="form-label">내용</label>
            <textarea class="form-control" id="formContent" name="content" rows="3" placeholder="내용을 입력해주세요.">
                <c:out value="${board.content}"/>
            </textarea>
        </div>
        <div class="col-12">
            <button type="button" class="btn btn-primary" onclick="modifyBoardContent();">수정</button>
            <button type="button" class="btn btn-primary" onclick="history.back();">취소</button>
        </div>
    </form>
</main>
</body>
</html>