<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="h-100">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ground for development</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        div.col.border.box {
            width:60px;
            height:60px;
        }

        .square {
            width: 50%;
            position: relative;
        }

        .square:after {
            content: "";
            display: block;
            padding-bottom: 100%;
        }

        .inner {
            position: absolute;
            width: 100%;
            height: 100%;
        }
        .centered { vertical-align : middle; display: table; margin-left: auto; margin-right: auto; }

    </style>
</head>
<body class="d-flex h-100 text-center text-white bg-dark">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="mb-auto">
        <div>
            <h3 class="float-md-start mb-0">G.F.D</h3>
            <nav class="nav nav-masthead justify-content-center float-md-end">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
                <a class="nav-link" href="<c:url value="/board/list"/>">Features</a>
                <a class="nav-link" href="<c:url value="/popup/map"/>">Map</a>
                <a class="nav-link" href="<c:url value="/game/guesswhat"/>">GW</a>
            </nav>
        </div>
    </header>

    <main class="px-3">
        <div class="container mb-auto">
            <div class="d-flex justify-content-around">
                <div class="col square box m-2">
                    <div class="inner border">
                        <div class="centered">A</div>
                    </div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">
                        <div class="align-content-center m-4">A</div>
                    </div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
            </div>
        </div>
        <div class="container mb-auto">
            <div class="d-flex justify-content-around">
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
            </div>
        </div>
        <div class="container mb-auto">
            <div class="d-flex justify-content-around">
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
            </div>
        </div>
        <div class="container mb-auto">
            <div class="d-flex justify-content-around">
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
                <div class="col square box m-2">
                    <div class="inner border">내부 컨텐츠</div>
                </div>
            </div>
        </div>
        <div class="container">
            <h1 style>Cover your page.</h1>
        </div>
    </main>

    <%--<footer class="mt-auto text-white-50">
        <p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a
                href="https://twitter.com/mdo" class="text-white">@mdo</a>.</p>
    </footer>--%>
</div>
</body>
</html>