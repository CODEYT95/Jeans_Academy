<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>메시지 수신함</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/message/messageList.css">
    <script type="text/javascript" src="../../../resources/js/message/messageList.js"></script>

</head>
<body>
    <section class="header">
        <div class="logo">
            <i class="ri-menu-line icon icon-0 menu"></i>
            <h2>J<span>eans:청바지:</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로 <span style="color:#5073FB">지</span>금!</h5>
        </div>
        <div class="search--notification--profile">
            <div class="notification--profile">
                <div class="picon bell">
                    <i class="ri-notification-2-line"></i>
                </div>
                <div class="picon chat">
                    <i class="ri-mail-line"></i>
                </div>
                <div class="picon profile">
                    <span>${member_id}님 오늘도 파이팅하세요:미소짓는_얼굴:</span>
                </div>
            </div>
        </div>
    </section>
    <section class="main">
        <div class="sidebar">
            <ul class="sidebar--items">
                <li>
                    <a href="/main1" id="active--link">
                        <span class="icon icon-1"><i class="ri-home-4-line"></i></span>
                        <span class="sidebar--item">홈</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon icon-2"><i class="ri-megaphone-line"></i></span>
                        <span class="sidebar--item">공지사항</span>
                    </a>
                </li>
                <li>
                    <a href="/board1/list">
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
                    <a href="#">
                        <span class="icon icon-5"><i class="ri-draft-line"></i></span>
                        <span class="sidebar--item">3반</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon icon-6"><i class="ri-draft-line"></i></span>
                        <span class="sidebar--item">4반</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon icon-7"><i class="ri-questionnaire-line"></i></span>
                        <span class="sidebar--item">QnA</span>
                    </a>
                </li>
            </ul>
            <ul class="sidebar--bottom-items">
                <li>
                    <a href="#">
                        <span class="icon icon-8"><i class="ri-user-3-line"></i></span>
                        <span class="sidebar--item">마이페이지</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon icon-9"><i class="ri-logout-box-r-line"></i></span>
                        <span class="sidebar--item">로그아웃</span>
                    </a>
                </li>
            </ul>
        </div>

    <div class="main--content" >

        <div class="messageRec--content">
            <h2>받은 쪽지</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>보낸 사람</th>
                        <th>제목</th>
                        <th>날짜</th>
                    </tr>
                </thead>
                <c:forEach var="messageRecDTO" items="${messageRecDTO}">
                <tbody>
                    <tr>
                        <td>${messageRecDTO.message_sender}</td>
                        <td><button type="button" class="btn-modal">${messageRecDTO.message_title}</button></td>
                        <div id="modal" class="modal-overlay">
                            <div class="modal-window">
                                <div class="close-area">X</div>
                                <div class="modal-header">

                                    <!-- 수신자 작성 -->


                                </div>
                                <div class="modal-body">


                                    <!-- 내용 작성 -->





                                    <form action="/" method="post">
                                        띄워보자 ${messageRecDTO.message_sender}
                                    </form>
                                </div>
                                <div class="modal-footer">

                                    <!-- 보내기 버튼, 취소(목록) 버튼 -->

                                </div>
                            </div>
                        </div>
                        <td><fmt:formatDate value="${messageRecDTO.message_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>

        <div class="messageSend--content">
            <h2>보낸 쪽지</h2>
            <table>
                <thead>
                <tr>
                    <th>받은 사람</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="messageSendDTO" items="${messageSendDTO}">
                    <tr>
                        <td>${messageSendDTO.message_receiver}</td>
                        <td>${messageSendDTO.message_title}</td>
                        <td><fmt:formatDate value="${messageSendDTO.message_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </div>
        </div>
    </div>

    </section>
</body>
</html>