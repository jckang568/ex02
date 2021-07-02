<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light"> -->
<nav
        class="nav nav-underline navbar navbar-expand-lg fixed-top navbar-dark bg-dark"
        aria-label="Main navigation">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ex02</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarScroll" aria-controls="navbarScroll"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll">
                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="#">홈</a></li>
                <li class="nav-item"><a class="nav-link" href="/board/list">목록</a></li>
                <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" href="#"
                        id="navbarScrollingDropdown" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"> Link </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link disabled" href="#"
                                        tabindex="-1" aria-disabled="true">Link</a></li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search"
                       aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>