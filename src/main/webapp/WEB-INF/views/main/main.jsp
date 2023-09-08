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
    <script type="text/javascript" src="../../../resources/js/main/main.js"></script>
</head>
<body data-member-class="${member_class}" data-category="${category}">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
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
                                                <div class="icon">🌏<a href="/noticeDetail/0">◇이벤트 안내> 이벤트 기간은 09.08~09.08 </a></div>
                                            </ul>
                                        </div>
                                    </a>
                                </li>



                                <li style="--cardColor: #1A237E">
                                    <a href="/notice/list">
                                    <div class="content">
                                        <ul class="post-list" data-class="notice-2">
                                        <div class="icon">🚀<a href="/noticeDetail/2">◇학원생활</a></div>
                                        </ul>
                                    </div>
                                    </a>
                                </li>



                                <li style="--cardColor: #3F51B5 ">
                                    <a href="/notice/list">
                                        <div class="content">
                                            <ul class="post-list" data-class="notice-3">
                                            <div class="icon">🍧<a href="/noticeDetail/3">◇공지사항3</a></div>
                                            </ul>
                                        </div>
                                    </a>
                                </li>



                                <li style="--cardColor: #1976D2">
                                    <a href="/notice/list">
                                        <div class="content">
                                            <ul class="post-list" data-class="notice-4">
                                            <div class="icon">🛸<a href="/noticeDetail/4">◇전체 공지</a></div>
                                            </ul>
                                        </div>
                                    </a>
                                </li>



                                <li style="--cardColor:	#00ACC1">
                                    <a href="/notice/list">
                                        <div class="content">
                                            <div class="icon">🐧<a href="/noticeDetail/5">◇학원 사이트</a></div>
                                        </div>
                                    </a>
                                </li>

                            </ol>
                        </ul>
                    </div>
                </div>

                <div class="board-class">
                            <div class="class-1">
                                <input type="hidden" class="checkClass1" value="1반">
                                <a href="/board1/list"><h1>1반</h1></a>
                                <!-- 게시글 목록 링크 -->
                                <!-- 1반 게시판 목록 -->
                                <ul class="board1List" data-class="boardList">
                                    <c:forEach items="${board1List}" var="board1Item">
                                        <li><a href="/board1/detail/${board1Item.board1_no}">${board1Item.board1_title}</a></li>
                                    </c:forEach>
                                </ul>

                            </div>



                    <div class="class-2">
                        <input type="hidden" class="checkClass2" value="2반">
                        <a href="/board2/list"><h1>2반</h1></a>
                        <!-- 게시글 목록 링크 -->
                        <!-- 1반 게시판 목록 -->
                        <ul class="board2List" data-class="boardList">
                            <c:forEach items="${board2List}" var="board2Item">
                                <li><a href="/board2/detail/${board2Item.board2_no}">${board2Item.board2_title}</a></li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="class-3">
                        <input type="hidden" class="checkClass3" value="3반">
                        <a href="/board3/list"><h1>3반</h1></a>
                        <!-- 게시글 목록 링크 -->
                        <!-- 1반 게시판 목록 -->
                        <ul class="board3List" data-class="boardList">
                            <c:forEach items="${board3List}" var="board3Item">
                                <li><a href="/board3/detail/${board3Item.board3_no}">${board3Item.board3_title}</a></li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="class-4">
                        <input type="hidden" class="checkClass4" value="4반">
                        <a href="/board4/list"><h1>4반</h1></a>
                        <!-- 게시글 목록 링크 -->
                        <!-- 1반 게시판 목록 -->
                        <ul class="board4List" data-class="boardList">
                            <c:forEach items="${board4List}" var="board4Item">
                                <li><a href="/board4/detail/${board4Item.board4_no}">${board4Item.board4_title}</a></li>
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
</body>
</html>
