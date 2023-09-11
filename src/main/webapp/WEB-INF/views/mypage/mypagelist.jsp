<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page"xmlns:fmt="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/mypage/mypage.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script type="text/javascript" src="../../../resources/js/mypage/mypage.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
    <div class="main--content">
        <div class="title-box">
            <div class="title">
                나의 현황
            </div>
        </div>
        <div class="mypage-list">
            <div class="outer-gird">
                <div class="/mypage-board1">
                    <div class="b-outer-gird1">
                        <div class="list-boxtitle1">개인정보</div>
                        <div class="b-list1">
                            <div class="list-id">
                                <p><strong>ID:</strong>
                                    <span>${member.member_id}</span></p>
                            </div>
                            <div class="list-pw">
                                <p><strong>반 번호:</strong>
                                    <span>${member.member_class}</span></p>
                            </div>
                            <div class="list-day">
                                <p><strong>Day:</strong><span><fmt:formatDate value="${member.member_day}" pattern="yyyy-MM-dd"/></span></p>
                            </div>
                            <div class="list-phon">
                                <p><strong>Phon_Number:</strong><span>${member.member_phone}</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mypage-board2">
                    <div class="b-outer-gird2">
                        <div class="list-boxtitle2">내가 작성한 글</div>
                            <div class="b-list2">

                                <c:forEach items="${board}" var="writeList">
                                    <div class="boardlist">
                                        <a href="/board1/detail/${writeList.board1_no}" class="class1">${writeList.board1_title}</a>
                                        <a href="/board2/detail/${writeList.board2_no}" class="class1">${writeList.board2_title}</a>
                                        <a href="/board3/detail/${writeList.board3_no}" class="class1">${writeList.board3_title}</a>
                                        <a href="/board4/detail/${writeList.board4_no}" class="class1">${writeList.board4_title}</a>
                                    </div>
                                </c:forEach>
                            </div>
                    </div>
                </div>
                <div class="calendar">
                    <div class="c-outer-gird">
                        <div class="calendar-header">
                            <button id="prev-month"><i class="fa-solid fa-angle-left fa-xl"></i></button>
                            <h2 id="month-year">2023년 8월</h2>
                            <button id="next-month"><i class="fa-solid fa-angle-left fa-rotate-180 fa-xl"></i></button>
                        </div>
                        <div class="calendar-board">
                            <div class="calendar-grid" id="calendar-grid">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="modal" class="modal">
                    <div class="modal-content">
                        <div class="modal-title">출석 체크</div>
                        <button id="attendance-button">출석</button>
                    </div>
                </div>
                <!-- 모달과 관련된 코드는 그대로 둡니다 -->

                <div class="event-form">
                    <div class="c-outer-gird2">
                        <h3>일정 추가</h3>
                        <div class="c-title">
                            <!-- 일정 입력 폼 -->
                                <input type="date" name="date" id="event-date">
                                <input type="text" name="title" id="event-title" placeholder="일정 제목">
                                <button class="add-event-button">일정 추가</button>
                        </div>
                        <!-- 일정 목록 추가 -->
                        <div class="event-list">
                            <div class="event-title">
                                <ul>
                                <c:forEach items="${eventList}" var="eventList">
                                    <input type="hidden" data-mypageno="${eventList.mypage_no}" value="${eventList.mypage_no}">
                                    <div class="event-item">
                                    <spandate>날짜: <fmt:formatDate value="${eventList.mypage_regdate}" pattern="yyyy-MM-dd"/></spandate>
                                        <spanevent>: ${eventList.mypage_content}</spanevent>
                                        <div class="delete-button">
                                        <button class="delete-event-button" data-event-id="${eventList.member_id}">일정 삭제</button>
                                    </div>
                                    </div>
                                </c:forEach>
                            </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
