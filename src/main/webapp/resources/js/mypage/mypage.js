   $(document).ready(function () {
        // 폼 제출 이벤트 리스너
        $("form").submit(function (event) {
            event.preventDefault();
            var date = $("#event-date").val();
            var title = $("#event-title").val();

            $.ajax({
                url: "/addEvent",
                method: "POST",
                data: { date: date, title: title },
                success: function () {
                    // 일정 추가 성공 시, 일정 목록을 업데이트
                    updateEventList();
                }
            });
        });

        // 일정 목록 업데이트 함수
        function updateEventList() {
            $.get("/getEvents", function (data) {
                // 서버에서 받은 데이터를 사용하여 목록 업데이트
                $("#event-list").html(data);
            });
        }

        // 페이지 로드 시 일정 목록 초기화
        updateEventList();
    });
