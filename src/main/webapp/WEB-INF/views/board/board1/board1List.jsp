<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:c="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>1반 게시글 목록</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/board/boardList.css">
    <script type="text/javascript" src="../../../../resources/js/board/boardList.js"></script>
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
                <span>${member_id}님 오늘도 파이팅하세요:미소짓는_얼굴:</span>
            </div>
        </div>
    </div>
</section>
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a href="/main1" id="active--link">
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
            <button type="button" class="button" onclick="location.href='/board1/write'">글쓰기</button>
            <div class="title-content"><h1>1반 게시판입니다</h1></div>
        </div>
        <div class="slide-container">
            <div class="slider">
                <input type="radio" name="testimonial" id="t-1"checked>
                <input type="radio" name="testimonial" id="t-2">
                <input type="radio" name="testimonial" id="t-3">
                <input type="radio" name="testimonial" id="t-4">
                <input type="radio" name="testimonial" id="t-5">
                <div class="testimonials">
                    <c:forEach var="board" items="${board1List}" varStatus="loop" begin="0" end="4">
                        <label class="item"  for="t-${loop.index + 1}">
                            <h2><a href="/board1/detail/${board.board1_no}">${board.board1_title}</a></h2>
                            <h3>${board.board1_content}</h3>
                        </label>
                    </c:forEach>
                </div>
                <div class="dots">
                    <label for="t-1"></label>
                    <label for="t-2"></label>
                    <label for="t-3"></label>
                    <label for="t-4"></label>
                    <label for="t-5"></label>
                </div>
            </div>
        </div>
        <div class = "box-container">
            <div class="boxes">
                <c:forEach var="board1List" items="${board1List}">
                    <div class="box">
                        <div>
                            <button type="button" class="box-button" onclick="location.href='/board1/detail/${board1List.board1_no}'">상세</button>
                        </div>
                        <div>
                            <h1>${board1List.board1_title}</h1>
                            <p>${board1List.board1_content}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
</body>
</html>