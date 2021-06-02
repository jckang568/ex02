<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 목록 페이지</title>
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
        $(function () {
            var result = '<c:out value="${result}"/>';
            checkModal(result);
            history.replaceState({}, null, null);
        });

        function checkModal(result) {
            if (result == '' || history.state) {
                return;
            }
            if (parseInt(result) > 0) {
                $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
            }
            $("#myModal").modal("show");
        }
    </script>
</head>
<body>
<%@include file="../includes/nav.jsp" %>
<main class="container p-3">
    <div class="d-flex bd-highlight mb-2">
        <div class="me-auto p-2 bd-highlight align-self-end">
            <span class="align-bottom">* 개의 글</span>
        </div>
        <!-- <div class="p-2 bd-highlight">Flex item</div> -->
        <div class="p-2 bd-highlight">
            <button type="button" class="btn btn-primary"
                    onclick="location.href='/board/register'">글 작성
            </button>
        </div>
    </div>
    <div class="bg-light p-2 rounded mt-1">
        <table class="table">
            <thead>
            <tr>
                <th>#번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>수정일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="board">
                <tr>
                    <th scope="row"><c:out value="${board.bno }"/></th>
                    <td><a href='/board/get?bno=<c:out value="${board.bno }"/>'>
                        <c:out value="${board.title }"/>
                    </a></td>
                    <td><c:out value="${board.writer }"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"
                                        value="${board.regDate }"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"
                                        value="${board.updateDate }"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- table end -->
        <!-- start pagination -->
        <div class="pull-right">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageMaker.prev}">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    </c:if>
                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <c:choose>
                            <c:when test="${num eq 1}">
                                <li class="page-item active"><a class="page-link" href="#">${num}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="#">${num}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pageMaker.next}">
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <!-- end Pagination -->
    </div>
</main>

<!-- Modal Start -->
<div class="modal fade" id="myModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">글 등록 알림</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- <p>Modal body text goes here.</p> -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                </button>
                <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
            </div>
        </div>
    </div>
</div>
</body>
</html>