<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page">
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
        <div class="search-box">
            <input type="text" class="search-input" placeholder="검색어를 입력하세요">
            <button class="search-button"><i class="ri-search-line"></i></button>
        </div>
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
                <tbody id="showTableBody">
                <c:choose>
                    <c:when test="${showMembers.size() > 0}">
                        <c:forEach items="${showMembers}" var="show">
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
                </c:choose>
                </tbody>
            </table>
            <div class="pagination">
                <div class="paging">
                    <form action="<c:url value='/admin/memberList' />" name="pageForm">
                        <div class="text-center clearfix">
                            <ul class="pagination-container" id="pagination">
                                <div class="showPage" id="showPage" data-countperpage1="${pageCreateShow.paging1.countPerPage1}">
                                    <c:if test="${pageCreateShow.prev1}">
                                        <li class="page-item"><a class="page-link" href="#" data-pageNum1="${pageCreateShow.beginPage1-1}">Prev</a></li>
                                    </c:if>
                                    <c:forEach var="num" begin="${pageCreateShow.beginPage1}" end="${pageCreateShow.endPage1}">
                                        <li class="${pageCreateShow.paging1.pageNum1 == num ? 'currentPage1' : ''}" page-item><a class="page-link" href="#" data-pageNum1="${num}">${num}</a></li>
                                    </c:forEach>
                                    <c:if test="${pageCreateShow.next1}">
                                        <li class="page-item"><a class="page-link" href="#" data-pageNum1="${pageCreateShow.endPage1+1}">Next</a></li>
                                    </c:if>
                                </div>
                            </ul>
                        </div>
                        <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
                        <input type="hidden" name="pageNum1" id="pageNumShow" value="${pageCreateShow.paging1.pageNum1}">
                        <input type="hidden" name="countPerPage1" value="${pageCreateShow.paging1.countPerPage1}">
                    </form>
                </div>
            </div>
        </div>
        <hr>
        <div class="acceptTable">
            <table>
                <caption class="table1">요청 처리 회원</caption>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>생일</th>
                    <th>전화번호</th>
                    <th>유형</th>
                    <th>코드</th>
                    <th>승인/삭제</th>
                </tr>
                </thead>
                <tbody id="acceptTableBody">
                <c:choose>
                    <c:when test="${acceptMembers.size() > 0}">
                        <c:forEach items="${acceptMembers}" var="accept">
                            <tr>
                                <td>${accept.member_id}</td>
                                <td>${accept.member_name}</td>
                                <td><fmt:formatDate value="${accept.member_day}" pattern="yyyy-MM-dd" /></td>
                                <td>${accept.member_phone}</td>
                                <td>${accept.member_type}</td>
                                <td>${accept.member_code}</td>
                                <td>
                                    <div class="table-icon">
                                        <button class="modifyBtn">
                                            <i class="ri-pencil-line" id="accept"></i>
                                        </button>
                                        <button class= "updateBtn">
                                            <i class="ri-delete-bin-6-line" id="reject"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>
                </tbody>
            </table>
            <!-- 페이지 2 (acceptMembers) 페이징 -->
            <div class="paging">
                <form action="<c:url value='/admin/memberList' />" name="pageForm2">
                    <div class="text-center clearfix">
                        <ul class="pagination-container" id="pagination2">
                            <div class="acceptPage" id="acceptPage" data-countperpage2="${pageCreateAccept.paging2.countPerPage2}">
                                <c:if test="${pageCreateAccept.prev2}">
                                    <li class="page-item"><a class="page-link" href="#" data-pageNum2="${pageCreateAccept.beginPage2-1}">Prev</a></li>
                                </c:if>
                                <c:forEach var="num" begin="${pageCreateAccept.beginPage2}" end="${pageCreateAccept.endPage2}">
                                    <li class="${pageCreateAccept.paging2.pageNum2 == num ? 'currentPage2' : ''}" page-item><a class="page-link" href="#" data-pageNum2="${num}">${num}</a></li>
                                </c:forEach>
                                <c:if test="${pageCreateAccept.next2}">
                                    <li class="page-item"><a class="page-link" href="#" data-pageNum2="${pageCreateAccept.endPage2+1}">Next</a></li>
                                </c:if>
                            </div>
                        </ul>
                    </div>
                    <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
                    <input type="hidden" name="pageNum2" id="pageNumAccept" value="${pageCreateAccept.paging2.pageNum2}">
                    <input type="hidden" name="countPerPage2" value="${pageCreateAccept.paging2.countPerPage2}">
                </form>
            </div>
        </div>
    </div>
    <hr>
    <div class="hiddenTable">
        <table>
            <caption class="table1">탈퇴 회원 관리</caption>
            <thead>
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>생일</th>
                <th>전화번호</th>
                <th>유형</th>
                <th>코드</th>
                <th>삭제</th>
            </tr>
            </thead>
            <tbody id="hiddenTableBody">
            <c:choose>
                <c:when test="${hiddenMembers.size() > 0}">
                    <c:forEach items="${hiddenMembers}" var="hidden">
                        <tr>
                            <td>${hidden.member_id}</td>
                            <td>${hidden.member_name}</td>
                            <td><fmt:formatDate value="${show.member_day}" pattern="yyyy-MM-dd" /></td>
                            <td>${hidden.member_phone}</td>
                            <td>${hidden.member_type}</td>
                            <td>${hidden.member_code}</td>
                            <td>
                                <div class="table-icon">
                                    <button class="modifyBtn">
                                        <i class="ri-pencil-line" id="delete"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
            </tbody>
        </table>
        <!-- 페이지 3 (hiddenMembers) 페이징 -->
        <div class="paging">
            <form action="<c:url value='/admin/memberList' />" name="pageForm3">
                <div class="text-center clearfix">
                    <ul class="pagination-container" id="pagination3">
                        <div class="hiddenPage" id="hiddenPage" data-countperpage3="${pageCreateHidden.paging3.countPerPage3}">
                            <c:if test="${pageCreateHidden.prev3}">
                                <li class="page-item"><a class="page-link" href="#" data-pageNum3="${pageCreateHidden.beginPage3-1}">Prev</a></li>
                            </c:if>
                            <c:forEach var="num" begin="${pageCreateHidden.beginPage3}" end="${pageCreateHidden.endPage3}">
                                <li class="${pageCreateHidden.paging3.pageNum3 == num ? 'currentPage3' : ''}" page-item><a class="page-link" href="#" data-pageNum3="${num}">${num}</a></li>
                            </c:forEach>
                            <c:if test="${pageCreateHidden.next3}">
                                <li class="page-item"><a class="page-link" href="#" data-pageNum3="${pageCreateHidden.endPage3+1}">Next</a></li>
                            </c:if>
                        </div>
                    </ul>
                </div>
                <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
                <input type="hidden" name="pageNum3" id="pageNumHidden" value="${pageCreateHidden.paging3.pageNum3}">
                <input type="hidden" name="countPerPage3" value="${pageCreateHidden.paging3.countPerPage3}">
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function() {
        $('#pagination .showPage').on('click', 'a', function(e) {
            e.preventDefault();
            const value = $(this).data('pagenum1');
            $('#pageNumShow').val(value); // 각 페이지 컨테이너에 맞는 id를 사용
            document.pageForm.submit();
        });

        $('#pagination2 .acceptPage').on('click', 'a', function(e) {
            e.preventDefault();
            const value = $(this).data('pagenum2');
            $('#pageNumAccept').val(value); // 각 페이지 컨테이너에 맞는 id를 사용
            document.pageForm2.submit();
        });

        $('#pagination3 .hiddenPage').on('click', 'a', function(e) {
            e.preventDefault();
            const value = $(this).data('pagenum3');
            $('#pageNumHidden').val(value); // 각 페이지 컨테이너에 맞는 id를 사용
            document.pageForm3.submit();
        });
    })
</script>

