<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <script type="text/javascript" src="../../../../resources/js/common/sidebar.js"></script>
    <style>
        /* body 스타일 */
        body {
          margin-top: 40px;
          font-size: 14px;
          font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        }
        /* 드래그 박스의 스타일 */
        #external-events {
          position: fixed;
          left: 20px;
          top: 20px;
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
          margin-left: 200px;
        }

        #calendar1 {
          max-width: 1100px;
          margin: 0 auto;
        }
    </style>
</head>
<body>
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
</body>
</html>