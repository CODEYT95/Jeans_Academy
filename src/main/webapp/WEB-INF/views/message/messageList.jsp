<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>메시지 수신함</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/message/messageList.css">
    <script type="text/javascript" src="../../../resources/js/message/messageList.js"></script>
</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<div class="main--content" >
    <button type="button" class="btn-modal" id="send_button">쪽지 보내기</button>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="close-area">X</div>
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
                    <script>
                        var selectedClass = document.getElementById("member_class");
                    </script>
                    <select id="receiver" class="memberId" name="message_receiver">
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
        <form action="/message/deleteRecMsg" method="get">
            <h2>받은 쪽지함</h2>
            <button type="submit" class="delete-button" onclick="return checkData()">삭제</button>
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
                                <button type="button" class="btn-modal2" data-modal-id2="modal2-${loop.index}">${messageRecDTO.message_title}</button>
                            </label>
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
                                    <button type="button" class="close-area2">목록</button>
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

    <div class="messageSend--content">
        <form action="/message/deleteSendMsg" method="get">
            <h2>보낸 쪽지함</h2>
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
                            <label for="message_no2"><button type="button" class="btn-modal3" data-modal-id3="modal3-${loop.index}">${messageSendDTO.message_title}</button></label>
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
                                    <button type="button" class="close-area3">목록</button>
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
</div>
</body>
</html>