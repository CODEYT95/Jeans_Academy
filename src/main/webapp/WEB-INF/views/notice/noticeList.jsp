<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/notice/noticeList.css">
    <script type="text/javascript" src="../../../resources/js/notice/noticeList.js"></script>
</head>
<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans👖</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로
        <span style="color:#5073FB">지</span>금!</h5>
    </div>
    <div class="search--notification--profile">
        <div class="notification--profile">
            <div class="picon chat">
                <i class="ri-mail-line"></i>
            </div>
            <div class="picon profile">
                <span>???님 오늘도 파이팅하세요🙂</span>
            </div>
        </div>
    </div>
</section>
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a href="#">
                    <span class="icon icon-1"><i class="ri-home-4-line"></i></span>
                    <span class="sidebar--item">홈</span>
                </a>
            </li>
            <li>
                <a href="#" id="active--link">
                    <span class="icon icon-2"><i style="color:white;" class="ri-megaphone-line"></i></span>
                    <span class="sidebar--item">공지사항</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-3"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">1반</span>
                </a>
            </li>
            <li>
                <a href="#">
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
        <div class="notice-body">
            <div class="notice-title">
                <h1>공지사항</h1>
            </div>
            <div class="subject-line">
                <header class="line">
                    <div class="subject-name">
                        <h3 class="board-no">번호</h3>
                        <h3 class="board-title">제목</h3>
                        <h3 class="board-writer">작성자</h3>
                        <h3 class="board-reg">작성날짜</h3>
                        <h3 class="board-count">조회수</h3>
                    </div>
                </header>
                <ul>
                    <c:forEach items="${noticeList}" var="notice">
                        <li>
                            <span class="no">${notice.notice_no}</span>
                            <a class="view-link">
                                <span class="title">${notice.notice_content}</span>
                            </a>
                            <div class="writer-container">
                                <span class="writer">${notice.member_name}</span>
                            </div>
                            <span class="reg">${notice.notice_regdate}</span>
                            <span class="count">111</span>
                        </li>
                    </c:forEach>
                    <div class="container">
                        <button class="button" id="startBtn" disabled>
                            <i class="fa-solid fa-angles-left"></i>
                        </button>
                        <button class="button prevNext" id="prev" disabled>
                            <i class="fa-solid fa-angle-left"></i>
                        </button>
                        <div class="links">
                            <a href="#" class="link active">1</a>
                            <a href="#" class="link">2</a>
                            <a href="#" class="link">3</a>
                            <a href="#" class="link">4</a>
                            <a href="#" class="link">5</a>
                        </div>
                        <button class="button prevNext" id="next">
                            <i class="fa-solid fa-angle-right"></i>
                        </button>
                        <button class="button" id="endBtn">
                            <i class="fa-solid fa-angles-right"></i>
                        </button>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</section>
</body>
</html>