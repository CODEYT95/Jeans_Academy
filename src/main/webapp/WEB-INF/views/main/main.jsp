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




    <script>
        $(document).ready(function() {
            let menu = $('.menu');
            let sidebar = $('.sidebar');
            let mainContent = $('.main--content');
            menu.click(function() {
                sidebar.toggleClass('active');
                mainContent.toggleClass('active');
            });
        });
    </script>

    <!-- 게시물 목록에 제목 표시 -->
    <script>
        $(document).ready(function() {
            // 각 게시물 항목을 순회하며 제목 정보를 가져와서 표시합니다.
            $('.box-notice ul li').each(function() {
                var title = $(this).data('title'); // 데이터 속성에서 제목 정보 가져오기
                if (title) {
                    // 게시물 항목 아래에 제목 정보를 추가합니다.
                    $(this).find('.icon').append('<div class="post-title">' + title + '</div>');
                }
            });
        });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const slides = document.querySelectorAll('.slide');
            const btns = document.querySelectorAll('.btn');
            let currentSlide = 0;

            function manualNav(manual) {
                slides.forEach((slide) => {
                    slide.classList.remove('active');
                });

                btns.forEach((btn) => {
                    btn.classList.remove('active');
                });

                slides[manual].classList.add('active');
                btns[manual].classList.add('active');
            }

            btns.forEach((btn, i) => {
                btn.addEventListener("click", () => {
                    manualNav(i);
                    currentSlide = i;
                });
            });

            function repeat(activeClass) {
                const active = document.getElementsByClassName('active');
                let i = 0;

                function repeater() {
                    setTimeout(function() {
                        [...active].forEach((activeSlide) => {
                            activeSlide.classList.remove('active');
                        });

                        slides[i].classList.add('active');
                        btns[i].classList.add('active');
                        i++;

                        if (slides.length == i) {
                            i = 0;
                        }
                        if (i >= slides.length) {
                            return;
                        }
                        repeater();
                    }, 3000);
                }
                repeater();
            }

            repeat();
        });
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
     var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, {
         headerToolbar: {
             left: 'prev,next today',
             center: 'title',
             right: 'dayGridMonth,timeGridWeek,timeGridDay'
         },
         initialDate: new Date(),
         navLinks: true,
         selectable: true,
         selectMirror: true,
         select: function(arg) {
                var title = prompt('입력할 일정:');
                if (title) {
                    calendar.addEvent({
                        title: title,
                        start: arg.start,
                        end: arg.end,
                        allDay: arg.allDay,
                        backgroundColor: "#FFCDD2",
                        textColor: "black"
                    });

                    // 입력된 데이터를 서버로 전송
                     $.ajax({
                        type: "POST",
                        url: "/insertPlan?method=data",
                        data: JSON.stringify({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay
                        }), // 데이터를 JSON 형식으로 보냄
                        contentType: "application/json; charset=UTF-8",
                        dataType: "text",
                        success: function (response) {
                            // 성공적으로 서버에 데이터를 전송한 후 실행할 코드
                        },
                        error: function () {
                            // 오류 처리
                        }
                    });
                }
                calendar.unselect();
            },
         eventClick: function(arg) {
             if (confirm('해당 일정을 정말로 삭제 하시겠습니까?')) {
                 arg.event.remove();
             }
         },
         editable: true,
         locale: 'ko', // 한국 날짜 형식으로 설정
         events: function(info, successCallback, failureCallback) {
             $.ajax({
                 type: "GET",
                 url: "/selectPlan?method=data",
                 dataType: "text",
                 success: function(response) {
                 console.log(response);
                     successCallback(JSON.parse(response));
                 },
                 error: function() {
                     failureCallback();
                 }
             });
         }
     });
     calendar.render();
 });

    </script>
    <script type="text/javascript">
        var colour="random"; // in addition to "random" can be set to any valid colour eg "#f0f" or "red"
        var sparkles=50;

        /****************************
        *  Tinkerbell Magic Sparkle *
        *(c)2005-13 mf2fm web-design*
        *  http://www.mf2fm.com/rv  *
        * DON'T EDIT BELOW THIS BOX *
        ****************************/
        var x=ox=400;
        var y=oy=300;
        var swide=800;
        var shigh=600;
        var sleft=sdown=0;
        var tiny=new Array();
        var star=new Array();
        var starv=new Array();
        var starx=new Array();
        var stary=new Array();
        var tinyx=new Array();
        var tinyy=new Array();
        var tinyv=new Array();

        window.onload=function() { if (document.getElementById) {
            var i, rats, rlef, rdow;
            for (var i=0; i<sparkles; i++) {
                var rats=createDiv(3, 3);
                rats.style.visibility="hidden";
                rats.style.zIndex="999";
                document.body.appendChild(tiny[i]=rats);
                starv[i]=0;
                tinyv[i]=0;
                var rats=createDiv(5, 5);
                rats.style.backgroundColor="transparent";
                rats.style.visibility="hidden";
                rats.style.zIndex="999";
                var rlef=createDiv(1, 5);
                var rdow=createDiv(5, 1);
                rats.appendChild(rlef);
                rats.appendChild(rdow);
                rlef.style.top="2px";
                rlef.style.left="0px";
                rdow.style.top="0px";
                rdow.style.left="2px";
                document.body.appendChild(star[i]=rats);
            }
            set_width();
            sparkle();
        }}

        function sparkle() {
            var c;
            if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
                ox=x;
                oy=y;
                for (c=0; c<sparkles; c++) if (!starv[c]) {
                    star[c].style.left=(starx[c]=x)+"px";
                    star[c].style.top=(stary[c]=y+1)+"px";
                    star[c].style.clip="rect(0px, 5px, 5px, 0px)";
                    star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
                    star[c].style.visibility="visible";
                    starv[c]=50;
                    break;
                }
            }
            for (c=0; c<sparkles; c++) {
                if (starv[c]) update_star(c);
                if (tinyv[c]) update_tiny(c);
            }
            setTimeout("sparkle()", 40);
        }

        function update_star(i) {
            if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
            if (starv[i]) {
                stary[i]+=1+Math.random()*3;
                starx[i]+=(i%5-2)/5;
                if (stary[i]<shigh+sdown) {
                    star[i].style.top=stary[i]+"px";
                    star[i].style.left=starx[i]+"px";
                }
                else {
                    star[i].style.visibility="hidden";
                    starv[i]=0;
                    return;
                }
            }
            else {
                star[i].style.visibility="hidden";
                starv[i]=0;
                return;
            }
        }

        function update_tiny(i) {
            if (--tinyv[i]==25) {
                tiny[i].style.width="1px";
                tiny[i].style.height="1px";
            }
            if (tinyv[i]) {
                tinyy[i]+=1+Math.random()*3;
                tinyx[i]+=(i%5-2)/5;
                if (tinyy[i]<shigh+sdown) {
                    tiny[i].style.top=tinyy[i]+"px";
                    tiny[i].style.left=tinyx[i]+"px";
                }
                else {
                    tiny[i].style.visibility="hidden";
                    tinyv[i]=0;
                    return;
                }
            }
            else {
                tiny[i].style.visibility="hidden";
                tinyv[i]=0;
                return;
            }
        }

        document.onmousemove=mouse;
        function mouse(e) {
            if (e) {
                y=e.pageY;
                x=e.pageX;
            }
            else {
                set_scroll();
                y=event.y+sdown;
                x=event.x+sleft;
            }
        }

        window.onscroll=set_scroll;
        function set_scroll() {
            if (typeof(self.pageYOffset)=='number') {
                sdown=self.pageYOffset;
                sleft=self.pageXOffset;
            }
            else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
                sdown=document.body.scrollTop;
                sleft=document.body.scrollLeft;
            }
            else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
                sleft=document.documentElement.scrollLeft;
                sdown=document.documentElement.scrollTop;
            }
            else {
                sdown=0;
                sleft=0;
            }
        }

        window.onresize=set_width;
        function set_width() {
            var sw_min=999999;
            var sh_min=999999;
            if (document.documentElement && document.documentElement.clientWidth) {
                if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
                if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
            }
            if (typeof(self.innerWidth)=='number' && self.innerWidth) {
                if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
                if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
            }
            if (document.body.clientWidth) {
                if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
                if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
            }
            if (sw_min==999999 || sh_min==999999) {
                sw_min=800;
                sh_min=600;
            }
            swide=sw_min;
            shigh=sh_min;
        }

        function createDiv(height, width) {
            var div=document.createElement("div");
            div.style.position="absolute";
            div.style.height=height+"px";
            div.style.width=width+"px";
            div.style.overflow="hidden";
            div.style.backgroundColor=colour;
            return (div);
        }

        function newColour() {
            var c=new Array();
            c[0]=255;
            c[1]=Math.floor(Math.random()*256);
            c[2]=Math.floor(Math.random()*(256-c[1]/2));
            c.sort(function(){return (0.5-Math.random());});
            return("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
        }
    </script>
    <script>
    //반별로 게시판 권한 주기
    document.addEventListener("DOMContentLoaded", function() {
    var member_class = "${member_class}";
    console.log(member_class);

    // 클릭 이벤트 캔슬 함수
    function cancelClickEvent(links) {
    links.forEach(function(link) {
    link.addEventListener("click", function(event) {
    event.preventDefault(); // 클릭 이벤트를 캔슬합니다.
    });
    });
    }

    var class1Links = document.querySelectorAll(".class-1 a");
    var class2Links = document.querySelectorAll(".class-2 a");
    var class3Links = document.querySelectorAll(".class-3 a");
    var class4Links = document.querySelectorAll(".class-4 a");
    var sideClass1 = document.querySelectorAll(".sideBoard1")
    var sideClass2 = document.querySelectorAll(".sideBoard2")
    var sideClass3 = document.querySelectorAll(".sideBoard3")
    var sideClass4 = document.querySelectorAll(".sideBoard4")


    if (member_class === "1반") {
    cancelClickEvent(class2Links);
    cancelClickEvent(class3Links);
    cancelClickEvent(class4Links);
    cancelClickEvent(sideClass2);
    cancelClickEvent(sideClass3);
    cancelClickEvent(sideClass4);
    } else if (member_class === "2반") {
    cancelClickEvent(class1Links);
    cancelClickEvent(class3Links);
    cancelClickEvent(class4Links);
    cancelClickEvent(sideClass1);
    cancelClickEvent(sideClass3);
    cancelClickEvent(sideClass4);
    } else if (member_class === "3반") {
    cancelClickEvent(class1Links);
    cancelClickEvent(class2Links);
    cancelClickEvent(class4Links);
    cancelClickEvent(sideClass1);
    cancelClickEvent(sideClass2);
    cancelClickEvent(sideClass4);
    } else if (member_class === "4반") {
    cancelClickEvent(class1Links);
    cancelClickEvent(class2Links);
    cancelClickEvent(class3Links);
    cancelClickEvent(sideClass1);
    cancelClickEvent(sideClass2);
    cancelClickEvent(sideClass3);
    }
    });
    </script>
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
                <a href="#">
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
                                <ul class="board-list" data-class="class-3">
                                    <li><a href="/board1/detail/41">▷궁금한 점이 있어요</a></li>
                                    <li><a href="/board1/detail/31">▷글을 작성해볼게요</a></li>
                                    <li><a href="/board1/detail/66">▷취업 관련 정보</a></li>
                                </ul>
                            </div>



                    <div class="class-2">
                        <a href="/board2/list"><h1>2반</h1></a> <!-- 수정된 부분 -->
                        <!-- 게시글 목록 링크 -->
                        <ul class="post-list" data-class="class-2">
                            <li data-post-id="2"><a href="#">◇게시글 목록</a></li>
                        </ul>
                        <!-- 1반 게시판 목록 -->
                        <ul class="board-list" data-class="class-2">
                            <li><a href="/board2/detail/1">게시판 1</a></li>
                            <li><a href="/board2/detail/2">게시판 2</a></li>
                        </ul>
                    </div>

                    <div class="class-3">
                        <a href="/board3/list"><h1>3반</h1></a> <!-- 수정된 부분 -->
                        <!-- 게시글 목록 링크 -->
                        <ul class="post-list" data-class="class-3">
                            <li data-post-id="3"><a href="#">◇게시글 목록</a></li>
                        </ul>
                        <!-- 1반 게시판 목록 -->
                        <ul class="board-list" data-class="class-3">
                            <li><a href="/board3/detail/1">게시판 1</a></li>
                            <li><a href="/board3/detail/2">게시판 2</a></li>
                        </ul>
                    </div>

                    <div class="class-4">
                        <a href="/board4/list"><h1>4반</h1></a> <!-- 수정된 부분 -->
                        <!-- 게시글 목록 링크 -->
                        <ul class="post-list" data-class="class-4">
                            <li data-post-id="4"><a href="#">◇게시글 목록</a></li>
                        </ul>
                        <!-- 1반 게시판 목록 -->
                        <ul class="board-list" data-class="class-4">
                            <li><a href="/board4/detail/1">게시판 1</a></li>
                            <li><a href="/board4/detail/2">게시판 2</a></li>
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
