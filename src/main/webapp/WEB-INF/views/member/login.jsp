<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Jeans|로그인</title>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/member/login.css">
    <script type="text/javascript" src="../../../resources/js/member/login.js"></script>
</head>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="#">
            <h1>Login</h1>

            <span>강사/관리자</span>
            <input type="text" placeholder="Id" />
            <input type="password" placeholder="Password" />
            <div>
                <button>로그인</button>
                <button id="teacherSignup">회원가입</button>
            </div>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="#">
            <h1>Login</h1>
            <span>수강생</span>
            <input type="text" placeholder="Id" />
            <input type="password" placeholder="Password" />

            <a href="#">아이디 찾기</a>
            <div>
                <button>로그인</button>
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