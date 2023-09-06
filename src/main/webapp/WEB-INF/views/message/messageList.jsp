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
    <script type="text/javascript" src="../../../../resources/js/common/sidebar.js"></script>

</head>
<body data-member-class="${member_class}">
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans👖</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로
        <span style="color:#5073FB">지</span>금!</h5>
    </div>
    <div class="search--notification--profile">
        <div class="notification--profile">
                <a href="/message/messageList">
                    <div class="picon chat"  id="active--link">
                        <i class="ri-mail-line" style="color:white;" ></i>
                    </div>
                </a>
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
                <a  href="/main1">
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
                <a class="sideBoard1" href="/board1/list">
                    <span class="icon icon-3"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">1반</span>
                </a>
            </li>
            <li>
                <a class="sideBoard2" href="/board2/list">
                    <span class="icon icon-4"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">2반</span>
                </a>
            </li>
            <li>
                <a class="sideBoard3" href="/board3/list">
                    <span class="icon icon-5"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">3반</span>
                </a>
            </li>
            <li>
                <a class="sideBoard4" href="/board4/list">
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

    <div class="main--content" >

        <button type="button" class="btn-modal" id="send_button">쪽지 보내기</button>
        <div id="modal" class="modal-overlay">
            <div class="modal-window">
                <div class="close-area">X</div>
                <form action="/message/send" method="post" id="aaa">
                    <input type="hidden" value="${member_id}" name="member_id">
                    <div class="modal-header">
                        <!-- 수신자 작성(수신자 불러오기) -->
                        <select id="receiver" name="message_receiver">
                            <c:forEach items="${messageMemberDTO}" var="msgMemberDTO" varStatus="loop" begin="0">
                                <option value="${msgMemberDTO.member_id}"> ${msgMemberDTO.member_id}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="modal-body">
                        <div>
                            <!-- 내용 작성 -->
                            <h2>제목</h2><input type="text" name="message_title"/>
                        </div>
                        <div>
                            <h2>내용</h2><input type="text" name="message_content"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <!-- 보내기 버튼, 취소(목록) 버튼 -->
                        <button type="submit" class="write-button">작성</button>
                        <button type="button" class="list-button" onclick="location.href='/message/messageList'">목록</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="messageRec--content">
            <h2>받은 쪽지함</h2>
            <button type="delete-button" class="delete-button">삭제</button>
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
                            <input type="checkbox" name="box2">&nbsp;
                            <label for="box2"><button type="button" class="btn-modal2" data-modal-id2="modal2-${loop.index}">${messageRecDTO.message_title}</button></label>
                        </td>
                        <div id="modal2-${loop.index}" class="modal-overlay2">
                            <div class="modal-window">
                                <div class="close-area2">X</div>
                                <div class="modal-header">
                                </div>
                                <div class="modal-body">
                                    <div>제목: ${messageRecDTO.message_title}</div>
                                    <div>보낸 사람: ${messageRecDTO.message_receiver}</div>
                                    <div>받은 사람: ${messageRecDTO.message_sender}</div>
                                    <div>날짜: ${messageRecDTO.message_date}</div>
                                    <div>내용: ${messageRecDTO.message_content}</div>
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
        </div>

        <div class="messageSend--content">
            <h2>보낸 쪽지함</h2>
            <button type="delete-button" class="delete-button">삭제</button>
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
                            <input type="checkbox" name="box3">&nbsp;
                            <label for="box3"><button type="button" class="btn-modal3" data-modal-id3="modal3-${loop.index}">${messageSendDTO.message_title}</button></label>
                        </td>
                        <div id="modal3-${loop.index}" class="modal-overlay3">
                            <div class="modal-window">
                                <div class="close-area3">X</div>
                                <div class="modal-header">
                                </div>
                                <div class="modal-body">
                                    <div>제목: ${messageSendDTO.message_title}</div>
                                    <div>받은 사람: ${messageSendDTO.message_sender}</div>
                                    <div>보낸 사람: ${messageSendDTO.message_receiver}</div>
                                    <div>날짜: ${messageSendDTO.message_date}</div>
                                    <div>내용: ${messageSendDTO.message_content}</div>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>
                        </div>
                            <td class="col-2">${messageSendDTO.message_receiver}</td>
                            <td class="col-3"><fmt:formatDate value="${messageSendDTO.message_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                        </td>
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