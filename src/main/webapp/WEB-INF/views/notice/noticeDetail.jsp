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
    <link rel="stylesheet" type="text/css" href="../../../resources/css/notice/noticeDetail.css">
    <script type="text/javascript" src="../../../resources/js/notice/noticeDetail.js"></script>
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
                <a href="/noticeList" id="active--link">
                    <span class="icon icon-2"><i class="ri-megaphone-line" style="color:white;"></i></span>
                    <span class="sidebar--item">공지사항</span>
                </a>
            </li>
            <li>
                <a href="/board1/list" class="sideBoard1">
                    <span class="icon icon-3"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">1반</span>
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
        <div class="main-container">
            <!-- Modal -->
            <div class="modal-container">
              <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p>정말 삭제하시겠습니까???</p>
                    <!-- 삭제 확인 및 취소 버튼 -->
                    <div class="confirm-container">
                      <button id="confirmDelete">확인</button>
                      <button id="cancelDelete">취소</button>
                    </div>
                </div>
              </div>
            </div>
            <button class="delete">삭제</button>
            <button class="edit">수정</button>
            <div class="title-container">
                <div class="write-title">
                    <label>
                        <span>제목</span>
                        <textarea name="title"></textarea>
                    </label>
                </div>
            </div>
            <div class="content-container">
                <c:if test="${not empty noticeDetail}">
                    <div class="write-content">
                        <span class="content-label">${noticeDetail.notice_title}</span>
                        <div class="content" contenteditable="true"></div>
                    </div>
                </c:if>
                <input type="button" class="insert-reply" value="댓글 등록">
            </div>
            <div class="reply-container">
                <div>
                    <textarea class="reply-insert" maxlength="300"></textarea>
                </div>
                <div class="reply-content-container">
                    <ul>
                        <li>
                            <div class="reply-info">
                                <span class="reply-class">1반</span>
                                <span class="reply-name">홍길동</span>
                                <span class="reply-regdate">2023-08-30</span>
                                <input type="button" class="reply-edit" value="수정">
                                <input type="button" class="reply-delete" value="삭제">
                            </div>
                            <p class="reply-content">안녕하세요 댓글 테스트 중입니다 ㅎㅎㅎㅎㅎㅎㅎ</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</form>

</section>
</body>