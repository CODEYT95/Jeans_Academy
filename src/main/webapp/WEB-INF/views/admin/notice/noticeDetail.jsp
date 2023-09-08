<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <script type="text/javascript" src="../../../../resources/js/admin/notice/noticeDetail.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/admin/notice/noticeDetail.css">
</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
    <div class="main--content">
        <span class="category-label">공지사항</span>
        <div class="main-container">
            <!-- Modal -->
            <div class="modal-container">
              <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p>정말 삭제하시겠습니까?</p>
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
            <c:if test="${not empty noticeDetail}">
            <div class="title-container">
                <div class="write-title">
                    <label>
                        <span>제목</span>
                        <textarea name="title">${noticeDetail.notice_title}</textarea>
                    </label>
                </div>

                    <div class="write-content">
                        <span class="content-label">내용</span>
                        <div class="content" contenteditable="false" >${noticeDetail.notice_content}</div>
                    </div>
            </div>
            </c:if>
            <div class="content-container">
                <input type="button" class="insert-reply" value="댓글 등록">
            </div>
            <div class="reply-container">
                <div>
                    <label>
                        <textarea class="reply-insert" maxlength="300"></textarea>
                    </label>
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
</body>