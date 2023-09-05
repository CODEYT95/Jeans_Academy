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
document.addEventListener("DOMContentLoaded", function() {
    const addEventButton = document.getElementById("add-event-button");

    addEventButton.addEventListener("click", function() {
        const date = document.getElementById("event-date").value;
        const title = document.getElementById("event-title").value;

        // 서버로 데이터를 전송합니다.
        fetch("/add-event.php", {
            method: "POST",
            body: JSON.stringify({ date, title }),
            headers: {
                "Content-Type": "application/json"
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("일정이 성공적으로 추가되었습니다.");
                // 일정 목록 업데이트 로직을 여기에 추가할 수 있습니다.
            } else {
                alert("일정 추가 실패: " + data.message);
            }
        })
        .catch(error => {
            console.error("오류 발생:", error);
        });
    });
});
