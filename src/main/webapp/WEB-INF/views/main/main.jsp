<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset='utf-8' />
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
        height: 60px;
        width: 100%;
        display: flex;
        align-items: center;
        border-bottom: 2px solid #F1F1F1;
        background-color: #ebf3ff ;
        border: none;
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
        position: absolute;
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
    }
    .sidebar.active {
        width: 103px;
        overflow: hidden;
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
        padding: 0 40px;
        overflow-y: auto;
        transition: .1s;
    }

     .main--content.active {
        width: calc(100% - 103px);
    }

.box-list1 {
border: 1px solid white;
display: flex;
justify-content: space-around;
margin-top: 110px;
width: 100%;
height: 130px;
margin-right: auto;
margin-left: auto;
color: rgba(0, 0, 0, 0.87);
font-family: Roboto, Helvetica, Arial, sans-serif;
font-size: 1.25rem;
font-weight: 400;
line-height: 1.625;
letter-spacing: 0.00938em background-color: rgb(248, 249, 250);
}

.box-list2 {
border:1px solid white;
display: flex;
flex-direction: row;
margin-top:50px;
width:100%;
height:500px;
margin-right:auto;
margin-left:auto;
color: rgba(0, 0, 0, 0.87);
font-family: Roboto, Helvetica, Arial, sans-serif;
font-size: 1.25rem;
font-weight: 400;
line-height: 1.625;
letter-spacing: 0.00938em
background-color: rgb(248, 249, 250);

  display: flex;
justify-content: center;
align-items: center;
height: 100vh;



}



.box-list3 {
border: 1px solid white;
display: flex;
justify-content: space-around;
margin-top: 20px;
width: 100%;
height: 120px;
margin-right: auto;
margin-left: auto;
color: rgba(0, 0, 0, 0.87);
font-family: Roboto, Helvetica, Arial, sans-serif;
font-size: 1.25rem;
font-weight: 400;
line-height: 1.625;
letter-spacing: 0.00938em background-color: rgb(248, 249, 250);
}

.box1 {
border: 0px solid rgba(0, 0, 0, 0.125);
border-radius: 1rem;
box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
overflow-wrap: break-word;
min-width: 800px;
color: rgba(0, 0, 0, 0.87);
transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
overflow: hidden;
display: flex;
flex-direction: column;
 justify-content: center;
 align-items: center;
position: relative;
padding: 50px;
margin: 0 auto;
width: 500px;
height:200px;

background-color: rgb(255, 255, 255);
background-clip: border-box;

}

.box1 img {
max-width: 100%;
max-height: 100%;
}




.box2 {
border: 0px solid rgba(0, 0, 0, 0.125);
border-radius: 1rem;
box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
overflow-wrap: break-word;
min-width: 0px;
color: rgba(0, 0, 0, 0.87);
transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
overflow: hidden;
flex-direction: column;
justify-content: center;
align-items: center;
position: relative;
margin: 0 auto;
width: 100%;
max-width: 400px; /* 최대 너비 제한 */
height: 80%;
background-color: rgb(255, 255, 255);
background-clip: border-box;

justify-content: center; /* 세로 정렬 조절 */
align-items: center;     /* 가로 정렬 조절 */
}

h1 {
font-family: sans-serif;
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
--inlinePadding: 1em;
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
font-size: 2em;
}
.olcards li .content .title {
grid-area: title;
font-size: 1.25em;
/* font-weight: 700; */
}
.olcards li .content .text {
grid-area: text;
}


.box3 {
border: 0px solid rgba(0, 0, 0, 0.125);
border-radius: 1rem;
box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
overflow-wrap: break-word;
min-width: 0px;
color: rgba(0, 0, 0, 0.87);
transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
overflow: hidden;
display: flex;
flex-direction: column;
align-items: center;
position: relative;
padding: 10px;
margin: 0 auto;
width: 40%;
height: 74%;
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
      position: fixed;
      right: 37px;
      top: 75px;
      width: 100px;
      padding: 0 10px;
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

.box4 {
border: 0px solid rgba(0, 0, 0, 0.125);
border-radius: 1rem;
box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
overflow-wrap: break-word;
min-width: 0px;
color: rgba(0, 0, 0, 0.87);
transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
overflow: hidden;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
position: relative;
padding: 80px;
margin: 0 auto;
width: 70% height:auto;
background-color: rgb(255, 255, 255);
background-clip: border-box;

background: linear-gradient(150deg, #FFFFFF, );
}

.box5 {
border: 0px solid rgba(0, 0, 0, 0.125);
border-radius: 1rem;
box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
overflow-wrap: break-word;
min-width: 0px;
color: rgba(0, 0, 0, 0.87);
transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
overflow: hidden;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
position: relative;
padding: 80px;
margin: 0 auto;
width: 70% height:auto;
background-color: rgb(255, 255, 255);
background-clip: border-box;
}

.box6 {
border: 0px solid rgba(0, 0, 0, 0.125);
border-radius: 1rem;
box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
overflow-wrap: break-word;
min-width: 0px;
color: rgba(0, 0, 0, 0.87);
transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
overflow: hidden;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
position: relative;
padding: 80px;
margin: 0 auto;
width: 70% height:auto;
background-color: rgb(255, 255, 255);
background-clip: border-box;
}

.box7 {
border: 0px solid rgba(0, 0, 0, 0.125);
border-radius: 1rem;
box-shadow: rgba(0, 0, 0, 0.05) 0rem 1.25rem 1.6875rem 0rem;
overflow-wrap: break-word;
min-width: 0px;
color: rgba(0, 0, 0, 0.87);
transition: box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
overflow: hidden;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
position: relative;
padding: 80px;
margin: 0 auto;
width: 70% height:auto;
background-color: rgb(255, 255, 255);
background-clip: border-box;
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
        }.main--content {
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            width: calc(100% - 300px);
            padding: 0 40px;
            overflow-y: auto;
            transition: .1s;
        }
    }

</style>

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
            // calendar element 취득
            var calendarEl = $('#calendar1')[0];
            // full-calendar 생성하기
            var calendar = new FullCalendar.Calendar(calendarEl, {
              // 해더에 표시할 툴바
              headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
              },
              initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
              locale: 'ko', // 한국어 설정
              editable: true, // 수정 가능
              droppable: true,  // 드래그 가능
              drop: function(arg) { // 드래그 엔 드롭 성공시
                // 드래그 박스에서 아이템을 삭제한다.
                arg.draggedEl.parentNode.removeChild(arg.draggedEl);
              }
            });
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
        <h2>J<span>eans</span></h2><img src="../../../resources/image/main/로고5.png">
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
                <span>???님 오늘도 파이팅하세요:미소짓는_얼굴:</span>
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
                <a href="#" onclick="navigateToPage('mypage.html');">
                    <span class="icon icon-8"><i class="ri-user-3-line"></i></span>
                    <span class="sidebar--item">마이페이지</span>
                </a>
            </li>
            <li>
                <a href="#" onclick="navigateToPage('logout.html');">
                    <span class="icon icon-9"><i class="ri-logout-box-r-line"></i></span>
                    <span class="sidebar--item">로그아웃</span>
                </a>
            </li>
        </ul>
    </div>
</section>

<section>
    <div class="main--content">
        <div class="box-list1">

            <div class="box1">
                <a href="/images.do">
                    <img src="${image}" alt="이미지_설명">
                </a>
            </div>
        </div>
        <div class="box-list2">
            <a class="box2">
                <ul>
                    <ol class="olcards">
                        <a href="/notice.do">
                            <li style="--cardColor:#7E57C2">
                                <div class="content">
                                    <div class="icon">🌏</div>
                                    <div class="title">공지리스트1</div>
                                </div>
                            </li>
                        </a>

                        <a href="/notice.do">
                            <li style="--cardColor: #1A237E">
                                <div class="content">
                                    <div class="icon">🚀</div>
                                    <div class="title">공지리스트2</div>
                                </div>
                            </li>
                        </a>

                        <a href="/notice.do">
                            <li style="--cardColor: #3F51B5 ">
                                <div class="content">
                                    <div class="icon">🍧</div>
                                    <div class="title">공지리스트3</div>
                                </div>
                            </li>
                        </a>

                        <a href="/notice.do">
                            <li style="--cardColor: #1976D2">
                                <div class="content">
                                    <div class="icon">🛸</div>
                                    <div class="title">공지리스트4</div>
                                </div>
                            </li>
                        </a>

                        <a href="/notice.do">
                            <li style="--cardColor:	#00ACC1">
                                <div class="content">
                                    <div class="icon">🐧</div>
                                    <div class="title">공지리스트5</div>
                                </div>
                            </li>
                        </a>
                    </ol>
                </ul>
            </a>


            <a href="/.do" class="box3" id="calendarLink">

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

            </a>
        </div>

        <div class="box-list3">
            <div class="box4" id="box4">
                <a href="/boardList1.do">
                    <h2>1반</h2>
                </a>
            </div>
            <div class="box5" id="box5">
                <a href="/board2.do">
                    <h2>2반</h2>
                </a>
            </div>
            <div class="box6" id="box6">
                <a href="/board3.do">
                    <h2>3반</h2>
                </a>
            </div>
            <div class="box7" id="box7">
                <a href="/board4.do">
                    <h2>4반</h2>
                </a>
            </div>
        </div>
    </div>
</section>
</body>
</html>