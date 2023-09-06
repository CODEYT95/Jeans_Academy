<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
}
body {
    position: relative;
    width: 100%;
}
.header {
    position: fixed;
    z-index: 9999;
    height: 60px;
    width: 100%;
    display: flex;
    align-items: center;
    border-bottom: 2px solid #F1F1F1;
    background-color: #ebf3ff;
    border: none;
    box-shadow: 11px 3px 16px #0000000d;
        }
.logo {
    display: flex;
    align-items: center;
    width: 300px;
    padding-left: 40px;
}
.logo span {
    color: #5073FB;
}
.search--notification--profile {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    width: calc(100% - 300px);
    padding: 0 40px;
}
.notification--profile {
    display: flex;
    align-items: center;
}
.picon {
    margin-left: 20px;
    font-size: 1.1rem;
    padding: 5px;
    border-radius: 5px;
}
.chat {
    color: #70D7A5;
    background-color: rgba(112, 215, 165, .2);
}
.profile {
    position: relative;
    width: 100%;
    overflow: auto;
}
.profile span{
font-family: 'Do Hyeon', sans-serif;
}
img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.main {
    position: relative;
    width: 100%;
    min-height: calc(100vh - 60px);
}
/* sidebar */
.sidebar--item{
font-family: 'Do Hyeon', sans-serif;
}
.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 300px;
    background-color: #f2f7fb;
    border: none;
    padding: 30px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: .5s;
    overflow-y: scroll;
    box-shadow: 11px 3px 16px #0000000d;
}
.sidebar::-webkit-scrollbar {
    display: none;
}
.sidebar--items{
    margin-top: 60px;
}
.sidebar.active {
    width: 103px;
    overflow-y: scroll;
}
.sidebar.active::-webkit-scrollbar{
    display: none;
}
.sidebar.active .sidebar--item {
    display: none;
}
li {
    list-style: none;
}
a {
    text-decoration: none;
}
.sidebar--items a,
.sidebar--bottom-items a {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    font-size: 1.1rem;
    color: #000;
    padding: 10px;
    border-radius: 10px;
}
.sidebar--items a:hover,
.sidebar--bottom-items a:hover {
    background-color: #5073FB;
    color: #fff;
}
#active--link {
    background-color: #5073FB;
    color: #fff;
}
#active--link i:hover {
    background-color: #5073FB;
    color: #fff;
}
.sidebar--bottom-items li:last-child a {
    margin-bottom: 0;
}
.icon {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 20px;
    font-size: 1.3rem;
}
.icon-0 {
    color: #5073FB;
}
.icon-1 {
    color: #C5BC58;
}
.icon-2 {
    color: #A280E9;
}
.icon-3 {
    color: #85ADE3;
}
.icon-4 {
    color: #E36AC8;
}
.icon-5 {
    color: #70D7A5;
}
.icon-6 {
    color: #5F5CE0;
}
.icon-7 {
    color: #E86786;
}
.icon-8 {
    color: #F1D243;
}
.icon-9 {
        color: #585858;
}
.icon-10 {
        color: #00acc1;
}
.sidebar--items a:hover .icon i {
        color: white;
}
.sidebar--bottom-items a:hover .icon i {
        color: white;
}
#active--link {
    background-color: #5073FB;
    color: #fff;
}

/* main--content */
.main--content {
        position: absolute;
        top: 0;
        right: 0;
        height: 100%;
        width: calc(100% - 300px);
        padding: 31px 125px;
        transition: .1s;
        margin-top: 60px;
}
.main--content.active {
    width: calc(100% - 103px);
}
@media screen and (max-width:1024px) {
    table {
        min-width: 600px;
    }
}
@media screen and (max-width:768px) {
    .logo {
        padding-left: 30px;
        width: fit-content;
    }
    .search--notification--profile {
        padding: 0 20px;
        margin-left: auto;
    }
    .main--content {
        padding: 0 20px;
    }
    .sidebar {
        padding: 20px;
    }
    .sidebar.active {
        width: 85px;
    }
    .main--content.active {
        width: calc(100% - 85px);
    }
}
@media screen and (max-width:590px) {
    .lock,
    .chat {
        display: none;
    }
    .notification--profile {
        margin-left: auto;
    }
    .search--notification--profile {
        width: fit-content;
    }
    .sidebar {
        transform: translateX(-100%);
        z-index: 10;
        background-color: #fff;
    }
    .sidebar.active {
        transform: translateX(0);
        width: 300px;
    }
    .sidebar.active .sidebar--item {
        display: block;
    }
    .main--content {
        width: calc(100% - 0px);
    }
    .main--content.active {
        width: calc(100% - 0px);
    }
}
@media screen and (max-width:450px) {
    .main--content {
        padding: 0 10px;
    }
    .logo {
        padding-left: 10px;
    }
    .search--notification--profile {
        padding: 0 10px;
    }
    .sidebar {
        padding: 10px;
    }
}
.quickHomeBtn{
    display: flex;
    align-items: center;
}
</style>
<script>
    $(document).ready(function() {
       /* 메뉴 공통 기능 */
           let menu = $('.menu');
           let sidebar = $('.sidebar');
           let mainContent = $('.main--content');
           menu.click(function() {
               sidebar.toggleClass('active');
               mainContent.toggleClass('active');
           });
    });
</script>
<body data-member-class="${member_class}" data-category="${category}">
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <a class="quickHomeBtn" href="main1">
        <h2>J<span>eans👖</span></h2>
        <h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로 <span style="color:#5073FB">지</span>금!</h5>
        </a>
    </div>
    <div class="search--notification--profile">
        <div class="notification--profile">
            <a href="/message/messageList">
                <div class="picon chat">
                    <i class="ri-mail-line"></i>
                </div>
            </a>
            <div class="picon profile">
                <span>${member_class} ${member_name}님 오늘도 파이팅하세요🙂</span>
            </div>
        </div>
    </div>
</section>
</body>
</html>
