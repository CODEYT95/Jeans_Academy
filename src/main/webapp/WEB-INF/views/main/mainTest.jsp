<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
    <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta charset="UTF-8">
    <title>Jeans</title>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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
        .bell {
            color: #F1D243;
            background-color: rgba(241, 210, 67, .2);
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

            width: 100%;
            height: 100%;
            border-radius:24px;
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
	    .sidebar--items{
            margin-top: 60px;
        }
        .sidebar::-webkit-scrollbar {
            display: none;
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
        /* main--content */
        .main--content {
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            width: calc(100% - 300px);
            padding: 14px 50px;
            overflow-y: auto;
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
    </style>
<!-- 절취선-->
    <style>
        .main-container{
            display: flex;
            width: 100%;
            height: 100%;
        }
        .contents{
            width: 100%;
            height: 100%;
            display: flex;
        }

       .img-notice{
            width: 40%;
            display: flex;
            height: 100%;
            flex-direction: column;
            left:50px;

        }
        .box-img{
            width: 95%;
            height: 83%;
            margin-bottom: 24px;
            border: 1px solid;
            border-radius: 24px;

          border: 0px solid rgba(0, 0, 0, 0.125);
          border-radius: 1rem;
          box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
          overflow-wrap: break-word;
          min-width: 0px;
          color: rgba(0, 0, 0, 0.87);
          transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
     overflow: hidden;
        justify-content: center;
        }

        .box-notice{
            width: 100%;
            height: 100%;
            border: 1px solid;
            border-radius: 24px;



         border: 0px solid rgba(0, 0, 0, 0.125);
          border-radius: 1rem;
          box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
          overflow-wrap: break-word;
          min-width: 0px;
          color: rgba(0, 0, 0, 0.87);
          transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
          overflow: hidden;
        justify-content: center;
        }
        .title {
        color: white; /* 원하는 폰트 컬러 값으로 변경 */
    }


        .board-class{
            padding: 0px 19px;
            width: 32%;
            height: 100%;


        }

        .class-1{
            width: 100%;
            height: 23%;
            margin-bottom: 21px;
            border: 1px solid;
            border-radius: 24px;
        }

        .class-2{
            width: 100%;
            height: 23%;
            margin-bottom: 21px;
            border: 1px solid;
            border-radius: 24px;
        }

        .class-3{
            width: 100%;
            height: 23%;
            margin-bottom: 21px;
            border: 1px solid;
            border-radius: 24px;
        }

        .class-4{
            width: 100%;
            height: 23%;
            margin-bottom: 21px;
            border: 1px solid;
            border-radius: 24px;
        }

        .plan-game{
            width: 28%;
            height: 100%;
        }



        .plan-container{
            width: 100%;
            height: 50%;
            border: 1px solid;
            border-radius: 24px;
            margin-bottom: 10px;

 border: 0px solid rgba(0, 0, 0, 0.125);
  border-radius: 1rem;
  box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
  overflow-wrap: break-word;
  min-width: 0px; /* 최대 너비 제한 */
  color: rgba(0, 0, 0, 0.87);
  transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
  overflow: hidden;

  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;

  background-color: rgb(255, 255, 255);
  background-clip: border-box;
  justify-content: flex-start;
        }

 .wrap {
          margin-top: 40px;
          font-size: 14px;
          font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        }
        /* 드래그 박스의 스타일 */
     #external-events {
    right: 0px;
    top: 200px;
    width: 30%;
    padding: 0px 10px;
    border: 1px solid #ccc;
    background: #eee;
    text-align: left;
}
        #external-events h4 {
          font-size: 16px;
          margin-top: 0;
          padding-top: 1em;
        }
        #external-events .fc-event {
          margin: 3px 0;
          cursor: move;
        }

        #external-events p {
          margin: 1.5em 0;
          font-size: 11px;
          color: #666;
        }

        #external-events p input {
          margin: 0;
          vertical-align: middle;
        }

        #calendar-wrap {
          margin-left: 0px;
        }

        #calendar1 {
          max-width: 1100px;
          margin: 0 auto;
        }
    .fc .fc-toolbar.fc-header-toolbar {
        margin-top: 10px;
        margin-bottom: 10px;
        margin-right: 10px;
        margin-left: 10px;
        }
        .fc .fc-toolbar {
        display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 12px;
        }

.olcards,
.olcards * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.olcards {
  list-style: none;
  counter-reset: cardCount;
  font-family: sans-serif;
  display: flex;
  flex-direction: column;
  --cardsGap: 1rem;
  gap: var(--cardsGap);
  padding-bottom: var(--cardsGap);
  max-width: 100%;
   margin: 0 auto;
}
 .olcards li {
  counter-increment: cardCount;
    display: flex;
    color: white;
    --labelOffset: 1rem;
    --arrowClipSize: 1.5rem;
    margin-top: var(--labelOffset);
    height: 50px;
    width: 100%;
    flex-direction: row;
    justify-content: center;
}
 .olcards li::before {
  content: counter(cardCount, decimal-leading-zero);
  background: white;
  color: var(--cardColor);
  font-size: 2em;
  font-weight: 700;
  transform: translateY(calc(-1 * var(--labelOffset)));
  margin-right: calc(-1 * var(--labelOffset));
  z-index: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  padding-inline: 0.5em;
}
.olcards li .content {
  background-color: var(--cardColor);
  --inlinePadding: 7em;
  --boxPadding: 0.5em;
  display: grid;
  padding: var(--boxPadding) calc(var(--inlinePadding) + var(--arrowClipSize))
    var(--boxPadding) calc(var(--inlinePadding) + var(--labelOffset));
  grid-template-areas:
    "icon title"
    "icon text";
  gap: 0.25em 1em;
  clip-path: polygon(
    0 0,
    calc(100% - var(--arrowClipSize)) 0,
    100% 50%,
    calc(100% - var(--arrowClipSize)) 100%,
    calc(100% - var(--arrowClipSize)) calc(100% + var(--cardsGap)),
    0 calc(100% + var(--cardsGap))
  );
  position: relative;
}
.olcards li .content::before {
  content: "";
  position: absolute;
  width: var(--labelOffset);
  height: var(--labelOffset);
  background: var(--cardColor);
  left: 0;
  bottom: 0;
  clip-path: polygon(0 0, 100% 0, 0 100%);
  filter: brightness(0.75);
}
        .olcards li .content::after {
  content: "";
  position: absolute;
  height: var(--cardsGap);
  width: var(--cardsGap);
  background: linear-gradient(to right, rgba(0, 0, 0, 0.25), transparent 50%);
  left: 0;
  top: 100%;
}
        .olcards li .icon {
  grid-area: icon;
  align-self: center;
}
.olcards li .content .title {
  grid-area: title;
  font-size: 1.25em;
  /* font-weight: 700; */
}
.olcards li .content .text {
  grid-area: text;
}



        .game-container{
            width: 100%;
            height: 48%;
            border: 1px solid;
        }






    </style>


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

    <script>
        (function(){
          $(function(){
            // 드래그 박스 취득
            var containerEl = $('#external-events-list')[0];
            // 설정하기
            new FullCalendar.Draggable(containerEl, {
              itemSelector: '.fc-event',
              eventData: function(eventEl) {
                return {
                  title: eventEl.innerText.trim()
                }
              }
            });
            // 드래그 아이템 추가하기
            for(var i=1; i<=5;i++) {
              var $div = $("<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'></div>");
              $event = $("<div class='fc-event-main'></div>").text("Event "+i);
              $('#external-events-list').append($div.append($event));
            }
            var calendarEl = $('#calendar1')[0];

var calendar = new FullCalendar.Calendar(calendarEl, {
  headerToolbar: {
    left: 'prev,next today',
    center: 'title',
    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
  },
  initialDate: '2023-08-30',
  locale: 'ko',
  editable: true,
  droppable: true,
  drop: function(arg) {
    arg.draggedEl.parentNode.removeChild(arg.draggedEl);
  },
  dateClick: function(info) { // 이 부분을 제대로 추가해주세요.
    var clickedDate = info.date;
    var formattedDate = clickedDate.toISOString().split('T')[0];
    window.location.href = '스케줄페이지URL?date=' + formattedDate;
  }
});

// 캘린더 랜더링
calendar.render();




            // 캘린더 랜더링
            calendar.render();

          });
        })();
    </script>

</head>
<body>
<section class="header">
    <div class="logo">
        <i class="ri-menu-line icon icon-0 menu"></i>
        <h2>J<span>eans:👖:</span></h2><h5><span style="color:#5073FB">청</span>춘은 <span style="color:#5073FB">바</span>로 <span style="color:#5073FB">지</span>금!</h5>
    </div>
    <div class="search--notification--profile">
        <div class="notification--profile">
            <div class="picon bell">
                <i class="ri-notification-2-line"></i>
            </div>
            <div class="picon chat">
                <i class="ri-mail-line"></i>
            </div>
            <div class="picon profile">
                <span>???님 오늘도 파이팅하세요:😊:</span>
            </div>
        </div>
    </div>
</section>
<section class="main">
    <div class="sidebar">
        <ul class="sidebar--items">
            <li>
                <a href="#" id="active--link">
                    <span class="icon icon-1"><i class="ri-home-4-line"></i></span>
                    <span class="sidebar--item">홈</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-2"><i class="ri-megaphone-line"></i></span>
                    <span class="sidebar--item">공지사항</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-3"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item" style="white-space: nowrap;">1반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-4"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">2반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-5"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">3반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-6"><i class="ri-draft-line"></i></span>
                    <span class="sidebar--item">4반</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon icon-7"><i class="ri-questionnaire-line"></i></span>
                    <span class="sidebar--item">QnA</span>
                </a>
            </li>
        </ul>
        <ul class="sidebar--bottom-items">
            <li>
                <a href="#">
                    <span class="icon icon-8"><i class="ri-user-3-line"></i></span>
                    <span class="sidebar--item">마이페이지</span>
                </a>
            </li>
            <li>
                <a href="#">
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
                        <a href="/images.do">
                            <h1>Today Photo</h1>
                            <img src="../../../resources/image/cat.png" alt="today">

                        </a>
                    </div>

                    <div class="box-notice">
                        <ul>
                            <ol class="olcards">
                                <li style="--cardColor:#7E57C2">
                                    <a href="/notice.do">
                                        <div class="content">
                                            <div class="icon">🌏</div>
                                            <div class="title">공지리스트1</div>
                                        </div>
                                    </a>
                                </li>



                                    <li style="--cardColor: #1A237E">
                                        <a href="/notice.do">
                                        <div class="content">
                                            <div class="icon">🚀</div>
                                            <div class="title">공지리스트2</div>
                                        </div>
                                        </a>
                                    </li>



                                    <li style="--cardColor: #3F51B5 ">
                                        <a href="/notice.do">
                                        <div class="content">
                                            <div class="icon">🍧</div>
                                            <div class="title">공지리스트3</div>
                                        </div>
                                        </a>
                                    </li>



                                    <li style="--cardColor: #1976D2">
                                        <a href="/notice.do">
                                        <div class="content">
                                            <div class="icon">🛸</div>
                                            <div class="title">공지리스트4</div>
                                        </div>
                                        </a>
                                    </li>



                                    <li style="--cardColor:	#00ACC1">
                                        <a href="/notice.do">
                                        <div class="content">
                                            <div class="icon">🐧</div>
                                            <div class="title">공지리스트5</div>
                                        </div>
                                        </a>
                                    </li>

                            </ol>
                        </ul>
                    </div>
                </div>
                <div class="board-class">
                    <div class="class-1">

                    </div>
                    <div class="class-2">

                    </div>
                    <div class="class-3">

                    </div>
                    <div class="class-4">

                    </div>
                </div>

                <div class="plan-game">
                    <div class="plan-container">

                        <div id='wrap'>
                            <!-- 드래그 박스 -->
                            <div id='external-events'>
                                <h4>Draggable Events</h4>
                                <div id='external-events-list'></div>
                            </div>
                            <!-- calendar 태그 -->
                            <div id='calendar-wrap'>
                                <div id='calendar1'></div>
                            </div>
                        </div>
                    </div>
                    <div class="game-container" id="calendarLink">
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
</body>
</html>