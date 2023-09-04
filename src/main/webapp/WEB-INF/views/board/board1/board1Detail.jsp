<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html xmlns="http://www.w3.org/1999/html" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/board/boardDetail.css">
    <script type="text/javascript" src="../../../../resources/js/board/boardDetail.js"></script>
</head>
<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans👖</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로
        <span style="color:#5073FB">지</span>금!</h5>
    </div>
    <div class="search--notification--profile">
        <div class="notification--profile">
            <div class="picon chat">
                <i class="ri-mail-line"></i>
            </div>
            <div class="picon profile">
                <span>${member_class} ${member_name}님 오늘도 파이팅하세요🙂</span>
            </div>
        </div>
    </div>
</section>
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a href="/main1">
                    <span class="icon icon-1"><i class="ri-home-4-line"></i></span>
                    <span class="sidebar--item">홈</span>
                </a>
            </li>
            <li>
                <a href="/noticeList">
                    <span class="icon icon-2"><i class="ri-megaphone-line"></i></span>
                    <span class="sidebar--item">공지사항</span>
                </a>
            </li>
            <li>
                <a href="/board1/list"  id="active--link">
                    <span class="icon icon-3"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">1반</span>
                </a>
            </li>
            <li>
                <a href="/board2/list">
                    <span class="icon icon-4"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">2반</span>
                </a>
            </li>
            <li>
                <a href="/board3/list">
                    <span class="icon icon-5"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">3반</span>
                </a>
            </li>
            <li>
                <a href="/board4/list">
                    <span class="icon icon-6"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">4반</span>
                </a>
            </li>
            <li>
                <a href="/question/list">
                    <span class="icon icon-7"><i class="ri-questionnaire-line"></i></span>
                    <span class="sidebar--item">QnA</span>
                </a>
            </li>
            <c:if test="${member_type == '관리자'}">
                <li>
                    <a href="/admin/memberList">
                        <span class="icon icon-10"><i class="ri-admin-line"></i></span>
                        <span class="sidebar--item">Admin</span>
                    </a>
                </li>
            </c:if>
        </ul>
        <ul class="sidebar--bottom-items">
            <li>
                <a href="#">
                    <span class="icon icon-8"><i class="ri-user-3-line"></i></span>
                    <span class="sidebar--item">마이페이지</span>
                </a>
            </li>
            <li>
                <a href="/logout">
                    <span class="icon icon-9"><i class="ri-logout-box-r-line"></i></span>
                    <span class="sidebar--item">로그아웃</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="main--content">

        <div class="head-container">
            <div class="button-container">

                <form action="/board1/delete" method="get">
                    <input type="hidden" name="board1_no" value="${board1DTO.board1_no}"/>
                    <button type="submit" class="main-del-button">삭제</button>
                </form>
                <form action="/board1/modify" method="get">
                    <input type="hidden" name="board1_no" value="${board1DTO.board1_no}"/>
                    <button type="submit" class="main-ori-button">수정</button>
                </form>
                <button type="button" class="main-ori-button" onclick="location.href='/board1/list'">목록</button>
            </div>



            <div class="write-title">
                <label>
                    <h2>제목</h2>
                    <h4>by ${board1DTO.member_name}</h4>
                    <textarea name="board1_title" readonly>${board1DTO.board1_title}</textarea>
                </label>

            </div>
        </div>


        <div class="content-container">
            <div class="write-content">
                <span class="content-label">내용</span>
                <div class="content-textarea" readonly>${board1DTO.board1_content}</div>
            </div>
        </div>

        <div class="reply-container">
            <div>
                <form action="/comment1/write" method="post">
                    <input type="hidden" name="board1_no" value="${board1DTO.board1_no}">
                    <button type="submit" class="reply-button">댓글 등록</button>
                    <textarea name="comment1_content" class="reply-insert" maxlength="300"></textarea>
                </form>
            </div>
            <div class="reply-content-container">
                <ul>
                    <c:forEach items="${comment1DTO}" var="comment1DTO" varStatus="loop" begin="0">
                        <li>
                            <table>
                                <td class="col-1"><c:out value="${comment1DTO.comment1_content}"/></td>
                                <td class="col-2"><fmt:formatDate value="${comment1DTO.comment1_regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td class="col-3">
                                    <form action="/comment1/delete" method="post">
                                        <input type="hidden" name="comment1_no" value="${comment1DTO.comment1_no}"/>
                                        <input type="hidden" name="board1_no" value="${board1DTO.board1_no}"/>
                                        <button type="submit" class="reply-button-sm">삭제</button>
                                    </form>
                                </td >
                                <label class="item">
                                    <td class="col-4"><button class="btn-modal" id="reply-button-sm">수정</button></td>
                                </label>
                            </table>
                            <div id="modal" class="modal-overlay">
                                <div class="modal-window">
                                    <div class="close-area">X</div>
                                    <div class="modal-header">
                                        <h1>댓글 수정</h1>
                                        <br/><br/>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/comment1/update" method="post">
                                            <input type="hidden" name="board1_no" value="${board1DTO.board1_no}"/>
                                            <div id="comment_no"  class="form-group">
                                                <h3>댓글 번호</h3>
                                                <textarea name="comment1_no"><c:out value="${comment1DTO.comment1_no}"/></textarea>
                                            </div>
                                            <div id="comment_content" class="form-group">
                                                <h3>댓글 내용</h3>
                                                <textarea name="comment1_content"><c:out value="${comment1DTO.comment1_content}"/></textarea>
                                            </div>
                                            <br/>
                                            <button type="submit" class="reply-button">수정</button>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>

                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</section>
</body>


</html>