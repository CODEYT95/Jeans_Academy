<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>jeans|FindId</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/member/find.css">
    <script type="text/javascript" src="../../../resources/js/member/find.js"></script>
</head>
<body>
<h1>Id 찾기</h1>
<div>
    <form method="post" action="/findId" id="findForm">
    <input type="text" id="member_name" name="member_name" placeholder="이름을 입력해주세요.">
    <input type="text" id="member_phone" name="member_phone" maxlength="13" placeholder="전화번호(000-0000-0000)" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" >
        <div>
            <button type="submit">찾기</button>
        </div>
    </form>
</div>
🔍  <span id="result"></span>
</body>
</html>