<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>jeans|FindId</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
        * {
	box-sizing: border-box;
	font-family: 'Do Hyeon', sans-serif;
}
        input {
	background-color: #eee;
    border: none;
    padding: 12px 15px;
    padding-right: 40px;
    margin: 8px 0;
    width: 100%;
}

        button {
	border-radius: 20px;
	border: 1px solid #5073FB;
	background-color: #5073FB;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
    margin-bottom: 20px;
}

button:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.1);
	cursor:pointer;
}
    </style>
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
🔍  <span id="result">${member_id}</span>
</body>

<script>
        $(document).ready(function () {
            $("#member_phone").on("input", function() {
                var phoneNumber = $(this).val();
                phoneNumber = phoneNumber.replace(/[^0-9]/g, ''); // 숫자만 추출

                if (phoneNumber.length > 0) {
                    if (phoneNumber.length > 3) {
                        phoneNumber = phoneNumber.substring(0, 3) + '-' + phoneNumber.substring(3);
                    }
                    if (phoneNumber.length > 8) {
                        phoneNumber = phoneNumber.substring(0, 8) + '-' + phoneNumber.substring(8);
                    }
                }

                $(this).val(phoneNumber);
            });

            $("#findForm").submit(function (event) {
                event.preventDefault(); // 기본 폼 제출 동작을 막습니다.

                var member_name = $("#member_name").val();
                var member_phone = $("#member_phone").val();

                $.ajax({
                    type: "POST",
                    url: "/findId", // 서버의 컨트롤러 엔드포인트 주소
                    data: { member_name: member_name, member_phone: member_phone },
                    success: function (response) {
                        // 서버로부터의 응답을 처리합니다.
                        if (response != "0") {
                            $("#result").text(response);
                        } else {
                            $("#result").text("존재하지 않는 회원입니다.");
                        }
                    },
                    error: function () {
                        $("#result").text("오류가 발생했습니다.");
                    }
                });
            });
        });
</script>
</html>