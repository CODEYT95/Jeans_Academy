<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Jeans|로그인</title>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/member/login.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/member/login.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <script>
        function new_window() {
          window.open(
            "find",
            "findId",
            "width=400, height=300, top=400, left=750"
          );
        }
    </script>

</head>
<body>
<section class="main">
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="/login" method="post" id="teacherForm">
                <h1>Login</h1>
                <span>강사/관리자</span>
                <input type="hidden" name="member_type" id="teacher" value="강사님">
                <input type="text" name="member_id" class="teacherId" placeholder="Id" />
                <div class="password-container">
                    <input type="password" name="member_pw" class="teacherPw" placeholder="Password" />
                    <span class="eye-icon"><ion-icon name="eye-outline"></ion-icon></span>
                </div>
                <span id="ErrorTeacher" style="color: red;"></span>
                <div>
                    <button type="submit" class="login">로그인</button>
                    <button id="teacherSignup">회원가입</button>
                </div>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="/login" method="post" id="studentForm">
                <h1>Login</h1>
                <span>수강생</span>
                <input type="hidden" name="member_type" id="student" value="수강생">
                <input type="text" name="member_id"  class="studentId" placeholder="Id" />
                <div class="password-container">
                    <input type="password" name="member_pw"  class="studentPw" placeholder="Password"/>
                    <span  class="eye-icon2"><ion-icon name="eye-outline"></ion-icon></span>
                </div>
                <span id="ErrorStudent" style="color: red;"></span>
                <a onclick="new_window();">아이디 찾기</a>
                <div>
                    <button type="submit" class="login">로그인</button>
                    <button id="studentSignup">회원가입</button>
                </div>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Jeans👖</h1>
                    <span>청춘은 바로 지금!</span>
                    <p>수강생인가요?👨‍👨‍👧‍👧</p>
                    <button class="ghost" id="studentLogin">수강생</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Jeans👖</h1>
                    <span>청춘은 바로 지금!</span>
                    <p>강사님 또는 관리자인가요?👩‍🏫</p>
                    <button class="ghost" id="teacherLogin">강사/관리자</button>
                </div>
            </div>
        </div>
    </div>
</section>
</body>