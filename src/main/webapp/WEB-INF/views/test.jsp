<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page">
<head>
<meta charset="UTF-8">
<title>웹 페이지 제목</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="wrapper">
    <div class="game-details">
        <span class="score">점수: 0</span>
        <span class="high-score">최고 점수: 0</span>
    </div>
    <div class="play-board"></div>
    <div class="controls">
        <i data-key="ArrowLeft" class="fa-solid fa-arrow-left-long"></i>
        <i data-key="ArrowUp" class="fa-solid fa-arrow-up-long"></i>
        <i data-key="ArrowRight" class="fa-solid fa-arrow-right-long"></i>
        <i data-key="ArrowDown" class="fa-solid fa-arrow-down-long"></i>
    </div>
</div>
</body>
</html>