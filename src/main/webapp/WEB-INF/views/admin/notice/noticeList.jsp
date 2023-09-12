<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://www.w3.org/XML/1998/namespace">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/admin/notice/noticeList.css">
    <script type="text/javascript" src="../../../../resources/js/admin/notice/noticeList.js"></script>

    <style>
        @media screen and (max-width: 1024px)
        table {
        min-width: 100%;
        }
    </style>
</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
    <div class="main--content">
        <div class="notice-body">
            <div class="notice-title">
                <h1>공지사항</h1>
            </div>
            <c:if test="${member_class eq '💓'}">
                <a class="insertBtn" href="/noticeInsert">
                    <button>글쓰기</button>
                </a>
            </c:if>

            <div class="showTable">
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성날짜</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty noticePaging.noticeList}">
                            <c:forEach items="${noticePaging.noticeList}" var="show" >
                                <tr>
                                    <td>${show.notice_no}</td>
                                    <td data-field="notice_title"><a href="/noticeDetail/${show.notice_no}">${show.notice_title}</a></td>
                                    <td data-field="member_id" id="writer"><span>${show.member_id}</span></td>
                                    <td><fmt:formatDate value="${show.notice_regdate}" pattern="yyyy-MM-dd" /></td>
                                    <td  data-field="notice_count">${show.notice_count}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="8">공지사항이 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <div class="pagination">
                    <div class="paging">
                        <div class="text-center clearfix">
                            <div class="pagingNum">
                                <ul class="pagination-container" id="pagination">
                                    <c:if test="${noticePaging.startPage > 5}">
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value='/noticeList'/>?page=${noticePaging.startPage - 1}"><i class="fa-solid fa-angle-left"></i></a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="${noticePaging.startPage}" end="${noticePaging.endPage}" step="1" var="pageNum">
                                        <li id = "linkBtn" class="page-item ${currentPage == pageNum ? 'active-page' : ''}">
                                            <a class="page-link" href="<c:url value='/noticeList'/>?page=${pageNum}">${pageNum}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${noticePaging.endPage < noticePaging.totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value='/noticeList'/>?page=${noticePaging.startPage + 5}"><i class="fa-solid fa-angle-right"></i></a>
                                        </li>
                                    </c:if>
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