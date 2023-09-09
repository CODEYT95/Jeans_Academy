<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../../../resources/js/admin/notice/noticeDetail.js"></script>
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
            <c:if test="${not empty noticeDetail}">
            <c:if test="${member_id eq noticeDetail.member_id}">
            <div class="modal-container">
              <div id="myModal" class="modal">
                <div class="modal-content">
                    <p>정말 게시글을 삭제하시겠습니까?</p>
                    <div class="confirm-container">
                      <button id="confirmDelete">확인</button>
                      <button id="cancelDelete">취소</button>
                    </div>
                </div>
              </div>
            </div>
            <button class="delete">삭제</button>
            <button class="edit">수정</button>
            </c:if>
                <input type="hidden" class="param-member_id" value="${noticeDetail.member_id}">
                <input type="hidden" class="param-notice_no" value="${noticeDetail.notice_no}">
            <div class="title-container">
                <div class="write-title">
                    <label>
                        <span>제목</span>
                        <textarea name="title" readonly="readonly">${noticeDetail.notice_title}</textarea>
                    </label>
                </div>

                    <div class="write-content">
                        <span class="content-label">내용</span>
                        <div class="content" contenteditable="false" >${noticeDetail.notice_content}</div>
                    </div>
            </div>
            </c:if>
            <div class="content-container">
                <input type="button" id="insert-reply" class="insert-reply" value="댓글 등록">
                <input type="button" id="update-reply" class="insert-reply" value="댓글 수정">
            </div>
            <div class="reply-container">
                <div>
                    <label>
                        <textarea class="reply-insert" maxlength="200" placeholder="댓글을 입력해주세요"></textarea>
                    </label>
                </div>
                <span>댓글 수 : ${replyCount}</span>
                <div class="reply-content-container">
                    <div class="modal--container">
                        <div id="replyDeleteModal">
                            <div class="replyModal-content">
                                <p>정말 게시글을 삭제하시겠습니까?</p>
                                <div class="reply-confirm-container">
                                    <button id="replyConfirmDelete">확인</button>
                                    <button id="replyCancelDelete">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <ul>
                        <c:forEach items="${nreplyDetail}" var="reply">
                        <li>
                            <div class="reply-info" data-reply-no="${reply.comment_no}">
                                <span class="reply-class">${reply.member_class}</span>
                                <span class="reply-name">${reply.member_name}</span>
                                <span class="reply-regdate">${reply.comment_regdate}</span>
                                <c:if test="${member_id eq reply.member_id}">
                                <input type="button" class="reply-edit" value="수정">
                                <input type="button" class="reply-delete" value="삭제">
                                </c:if>
                                <p class="reply-content" data-reply-content="${reply.comment_content}">${reply.comment_content}</p>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>