   document.addEventListener("DOMContentLoaded", function() {
    const calendarGrid = document.getElementById("calendar-grid");
    const monthYear = document.getElementById("month-year");
    const prevMonthButton = document.getElementById("prev-month");
    const nextMonthButton = document.getElementById("next-month");
    const modal = document.getElementById("modal");
    const attendanceButton = document.getElementById("attendance-button");
    const modalBackdrop = document.querySelector(".modal-backdrop");
    const currentTimeDisplay = document.getElementById("current-time");
    const currentDate = new Date();

    const eventDateInput = document.getElementById("event-date");
    const eventTitleInput = document.getElementById("event-title");
    const addEventButton = document.getElementById("add-event-button");
    const eventListElement = document.getElementById("event-list");

    let currentMonth = currentDate.getMonth();
    let currentYear = currentDate.getFullYear();
    let markedDates = [];
    let events = {};
    let selectedDate = null;


//--------------캘린더-------------------------
function renderCalendar() {
    const firstDayOfMonth = new Date(currentYear, currentMonth, 1).getDay();
    const lastDayOfMonth = new Date(currentYear, currentMonth + 1, 0).getDate();

    monthYear.textContent = `${currentYear}년 ${currentMonth + 1}월`;

    calendarGrid.innerHTML = "";

    for (let i = 0; i < firstDayOfMonth; i++) {
        const emptyCell = document.createElement("div");
        emptyCell.classList.add("empty-cell");
        calendarGrid.appendChild(emptyCell);
    }

    for (let day = 1; day <= lastDayOfMonth; day++) {
        const dateCell = document.createElement("div");
        dateCell.textContent = day;
        dateCell.classList.add("date-cell");
//------출석체크 기능-------------

dateCell.addEventListener("click", () => {
    const isAlreadyAttended = dateCell.classList.contains("attended");

    if (!isAlreadyAttended) {
        attendanceButton.onclick = () => {
            dateCell.classList.add("attended");
            closeModal();

            alert("출석이 완료되었습니다.");

            attendanceButton.onclick = null; // 이벤트 리스너 해제
        };
             
    } else {
        alert("이미 출석이 완료되었습니다.");
    }
   
});
        calendarGrid.appendChild(dateCell);
    }
}
//------출석체크 기능 끝----------

//------이전달/다음달----------
prevMonthButton.addEventListener("click", () => {
    currentMonth--;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    }
    renderCalendar();
});

nextMonthButton.addEventListener("click", () => {
    currentMonth++;
    if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    renderCalendar();
});

renderCalendar();
//------이전달/다음달 끝----------

//----------modal창------------------------------------
 function openModal() {
    modal.style.display = "flex";
}

function closeModal() {
    modal.style.display = "none";
}

function closeOnEscKey(event) {
    if (event.key === "Escape") {
        closeModal();
    }
}

function closeOnOutsideClick(event) {
    if (event.target === modal || event.target === modalBackdrop) {
        closeModal();
    }
}

calendarGrid.addEventListener("click", (event) => {
    if (event.target.classList.contains("date-cell")) {
        if (!event.target.classList.contains("attended")) { // 출석이 완료되지 않은 경우에만 모달 창을 엽니다.
            openModal();
            toggleAttendance(event.target);
        }
        
    }
});
modal.addEventListener("click", closeOnOutsideClick);
document.addEventListener("keydown", closeOnEscKey);
//----------modal창 끝---------------------------------

// 일정 추가 버튼의 클릭 이벤트 리스너
addEventButton.addEventListener("click", function() {
    const eventDate = eventDateInput.value; // 사용자가 입력한 일정 날짜 가져오기
    const eventTitle = eventTitleInput.value; // 사용자가 입력한 일정 제목 가져오기

    if (!eventDate || !eventTitle) { // 만약 날짜나 제목이 비어있다면 경고 메시지를 띄우고 함수 종료
        alert("날짜와 제목을 모두 입력해주세요.");
        return;
    }


    if (!events[eventDate]) { // 해당 날짜에 대한 배열이 없다면 새로 생성
        events[eventDate] = [];
    }

    events[eventDate].push(eventTitle); // 해당 날짜의 배열에 새로운 이벤트 제목 추가

    updateEventList(); // 이벤트 목록 업데이트

    eventDateInput.value = ""; // 입력 필드 초기화
    eventTitleInput.value = "";
});

// 이벤트 목록 업데이트 함수
function updateEventList() {
  eventListElement.innerHTML = "";  // 기존 목록 삭제
  
  for (const date in events) {  // 모든 날짜에 대해 반복 
      for (const title of events[date]) {  // 해당 날짜의 모든 이벤트에 대해 반복 
          const listItem = document.createElement("li");  
          listItem.textContent = `${date}: ${title}`;  
          eventListElement.appendChild(listItem);  
      }
  }

}
});
$(document).ready(function() {
    $("#add-event-button").click(function() {
        var date = $("#event-date").val();
        var title = $("#event-title").val();

        $.ajax({
            type: "POST",
            url: "/planInsert",
            data: { date: date, title: title },
            success: function(response) {
                // 서버로부터 온 응답 처리
            },
            error: function(error) {
                console.error(error);
            }
        });
    });
});