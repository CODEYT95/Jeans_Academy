<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html xmlns:c="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>👖1반 게시글 수정</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/board/boardModify.css">
    <script type="text/javascript" src="../../../../resources/js/board/board1/board1Modify.js"></script>
    <style>
        body{
        background-color: rgba(186, 225, 245, 0.3);
        }
    </style>
</head>
<body data-member-class="${member_class}" data-category="${category}" data-member-type="${member_type}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
    <div class="main--content">
        <form action="/board1/modify" method="post">
            <input type="hidden" name="member_id" value="${member_id}">
            <input type="hidden" name="member_name" value="${member_name}">
            <input type="hidden" name="member_class" value="${member_class}">
            <input type="hidden" id="board1_no" name="board1_no" value="${board1DTO.board1_no}">
            <div class="head-container">
                <button id="save" class="main-ori-button">저장</button>
                <button type="button" class="main-ori-button" onclick="location.href='/board1/list'">목록</button>
                <button type="button" class="main-ori-button" onclick="location.href='/board1/detail/${board1DTO.board1_no}'">취소</button>
                <div class="title-container">
                    <div class="write-title">
                        <div class="text">글 수정</div>
                        <label>
                            <div><span>제목</span></div>
                            <textarea id="board1_title" name="board1_title" placeholder="제목을 입력하세요" maxlength="20" required>${board1DTO.board1_title}</textarea>
                        </label>
                    </div>
                </div>
            </div>
            <div class="content-container">
                <div class="write-content">
                    <span class="content-label">내용</span>
                    <div class="content-textarea" id="board1_content" name="board1_content" contenteditable="true">${board1DTO.board1_content}</div>
                    <input type="file" id="photo-input" accept="image/gif, image/jpeg, image/png, image/webp" multiple style="display: none;">
                    <input type="button" class="content-file" value="사진 수정">
                </div>
            </div>
        </form>
    </div>
</body>
</html>