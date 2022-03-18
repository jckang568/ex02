<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="h-100">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Guess What</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>
</head>
<style>
    .cs-color {
        background-color: #3a3a3c;
    }

    .test {
        width : 50px;
    }
</style>
<body class="d-flex h-100 text-center text-white bg-dark">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="mb-auto">
        <div>
            <h3 class="float-md-start mb-0">G.F.D</h3>
            <nav class="nav nav-masthead justify-content-center float-md-end">
                <a class="nav-link" aria-current="page" href="/">Home</a>
                <a class="nav-link" href="<c:url value="/board/list"/>">Features</a>
                <a class="nav-link" href="<c:url value="/popup/map"/>">Map</a>
                <a class="nav-link active" href="<c:url value="/game/guesswhat"/>">GW</a>
            </nav>
        </div>
    </header>

    <main class="px-3">

        <div class="container">
            <div class="d-flex justify-content-center row row-cols-5 row-cols-sm-5 row-cols-md-5">
                <c:forEach var="i" begin="0" end="4">
                    <div class="col square box border align-flex-center cs-color m-1">
                        <div class="centered">
                            <p class="fs-7 mb-0 fw-bolder">A</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


        <div class="container mb-auto pe-5 ps-5">
            <div class="d-flex justify-content-center row row-cols-5 row-cols-sm-5 row-cols-md-5">
                <c:forEach var="i" begin="0" end="4">
                    <div class="col square box border align-flex-center cs-color m-1">
                        <div class="centered">
                            <p class="fs-7 mb-0 fw-bolder">A</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="container mb-auto pe-5 ps-5">
            <div class="d-flex justify-content-center row row-cols-5 row-cols-sm-5 row-cols-md-5">
                <c:forEach var="i" begin="0" end="4">
                    <div class="col square box border align-flex-center cs-color m-1">
                        <div class="centered">
                            <p class="fs-7 mb-0 fw-bolder">A</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="container mb-auto pe-5 ps-5">
            <div class="d-flex justify-content-center row row-cols-5 row-cols-sm-5 row-cols-md-5">
                <c:forEach var="i" begin="0" end="4">
                    <div class="col square box border align-flex-center cs-color m-1">
                        <div class="centered">
                            <p class="fs-7 mb-0 fw-bolder">A</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="container mb-5 pb-5 pe-5 ps-5">
            <div class="d-flex justify-content-center row row-cols-5 row-cols-sm-5 row-cols-md-5">
                <c:forEach var="i" begin="0" end="4">
                    <div class="col square box border align-flex-center cs-color m-1">
                        <div class="centered">
                            <p class="fs-7 mb-0 fw-bolder">A</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- keyboard -->
        <div class="container mt-5">
            <div class="d-flex flex-row bd-highlight justify-content-center mb-3">
                <div class="p-2 bd-highlight border w-50">Q</div>
                <div class="p-2 bd-highlight border w-50">W</div>
                <div class="p-2 bd-highlight border w-25">E</div>
                <div class="p-2 bd-highlight border w-25">R</div>
                <div class="p-2 bd-highlight border w-25">T</div>
                <div class="p-2 bd-highlight border w-25">Y</div>
                <div class="p-2 bd-highlight border w-25">U</div>
                <div class="p-2 bd-highlight border w-25">I</div>
                <div class="p-2 bd-highlight border w-25">O</div>
                <div class="p-2 bd-highlight border w-25">P</div>
            </div>
            <div class="d-flex flex-row bd-highlight justify-content-center mb-3">
                <div class="d-inline-flex p-2 bd-highlight border test">1Q</div>
                <div class="d-inline-flex p-2 bd-highlight border test">W</div>
                <div class="d-inline-flex p-2 bd-highlight border test">E</div>
                <div class="d-inline-flex p-2 bd-highlight border test">R</div>
                <div class="d-inline-flex p-2 bd-highlight border test">T</div>
                <div class="d-inline-flex p-2 bd-highlight border test">Y</div>
                <div class="d-inline-flex p-2 bd-highlight border test">U</div>
                <div class="d-inline-flex p-2 bd-highlight border test">I</div>
                <div class="d-inline-flex p-2 bd-highlight border test">O</div>
                <div class="d-inline-flex p-2 bd-highlight border test">P</div>
            </div>
            <div class="d-flex flex-row bd-highlight justify-content-center mb-3">
                <div class="d-inline-flex p-2 bd-highlight border">Q</div>
                <div class="d-inline-flex p-2 bd-highlight border">W</div>
                <div class="d-inline-flex p-2 bd-highlight border">E</div>
                <div class="d-inline-flex p-2 bd-highlight border">R</div>
                <div class="d-inline-flex p-2 bd-highlight border">T</div>
                <div class="d-inline-flex p-2 bd-highlight border">Y</div>
                <div class="d-inline-flex p-2 bd-highlight border">U</div>
                <div class="d-inline-flex p-2 bd-highlight border">I</div>
                <div class="d-inline-flex p-2 bd-highlight border">O</div>
                <div class="d-inline-flex p-2 bd-highlight border">P</div>
            </div>
            <div class="d-flex flex-row bd-highlight justify-content-center mb-3">
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
            </div>
            <div class="d-flex flex-row bd-highlight justify-content-center mb-3">
                <div class="d-inline-flex p-2 bd-highlight border">A</div>
                <div class="p-2 bd-highlight border">W</div>
                <div class="p-2 bd-highlight border">E</div>
                <div class="p-2 bd-highlight border">R</div>
                <div class="p-2 bd-highlight border">T</div>
                <div class="p-2 bd-highlight border">Y</div>
                <div class="p-2 bd-highlight border">U</div>
                <div class="p-2 bd-highlight border">I</div>
                <div class="p-2 bd-highlight border">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                        <path fill="var(--color-tone-1)"
                              d="M22 3H7c-.69 0-1.23.35-1.59.88L0 12l5.41 8.11c.36.53.9.89 1.59.89h15c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H7.07L2.4 12l4.66-7H22v14zm-11.59-2L14 13.41 17.59 17 19 15.59 15.41 12 19 8.41 17.59 7 14 10.59 10.41 7 9 8.41 12.59 12 9 15.59z"></path>
                    </svg>
                </div>
            </div>
        </div>

        <div class="container mt-5">
            <div class="d-flex justify-content-center me-md-5 ms-md-5">
                <c:forEach var="i" begin="0" end="9">
                    <div class="col-sm square box m-1">
                        <div class="inner border align-flex-center">
                            <div class="centered">
                                <p class="fs-7 mb-0">A</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="container">
            <div class="d-flex justify-content-center pe-3 ps-3 me-md-5 ms-md-5">
                <c:forEach var="i" begin="0" end="8">
                    <div class="col-sm square box m-1">
                        <div class="inner border align-flex-center">
                            <div class="centered">
                                <p class="fs-7 mb-0">A</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="container">
            <div class="d-flex justify-content-center me-md-5 ms-md-5">
                <c:forEach var="i" begin="0" end="9">
                    <div class="col-sm square box m-1">
                        <div class="inner border align-flex-center">
                            <div class="centered">
                                <p class="fs-7 mb-0">A</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </main>

    <%--<footer class="mt-auto text-white-50">
        <p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a
                href="https://twitter.com/mdo" class="text-white">@mdo</a>.</p>
    </footer>--%>
</div>
</body>
</html>