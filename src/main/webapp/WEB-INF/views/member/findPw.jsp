<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>jeans|FindPw</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/member/find.css">
    <script type="text/javascript" src="../../../resources/js/member/findPw.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body>
<h1>비밀번호 수정</h1>
<div>
    <form method="post" action="/findPw" id="findForm">
        <input type="text" id="member_id" name="member_id" placeholder="아이디를 입력해주세요." minlength="3" maxlength="12">
        <input type="text" id="member_phone" name="member_phone" maxlength="13" placeholder="전화번호(000-0000-0000)" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" >
        <div>
            <button type="submit" id="modifyBtn">비밀번호 수정</button>
        </div>
        <span id="errorMsg"></span>
    </form>
    <form method="post" action="/updatePw" id="updateForm" style="display:none;">
        <span style="font-size:13px;">새로운 비밀번호를 입력해 주세요🙏</span>
        <input type="hidden" id="member_id_hidden" name="member_id" value="">
        <div class="password">
            <input type="text" id="member_pw" name="member_pw" placeholder="새 비밀번호" minlength="6" maxlength="20">
            <span class="eye-icon"><ion-icon name="eye-outline"></ion-icon></span>
        </div>
        <div class="passwordCheck">
            <input type="password" id="check_new_pw" placeholder="새 비밀번호 확인" minlength="6" maxlength="20">
            <span class="eye-icon2"><ion-icon name="eye-outline"></ion-icon></span>
        </div>
        <span id="errorMsg2" style="font-size:13px;"></span>
        <div>
            <button type="submit" id="updatePw">수정하기</button>
        </div>
    </form>
</div>
<div class="modal-container">
    <div id="myModal" class="modal">
        <div class="modal-content">
            <p>비밀번호가 변경 되었습니다.</p>
            <!-- 삭제 확인 및 취소 버튼 -->
            <div class="confirm-container">
                <button id="confirmDelete">확인</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>