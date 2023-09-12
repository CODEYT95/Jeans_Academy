<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>👖3반 게시글 상세 페이지</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../../resources/css/board/boardDetail.css">
    <script type="text/javascript" src="../../../../resources/js/board/board3/board3Detail.js"></script>
    <style>
        body{
         background-color: rgba(166, 245, 162, 0.2);
        }
    </style>
</head>
<body data-member-class="${member_class}" data-category="${category}" data-member-type="${member_type}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<div class="main--content">
    <div class="head-container">
        <div class="button-container">
            <form action="/board3/delete" method="get">
                <!-- 본인이 작성한 게시물만 삭제 가능 처리 -->
                <input type="hidden" name="board3_no" value="${board3DTO.board3_no}"/>
                <c:if test="${member_id == board3DTO.member_id || member_type.equals('관리자')}">
                    <button id="delete" class="main-del-button">삭제</button>
                </c:if>
            </form>
            <form action="/board3/modify" method="get">
                <!-- 본인이 작성한 게시물만 수정 가능 처리 -->
                <input type="hidden" name="board3_no" value="${board3DTO.board3_no}"/>
                <c:if test="${member_id == board3DTO.member_id}">
                    <button type="submit" class="main-ori-button3">수정</button>
                </c:if>
            </form>
            <button type="button" class="main-ori-button3" onclick="location.href='/board3/list'">목록</button>
        </div>
        <div class="write-title">
            <label>
                <h2>제목</h2>
                <h4>by ${board3DTO.member_name}</h4>
                <textarea name="board3_title" readonly>${board3DTO.board3_title}</textarea>
            </label>
        </div>
    </div>
    <div class="content-container">
        <div class="write-content">
            <span class="content-label">내용</span>
            <div class="content-textarea" readonly>${board3DTO.board3_content}</div>
        </div>
    </div>
    <div class="reply-container">
        <div>
            <form action="/comment3/write" method="post">
                <input type="hidden" name="member_id" value="${member_id}">
                <input type="hidden" name="member_name" value="${member_name}">
                <input type="hidden" name="member_class" value="${member_class}">
                <input type="hidden" name="board3_no" value="${board3DTO.board3_no}">
                <button type="submit" class="reply-button">댓글 등록</button>
                <textarea name="comment3_content" class="reply-insert" maxlength="300"  placeholder="댓글을 작성하세요" required></textarea>
            </form>
        </div>
        <div class="reply-content-container">
            <ul>
                <c:forEach items="${comment3DTO}" var="comment3DTO" varStatus="loop" begin="0">
                    <li>
                        <table>
                            <td class="col-1"><c:out value="${comment3DTO.comment3_content}"/></td>
                            <td class="col-2"><c:out value="${comment3DTO.member_name}"/></td>
                            <td class="col-3"><fmt:formatDate value="${comment3DTO.comment3_regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
                            <label class="item">
                                <!-- 댓글 작성자만 댓글 수정 가능 -->
                                <td class="col-4">
                                    <c:if test="${member_id == comment3DTO.member_id}">
                                        <button class="btn-modal" id="reply-button-sm" data-comment-no="${comment3DTO.comment3_no}">수정</button>
                                    </c:if>
                                </td>
                                <!-- 각 댓글에 대한 고유한 모달 창 -->
                                <div id="modal" class="modal-overlay">
                                    <div class="modal-window">
                                        <div class="close-area"><h2>X</h2></div>
                                        <div class="modal-header">
                                            <h1>댓글 수정</h1>
                                            <br/><br/>
                                        </div>
                                        <div class="modal-body">
                                            <form action="/comment3/update" method="post">
                                                <input type="hidden" name="board3_no" value="${board3DTO.board3_no}"/>
                                                <input type="hidden" name="comment3_no" value="${comment3DTO.comment3_no}">
                                                <div id="comment_content" class="form-group">
                                                    <h3>댓글 내용</h3>
                                                    <textarea type="text" id="content" name="comment3_content" required>${comment3DTO.comment3_content}</textarea>
                                                </div>
                                                <br/>
                                                <button type="submit" class="reply-button">수정</button>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                        </div>
                                    </div>
                                </div>
                            </label>
                            <td class="col-5">
                                <form action="/comment3/delete" method="post">
                                    <input type="hidden" name="comment3_no" value="${comment3DTO.comment3_no}"/>
                                    <input type="hidden" name="board3_no" value="${board3DTO.board3_no}"/>
                                    <!-- 관리자와 댓글 작성자만 삭제 가능-->
                                    <c:if test="${member_id == comment3DTO.member_id || member_type.equals('관리자')}">
                                        <button type="submit" class="reply-button-sm">삭제</button>
                                    </c:if>
                                </form>
                            </td >
                        </table>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</section>
</body>
</html>