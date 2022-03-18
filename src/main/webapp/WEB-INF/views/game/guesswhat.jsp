<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Guess What</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>">
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-3.6.0.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.flip.min.js"/>"></script>
</head>
<style>
    .cs-color {
        background-color: #3a3a3c;
    }

    @media screen and (max-width: 508px) {
        .test {
            height: 50px;
            width: 37px;
        }
    }

    @media screen and (min-width: 509px) {
        .test {
            height: 60px;
            width: 45px;
        }
    }


    div svg {
        fill: #fff;
    }

    .key-bg {
        background-color: #808384;
    }

    .cs-height {
        height: calc(100vh - 67px);
    }

    html, body {
        width: 100%;
        height: 100%;
    }

    .parent {
        overflow: hidden;
    }

    .bg-correct {
        background-color: #538d42;
    }

    .bg-incorrect {
        background-color: #3a3a3c;
    }

    .bg-half-correct {
        background-color: #b49f3b;
    }

</style>


<script>

    const answer = 'horse';
    let inputAnswer = '';
    let inputArray = [];
    const regExp = /^[a-zA-Z].{0}$/;
    jQuery(function () {
        jQuery('#keyboard div.test').on('click', function () {
            let clickedKey = jQuery(this).find('p').data('key');
        });
        jQuery(document).on('keyup', function (e) {

            // Enter키 일 때
            if (e.key === 'Enter') {
                if (inputAnswer.length < 5) {
                    alert('5자 입력');
                    return false;
                }
                /* 확인 로직 후 */
                for (let i = 0; i < 5; i++) {
                    let bgClass;

                    for (let j = 0; j < 5; j++) {
                        if (j === 0) {
                            bgClass = '';
                        }
                        if (inputAnswer.charAt(i) === answer.charAt(j) && i === j) {
                            /*jQuery('#keyboard p[data-key="' + inputAnswer.charAt(i).toUpperCase() + '"]').parent().parent().removeClass('key-bg').addClass('bg-correct');*/
                            bgClass = 'bg-correct';


                            break;
                        } else if (inputAnswer.charAt(i) === answer.charAt(j) && i !== j) {
                            /*jQuery('#keyboard p[data-key="' + inputAnswer.charAt(i).toUpperCase() + '"]').parent().parent().removeClass('key-bg').addClass('bg-half-correct');*/
                            bgClass = 'bg-half-correct';
                        } else {
                            if (j === 4 && !bgClass) {
                                bgClass = 'bg-incorrect';
                                /*jQuery('#keyboard p[data-key2="' + inputAnswer.charAt(i).toUpperCase() + '"]').parent().parent().removeClass('key-bg').addClass('bg-incorrect');*/
                            }
                        }

                        /*if(j === 4){
                            jQuery('#keyboard p[data-key="' + inputAnswer.charAt(i).toUpperCase() + '"]').parent().parent().removeClass('key-bg').addClass(bgClass);
                        }*/
                    }
                    console.log(bgClass);
                    let target = jQuery('#keyboard p[data-key="' + inputAnswer.charAt(i).toUpperCase() + '"]').parent().parent();
                    if (target.hasClass('key-bg')) {
                        target.removeClass('key-bg').addClass(bgClass);
                    } else if (target.hasClass('bg-half-correct')) {
                        target.removeClass('bg-half-correct').addClass(bgClass);
                    }

                }


                inputArray.push(inputAnswer);
                inputAnswer = '';
                /* 숫자 뒤집기 */
                for (let i = 1; i < 6; i++) {
                    setTimeout(function () {
                        jQuery('#flip' + (inputArray.length) + '-' + i).flip('toggle');
                    }, i * 400);
                }

                /*jQuery('#row').find('p').each(function(){
                   jQuery('#row1-1').flip();
                });*/

                // backspace
            } else if (e.key === 'Backspace') {
                inputAnswer = inputAnswer.substring(0, inputAnswer.length - 1);
                jQuery('.row' + (inputArray.length + 1) + '-' + (inputAnswer.length + 1)).html('');

                // 영문 입력 키
            } else if (regExp.test(e.key)) {
                if (inputAnswer.length === 5) {
                    return false;
                }
                inputAnswer += e.key;

                let target = jQuery('.row' + (inputArray.length + 1) + '-' + inputAnswer.length);
                target.html(e.key.toUpperCase());

                target.parent().parent().css("transform", "scale(1.1)").css("transform", "scale(1)");

                /*target.parent().parent().animate({transform: 1.2},
                    {duration:500,
                        step: function(now, fx) {
                            $(this).css('transform','scale('+now+')')}
                    }).animate({transform: 1},
                    {duration:500,
                        step: function(now, fx) {
                            $(this).css('transform','scale('+now+')')}
                    });*/

            } else {
                return false;
            }

        });

        jQuery('.flip').flip(
            {
                trigger: 'manual',
                axis: 'x'
            }
        );


    });

    function fn_compare(a, b) {

    }

</script>

<body class="d-flex flex-column h-100 text-center text-white bg-dark">
<%--<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
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
    </header>--%>

<%@include file="../includes/nav.jsp" %>

<main class="container">


    <div class="container mt-sm-5 pt-sm-5 mt-4 pt-5">
        <div class="d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="5">
                <div id="flip1-${i}" class="m-1 box flip">
                    <div class="col square align-flex-center cs-color front">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row1-${i}"></p>
                        </div>
                    </div>
                    <div class="col square align-flex-center cs-color back">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row1-${i}"></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


    <div class="container mb-auto">
        <div class="d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="5">
                <div id="flip2-${i}" class="m-1 box flip">
                    <div class="col square align-flex-center cs-color front">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row2-${i}"></p>
                        </div>
                    </div>
                    <div class="col square align-flex-center cs-color back">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row2-${i}"></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="container mb-auto">
        <div class="d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="5">
                <div id="flip3-${i}" class="m-1 box flip">
                    <div class="col square align-flex-center cs-color front">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row3-${i}"></p>
                        </div>
                    </div>
                    <div class="col square align-flex-center cs-color back">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row3-${i}"></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="container mb-auto">
        <div class="d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="5">
                <div id="flip4-${i}" class="m-1 box flip">
                    <div class="col square align-flex-center cs-color front">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row4-${i}"></p>
                        </div>
                    </div>
                    <div class="col square align-flex-center cs-color back">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row4-${i}"></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="container mb-auto">
        <div class="d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="5">
                <div id="flip5-${i}" class="m-1 box flip">
                    <div class="col square align-flex-center cs-color front">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row5-${i}"></p>
                        </div>
                    </div>
                    <div class="col square align-flex-center cs-color back">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row5-${i}"></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="container mb-auto">
        <div class="d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="5">
                <div id="flip6-${i}" class="m-1 box flip">
                    <div class="col square align-flex-center cs-color front">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row6-${i}"></p>
                        </div>
                    </div>
                    <div class="col square align-flex-center cs-color back">
                        <div class="centered">
                            <p class="fs-2 mb-0 fw-bolder row6-${i}"></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <c:set var="array1" value="${fn:split('Q,W,E,R,T,Y,U,I,O,P',',')}"/>
    <c:set var="array2" value="${fn:split('A,S,D,F,G,H,J,K,L',',')}"/>
    <c:set var="array3" value="${fn:split('Z,X,C,V,B,N,M',',')}"/>


</main>

<footer class="footer mt-auto py-3">
    <!-- keyboard -->
    <div class="container" id="keyboard">
        <div class="d-flex flex-row bd-highlight justify-content-center mb-2">
            <c:forEach items="${array1}" var="item" varStatus="i">
                <div class="d-inline-flex align-flex-center p-1 bd-highlight test rounded-1 m-1 key-bg">
                    <div class="centered">
                        <p class="fs-6 mb-0 fw-bolder" data-key="${item}">${item}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="d-flex flex-row bd-highlight justify-content-center mb-2">
            <c:forEach items="${array2}" var="item" varStatus="i">
                <div class="d-inline-flex align-flex-center p-1 bd-highlight test rounded-1 m-1 key-bg">
                    <div class="centered">
                        <p class="fs-6 mb-0 fw-bolder" data-key="${item}">${item}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="d-flex flex-row bd-highlight justify-content-center mb-2">
            <div class="d-inline-flex align-flex-center p-1 bd-highlight test rounded-1 m-1 key-bg"
                 style="width: 70px">
                <div class="centered">
                    <p class="fs-6 mb-0 fw-bolder" data-key="enter">Enter</p>
                </div>
            </div>
            <c:forEach items="${array3}" var="item" varStatus="i">
                <div class="d-inline-flex align-flex-center p-1 bd-highlight test rounded-1 m-1 key-bg">
                    <div class="centered">
                        <p class="fs-6 mb-0 fw-bolder" data-key="${item}">${item}</p>
                    </div>
                </div>
            </c:forEach>
            <div class="d-inline-flex align-flex-center p-1 bd-highlight test rounded-1 m-1 key-bg" style="width: 70px">
                <div class="centered">
                    <p class="fs-6 mb-0 fw-bolder" data-key="back">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                            <path fill="var(--color-tone-1)"
                                  d="M22 3H7c-.69 0-1.23.35-1.59.88L0 12l5.41 8.11c.36.53.9.89 1.59.89h15c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H7.07L2.4 12l4.66-7H22v14zm-11.59-2L14 13.41 17.59 17 19 15.59 15.41 12 19 8.41 17.59 7 14 10.59 10.41 7 9 8.41 12.59 12 9 15.59z"></path>
                        </svg>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- keyboard end -->
</footer>

<%--<footer class="mt-auto text-white-50">
    <p>Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a
            href="https://twitter.com/mdo" class="text-white">@mdo</a>.</p>
</footer>--%>
<%--</div>--%>
</body>
</html>