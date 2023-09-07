<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/question/questionWrite.css">
    <script type="text/javascript" src="../../../resources/js/question/questionWrite.js"></script>
    <script type="text/javascript" src="../../../../resources/js/common/sidebar.js"></script>
</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
    <div class="main--content">
        <span class="category-label">Q&A</span>
        <div class="main-container">
            <form method="post" action="/question/write">
                <div class="container">
                    <button class="save">저장</button>
                    <div class="title-container">
                        <div class="write-title">
                            <label>
                                <span>제목</span>
                                <textarea name="title" required></textarea>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="content-container">
                    <div class="write-content">
                        <span class="content-label">내용</span>
                        <input type="file" id="photo-input" accept="image/gif, image/jpeg, image/png, image/webp" multiple style="display: none;">
                        <input type="hidden" name="member_name" value="${member_name}">
                        <input type="hidden" name="member_class" value="${member_class}">
                        <div class="content" name="content" contenteditable="true"></div>
                        <input type="button" class="content-file" value="사진추가">
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>