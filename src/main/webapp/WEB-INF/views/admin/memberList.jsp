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
                    <div class="text-center clearfix">
                        <ul class="pagination-container" id="pagination">
                            <div class="showPage" id="showPage" data-countperpage="${pageCreateShow.paging.countPerPage}">
                                <c:if test="${pageCreateShow.prev}">
                                    <li class="page-item"><a class="page-link" href="#" data-pageNum="${pageCreateShow.beginPage-1}">Prev</a></li>
                                </c:if>
                                <c:forEach var="num" begin="${pageCreateShow.beginPage}" end="${pageCreateShow.endPage}">
                                    <li class="${pageCreateShow.paging.pageNum == num ? 'currentPage' : ''}" page-item><a class="page-link" href="#" data-pageNum="${num}">${num}</a></li>
                                </c:forEach>
                                <c:if test="${pageCreateShow.next}">
                                    <li class="page-item"><a class="page-link" href="#" data-pageNum="${pageCreateShow.endPage+1}">Next</a></li>
                                </c:if>
                            </div>
                        </ul>
                    </div>
                    <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
                    <input type="hidden" name="pageNum" id="pageNumShow" value="${pageCreateShow.paging.pageNum}">
                    <input type="hidden" name="countPerPage" value="${pageCreateShow.paging.countPerPage}">
                </div>
            </div>
        </div>
        <hr>

    </div>
    <hr>
</div>
</body>
</html>
<script>
    $(document).ready(function() {
        $(document).on("click", "#pagination .showPage a", function(e) {
            e.preventDefault();
            var value = $(this).attr("data-pageNum");
            console.log(value);
            $.ajax({
                type: "POST",
                url: "/admin/memberList",
                data: {
                    pageNum: value,
                    countPerPage: $("#showPage").data("countperpage")
                },
                success: function(data) {
                    $("#showTableBody").empty(); // 기존 데이터 삭제
                    $.each(data.showMembers, function(index, show) {
                        var formattedDate = new Date(show.member_day).toLocaleDateString(); // 날짜 포맷팅
                        var newRow = "<tr>" +
                            "<td>" + show.member_id + "</td>" +
                            "<td>" + show.member_name + "</td>" +
                            "<td>" + formattedDate + "</td>" +
                            "<td>" + show.member_phone + "</td>" +
                            "<td>" + show.member_type + "</td>" +
                            "<td>" + show.member_code+ "</td>"+
                            // ... 추가 필드 및 버튼 등 ...
                            "</tr>";
                        $("#showTableBody").append(newRow);
                    });
                },
                error: function(error) {
                    console.error("Error:", error);
                }
            });
        });
    });
</script>

