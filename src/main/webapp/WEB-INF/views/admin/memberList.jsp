<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jeans|회원조회</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/admin/memberList.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/admin/memberList.css">
    <style>
    </style>
</head>
<body data-member-class="${member_class}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<div class="main--content">
    <div class="main-container">
        <div class="showTable">
            <table>
                <caption class="table1">현재 회원 목록</caption>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>생일</th>
                    <th>전화번호</th>
                    <th>유형</th>
                    <th>코드</th>
                    <th>수정/삭제</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty pageDTO.memberList}">
                        <c:forEach items="${pageDTO.memberList}" var="show">
                            <tr>
                                <td>${show.member_id}</td>
                                <td>${show.member_name}</td>
                                <td><fmt:formatDate value="${show.member_day}" pattern="yyyy-MM-dd" /></td>
                                <td>${show.member_phone}</td>
                                <td>${show.member_type}</td>
                                <td>${show.member_code}</td>
                                <td>
                                    <div class="table-icon">
                                        <button class="modifyBtn">
                                            <i class="ri-pencil-line" id="modify"></i>
                                        </button>
                                        <button class= "updateBtn">
                                            <i class="ri-delete-bin-6-line" id="update"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="7">현재 수강생이 없습니다.</td>
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
                                <c:if test="${pageDTO.startPage > 5}">
                                    <li class="page-item">
                                        <a class="page-link" href="<c:url value='/admin/memberList'/>?page=${pageDTO.startPage -1}">Prev</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1" var="pageNum">
                                    <li class="page-item ${currentPage == pageNum ? 'active' : ''}" style="${currentPage == pageNum ? 'background-color: #e156db36; border-radius: 8px;' : ''}">
                                        <a class="page-link" href="<c:url value='/admin/memberList'/>?page=${pageNum}">${pageNum}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageDTO.endPage < pageDTO.totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="<c:url value='/admin/memberList'/>?page=${pageDTO.startPage + 5}">Next</a>
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
