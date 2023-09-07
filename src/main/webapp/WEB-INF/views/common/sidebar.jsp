<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/common/sidebar.css">
    <meta charset="UTF-8">
    <title></title>
</head>
<body data-member-class="${member_class}" data-category="${category}">
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a href="/main1" id="${category == 'main' ? 'active--link' : ''}">
                    <span class="icon icon-1"><i class="ri-home-4-line" style="${category == 'main' ? 'color:white;' : ''}"></i></span>
                    <span class="sidebar--item">홈</span>
                </a>
            </li>
            <li>
                <a href="/noticeList" id="${category == 'notice' ? 'active--link' : ''}">
                    <span class="icon icon-2"><i class="ri-megaphone-line" style="${category == 'notice' ? 'color:white;' : ''}"></i></span>
                    <span class="sidebar--item">공지사항</span>
                </a>
            </li>
            <li>
                <a href="/board1/list" id="${category == 'board1' ? 'active--link' : ''}" class="sideBoard1">
                    <span class="icon icon-3"><i class="ri-draft-line" style="${category == 'board1' ? 'color:white;' : ''}"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">1반</span>
                </a>
            </li>
            <li>
                <a href="/board2/list" id="${category == 'board2' ? 'active--link' : ''}" class="sideBoard2">
                    <span class="icon icon-4"><i class="ri-draft-line" style="${category == 'board2' ? 'color:white;' : ''}"></i></span>
                    <span class="sidebar--item">2반</span>
                </a>
            </li>
            <li>
                <a href="/board3/list" id="${category == 'board3' ? 'active--link' : ''}" class="sideBoard3">
                    <span class="icon icon-5"><i class="ri-draft-line" style="${category == 'board3' ? 'color:white;' : ''}"></i></span>
                    <span class="sidebar--item">3반</span>
                </a>
            </li>
            <li>
                <a href="/board4/list"id="${category == 'board4' ? 'active--link' : ''}" class="sideBoard4">
                    <span class="icon icon-6"><i class="ri-draft-line" style="${category == 'board4' ? 'color:white;' : ''}"></i></span>
                    <span class="sidebar--item">4반</span>
                </a>
            </li>
            <li>
                <a href="/question/list" id="${category == 'question' ? 'active--link' : ''}">
                    <span class="icon icon-7"><i class="ri-questionnaire-line" style="${category == 'question' ? 'color:white;' : ''}"></i></span>
                    <span class="sidebar--item">QnA</span>
                </a>
            </li>
            <li>
                <a href="/map" id="${category == 'map' ? 'active--link' : ''}">
                    <span class="icon icon-8"><i class="ri-map-fill" style="${category == 'board4' ? 'color:white;' : ''}"></i></span>
                    <span class="sidebar--item">찾아오시는 길</span>
                </a>
            </li>
            <c:if test="${member_type == '관리자'}">
                <li>
                    <a href="/admin/memberList" id="${category == 'admin' ? 'active--link' : ''}">
                        <span class="icon icon-10"><i class="ri-admin-line" style="${category == 'admin' ? 'color:white;' : ''}"></i></span>
                        <span class="sidebar--item">Admin</span>
                    </a>
                </li>
            </c:if>
        </ul>
        <ul class="sidebar--bottom-items">
            <li>
                <a href="/mypage/list" id="${category == 'mypage' ? 'active--link' : ''}">
                    <span class="icon icon-8"><i class="ri-user-3-line" style="${category == 'mypage' ? 'color:white;' : ''}"></i></span>
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
</section>
</body>