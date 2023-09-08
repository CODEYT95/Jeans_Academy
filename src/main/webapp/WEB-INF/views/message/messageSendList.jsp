<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>보낸 쪽지함</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/message/messageListContent.css">
    <script type="text/javascript" src="../../../resources/js/message/messageList.js"></script>
</head>
<body>
<body data-member-class="${member_class}" data-category="${category}">

<div class="messageSend--content">
    <form action="/message/deleteSendMsg" method="get">
        <button type="delete-button" class="delete-button" onclick="return checkData()">삭제</button>
        <table>
            <thead>
            <tr>
                <th>제목</th>
                <th>받은 사람</th>
                <th>날짜</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="messageSendDTO" items="${messageSendDTO}" varStatus="loop" begin="0">
                <tr>
                    <td class="col-1">
                        <input type="checkbox" id="message_no2" name="message_no" value="${messageSendDTO.message_no}">&nbsp;
                        <label for="message_no2">
                            <a class="btn-modal3" data-modal-id3="modal3-${loop.index}">${messageSendDTO.message_title}</a>
                        </label>
                    </td>
                    <div id="modal3-${loop.index}" class="modal-overlay3">
                        <div class="modal-window">
                            <div class="modal-header">
                                <div class="close-area3">X</div>
                            </div>
                            <div class="modal-body">
                                <div class="inputContent"><h3>제목</h3> ${messageSendDTO.message_title}</div>
                                <div class="inputContent"><h3>받은 사람</h3> ${messageSendDTO.message_receiver}</div>
                                <div class="inputContent"><h3>보낸 사람</h3>${messageSendDTO.message_sender}</div>
                                <div class="inputContent"><h3>날짜</h3> ${messageSendDTO.message_date}</div>
                                <h3>내용</h3>
                                <div class="modal-content">${messageSendDTO.message_content}</div>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                    <td class="col-2">${messageSendDTO.message_receiver}</td>
                    <td class="col-3"><fmt:formatDate value="${messageSendDTO.message_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
</div>




</body>
</html>