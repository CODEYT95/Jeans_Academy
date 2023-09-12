document.addEventListener("DOMContentLoaded", function () {
    const calendarGrid = document.getElementById("calendar-grid");
    const monthYear = document.getElementById("month-year");
    const prevMonthButton = document.getElementById("prev-month");
    const nextMonthButton = document.getElementById("next-month");
    const modal = document.getElementById("modal");
    const attendanceButton = document.getElementById("attendance-button");
    const modalBackdrop = document.querySelector(".modal-backdrop");
    const currentTimeDisplay = document.getElementById("current-time");
    const currentDate = new Date();

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
            if (!event.target.classList.contains("attended")) {
                openModal();
            }
        }
    });

    modal.addEventListener("click", closeOnOutsideClick);
    document.addEventListener("keydown", closeOnEscKey);
    //----------modal창 끝---------------------------------

    // 이벤트 목록 업데이트 함수
    function updateEventList() {
        eventListElement.innerHTML = ""; // 기존 목록 삭제

        for (const date in events) {
            // 모든 날짜에 대해 반복
            for (const title of events[date]) {
                // 해당 날짜의 모든 이벤트에 대해 반복
                const listItem = document.createElement("li");
                listItem.textContent = `${date}: ${title}`;
                eventListElement.appendChild(listItem);
            }
        }
    }

    // 다른 코드 ...

    $(document).ready(function () {
        const eventDateInput = document.getElementById("event-date");
        const eventTitleInput = document.getElementById("event-title");
        const addEventButton = document.querySelector(".add-event-button");

        addEventButton.onclick = function () {
            // 입력된 날짜와 제목을 가져옵니다.
            const date = eventDateInput.value;
            const title = eventTitleInput.value;

            // AJAX 요청을 보냅니다.
            $.ajax({
                type: "POST",
                url: "/mypage/write", // "write"는 실제로 데이터를 처리하는 서버 엔드포인트 URL입니다.
                data: { date: date, title: title }, // 데이터를 객체로 보냅니다.
                success: function (response) {
                    // 요청이 성공하면 여기에서 추가적인 처리를 수행할 수 있습니다.
                    if (response === "1") {
                        window.location.href = "/mypage/list";
                        console.log("일정이 성공적으로 추가되었습니다.");
                    }
                    // 원하는 추가 작업을 수행할 수 있습니다.
                },
                error: function (xhr, status, error) {
                    // 요청이 실패한 경우 여기에서 처리할 수 있습니다.
                    console.error("일정 추가 실패:", error);
                },
            });
        };
    });
    $(document).ready(function () {
            const inputElement = document.querySelector('input[data-mypageno]');
            const addEventButton = document.querySelector(".delete-event-button");

            addEventButton.onclick = function () {
                // 입력된 날짜와 제목을 가져옵니다.
                const mypage_no = inputElement.value;
                // AJAX 요청을 보냅니다.
                $.ajax({
                    type: "POST",
                    url: "/mypage/delete", // "write"는 실제로 데이터를 처리하는 서버 엔드포인트 URL입니다.
                    data: { mypage_no: mypage_no}, // 데이터를 객체로 보냅니다.
                    success: function (response) {
                        // 요청이 성공하면 여기에서 추가적인 처리를 수행할 수 있습니다.
                        if (response === "1") {
                            window.location.href = "/mypage/list";
                            console.log("일정이 성공적으로 삭제되었습니다.");
                        }
                        // 원하는 추가 작업을 수행할 수 있습니다.
                    },
                    error: function (xhr, status, error) {
                        // 요청이 실패한 경우 여기에서 처리할 수 있습니다.
                        console.error("일정 삭제 실패:", error);
                    },
                });
            };
    });
});
