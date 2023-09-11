<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://www.w3.org/XML/1998/namespace">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/admin/notice/noticeList.css">
    <script type="text/javascript" src="../../../../resources/js/admin/notice/noticeList.js"></script>

</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
    <div class="main--content">
        <div class="notice-body">
            <div class="notice-title">
                <h1>공지사항</h1>
            </div>
            <c:if test="${member_class eq '💓'}">
                <a class="insertBtn" href="/noticeInsert">
                    <button>글쓰기</button>
                </a>
            </c:if>
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
                    <c:forEach items="${noticeList}" var="notice" varStatus="status">
                        <li>
                            <span class="no">${status.index + 1}</span>
                            <a class="view-link" href="/noticeDetail/${notice.notice_no}">
                                <span class="title">${notice.notice_title}</span>
                            </a>
                            <div class="writer-container">
                                <span class="writer">${notice.member_id}</span>
                            </div>
                            <span class="reg"><fmt:formatDate value="${notice.notice_regdate}" pattern="yyyy-MM-dd" /></span>
                            <span class="count">${notice.notice_count}</span>
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
</body>
</html>