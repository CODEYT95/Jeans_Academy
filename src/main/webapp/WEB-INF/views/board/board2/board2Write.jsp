<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html xmlns:c="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/board/boardWrite.css">
    <script type="text/javascript" src="../../../../resources/js/board/board2/board2Write.js"></script>
    <style>
        body{
        background-color: rgba(246, 192, 252, 0.2);
        }
    </style>
</head>
<body data-member-class="${member_class}" data-category="${category}" data-member-type="${member_type}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<div class="main--content">
    <form action="/board2/write" method="post" enctype="multipart/form-data">
        <input type="hidden" name="member_id" value="${member_id}">
        <div class="head-container">
            <button id="save" class="main-ori-button">저장</button>
            <button type="button" class="main-ori-button" onclick="location.href='/board2/list'">취소/목록</button>
            <div class="title-container">
                <div class="write-title">
                    <div class="text">글 작성</div>
                    <label>
                        <div><span>제목</span></div>
                        <textarea id="board2_title" name="board2_title" placeholder="제목을 입력해주세요" required></textarea>
                    </label>
                </div>
            </div>
        </div>
        <div class="content-container">
            <div class="write-content">
                <span class="content-label">내용</span>
                <div class="content-textarea" id="board2_content" name="board2_content" contenteditable="true" required></div>
                <input type="file" id="photo-input" accept="image/gif, image/jpeg, image/png, image/webp" multiple style="display: none;">
                <input type="button" class="content-file" value="사진추가">
            </div>
        </div>
    </form>
</div>
</body>
</html>
