<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Jeans|회원가입</title>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/member/join.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/member/teacherJoin.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body class="form-v10">
<div class="page-content">
    <a href="/login">
        <i class="fa-solid fa-chevron-left" style="color: #5073fb; margin: 10px;" ></i>
    </a>
    <div class="form-v10-content">
        <form class="form-detail" action="/teacher" method="post" id="teacherForm">
            <div class="form-left">
                <h2>강사님 회원가입👖</h2>
                <div class="signup">
                    <div class="form-row form-row-1">
                        <input type="text" name="member_name" id="name" class="input-text" placeholder="이름" autocomplete="off">
                        <span id="nameError" style="color: red; font-size: 14px;"></span>
                    </div>
                    <div class="form-row form-row-2">
                        <input type="text" name="member_id" id="id" class="input-text" placeholder="아이디" autocomplete="off" minlength="3" maxlength="12">
                        <span id="idError" style="color: red; font-size: 14px;"></span>
                    </div>
                    <div class="form-row form-row-3">
                        <div class="password-container">
                            <input type="password" name="member_pw" id="member_pw" class="input-text" placeholder="비밀번호" minlength="6" maxlength="20">
                            <span class="eye-icon"><ion-icon name="eye-outline"></ion-icon></span>
                        </div>
                        <span id="passwordError" style="color: red; font-size: 14px;"></span>
                    </div>
                    <div class="form-row form-row-4">
                        <div class="password-container">
                            <input type="password" name="member_pw2" id="member_pw2" class="input-text" placeholder="비밀번호 확인" minlength="6" maxlength="20">
                            <span  class="eye-icon2"><ion-icon name="eye-outline"></ion-icon></span>
                        </div>
                        <span id="passwordMatchError" style="color: red; font-size: 14px;"></span>
                    </div>
                    <div class="form-row form-row-2">
                        <select name="member_class" required>
                            <option value="" disabled selected>반 선택</option>
                            <option value="1반">1반</option>
                            <option value="2반">2반</option>
                            <option value="3반">3반</option>
                            <option value="4반">4반</option>
                        </select>
                        <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-right">
                <h2>개인 정보</h2>
                <div class="form-row">
                    <input type="tel" id="phone" name="member_phone" class="phone" maxlength="13" placeholder="전화번호(000-0000-0000)" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" autocomplete="off">
                    <span id="phoneError" style="color: red; font-size: 14px;"></span>
                </div>
                <div class="form-row">
                    <input type="date" name="member_day" class="birth" id="birth" pattern="[0-9]{6}" maxlength="6" placeholder="생년월일(6자리)" required>
                </div>
                <div class="form-row">
                    <input type="text" name="member_code" class="code" id="code" pattern="[0-9]{4}" maxlength="4" placeholder="강사번호(4자리)" autocomplete="off">
                    <span id="codeError" style="color: red; font-size: 14px;"></span>
                </div>
                <div class="form-checkbox">
                    <label class="container"><p>Jeans 강사님 인가요? 👀</p>
                        <input type="checkbox" name="checkbox" id="teacherCheckbox">
                        <span class="checkmark"></span>
                    </label>
                </div>
                <div class="form-row-last">
                    <input type="submit" id="register" name="register" class="register" value="회원가입">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>