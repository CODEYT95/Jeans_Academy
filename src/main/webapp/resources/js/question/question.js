document.addEventListener("DOMContentLoaded", function () {
    // box-list 정렬
    var boxCount = 0;
    var boxes = document.querySelectorAll('.box1');

    if (boxes.length > 0) {
        // 여기에서 상태 변수 (status) 대신 조건을 검사하여 로직 수정이 필요합니다.
        // 예: if (boxCount % 4 === 3 || boxCount === boxes.length - 1) {
        if (boxCount % 4 === 3 || boxCount === boxes.length - 1) {
            boxes[boxCount].parentNode.classList.add('box-row');
        }
        boxCount++;
    }

    // 검색 기능
    $(document).ready(function () {
        let originalBoxes = $('.box-list .box').clone(); // 처음 로드된 박스들을 복사하여 저장

        $('.search-button').click(function () {
            performSearch();
        });

        $('.search-input').keyup(function (event) {
            if (event.keyCode === 13) { // Enter 키를 눌렀을 때
                performSearch();
            }
        });

        // 박스 클릭 이벤트 리스너 추가
        $('.box-list .box').click(function () {
            let boxTitle = $(this).find('h2').text();
            let boxContent = $(this).find('p').text();
            let detailURL = '상세페이지URL?title=' + encodeURIComponent(boxTitle) + '&content=' + encodeURIComponent(boxContent);
            window.location.href = detailURL;
        });

        function performSearch() {
            let searchKeyword = $('.search-input').val().toLowerCase();
            let matchingBoxes = [];

            originalBoxes.each(function () {
                let boxTitle = $(this).find('h2').text().toLowerCase();
                if (boxTitle.includes(searchKeyword)) {
                    matchingBoxes.push($(this));
                }
            });

            $('.box-list').empty(); // 이전 검색 결과를 제거

            matchingBoxes.forEach(function (box) {
                $('.box-list').append(box);
            });

            // 필터링된 결과에 대한 박스 클릭 이벤트 리스너 추가
            $('.box-list .box').click(function () {
                let boxTitle = $(this).find('h2').text();
                let boxContent = $(this).find('p').text();
                let detailURL = '상세페이지URL?title=' + encodeURIComponent(boxTitle) + '&content=' + encodeURIComponent(boxContent);
                window.location.href = detailURL;
            });

            document.getElementById("write-button").addEventListener("click", function () {
                // 글작성 페이지의 URL로 이동
                window.location.href = "/question/write";
            });
        }
    });

$(document).ready(function () {
    // 초기화: 상대 시간 업데이트 함수 실행
    updateRelativeTime();

    // 1분마다 상대 시간 업데이트 함수 실행
    setInterval(updateRelativeTime, 60000);

    // 상대 시간 업데이트 함수
    function updateRelativeTime() {
        const currentTimestampMillis = Date.now();

        // 모든 .postdate 엘리먼트에 대해 반복
        $('.postdate').each(function () {
            var dateString = $(this).data('timestamp'); // 데이터 속성에서 날짜 문자열 얻기
                    var timestampMillis = new Date(dateString).getTime(); // 날짜 문자열을 타임스탬프로 변환

                    var diff = currentTimestampMillis - timestampMillis; // 현재 시간과 타임스탬프의 차이 계산
                    console.log('Diff (ms):', diff);

            // 차이를 초, 분, 시간, 일로 계산
            var seconds = Math.floor(diff / 1000);
            var minutes = Math.floor(seconds / 60);
            var hours = Math.floor(minutes / 60);
            var days = Math.floor(hours / 24);

            var relativeTime;
            if (days > 0) {
                relativeTime = days + '일 전';
            } else if (hours > 0) {
                relativeTime = hours + '시간 전';
            } else if (minutes > 0) {
                relativeTime = minutes + '분 전';
            } else {
                relativeTime = '방금 전';
            }

            // 상대 시간으로 업데이트
            $(this).text(relativeTime);
        });
       }
   });
});
