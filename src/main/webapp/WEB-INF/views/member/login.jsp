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
</head>
<body>
    <section class="main">
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="/login" method="post">
                    <h1>Login</h1>
                    <span>강사/관리자</span>
                    <input type="hidden" name="member_type" id="teacher" value="강사님">
                    <input type="text" name="member_id" class="teacherId" placeholder="Id" />
                    <span id="idErrorTeacher" style="color: red; font-size: 10px; margin-left: 10px;"></span>
                    <input type="password" name="member_pw" class="teacherPw" placeholder="Password" />
                    <span id="pwErrorTeacher" style="color: red; font-size: 10px; margin-left: 10px;"></span>
                    <pre>

                    </pre>
                    <span id="loginErrorTeacher" style="color: red; font-size: 10px; margin-left: 10px;"></span>
                    <div>
                        <button type="submit" class="login">로그인</button>
                        <button id="teacherSignup">회원가입</button>
                    </div>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="/login" method="post">
                    <h1>Login</h1>
                    <span>수강생</span>
                    <input type="hidden" name="member_type" id="student" value="수강생">
                    <input type="text" name="member_id"  class="studentId" placeholder="Id" />
                    <span id="idErrorStudent" style="color: red; font-size: 10px; margin-left: 10px;"></span>
                    <input type="password" name="member_pw"  class="studentPw" placeholder="Password"/>
                    <span id="pwErrorStudent" style="color: red; font-size: 10px; margin-left: 10px;"></span>
                    <a href="#">아이디 찾기</a>
                    <span id="loginErrorStudent" style="color: red; font-size: 10px; margin-left: 10px;"></span>
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
                        <button class="ghost" id="signIn">수강생</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Jeans👖</h1>
                        <span>청춘은 바로 지금!</span>
                        <p>강사님 또는 관리자인가요?👩‍🏫</p>
                        <button class="ghost" id="signUp">강사/관리자</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>