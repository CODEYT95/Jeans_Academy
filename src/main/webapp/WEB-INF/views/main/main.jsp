<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns:c="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset='utf-8'/>
    <title>Jeans</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <!-- 슬라이드-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../resources/css/main/main.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/game/snakeGame.css">
    <script src="../../../resources/js/game/snakeGame.js" defer></script>
    <script type="text/javascript" src="../../../../resources/js/common/sidebar.js"></script>
    <script type="text/javascript" src="../../../resources/js/main/main.js"></script>



</head>

<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans👖</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로
        <span style="color:#5073FB">지</span>금!</h5>
    </div>
    <div class="search--notification--profile">
        <div class="notification--profile">
            <a href="/message/messageList">
                <div class="picon chat">
                    <i class="ri-mail-line" ></i>
                </div>
            </a>
            <div class="picon profile">
                <span>${member_class} ${member_name}님 오늘도 파이팅하세요🙂</span>
            </div>
        </div>
    </div>
</section>
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a  href="/main1" id="active--link">
                    <span class="icon icon-1"><i  style="color:white;" class="ri-home-4-line"></i></span>
                    <span class="sidebar--item">홈</span>
                </a>
            </li>
            <li>
                <a href="/noticeList">
                    <span class="icon icon-2"><i class="ri-megaphone-line"></i></span>
                    <span class="sidebar--item">공지사항</span>
                </a>
            </li>
            <li>
                <a class="sideBoard1" href="/board1/list">
                    <span class="icon icon-3"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">1반</span>
                </a>
            </li>
            <li>
                <a class="sideBoard2" href="/board2/list">
                    <span class="icon icon-4"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">2반</span>
                </a>
            </li>
            <li>
                <a class="sideBoard3" href="/board3/list">
                    <span class="icon icon-5"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">3반</span>
                </a>
            </li>
            <li>
                <a class="sideBoard4" href="/board4/list">
                    <span class="icon icon-6"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">4반</span>
                </a>
            </li>
            <li>
                <a href="/question/list">
                    <span class="icon icon-7"><i class="ri-questionnaire-line"></i></span>
                    <span class="sidebar--item">QnA</span>
                </a>
            </li>
            <c:if test="${member_type == '관리자'}">
                <li>
                    <a href="/admin/memberList">
                        <span class="icon icon-10"><i class="ri-admin-line"></i></span>
                        <span class="sidebar--item">Admin</span>
                    </a>
                </li>
            </c:if>
        </ul>
        <ul class="sidebar--bottom-items">
            <li>
                <a href="/event/list">
                    <span class="icon icon-8"><i class="ri-user-3-line"></i></span>
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
    <div class="main--content">
        <div class="main-container">
            <div class="contents">
                <div class="img-notice">
                    <div class="box-img">
                        <a>
                            <div class="img-slider">
                                <div class="slide active">
                                    <img src="https://gogumafarm.kr/wp-content/uploads/2023/06/%EC%B9%B4%ED%88%B0%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%ED%8C%8C%EC%9B%8C%ED%8D%BC%ED%94%84%EA%B1%B8-700x392.png" alt="">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="https://isplus.com/data/isp/image/2023/07/18/isp20230718000308.600x.0.jpg" alt="">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="http://dh.aks.ac.kr/Edu/wiki/images/a/a5/%EA%B7%80%EC%97%AC%EC%9B%A1.gif" alt="">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="../../../resources/image/main/cat.png" alt="today">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="https://gogumafarm.kr/wp-content/uploads/2023/06/%EC%9C%A0%ED%8A%9C%EB%B8%8C-%EB%89%B4%EC%A7%84%EC%8A%A4-%ED%8C%8C%EC%9B%8C%ED%8D%BC%ED%94%84%EA%B1%B8-700x394.png" alt="">
                                    <div class="info">
                                    </div>
                                </div>
                                <div class="navigation">
                                    <div class="btn active"></div>
                                    <div class="btn"></div>
                                    <div class="btn"></div>
                                    <div class="btn"></div>
                                    <div class="btn"></div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="box-notice">
                        <ul>
                            <ol class="olcards">
                                <li style="--cardColor:#7E57C2">
                                    <a href="/notice/list">
                                        <div class="content">
                                            <ul class="post-list" data-class="notice-1">
                                                <div class="icon">🌏<a href="/noticeDetail?notice_no=0">◇이벤트 안내> 이벤트 기간은 09.08~09.08 </a></div>
                                            </ul>
                                        </div>
                                    </a>
                                </li>



                                <li style="--cardColor: #1A237E">
                                    <a href="/notice/list">
                                    <div class="content">
                                        <ul class="post-list" data-class="notice-2">
                                        <div class="icon">🚀<a href="/noticeDetail?notice_no=2">◇학원생활</a></div>
                                        </ul>
                                    </div>
                                    </a>
                                </li>



                                <li style="--cardColor: #3F51B5 ">
                                    <a href="/notice/list">
                                        <div class="content">
                                            <ul class="post-list" data-class="notice-3">
                                            <div class="icon">🍧<a href="/noticeDetail?notice_no=3">◇공지사항3</a></div>
                                            </ul>
                                        </div>
                                    </a>
                                </li>



                                <li style="--cardColor: #1976D2">
                                    <a href="/notice/list">
                                        <div class="content">
                                            <ul class="post-list" data-class="notice-4">
                                            <div class="icon">🛸<a href="/noticeDetail?notice_no=4">◇전체 공지</a></div>
                                            </ul>
                                        </div>
                                    </a>
                                </li>



                                <li style="--cardColor:	#00ACC1">
                                    <a href="/notice/list">
                                        <div class="content">
                                            <div class="icon">🐧<a href="/noticeDetail?notice_no=5">◇학원 사이트</a></div>
                                            <ul>
                                                <c:forEach items="${noticeList}" var="notice">
                                                    <li>
                                                        <a href="#"><span class="no">${notice.notice_no}</span></a>
                                                        <a class="view-link">
                                                            <span class="title">${notice.notice_content}</span>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </a>
                                </li>

                            </ol>
                        </ul>
                    </div>
                </div>

                <div class="board-class">
                            <div class="class-1">
                                <a href="/board1/list"><h1>1반</h1></a>
                                <!-- 게시글 목록 링크 -->
                                <!-- 1반 게시판 목록 -->
                                <ul class="board1List" data-class="boardList">
                                    <c:forEach items="${board1List}" var="board1Item">
                                        <li><a href="/board1/detail/{board1Item.board1_no}">${board1Item.board1_title}</a></li>
                                    </c:forEach>
                                </ul>


                             <!--   <ul class="board-list" data-class="class-3">
                                    <li><a href="/board1/detail/41">▷궁금한 점이 있어요</a></li>
                                    <li><a href="/board1/detail/31">▷글을 작성해볼게요</a></li>
                                    <li><a href="/board1/detail/66">▷취업 관련 정보</a></li>
                                </ul>-->
                            </div>



                    <div class="class-2">
                        <a href="/board2/list"><h1>2반</h1></a> <!-- 수정된 부분 -->
                        <!-- 게시글 목록 링크 -->
                        <ul class="post-list" data-class="class-2">
                            <li data-post-id="2"><a href="#">◇게시글 목록</a></li>
                        </ul>
                        <!-- 2반 게시판 목록 -->
                        <ul class="board2List" data-class="boardList">
                            <c:forEach items="${board2List}" var="board2Item">
                                <li>${board2Item.title}</li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="class-3">
                        <a href="/board3/list"><h1>3반</h1></a> <!-- 수정된 부분 -->
                        <!-- 게시글 목록 링크 -->
                        <ul class="post-list" data-class="class-3">
                            <li data-post-id="3"><a href="#">◇게시글 목록</a></li>
                        </ul>
                        <!-- 3반 게시판 목록 -->
                        <ul class="board3List" data-class="boardList">
                            <c:forEach items="${board3List}" var="board3Item">
                                <li>${board3Item.title}</li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="class-4">
                        <a href="/board4/list"><h1>4반</h1></a> <!-- 수정된 부분 -->
                        <!-- 게시글 목록 링크 -->
                        <ul class="post-list" data-class="class-4">
                            <li data-post-id="4"><a href="#">◇게시글 목록</a></li>
                        </ul>
                        <!-- 4반 게시판 목록 -->
                        <ul class="board4List" data-class="boardList">
                            <c:forEach items="${board4List}" var="board4Item">
                                <li>${board4Item.title}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="plan-game">
                    <div class="plan-container">

                        <!-- calendar 태그 -->
                        <div id='calendar-container'>
                            <div id='calendar'></div>
                        </div>
                    </div>

                    <div class="game-container">
                        <div class="wrapper">
                            <div class="game-details">
                                <span class="score">점수: 0</span>
                                <span class="high-score">최고점수: 0</span>
                            </div>
                            <div class="play-board"></div>
                            <div class="controls">
                                <i data-key="ArrowLeft" class="fa-solid fa-arrow-left-long"></i>
                                <i data-key="ArrowUp" class="fa-solid fa-arrow-up-long"></i>
                                <i data-key="ArrowRight" class="fa-solid fa-arrow-right-long"></i>
                                <i data-key="ArrowDown" class="fa-solid fa-arrow-down-long"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
