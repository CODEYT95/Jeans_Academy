<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko"  value="<%=request.getContextPath() %>" xmlns="http://www.w3.org/1999/html"/>
<head>
    <meta charset="UTF-8">
    <title>메시지 수신함</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/message/messageList.css">
    <script type="text/javascript" src="../../../resources/js/message/messageList.js"></script>
    <script>
        $(function(){
            $("#sendMsgList").click(function(){
                $("#msgAllList").load("${cPath}/message/sendMsgList");
            });
        });

        $(function(){
            $("#recMsgList").click(function(){
                $("#msgAllList").load("${cPath}/message/recMsgList");
            });
        });
    </script>
</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<div class="main--content" >
    <div class="button-content">
        <button type="button" class="btn-modal" id="send_button">쪽지 보내기</button>
        <div id="modal" class="modal-overlay">
            <div class="modal-window">
                <div class="close-area"><h2>X</h2></div>
                <form action="/message/send" method="post" id="aaa">
                    <input type="hidden" value="${member_id}" name="member_id">
                    <div class="modal-header">
                        <!-- 수신자 작성(수신자 불러오기) -->
                        <select id="member_class" class="member_class" name="member_class">
                            <option value="selectClassOption">반을 선택해주세요</option>
                            <option value="1반">1반</option>
                            <option value="2반">2반</option>
                            <option value="3반">3반</option>
                            <option value="4반">4반</option>
                        </select>
                        <select id="receiver" class="memberId" name="message_receiver">
                        </select>
                    </div>
                    <div class="modal-body">
                        <div class="message-title">
                            <h2>제목</h2><input id="title" type="text" name="message_title" placeholder="제목을 작성해주세요" required/>
                        </div>
                        <div class="message-content">내용
                            <textarea id="content" type="text" name="message_content" placeholder="내용을 작성해주세요" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <!-- 보내기 버튼, 취소(목록) 버튼 -->
                        <button type="submit" id = "write" class="button">작성</button>
                        <button type="button" class="button" onclick="location.href='/message/messageList'">목록</button>
                    </div>
                </form>
            </div>
        </div>
        <button id="sendMsgList">보낸 쪽지함</button>
        <button id="recMsgList">받은 쪽지함</button>
        <div class="call-content">
            <br/><br/>
            <h2>안녕하세요! 👖${member_name}님 쪽지함입니다😊<br/></h2>
            <div id="msgAllList">
                1. 쪽지를 보내시고 싶으시면 '쪽지 보내기'<br/>
                2. 보낸 쪽지를 확인하고 싶으시면 '보낸 쪽지함'<br/>
                3. 받은 쪽지를 확인하고 싶으시면 '받은 쪽지함'<br/>
                여러분들이 걸어가는 길목마다 행복이라는 꽃들이 한아름 피어나기를☺️
            </div>
        </div>
    </div>
</body>
</html>