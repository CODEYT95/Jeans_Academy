<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jeans|회원조회</title>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/admin/acceptList.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/admin/acceptList.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <style>
    </style>
</head>
<body data-member-class="${member_class}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<div class="main--content">
    <div class="main-container">
        <div class="button-wrap">
            <a href="/admin/memberList"><button class="showMembers">현재 회원</button></a>
            <a href="/admin/acceptList"><button class="acceptMembers" style="background : #5073FB;">요청 회원</button></a>
            <a href="/admin/hiddenList"><button class="hideMembers">탈퇴 회원</button></a>
        </div>
        <form action="/admin/acceptList" method="get">
            <div class="search-box">
                <select class="form-control" id="search-select" name="condition">
                    <option value="member_id"><c:if test="${param.condition == 'member_id'}"></c:if>아이디</option>
                    <option value="member_name"><c:if test="${param.condition == 'member_name'}">selected</c:if>이름</option>
                    <option value="member_type"><c:if test="${param.condition == 'member_type'}">selected</c:if>유형</option>
                </select>
                <input type="text" name="keyword" class="search-input" placeholder="검색어를 입력하세요" value="${param.keyword}">
                <button type="submit" class="search-button"><i class="ri-search-line"></i></button>
            </div>
        </form>
        <div class="showTable">
            <table>
                <caption class="table1">요청 회원 목록</caption>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>생일</th>
                    <th>전화번호</th>
                    <th>유형</th>
                    <th>반</th>
                    <th>코드</th>
                    <th>수락/거절</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty pageDTO.memberList}">
                        <c:forEach items="${pageDTO.memberList}" var="show">
                            <tr>
                                <td>${show.member_id}</td>
                                <td class="editable" data-field="member_name">${show.member_name}</td>
                                <td><fmt:formatDate value="${show.member_day}" pattern="yyyy-MM-dd" /></td>
                                <td class="editable" data-field="member_phone">${show.member_phone}</td>
                                <td>${show.member_type}</td>
                                <td class="editable" data-field="member_class">${show.member_class}</td>
                                <td class="editable" data-field="member_code">${show.member_code}</td>
                                <td>
                                    <div class="table-icon">
                                        <button class="acceptBtn" data-member-id="${show.member_id}">
                                            <i class="ri-check-line" id="modify" data-member-id="${show.member_id}"></i>
                                        </button>
                                        <button class="cancelBtn" data-member-id="${show.member_id}">
                                            <i class="ri-close-circle-line" data-member-id="${show.member_id}"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="8">수강생이 없습니다.</td>
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
                                        <a class="page-link" href="<c:url value='/admin/acceptList'/>?page=${pageDTO.startPage - 1}&keyword=${param.keyword}&condition=${param.condition}">Prev</a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1" var="pageNum">
                                    <li class="page-item ${currentPage == pageNum ? 'active-page' : ''}">
                                        <a class="page-link" href="<c:url value='/admin/acceptList'/>?page=${pageNum}&keyword=${param.keyword}&condition=${param.condition}">${pageNum}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageDTO.endPage < pageDTO.totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="<c:url value='/admin/acceptList'/>?page=${pageDTO.startPage + 5}&keyword=${param.keyword}&condition=${param.condition}">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div id="myModal" class="modal" style="display:none;">
                <div class="modal-content">
                    <p id="memberId" style="margin: 7px;"></p>
                    <!-- 삭제 확인 및 취소 버튼 -->
                    <div class="confirm-container">
                        <button class="confirmUpdate" data-member-id="${show.member_id}">확인</button>
                        <button class="conceal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
