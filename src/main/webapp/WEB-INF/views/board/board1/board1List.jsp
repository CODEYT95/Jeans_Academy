<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>1반 게시글 목록</title>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/board/board1List.css">
    <script type="text/javascript" src="../../../resources/js/board/board1.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <script>
    $(document).ready(function() {
        let menu = $('.menu');
        let sidebar = $('.sidebar');
        let mainContent = $('.main--content');
        menu.click(function() {
            sidebar.toggleClass('active');
            mainContent.toggleClass('active');
        });
    });

    /* 추가한 기능 */

    function moveSlide(direction) {
        let currentSlide = 0;
        const slides = document.querySelectorAll(".carousel-item");
        const maxSlide = slides.length;

        currentSlide += direction;
        if (currentSlide < 0) {
            currentSlide = maxSlide - 1;
        } else if (currentSlide >= maxSlide) {
            currentSlide = 0;
        }

        const slideWidth = slides[0].clientWidth;
        const offset = -currentSlide * slideWidth;
        document.querySelector(".carousel-inner").style.transform = `translateX(${offset}px)`;
    }

    </script>

</head>
<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans:청바지:</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로 <span style="color:#5073FB">지</span>금!</h5>
    </div>
    <div class="search--notification--profile">
        <div class="notification--profile">
            <div class="picon bell">
                <i class="ri-notification-2-line"></i>
            </div>
            <div class="picon chat">
                <i class="ri-mail-line"></i>
            </div>
            <div class="picon profile">
                <span>???님 오늘도 파이팅하세요:미소짓는_얼굴:</span>
            </div>
        </div>
    </div>
</section>
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a href="#" id="active--link">
                    <span class="icon icon-1"><i class="ri-home-4-line"></i></span>
                    <span class="sidebar--item">홈</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-2"><i class="ri-megaphone-line"></i></span>
                    <span class="sidebar--item">공지사항</span>
                </a>
            </li>
            <li>
                <a href="/board1/list">
                    <span class="icon icon-3"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">1반</span>
                </a>
            </li>
            <li>
                <a href="/board2/list">
                    <span class="icon icon-4"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">2반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-5"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">3반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-6"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">4반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-7"><i class="ri-questionnaire-line"></i></span>
                    <span class="sidebar--item">QnA</span>
                </a>
            </li>
        </ul>
        <ul class="sidebar--bottom-items">
            <li>
                <a href="#">
                    <span class="icon icon-8"><i class="ri-user-3-line"></i></span>
                    <span class="sidebar--item">마이페이지</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-9"><i class="ri-logout-box-r-line"></i></span>
                    <span class="sidebar--item">로그아웃</span>
                </a>
            </li>
        </ul>
    </div>


    <div class="main--content">

        <div class = "title--container">
            <div>
                1반 게시판입니다
            </div>
        </div>

        <div class = "image-container">
            <div class="image">
                <img src="" alt="이미지">
            </div>
        </div>

        <div class = "carousel-container">
            <div class="carousel">
                <div class="carousel-inner">
                    <button class="carousel-btn prev-btn" onclick="moveSlide(-1)">&lt;</button>
                    <c:forEach var="board" items="${board1List}">
                        <div class="carousel-item">
                            <a href="/board1/detail/${board.board1_no}">${board.board1_title}</a>
                            <p>${board.board1_content}</p>
                        </div>
                    </c:forEach>
                    <button class="carousel-btn next-btn" onclick="moveSlide(1)">&gt;</button>
                </div>
            </div>
        </div>

        <div class = "class--conatiner">
            <div class="boxes">
                <c:forEach var="board1List" items="${board1List}">
                    <div class="box">
                        <a href="/board1/detail/${board1List.board1_no}">${board1List.board1_title}</a>
                        <p>${board1List.board1_content}</p>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>
</section>
</body>
</html>