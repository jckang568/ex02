<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width" charset="UTF-8"/>
    <title>글 목록 페이지</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>
    <script>

        <%--@elvariable id="result" type="java.lang.Long"--%>
        <%--@elvariable id="service" type="java.lang.String"--%>
        $(function () {
            let result = '<c:out value="${result}"/>';
            let service = '<c:out value="${service}"/>';
            console.log(result);
            console.log(service);
            checkModal(result, service);
            history.replaceState({}, null, null);

            let actionForm = $("#actionForm");
            $('.page-item a').on("click", function (e) {
                e.preventDefault();
                actionForm.find('input[name="pageNum"]').val($(this).attr("href"));
                actionForm.trigger("submit");
            });

            $('.get-detail').on('click', function (e) {
                e.preventDefault();
                console.log($(this).attr("href"));
                actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
                actionForm.attr("action", "/board/get");
                actionForm.trigger("submit");
            });

        });

        function checkModal(result, service) {
            if (result === '' || history.state) {
                return;
            }
            if (service === 'register') {
                $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
            } else if (service === 'modify') {
                $(".modal-body").html("게시글 " + parseInt(result) + " 번이 수정되었습니다.");
            } else if (service === 'remove') {
                $(".modal-body").html("게시글 " + parseInt(result) + " 번이 삭제되었습니다.");
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
            <span class="align-bottom"><c:out value="${pageMaker.total }" /> 개의 글</span>
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
            <%--@elvariable id="list" type="java.util.List<com.jckang.ex02.domain.BoardVO>"--%>
            <c:forEach items="${list}" var="board">
                <tr>
                    <th scope="row">
                        <c:out value="${board.bno }"/>
                    </th>
                    <td>
                        <a class='get-detail' href='<c:out value="${board.bno }"/>'><c:out value="${board.title }"/></a>
                    </td>
                    <td>
                        <c:out value="${board.writer }"/>
                    </td>
                    <td>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate }"/>
                    </td>
                    <td>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- table end -->
    </div>
    <!-- pageMaker Form Start -->
    <%--@elvariable id="pageMaker" type="com.jckang.ex02.domain.PageDTO"--%>
    <form id="actionForm" action="${pageContext.request.contextPath}/board/list" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
    </form>

    <!-- start pagination -->
    <div class="pull-right mt-3">
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <c:if test="${pageMaker.prev}">
                    <li class="page-item">
                        <a class="page-link" href="${pageMaker.startPage - 1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item ${pageMaker.cri.pageNum == num ? "active" : ""}">
                        <a class="page-link page-number" href="${num}">${num}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                    <li class="page-item">
                        <a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
    <!-- end Pagination -->
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
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
            </div>
        </div>
    </div>
</div>
</body>
</html>