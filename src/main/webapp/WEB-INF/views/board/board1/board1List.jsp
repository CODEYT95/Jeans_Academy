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
    <script type="text/javascript" src="../../../../resources/js/common/sidebar.js"></script>
</head>
<body data-member-class="${member_class}">
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans👖</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로
        <span style="color:#5073FB">지</span>금!</h5>
    </div>
    <div class="search--notification--profile">
        <div class="notification--profile">
            <a href="/message/messageList">
                <div class="picon chat">
                    <i class="ri-mail-line" ></i>
                </div>
            </a>
            <div class="picon profile">
                <span>${member_class} ${member_name}님 오늘도 파이팅하세요🙂</span>
            </div>
        </div>
    </div>
</section>
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a href="/main1">
                    <span class="icon icon-1"><i class="ri-home-4-line"></i></span>
                    <span class="sidebar--item">홈</span>
                </a>
            </li>
            <li>
                <a href="/noticeList">
                    <span class="icon icon-2"><i class="ri-megaphone-line"></i></span>
                    <span class="sidebar--item">공지사항</span>
                </a>
            </li>
            <li>
                <a href="/board1/list" id="active--link" class="sideBoard1">
                    <span class="icon icon-3"><i class="ri-draft-line" style="color:white;"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;" >1반</span>
                </a>
            </li>
            <li>
                <a href="/board2/list" class="sideBoard2">
                    <span class="icon icon-4"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">2반</span>
                </a>
            </li>
            <li>
                <a href="/board3/list" class="sideBoard3">
                    <span class="icon icon-5"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">3반</span>
                </a>
            </li>
            <li>
                <a href="/board4/list" class="sideBoard4">
                    <span class="icon icon-6"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">4반</span>
                </a>
            </li>
            <li>
                <a href="/question/list">
                    <span class="icon icon-7"><i class="ri-questionnaire-line"></i></span>
                    <span class="sidebar--item">QnA</span>
                </a>
            </li>
            <c:if test="${member_type == '관리자'}">
                <li>
                    <a href="/admin/memberList">
                        <span class="icon icon-10"><i class="ri-admin-line"></i></span>
                        <span class="sidebar--item">Admin</span>
                    </a>
                </li>
            </c:if>
        </ul>
        <ul class="sidebar--bottom-items">
            <li>
                <a href="#">
                    <span class="icon icon-8"><i class="ri-user-3-line"></i></span>
                    <span class="sidebar--item">마이페이지</span>
                </a>
            </li>
            <li>
                <a href="/logout">
                    <span class="icon icon-9"><i class="ri-logout-box-r-line"></i></span>
                    <span class="sidebar--item">로그아웃</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="main--content">
        <div class = "title--container">
            <!-- 같은 반일 경우에만 글쓰기 처리 -->
            <c:if test="${memberDTO.member_class == '1반' || member_type.equals('관리자') || member_type.equals('강사님')}">
            <button type="button" class="button" onclick="location.href='/board1/write'">글쓰기</button>
            </c:if>
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
                    <c:forEach var="notice" items="${noticeList}" varStatus="loop" begin="0" end="4">
                        <label class="item"  for="t-${loop.index + 1}">
                            <h2><a href="/noticeDetail/${notice.notice_no}">${notice.notice_title}</a></h2>
                            <h3>${notice.notice_content}</h3>
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