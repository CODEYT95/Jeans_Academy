<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page">

<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/question/questionlist.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/question/question.js"></script>
</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
    <div class="main--content">
        <div class="title-box">
            <div class="title">Q&A
            </div>
        </div>
        <div class="search-box">
            <input type="text" class="search-input" placeholder="검색어를 입력하세요">
            <button class="search-button"><i class="ri-search-line"></i></button>
            <div>
                <a href="/question/write" class="write-button">글작성</a>
            </div>
        </div>
        <div class="box-list">
            <c:forEach items="${questionList}" var="question" varStatus="status">
                <div class="box box${(status.index % 4) + 1}">
                    <div class="header-content">
                        <div class="header-title">
                            <span>${question.question_title}</span>
                        </div>
                        <div class="header-class">
                            <span>${question.member_class}</span></br>
                        </div>
                        <div class="header-name">
                            <span>${question.member_name}</span></br>
                        </div>
                        <div class="header-date">
                        <span class="postdate"><fmt:formatDate value="${question.question_regdate}" pattern="yyyy-MM-dd"/></span></br>

                    </div>
                    </div>
                    <span class=" clear">
                       ${question.question_content}
                    </span>
                            <c:if test="${status.index % 4 == 3 or status.last}">
                                <div style="clear: both;"></div>
                            </c:if>
                        </div>
            </c:forEach>
        </div>
    </div>
<div class="scroll-to-top">
    <a href="#" id="scroll-to-top-button">
        <i class="ri-arrow-up-line"></i></a>
</div>
</body>
</html>