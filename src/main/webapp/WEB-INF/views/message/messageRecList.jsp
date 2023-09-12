<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>👖받은 쪽지함</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/message/messageListContent.css">
    <script type="text/javascript" src="../../../resources/js/message/messageList.js"></script>
</head>
<body>
<body data-member-class="${member_class}" data-category="${category}">
    <div class="messageRec--content">
        <form action="/message/deleteRecMsg" method="get">
            <button type="submit" id="delete" class="delete-button" onclick="return checkData()">삭제</button>
            <table class="table">
                <thead>
                <tr>
                    <th>제목</th>
                    <th>보낸 사람</th>
                    <th>날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="messageRecDTO" items="${messageRecDTO}" varStatus="loop" begin="0">
                    <tr>
                        <td class="col-1">
                            <input type="checkbox" id="message_no1" name="message_no" value="${messageRecDTO.message_no}"/>
                            <label for="message_no1">
                                <a class="btn-modal2" data-modal-id2="modal2-${loop.index}">${messageRecDTO.message_title}</a>
                            </label>
                        </td>
                        <div id="modal2-${loop.index}" class="modal-overlay2">
                            <div class="modal-window">
                                <div class="close-area2"><h2>X</h2></div>
                                <div class="modal-header">
                                </div>
                                <div class="modal-body">
                                    <div class="inputContent"><h3>제목</h3> ${messageRecDTO.message_title}</div>
                                    <div class="inputContent"><h3>보낸 사람</h3> ${messageRecDTO.message_sender}</div>
                                    <div class="inputContent"><h3>받은 사람</h3>${messageRecDTO.message_receiver}</div>
                                    <div class="inputContent"><h3>날짜</h3> <fmt:formatDate value="${messageRecDTO.message_date}" pattern="yyyy-MM-dd HH:mm"/></div>
                                    <h3>내용</h3>
                                    <div class="modal-content">${messageRecDTO.message_content}</div>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>
                        </div>
                        <td class="col-2">${messageRecDTO.message_sender}</td>
                        <td class="col-3"><fmt:formatDate value="${messageRecDTO.message_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </form>
    </div>
</body>
</html>