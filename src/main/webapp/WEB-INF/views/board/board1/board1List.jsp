<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:c="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>👖1반 게시글 목록</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/board/boardList.css">
    <script type="text/javascript" src="../../../../resources/js/board/boardList.js"></script>
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
        <div class = "title--container">
            <!-- 같은 반일 경우에만 글쓰기 처리 -->
            <c:if test="${member_class.equals('1반') || member_type.equals('관리자') || member_type.equals('강사님')}">
                <button type="button" class="button" onclick="location.href='/board1/write'">글쓰기</button>
            </c:if>
            <div class="title-content"><h1>👖1반 게시판</h1></div>
        </div>
        <div class="slide-container">
            <div class="slider">
                <input type="radio" name="testimonial" id="t-1"checked>
                <input type="radio" name="testimonial" id="t-2">
                <input type="radio" name="testimonial" id="t-3">
                <input type="radio" name="testimonial" id="t-4">
                <input type="radio" name="testimonial" id="t-5">
                <div class="testimonials">
                    <c:if test="${member_class.equals('1반') || member_type.equals('관리자') || member_type.equals('강사님')}">
                        <c:choose>
                            <c:when test="${empty board1DTOBYTutor}">
                                <h1>공지사항이 없습니다</h1>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="tutor" items="${board1DTOBYTutor}" varStatus="loop" begin="0" end="4">
                                    <input type="radio" name="testimonial" id="t-${loop.index + 1}">
                                    <label class="item"  for="t-${loop.index + 1}">
                                        <h2><a href="/board1/detail/${tutor.board1_no}">${tutor.board1_title}</a></h2>
                                        <h3>${tutor.board1_content}</h3>
                                    </label>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
            </div>
        </div>
        <div class = "box-container">
            <div class="boxes">
                <c:if test="${member_class.equals('1반') || member_type.equals('관리자') || member_type.equals('강사님')}">
                    <c:choose>
                        <c:when test="${empty board1List}">
                            <h1>첫 글의 주인공이 되어주세요</h1>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="board1List" items="${board1List}">
                                <div class="box">
                                    <div>
                                        <button type="button" class="box-button" onclick="location.href='/board1/detail/${board1List.board1_no}'">상세</button>
                                    </div>
                                    <div>
                                        <h1>${board1List.board1_title}</h1>
                                        <p>${board1List.board1_content}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>